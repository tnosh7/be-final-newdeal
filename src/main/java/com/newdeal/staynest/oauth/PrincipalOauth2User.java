package com.newdeal.staynest.oauth;

import com.newdeal.staynest.entity.UserRoleEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;

import java.util.Collection;
import java.util.Map;

//package com.newdeal.staynest.oauth;
//
//import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
//import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
//import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
//import org.springframework.security.oauth2.core.user.OAuth2User;
//import org.springframework.stereotype.Service;
//
//@Service
//public class PrincipalOauth2UserService extends DefaultOAuth2UserService {
//
//    @Override
//    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
//        System.out.println("userRequest = " + userRequest);
//        System.out.println("getAccessToken = " + userRequest.getAccessToken());
//        System.out.println("getTokenValue = " + userRequest.getAccessToken().getTokenValue());
//        System.out.println("getClientRegistration = " + userRequest.getClientRegistration());
//        System.out.println("getAttributes = " + super.loadUser(userRequest).getAttributes());
//
//        OAuth2User oAuth2User = super.loadUser(userRequest);
//
//        return super.loadUser(userRequest);
//    }
//}
/*
성명, 이메일, 핸드폰번호

 */
@Slf4j(topic = "Oauth2User 정보 전달")
public class PrincipalOauth2User extends DefaultOAuth2User {

    private String role;

    /**
     *
     * @param authorities
     * @param attributes
     * @param nameAttributeKey
     *
     */
    public PrincipalOauth2User(Collection<? extends GrantedAuthority> authorities,
                               Map<String, Object> attributes,
                               String nameAttributeKey){
        super(authorities, attributes, nameAttributeKey);
        

    }
}