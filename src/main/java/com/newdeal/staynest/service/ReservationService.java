package com.newdeal.staynest.service;

import com.newdeal.staynest.entity.Reservation;
import com.newdeal.staynest.repository.ReservationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class ReservationService {
    final ReservationRepository reservationRepository;

    public Reservation addReservation(Reservation reservation) {
        return reservationRepository.save(reservation);
    }
}
