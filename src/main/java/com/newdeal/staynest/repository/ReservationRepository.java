package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

    // 숙소 ID를 기준으로 해당 숙소에 속하는 모든 예약의 ID를 조회하는 메서드
    @Query("SELECT r.reservationId FROM Reservation r WHERE r.accommodation = :accommId")
    List<Long> findReservationIdsByAccommId(@Param("accommId") Long accommId);

}


