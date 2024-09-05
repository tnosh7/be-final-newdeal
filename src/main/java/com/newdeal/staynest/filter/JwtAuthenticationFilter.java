package com.newdeal.staynest.filter;

import com.newdeal.staynest.jwt.TokenProvider;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Slf4j(topic = "로그인 및 jwt 생성")
@Component
public class JwtAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
    private final TokenProvider tokenProvider;
    private String redirectUrl = "";
    public JwtAuthenticationFilter(TokenProvider tokenProvider) {
        this.tokenProvider = tokenProvider;
        setFilterProcessesUrl("/member/login");
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        log.info("로그인 처리중");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(email, password);
        return this.getAuthenticationManager().authenticate(authenticationToken);
    }

    @Override
    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authResult) throws IOException, ServletException {
        log.info("로그인 성공");
        String token = tokenProvider.createToken(authResult);
        log.info("토큰: {}", token);
        response.addHeader("Authorization", "Bearer " + token);
        tokenProvider.getTokenFromRequest(token, response, request); //  쿠키 테스트중
        //세션에 토큰 값 저장(여기서 보냄 - 인가 체크 때문);
        HttpSession session = request.getSession();
        session.setAttribute(TokenProvider.AUTHORIZATION_HEADER, "Bearer " + token);
        session.setAttribute("role", authResult.getAuthorities().iterator().next().getAuthority());
    }

    @Override
    protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, AuthenticationException failed) throws IOException, ServletException {
        log.info("로그인 실패");
        response.sendError(HttpServletResponse.SC_UNAUTHORIZED, failed.getMessage());
        redirectUrl = "/member?error=true";
        response.sendRedirect(redirectUrl);
    }
}
