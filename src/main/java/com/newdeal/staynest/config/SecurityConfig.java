package com.newdeal.staynest.config;


//import com.newdeal.staynest.oauth.PrincipalOauth2UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;

import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
//@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig {

//    private final PrincipalOauth2UserService principalOauth2UserService;
//
//    public SecurityConfig(PrincipalOauth2UserService principalOauth2UserService) {
//        this.principalOauth2UserService = principalOauth2UserService;
//    }

    //비밀번호 인코더
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf(AbstractHttpConfigurer::disable);
        //http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
        // http.formLogin().disable();
        http

                //접근 가능 경로 -> 일단 모두 허가함
                .authorizeHttpRequests(authorizeRequests ->
                        authorizeRequests
                                .anyRequest().permitAll()
                               // .requestMatchers("/member/register", "/member/login-page", "/").permitAll()
                               // .anyRequest().authenticated()
                )
                //로그인 페이지 설정
                .formLogin(formLogin->
                        formLogin
                                .loginPage("/member/login-page")
                                .loginProcessingUrl("/member/login")
                                .permitAll()
                )
                //로그아웃 설정
                .logout(logout -> {
                            logout
                                    .logoutSuccessUrl("/")
                                    .permitAll();
                        }
                        );
        http
                .oauth2Login(oauth2Login ->
                        oauth2Login
                                .loginPage("/member/login-page")
                                //.userInfoEndpoint()
                               // .userService(principalOauth2UserService)
                            );

        return http.build();
    }
    
}
