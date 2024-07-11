package com.newdeal.staynest.controller;

import com.newdeal.staynest.dto.ReserveDto;
import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.Reservation;
import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.service.AccommodationService;
import com.newdeal.staynest.service.GuestService;
import com.newdeal.staynest.service.ReservationService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

@RequiredArgsConstructor
@Controller
public class ReserveController {

    private final GuestService guestService;
    private final AccommodationService accommodationService;
    private final ReservationService reservationService;

    @GetMapping("/reserve")
    public ModelAndView reserveAccommodations(HttpSession session) {
        ModelAndView mav = new ModelAndView("reserve/reserve");
        ReserveDto reserveDto = (ReserveDto) session.getAttribute("reserveDto");
        Accommodation accommodation = accommodationService.getAccomById(reserveDto.getAccommodationId());
        mav.addObject("accommodation", accommodation);
        mav.addObject("reserveDto", reserveDto);
        return mav;
    }

    @PostMapping("/reserve")
    public ResponseEntity<String> reserve(@RequestBody ReserveDto reserveDto, HttpSession session) {
        session.setAttribute("reserveDto", reserveDto);
        System.out.println(reserveDto.getCheckInDate());
        // 클라이언트로부터 받은 예약 정보 처리
        return ResponseEntity.ok("예약정보보내기!");
    }

    @GetMapping("/reserveComplete")
    public ModelAndView reservecomplete(HttpSession session) {
        ModelAndView mav = new ModelAndView("reserve/reserveComplete");
        Reservation reservation = (Reservation) session.getAttribute("reservation");
        Accommodation accommodation = accommodationService.getAccomById(reservation.getAccommodation().getAccommId());
        mav.addObject("reservation",reservation);
        mav.addObject("accommodation", accommodation);
        return mav;
    }

    @PostMapping("/reserveComplete")
    public ResponseEntity<String> reserve(@RequestBody String message, HttpSession session) {
        ReserveDto reserveDto = (ReserveDto) session.getAttribute("reserveDto");
        Guest guest = guestService.getGuestById(1L);
        Accommodation accommodation = accommodationService.getAccomById(reserveDto.getAccommodationId());
        Reservation reservation = Reservation.builder()
                .guest(guest)
                .accommodation(accommodation)
                .checkInDate(reserveDto.getCheckInDate())
                .checkOutDate(reserveDto.getCheckOutDate())
                .guests(reserveDto.getGuests())
                .message(message)
                .build();
        Reservation reservation1 = reservationService.addReservation(reservation);
        session.setAttribute("reservation",reservation1);
        return ResponseEntity.ok("예약완료처리!");
    }
}
