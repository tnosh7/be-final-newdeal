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

    @Column
    private String image;


    @PrePersist
    protected void onCreate() {
        this.joinDt = LocalDateTime.now();
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
                .image(this.image)
                .build();
    }

}
