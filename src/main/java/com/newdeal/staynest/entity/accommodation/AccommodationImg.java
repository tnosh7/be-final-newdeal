package com.newdeal.staynest.entity.accommodation;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "accomm_img")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AccommodationImg {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long AccommodationImgId;

    @ManyToOne
    @JsonIgnore
    @JoinColumn(name = "accomm_id")
    private Accommodation accommodation;

    @Column(name = "img_url", nullable = false)
    private String imgUrl;

    @Column(name = "created_at")
    private LocalDateTime createdAt;
}
