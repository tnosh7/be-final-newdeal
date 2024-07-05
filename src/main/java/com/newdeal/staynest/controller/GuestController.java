package com.newdeal.staynest.controller;

import com.newdeal.staynest.dto.guest.GuestRequest;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/guests")
public class GuestController {

    // 회원정보수정
    @GetMapping
    public ModelAndView guestView() {
        return new ModelAndView("guest/guestAccount");
    }

    // 예약 내역 정보
    @GetMapping("/reservations")
    public ModelAndView guestReservation() {
        return new ModelAndView("guest/guestReservation");
    }

    // 찜한 숙소 리스트
    @GetMapping("/favorites")
    public ModelAndView guestFavorite() {
        return new ModelAndView("guest/guestFavorite");
    }
}