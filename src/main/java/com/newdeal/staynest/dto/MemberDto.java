package com.newdeal.staynest.dto;

import com.newdeal.staynest.entity.Member;
import com.newdeal.staynest.entity.UserRoleEnum;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.*;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * DTO for {@link Member}
 */

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class MemberDto implements Serializable {

    long memberId;

    @NotNull
    String name;

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

    @NotNull
    LocalDateTime joinDt;

    @NotNull
    LocalDateTime expireDt;

    @NotNull
    String refreshToken;
    

    public static Member toEntity(MemberDto dto) {
        return Member.builder()
                .id(dto.getMemberId())
                .name(dto.getName())
                .email(dto.getEmail())
                .password(dto.getPassword())
                .phone(dto.getPhone())
                .role(dto.getRole())
                .joinDt(dto.getJoinDt())
                .expireDt(dto.getExpireDt())
                /*.refreshToken(dto.getRefreshToken())*/
                .build();
    }


}