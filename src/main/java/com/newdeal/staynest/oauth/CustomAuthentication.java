package com.newdeal.staynest.oauth;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.Collections;

public class CustomAuthentication implements Authentication {
    private final NaverUserInfo naverUserInfo;
    private boolean authenticated = true;

    public CustomAuthentication(NaverUserInfo naverUserInfo) {
        this.naverUserInfo = naverUserInfo;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER"));
    }

    @Override
    public Object getCredentials() {
        return null;
    }

    @Override
    public Object getDetails() {
        return naverUserInfo;
    }

    @Override
    public Object getPrincipal() {
        return new User(naverUserInfo.getEmail(), "", getAuthorities());
    }

    @Override
    public boolean isAuthenticated() {
        return authenticated;
    }

    @Override
    public void setAuthenticated(boolean isAuthenticated) throws IllegalArgumentException {
        this.authenticated = isAuthenticated;
    }

    @Override
    public String getName() {
        return naverUserInfo.getName();
    }
}
