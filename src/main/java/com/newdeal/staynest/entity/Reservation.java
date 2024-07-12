package com.newdeal.staynest.entity;

import com.newdeal.staynest.entity.accommodation.Accommodation;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "Reservation")
@Getter
@Setter
@Builder
@RequiredArgsConstructor
@AllArgsConstructor
@EntityListeners(AuditingEntityListener.class)
public class Reservation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reservationId;

    @ManyToOne
    @JoinColumn(name = "accomm_id")
    private Accommodation accommodation;

    @ManyToOne
    @JoinColumn(name = "guest_id")
    private Guest guest;

    @Column(name = "check_in_date", nullable = false)
    private LocalDate checkInDate;

    @Column(name = "check_out_date", nullable = false)
    private LocalDate checkOutDate;

    @Column(name = "guests", nullable = false)
    private int guests;

    @CreatedDate
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "message")
    private String message;
}
