package com.newdeal.staynest.auth;

import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.Host;
import com.newdeal.staynest.entity.UserRoleEnum;
import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class PrincipalDetails implements UserDetails {

    @Getter
    private Guest guest;
    @Getter
    private Host host;
    private UserRoleEnum userRoleEnum;

    public PrincipalDetails(Guest guest) {
        this.guest = guest;
        this.userRoleEnum = guest.getRole();
    }

    public PrincipalDetails(Host host) {
        this.host = host;
        this.userRoleEnum = host.getRole();
    }
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        // Guest의 역할을 추가
        if (guest != null) {
            authorities.add(new SimpleGrantedAuthority(guest.getRole().getAuthority()));
        }
        // Host의 역할을 추가
        if (host != null) {
            authorities.add(new SimpleGrantedAuthority(host.getRole().getAuthority()));
        }
        System.out.println("------------------------------------------");
        System.out.println("Authorities: " + authorities);
        return authorities;
    }

    @Override
    public String getPassword() {
        if (guest != null) {
            return guest.getPassword();
        } else {
            return host.getPassword();
        }
    }

    @Override
    public String getUsername() {
        if (guest != null) {
            return guest.getEmail();
        } else {
            return host.getEmail();
        }
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        // 휴면 계정 확인 로직?
        return true;
    }
}
