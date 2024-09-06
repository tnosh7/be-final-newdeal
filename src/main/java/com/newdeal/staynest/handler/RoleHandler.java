package com.newdeal.staynest.handler;

import com.newdeal.staynest.jwt.TokenProvider;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@Slf4j(topic = "자격 증명 핸들러")
public class RoleHandler {

    private final TokenProvider tokenProvider;

    public RoleHandler(TokenProvider tokenProvider) {
        this.tokenProvider = tokenProvider;
    }

    @PostMapping("/role")
    public String role(@RequestBody String token) {
        log.info("자격 확인 절차 간소화 {}", token);
        String role = "";
        if (!token.isEmpty()) {
            if (tokenProvider.validateToken(token)) {
                Authentication user = tokenProvider.getAuthentication(token);
                role = user.getAuthorities().toString();
                log.info("role {}", role);
                return role;
            }
        }
        return role;
    }
}
