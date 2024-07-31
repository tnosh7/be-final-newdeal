package com.newdeal.staynest.oauth;

import lombok.extern.slf4j.Slf4j;

import java.util.Map;
@Slf4j(topic = "네이버유저인포")
public class NaverUserInfo implements OAuth2MemberInfo {
    private Map<String, Object> attributes;

    public NaverUserInfo(Map<String, Object> attributes) {
        this.attributes = (Map<String, Object>) attributes.get("response");
    }

    @Override
    public String getProviderId() {
        return (String) attributes.get("id");
    }

    @Override
    public String getProvider() {
        return "naver";
    }

    @Override
    public String getEmail() {
        return (String) attributes.get("email");
    }

    @Override
    public String getName() {
        return (String) attributes.get("name");
    }

    @Override
    public String getPhone() {
        return (String) attributes.get("mobile");
    }

    @Override
    public String getImage() {
        return (String) attributes.get("profile_image");
    }

    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }
}
