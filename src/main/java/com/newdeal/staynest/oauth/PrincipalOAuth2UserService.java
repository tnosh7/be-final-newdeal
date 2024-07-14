package com.newdeal.staynest.oauth;

import com.newdeal.staynest.repository.GuestRepository;
import com.newdeal.staynest.repository.HostRepository;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Slf4j(topic = "소셜 로그인")
@Service
@RequiredArgsConstructor
public class PrincipalOAuth2UserService extends DefaultOAuth2UserService {

    private final HttpServletRequest request;
    private final GuestRepository guestRepository;
    private final HostRepository hostRepository;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);

        // 사용자 정보 가져오기
        Map<String, Object> attributes = oAuth2User.getAttributes();
        log.info("받은 사용자 정보: {}", attributes);

        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        log.info("받은 사용자 registrationId: {}", registrationId);
        Object memberInfo;
        if (registrationId.equals("kakao")) {
            memberInfo = extractKakaoOAuth2UserInfo(attributes);
        } else if (registrationId.equals("naver")) {
            memberInfo = extractNaverOAuth2UserInfo(attributes);
        } else {
            throw new OAuth2AuthenticationException("지원하지 않는 소셜 로그인입니다 : " + registrationId);
        }
        log.info("memberInfo : {} ", memberInfo);
        List<GrantedAuthority> authorities = Collections.singletonList(new SimpleGrantedAuthority("ROLE_GUEST"));
        return new PrincipalOauth2User(authorities, (Map<String, Object>) memberInfo, registrationId);
    }

    private Map<String, Object> extractNaverOAuth2UserInfo(Map<String, Object> attributes) {
        Map<String, Object> response = (Map<String, Object>) attributes.get("response");
        if (response == null) {
            log.error("Naver response is null");
            return null;
        }
        String name = (String) response.get("name");
        String email = (String) response.get("email");
        String mobile = (String) response.get("mobile");
        String id = (String) response.get("id");
        log.info("Naver user info - name: {}, email: {}, mobile: {}", name, email, mobile);
        return response;
    }

    private Map<String, Object> extractKakaoOAuth2UserInfo(Map<String, Object> attributes) {
        Map<String, Object> kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
        if (kakaoAccount == null) {
            log.error("Kakao account is null");
            return null;
        }
        String email = (String) kakaoAccount.get("email");
        Map<String, Object> profile = (Map<String, Object>) kakaoAccount.get("profile");
        String name = (String) profile.get("nickname");
        String phone = (String) kakaoAccount.get("phone_number");
        log.info("Kakao user info - name: {}, email: {}, phone: {}", name, email, phone);
        return kakaoAccount;
    }
}
