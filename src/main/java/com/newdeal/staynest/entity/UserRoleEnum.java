package com.newdeal.staynest.entity;

import lombok.Getter;

@Getter
public enum UserRoleEnum {
    GUEST(Authority.ROLE_GUEST),HOST(Authority.ROLE_HOST), ADMIN(Authority.ROLE_ADMIN);


    private final String authority;

    UserRoleEnum(String authority) {
        this.authority = authority;
    }
    public String getAuthority() {
        return this.authority;
    }

    public static class Authority {
        public static final String ROLE_GUEST = "ROLE_GUEST";
        public static final String ROLE_HOST = "ROLE_HOST";
        public static final String ROLE_ADMIN = "ROLE_ADMIN";
    }
}
