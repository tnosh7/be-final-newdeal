package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.Reservation;
import com.newdeal.staynest.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

    @Query("SELECT r FROM Review r JOIN FETCH r.reservation res JOIN FETCH res.guest WHERE r.accommodation = :accommId")
    List<Review> getReviewsByAccommodationId(@Param("accommId") Long accommId);

    List<Reservation> findByGuestId(Long guestId);
}


