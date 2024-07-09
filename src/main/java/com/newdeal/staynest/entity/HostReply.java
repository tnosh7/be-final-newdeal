package com.newdeal.staynest.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.mapping.ToOne;

import java.time.LocalDateTime;

@Entity
@Table(name = "host_reply")
@Getter
@Setter
@Builder
@RequiredArgsConstructor
@AllArgsConstructor
public class HostReply {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long hostReplyId;

    @OneToOne
    @JoinColumn(name = "review_id")
    private Review review;

    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "created_at")
    private LocalDateTime createdAt;
}
