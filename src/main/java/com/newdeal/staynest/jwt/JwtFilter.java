//package com.newdeal.staynest.jwt;
//
//import ch.qos.logback.core.util.StringUtil;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.http.HttpServletRequest;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.util.StringUtils;
//import org.springframework.web.filter.GenericFilterBean;
//
//import java.io.IOException;
//
//public class JwtFilter extends GenericFilterBean {
//    private static final Logger LOGGER = LoggerFactory.getLogger(JwtFilter.class);
//    private static final String AUTHORIZATION_HEADER = "Authorization";
//    private TokenProvider tokenProvider;
//
//    public JwtFilter(TokenProvider tokenProvider) {
//        this.tokenProvider = tokenProvider;
//    }
//    @Override
//    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        HttpServletRequest request = (HttpServletRequest) servletRequest;
//        String jwt = resolveToken(request);
//        String requestURI = request.getRequestURI();
//
//        if (StringUtils.hasText(jwt) && tokenProvider.validateToken(jwt)) {
//            Authentication auth = tokenProvider.getAuthentication(jwt);
//            SecurityContextHolder.getContext().setAuthentication(auth);
//            logger.debug("Security context set, uri : {}" + requestURI);
//        } else {
//            logger.debug("유효한 JWT토큰이 없습니다. uri : {}" + requestURI);
//        }
//        filterChain.doFilter(servletRequest, servletResponse);
//
//    }
//
//
//    //토큰 정보
//    private String resolveToken(HttpServletRequest request) {
//        String bearerToken = request.getHeader(AUTHORIZATION_HEADER);
//        if (bearerToken != null && bearerToken.startsWith("Bearer ")) {
//            return bearerToken.substring(7);
//        }
//        return null;
//    }
//
//}
