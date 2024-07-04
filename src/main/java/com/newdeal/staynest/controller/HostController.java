package com.newdeal.staynest.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/api/hosts")
public class HostController {

    // 숙소 등록 페이지
    @GetMapping("/accommodations")
    public ModelAndView hostAccom() {
        return new ModelAndView("host/hostAccom");
    }

    // 예약 내역 정보
    @GetMapping("/reservations")
    public ModelAndView hostReservation() {
        return new ModelAndView("host/hostReservation");
    }

}
