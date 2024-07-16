package com.newdeal.staynest.config;

import com.newdeal.staynest.auth.PrincipalDetailsService;
import com.newdeal.staynest.filter.JwtAuthenticationFilter;
import com.newdeal.staynest.filter.JwtAuthorizationFilter;
import com.newdeal.staynest.filter.LoggingFilter;
import com.newdeal.staynest.jwt.JwtAuthenticationEntryPoint;
import com.newdeal.staynest.jwt.JwtAccessDeniedHandler;
import com.newdeal.staynest.jwt.TokenProvider;
import com.newdeal.staynest.oauth.OAuth2LoginSuccessHandler;
import jakarta.servlet.DispatcherType;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;
import java.util.List;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfig {

    private final TokenProvider tokenProvider;
    private final PrincipalDetailsService principalDetailsService;
    private final AuthenticationConfiguration authenticationConfiguration;
    private final JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;
    private final JwtAccessDeniedHandler jwtAccessDeniedHandler;

    @Autowired
    public SecurityConfig(TokenProvider tokenProvider, PrincipalDetailsService principalDetailsService, AuthenticationConfiguration authenticationConfiguration, JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint, JwtAccessDeniedHandler jwtAccessDeniedHandler) {
        this.tokenProvider = tokenProvider;
        this.principalDetailsService = principalDetailsService;
        this.authenticationConfiguration = authenticationConfiguration;
        this.jwtAuthenticationEntryPoint = jwtAuthenticationEntryPoint;
        this.jwtAccessDeniedHandler = jwtAccessDeniedHandler;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }
    @Bean
    public JwtAuthenticationFilter jwtAuthenticationFilter() throws Exception {
        JwtAuthenticationFilter filter = new JwtAuthenticationFilter(tokenProvider);
        filter.setAuthenticationManager(authenticationManager(authenticationConfiguration));
        return filter;
    }
    @Bean
    public JwtAuthorizationFilter jwtAuthorizationFilter() {
        return new JwtAuthorizationFilter(tokenProvider, principalDetailsService);
    }
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(List.of("localhost:8090"));
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE"));
        configuration.setAllowedHeaders(Arrays.asList("X-Requested-With", "Content-Type", "JwtAuthorizationFilter", "X-XSRF-token"));
        configuration.setAllowCredentials(false);
        configuration.setMaxAge(3600L);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http, LoggingFilter loggingFilter) throws Exception {
        AuthenticationSuccessHandler OAuth2LoginSuccessHandler = new OAuth2LoginSuccessHandler();

        http
                .csrf(AbstractHttpConfigurer::disable)
                .sessionManagement(sessionManagement -> sessionManagement
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .formLogin(formLogin -> formLogin
                        .loginPage("/member/hostLogin-page")
                        .loginProcessingUrl("/member/login")
                        .usernameParameter("email")
                        .passwordParameter("password")
                        .successForwardUrl("/hosts/")
                        .failureUrl("/member/hostLogin-page?error=true")
                        .permitAll()
                )
                .formLogin(formLogin -> formLogin
                        .loginPage("/member/guestLogin-page")
                        .loginProcessingUrl("/member/login")
                        .usernameParameter("email")
                        .passwordParameter("password")
                        .successForwardUrl("/")
                        .failureUrl("/member/guestLogin-page?error=true")
                        .permitAll()
                )

                .logout(logout -> logout
                        .logoutUrl("/member/logout")
                        .deleteCookies("JSESSIONID")
                        .logoutSuccessHandler(logoutSuccessHandler())
                        .logoutSuccessUrl("/home")
                        .permitAll())
                .oauth2Login(oauth2Login -> oauth2Login
                        .loginPage("/member/guestLogin-page")
                        .defaultSuccessUrl("http://localhost:8090/login/oauth2/code/naver")
                        .successHandler(OAuth2LoginSuccessHandler)
                  //      .failureUrl()
                )
                .authorizeHttpRequests((requests) -> requests
                        //핵심 .. 눙물
                        .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                        //여기서 경로 설정 안함
                        .requestMatchers("/**").permitAll()
                        .requestMatchers("/hosts/**").permitAll()
                        .requestMatchers("/**").hasAnyRole("GUEST", "HOST", "ADMIN")
                        .requestMatchers("/hosts/**").hasAnyRole("GUEST", "HOST", "ADMIN")
                        .requestMatchers("/admin/**").hasAnyRole("ADMIN")
                        .anyRequest().authenticated())
                .addFilterBefore(loggingFilter, UsernamePasswordAuthenticationFilter.class)
                .addFilterBefore(jwtAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class)
                .addFilterBefore(new JwtAuthorizationFilter(tokenProvider, principalDetailsService), UsernamePasswordAuthenticationFilter.class)
                .exceptionHandling(handle -> handle
                        .authenticationEntryPoint(jwtAuthenticationEntryPoint)
                        .accessDeniedHandler(jwtAccessDeniedHandler));
        return http.build();
    }

    private LogoutSuccessHandler logoutSuccessHandler() {
        return (request, response, authentication) -> {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate(); // 세션 무효화
            }
            response.setStatus(HttpServletResponse.SC_OK); // 200 OK 상태 반환
        };
    }
}
