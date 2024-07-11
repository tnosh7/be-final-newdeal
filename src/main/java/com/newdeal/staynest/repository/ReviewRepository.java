package com.newdeal.staynest.repository;

import com.newdeal.staynest.dto.review.ReviewResponse;
import com.newdeal.staynest.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Long> {
    List<Review> findAllByReservation_ReservationId(Long reservationId);
}
