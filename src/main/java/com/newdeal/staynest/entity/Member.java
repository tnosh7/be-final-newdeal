package com.newdeal.staynest.entity;

import com.newdeal.staynest.dto.MemberDto;
import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import javax.management.relation.RoleStatus;
import java.time.LocalDateTime;
import java.util.Date;
@Entity
@Getter
@Setter
@Builder
@Table(name = "member")
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="member_id")
    private long id;

    @Column(nullable = false, length = 50)
    private String name;

    @Column(nullable = false, length = 50)
    private String email;

    @Column(nullable = false, length = 255)
    private String password;

    @Column(nullable = false, length = 15)
    private String phone;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private UserRoleEnum role;

    @Column(name = "join_dt", nullable = false)
    private LocalDateTime joinDt;

    @Column(name = "expire_dt", nullable = false)
    private LocalDateTime expireDt;

    @PrePersist
    protected void onCreate() {
        this.joinDt = LocalDateTime.now();
        //일단 7일로 설정함. 이메일 인증 안하면 자동 탈퇴하는 방식으로 구현할 예정.
        this.expireDt = LocalDateTime.now().plusDays(7);
    }

    public Member() {
    }

    public Member(long id, String name, String email, String password, String phone, UserRoleEnum role, LocalDateTime joinDt, LocalDateTime expireDt) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.role = role;
        this.joinDt = joinDt;
        this.expireDt = expireDt;

    }

    public static MemberDto toDto(Member member) {
        return MemberDto.builder()
                .memberId(member.getId())
                .name(member.getName())
                .email(member.getEmail())
                .password(member.getPassword())
                .phone(member.getPhone())
                .role(member.getRole())
                .joinDt(member.getJoinDt())
                .expireDt(member.getExpireDt())
                .build();
    }

}