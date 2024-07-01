package com.newdeal.staynest.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {


    //비밀번호 인코더
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf(AbstractHttpConfigurer::disable);
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
                                .defaultSuccessUrl("/", true)// 로그인 성공 시 리디렉션 경로 설정
                                .failureUrl("/login-page?error=true") // 로그인 실패 시 리디렉션 경로 설정
                                .permitAll()
                )
                //로그아웃 설정
                .logout(logout -> {
                            logout
                                    .logoutSuccessUrl("/")
                                    .permitAll();
                        }


                        );
        return http.build();
    }
    
}
