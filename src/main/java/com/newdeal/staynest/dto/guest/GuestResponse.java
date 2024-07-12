package com.newdeal.staynest.dto.guest;

import lombok.*;


public class GuestResponse {

    @Getter
    @Setter
    public static class UpdateGuestDTO {
        private String guestName;
        private String email;
        private String phone;
        private String address;

        public UpdateGuestDTO (
                String guestName,
                String email,
                String phone,
                String address
        ) {
            this.guestName = guestName;
            this.email = email;
            this.phone = phone;
            this.address = address;
        }
    }

    @Getter
    @AllArgsConstructor
    public static class listDTO {
        private Long guestId;
        private String guestName;
        private String email;
        private String phone;
        private String address;
    }

}