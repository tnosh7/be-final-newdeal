package com.newdeal.staynest.entity;

import com.newdeal.staynest.dto.guest.GuestRequest;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "guest")
public class Guest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="guest_id")
    private Long id;

    @Column(nullable = false)
    private String guestName;

    @Column(nullable = false)
    private String email;

    @Column
    private String password;

    @Column(nullable = false)
    private String phone;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private UserRoleEnum role;

    @Column(name = "join_dt",nullable = false)
    private LocalDateTime joinDt;

    @Column
    private String address;

    @Column
    private String image;

    @Column
    private String provider;

    @Column(name="provider_id")
    private String providerId;

    @PrePersist
    protected void onCreate() {
        this.joinDt = LocalDateTime.now();
    }

    public GuestRequest toDto() {
        return GuestRequest.builder()
                .guestId(this.id)
                .guestName(this.guestName)
                .email(this.email)
                .password(this.password)
                .phone(this.phone)
                .role(this.role)
                .joinDt(this.joinDt)
                .image(this.image)
                .provider(this.provider)
                .providerId(this.providerId)
                .build();
    }

}
