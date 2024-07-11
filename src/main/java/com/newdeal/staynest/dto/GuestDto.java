package com.newdeal.staynest.dto;

import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.UserRoleEnum;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Null;
import jakarta.validation.constraints.Pattern;
import lombok.*;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * DTO for {@link Guest}
 */

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class GuestDto implements Serializable {

    Long guestId;

    @NotNull
    String guestName;

    @NotNull
    @Email
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

    @Null
    private String emailCheckYn;

    public static Guest toEntity(GuestDto guestDto) {
        return Guest.builder()
                .id(guestDto.getGuestId())
                .guestName(guestDto.getGuestName())
                .email(guestDto.getEmail())
                .password(guestDto.getPassword())
                .phone(guestDto.getPhone())
                .role(guestDto.getRole())
                .joinDt(guestDto.getJoinDt())
                .expireDt(guestDto.getExpireDt())
                .image(guestDto.getImage())
                .build();
    }


}