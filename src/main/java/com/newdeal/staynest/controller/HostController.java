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
    // 숙소 등록
    @GetMapping("/accomEnroll")
    public ModelAndView accomEnroll() {
        return new ModelAndView("host/accomEnroll");
    }
    @GetMapping("/accomUpdate")
    public ModelAndView accomUpdate() {
        return new ModelAndView("host/accomUpdate");
    }
    //숙소 메인
    @GetMapping("/")
    public ModelAndView hostMain() {
        return new ModelAndView("host/hostMain");
    }

}
