package com.newdeal.staynest.dto;

import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.Host;
import com.newdeal.staynest.entity.UserRoleEnum;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Null;
import jakarta.validation.constraints.Pattern;
import lombok.*;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * DTO for {@link Host}
 */
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class HostDto implements Serializable {

    Long hostId;

    @NotNull
    @Pattern(regexp = "^[^0-9]*$")
    String hostName;

    @NotNull
    String email;

    @NotNull
    @Pattern(regexp = "^(?=.*[!@#$])[A-Za-z\\\\d!@#$]{8,16}$")
    String password;

    @NotNull
    @Pattern(regexp = "^0\\d{10}$")
    String phone;

    @NotNull
    UserRoleEnum role;

    @Null
    LocalDateTime joinDt;

    @Null
    LocalDateTime expireDt;

    @Null
    String image;

    public static Host toEntity(HostDto hostDto) {
        return Host.builder()
                .id(hostDto.getHostId())
                .hostName(hostDto.getHostName())
                .email(hostDto.getEmail())
                .password(hostDto.getPassword())
                .phone(hostDto.getPhone())
                .role(hostDto.getRole())
                .joinDt(hostDto.getJoinDt())
                .expireDt(hostDto.getExpireDt())
                .image(hostDto.getImage())
                .build();
    }
}