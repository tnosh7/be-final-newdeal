package com.newdeal.staynest.oauth;

import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.UserRoleEnum;
import com.newdeal.staynest.jwt.TokenProvider;
import com.newdeal.staynest.repository.GuestRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Slf4j(topic = "소셜 로그인")
@Service
public class PrincipalOAuth2UserService extends DefaultOAuth2UserService {

    private final GuestRepository guestRepository;
    private final HttpServletRequest request;
    private String clientId;
    private String clientSecret;
    private final TokenProvider tokenProvider;
    private HttpServletResponse response;

    public PrincipalOAuth2UserService(GuestRepository guestRepository, HttpServletRequest request,
                                      @Value("${security.oauth2.client.registration.naver.client-id") String clientId,
                                      @Value("${security.oauth2.client.registration.naver.client-secret") String clientSecret,
                                      TokenProvider tokenProvider,
                                      HttpServletResponse response) {
        this.guestRepository = guestRepository;
        this.request = request;
        this.response = response;
        this.clientId = clientId;
        this.clientSecret = clientSecret;
        this.tokenProvider = tokenProvider;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);
        String code = request.getParameter("code");
        System.out.println("==========code : " + code);
        String state = request.getParameter("state");
        System.out.println("==========state : " + state);
        // 사용자 정보 가져오기
        Map<String, Object> attributes = oAuth2User.getAttributes();
        log.info("받은 사용자 정보: {}", attributes);

        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        log.info("받은 사용자 registrationId: {}", registrationId);
        //중요
        String nameAttributeKey = userRequest.getClientRegistration().getProviderDetails().getUserInfoEndpoint().getUserNameAttributeName();
        log.info("nameAttributeKey : {} ", nameAttributeKey);

        OAuth2MemberInfo memberInfo;
        if (registrationId.equals("kakao")) {
            memberInfo = new KakaoUserInfo(attributes);
        } else if (registrationId.equals("naver")) {
            memberInfo = new NaverUserInfo(attributes);
        } else {
            throw new OAuth2AuthenticationException("지원하지 않는 소셜 로그인입니다 : " + registrationId);
        }
        log.info("memberInfo : {} ", memberInfo.getAttributes());

        boolean isVerified = verifyMember(memberInfo);
        if (isVerified) {
            log.info("새로 가입하는 유저임 ");
        } else log.info("이미 등록된 유저임");
        try {
            Authentication authentication = new CustomAuthentication((NaverUserInfo) memberInfo);
            setToken(authentication, response);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        List<GrantedAuthority> authorities = Collections.singletonList(new SimpleGrantedAuthority("ROLE_GUEST"));
        return new DefaultOAuth2User(authorities, attributes, nameAttributeKey);
    }

    private boolean verifyMember(OAuth2MemberInfo memberInfo) {
        Guest guest = guestRepository.findByEmail(memberInfo.getEmail());
        if (guest == null) {
            guest = Guest.builder()
                    .email(memberInfo.getEmail())
                    .guestName(memberInfo.getName())
                    .phone(memberInfo.getPhone())
                    .image(memberInfo.getImage())
                    .provider(memberInfo.getProvider())
                    .providerId(memberInfo.getProviderId())
                    .role(UserRoleEnum.GUEST)
                    .build();
            guestRepository.save(guest);
            guest.toDto();
            return true;
        }
        guest.toDto();
        return false;
    }

    public void setToken(Authentication authentication, HttpServletResponse response) throws IOException {
        String token = tokenProvider.createToken(authentication);
        log.info("토큰 : {}", token);
        response.addHeader("Authorization", "Bearer " + token);
//        HttpSession session = request.getSession();
//        session.setAttribute(TokenProvider.AUTHORIZATION_HEADER, "Bearer " + token);
//        session.setAttribute("role", "ROLE_GUEST");

    }
}
