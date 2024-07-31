package com.newdeal.staynest.oauth;

import org.springframework.stereotype.Component;

import java.util.Map;

public class KakaoUserInfo implements OAuth2MemberInfo{

    private Map<String, Object> attributes;
    private Map<String, Object> profile;

    public KakaoUserInfo(Map<String, Object> attributes) {
        this.attributes = (Map<String, Object>) attributes.get("kakao_account");
        this.profile = (Map<String, Object>) this.attributes.get("profile");
    }
    @Override
    public String getProviderId() {
        return (String) attributes.get("id");
    }

    @Override
    public String getProvider() {
        return "kakao";
    }

    @Override
    public String getEmail() {
        return (String) attributes.get("account_email");
    }

    @Override
    public String getName() {
        return (String) attributes.get("name");
    }

    @Override
    public String getPhone() {
        return (String) attributes.get("phone_number");
    }

    @Override
    public String getImage() {
        return (String) profile.get("profile_image");
    }

    @Override
    public Map<String, Object> getAttributes() {
        return profile;
    }
}
