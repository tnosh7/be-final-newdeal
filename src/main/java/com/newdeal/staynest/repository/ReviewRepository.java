package com.newdeal.staynest.repository;

import com.newdeal.staynest.dto.review.ReviewResponse;
import com.newdeal.staynest.entity.Reservation;
import com.newdeal.staynest.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.newdeal.staynest.entity.Review;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Long> {

    // 예약 ID들을 기준으로 해당 예약들에 속하는 모든 리뷰를 조회하는 메서드
//    List<Review> findAllByReservation_ReservationIdIn(List<Long> reservationIds);
//    @Query("SELECT r.reservationId FROM Reservation r WHERE r.accommodation.id = :accommId")
    
    @Query(" select re from Review re where re.reservation in(:reservationIds)")
    List<Review> findAllByReservation_ReservationIdIn(@Param("reservationIds") List<Long> reservationIds);

    @Query("select re from Review re where re.reservation.reservationId = :reservationId")
    Review findByReservationId(@Param("reservationId") Long reservationId);

//    List<Review> getReviewsByAccommodationId(Long accommId);

    @Query("SELECT r FROM Review r LEFT JOIN FETCH r.hostReply WHERE r.accommodation.id = :accommId")
    List<Review> getReviewsByAccommodationId(@Param("accommId") Long accommId);

    Review findByReservation_ReservationIdAndAccommodation_Id(Long reservationId, Long accomId);
}



