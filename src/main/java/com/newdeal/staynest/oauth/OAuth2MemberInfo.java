package com.newdeal.staynest.oauth;

import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public interface OAuth2MemberInfo {

    String getProviderId();
    String getProvider();
    String getEmail();
    String getName();
    String getPhone();
    String getImage();
    Map<String, Object> getAttributes();
}
