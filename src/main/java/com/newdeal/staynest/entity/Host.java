package com.newdeal.staynest.entity;

import com.newdeal.staynest.dto.HostDto;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "host")
public class Host {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="host_id")
    private Long id;

    @Column(nullable = false)
    private String hostName;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String phone;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private UserRoleEnum role;

    @Column(name = "join_dt",nullable = false)
    private LocalDateTime joinDt;

    @Column(name = "expire_dt",nullable = false)
    private LocalDateTime expireDt;

    @Column
    private String image;

    @Column(name="email_check_yn", nullable = false)
    private String emailCheckYn;


    @PrePersist
    protected void onCreate() {
        this.joinDt = LocalDateTime.now();
        this.expireDt = LocalDateTime.now().plusDays(7);
        this.emailCheckYn = "N";
    }

    public HostDto toDto() {
        return HostDto.builder()
                .hostId(this.id)
                .hostName(this.hostName)
                .email(this.email)
                .password(this.password)
                .phone(this.phone)
                .role(this.role)
                .joinDt(this.joinDt)
                .expireDt(this.expireDt)
                .image(this.image)
                .build();
    }

}
