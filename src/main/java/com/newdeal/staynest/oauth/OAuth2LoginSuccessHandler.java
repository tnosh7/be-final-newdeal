package com.newdeal.staynest.oauth;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
@Slf4j(topic = "OAuth2  로그인 성공")
@Component
@RequiredArgsConstructor
public class OAuth2LoginSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        // 로그인 성공 시 회원가입 페이지로 리다이렉트
      /*  String redirectUrl = "http://localhost:8090/login/oauth2/code/naver";
        log.info("OAuth2 로그인 성공, 회원가입 페이지로 리다이렉트: {}", redirectUrl);
        response.sendRedirect(redirectUrl);
*/




    }
}
