package com.newdeal.staynest.entity;

public enum UserRoleEnum {
    GUEST(Authority.GUEST), HOST(Authority.HOST), ADMIN(Authority.ADMIN);


    private final String authority;

    UserRoleEnum(String authority) {
        this.authority = authority;
    }
    
    public String getAuthority() {
        return this.authority;
    }
    private static class Authority {
        public static final String GUEST = "GUEST";
        public static final String HOST = "HOST";
        public static final String ADMIN = "ADMIN";
    }
}
