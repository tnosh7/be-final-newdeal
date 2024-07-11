package com.newdeal.staynest.dto.host;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

public class HostResponse {

    @Getter
    @Setter
    public static class UpdateHostDTO {
        private String hostName;
        private String email;
        private String phone;

        public UpdateHostDTO (
                String hostName,
                String email,
                String phone
        ) {
            this.hostName = hostName;
            this.email = email;
            this.phone = phone;
        }
    }

    @Getter
    @AllArgsConstructor
    public static class listDTO {
        private Long hostId;
        private String hostName;
        private String email;
        private String phone;
    }
}
