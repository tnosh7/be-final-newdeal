package com.newdeal.staynest.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "review_img")
@Getter
@Setter
@Builder
@RequiredArgsConstructor
@AllArgsConstructor
public class ReviewImg {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reviewImgId;

    @ManyToOne
    @JoinColumn(name = "review_id")
    private Review review;

    @Column(name = "img_url", nullable = false)
    private String imgUrl;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    public Long getId() {
        return reviewImgId;
    }

    public String getUrl() {
        return imgUrl;
    }
}
