package com.newdeal.staynest.filter;


import com.newdeal.staynest.auth.PrincipalDetailsService;
import com.newdeal.staynest.jwt.TokenProvider;
import io.jsonwebtoken.Claims;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
@Slf4j(topic = "JWT 검증 및 인가")
public class JwtAuthorizationFilter extends OncePerRequestFilter  {
    private final TokenProvider tokenProvider;
    private PrincipalDetailsService principalDetailsService;

    public JwtAuthorizationFilter(TokenProvider tokenProvider, PrincipalDetailsService principalDetailsService) {
        this.tokenProvider = tokenProvider;
        this.principalDetailsService = principalDetailsService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String token = request.getHeader("Authorization");
        String tokenValue = tokenProvider.getTokenFromRequest(request);

        if (StringUtils.hasText(tokenValue)) {
            // JWT 토큰 substring
            tokenValue = tokenProvider.substringToken(tokenValue);
            log.info(tokenValue);

            if (!tokenProvider.validateToken(tokenValue)) {
                log.error("Token Error");
                return;
            }
            Claims info = tokenProvider.getUserInfoFromToken(tokenValue);

            try {
                setAuthentication(info.getSubject());
            } catch (Exception e) {
                log.error(e.getMessage());
                return;
            }
        }

        filterChain.doFilter(request, response);
    }

    // 인증 처리
    public void setAuthentication(String username) {
        SecurityContext context = SecurityContextHolder.createEmptyContext();
        Authentication authentication = createAuthentication(username);
        context.setAuthentication(authentication);

        SecurityContextHolder.setContext(context);
    }

    // 인증 객체 생성
    private Authentication createAuthentication(String username) {
        UserDetails userDetails = principalDetailsService.loadUserByUsername(username);
        return new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
    }
}

