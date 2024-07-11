package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

}
