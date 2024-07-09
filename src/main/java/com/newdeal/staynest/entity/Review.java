package com.newdeal.staynest.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "review")
@Getter
@Setter
@Builder
@RequiredArgsConstructor
@AllArgsConstructor
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reviewId;

//    @OneToOne
//    @JoinColumn(name = "reservation_id")
//    private Reservation reservation;

    @OneToOne
    @JoinColumn(name = "host_id")
    private Host host;

    @Column(name = "star", nullable = false)
    private int star;

    @Column(name = "content", nullable = false)
    private String content;

    @OneToMany(mappedBy = "review", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ReviewImg> images;

    @Column(name = "created_at")
    private LocalDateTime createdAt;
}
