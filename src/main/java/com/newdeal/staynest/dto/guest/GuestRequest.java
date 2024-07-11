package com.newdeal.staynest.dto.guest;

import lombok.*;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class GuestRequest {

    @Getter
    @Builder
    @NoArgsConstructor
    public static class UpdateDTO {
        private static Long id;
    }
}