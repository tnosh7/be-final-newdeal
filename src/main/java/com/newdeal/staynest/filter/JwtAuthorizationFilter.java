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
import java.util.Arrays;
import java.util.List;

@Slf4j(topic = "JWT 검증 및 인가")
public class JwtAuthorizationFilter extends OncePerRequestFilter {
    private final TokenProvider tokenProvider;
    private final PrincipalDetailsService principalDetailsService;
    // 권한 체크 경로
    private static final List<String> SECURED_PATHS = Arrays.asList(
            "/hosts", "/admin", "/profile"
    );

    public JwtAuthorizationFilter(TokenProvider tokenProvider, PrincipalDetailsService principalDetailsService) {
        this.tokenProvider = tokenProvider;
        this.principalDetailsService = principalDetailsService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        // 인증이 필요 없는 경로인지 확인 (하위 경로 포함)
        //if (isSecuredPath(requestURI)) {
        //String token = tokenProvider.getTokenFromSession(request);
        String token = request.getHeader("Authorization");
        if (token == null) {
            filterChain.doFilter(request, response);
            return;
        }
        log.info("세션 Authorization 헤더 확인: {}", token);

        if (StringUtils.hasText(token)) {
            token = tokenProvider.substringToken(token);
            log.info("토큰 정보만 추출: {}", token);

            if (!tokenProvider.validateToken(token)) {
                log.error("error : 토큰 없음 또는 유효하지 않음");
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid token");
                return;
            }
            Claims info = tokenProvider.getUserInfoFromToken(token);
            try {
                // email, role 담음
                setAuthentication(info.get("sub", String.class), info.get("auth", String.class));
            } catch (Exception e) {
                log.error("인가 Error: {}", e.getMessage());
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "인가 실패");
                return;
            }
        }
        //}

        filterChain.doFilter(request, response);
    }

    // 인증 처리
    public void setAuthentication(String email, String memberRole) {
        SecurityContext context = SecurityContextHolder.createEmptyContext();
        Authentication authentication = createAuthentication(email, memberRole);
        log.info("Authentication  인가 설정 : {}", authentication);
        context.setAuthentication(authentication);
        log.info("이메일 : {}", email);
        SecurityContextHolder.setContext(context);
    }

    private boolean isSecuredPath(String requestURI) {
        return SECURED_PATHS.stream().anyMatch(requestURI::startsWith);
    }

    // 인증 객체 생성
    private Authentication createAuthentication(String email, String memberRole) {
        log.info("createAuthentication 인증 객체 생성");
        UserDetails userDetails = principalDetailsService.loadUserByUsername(email);
        return new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
    }

}

