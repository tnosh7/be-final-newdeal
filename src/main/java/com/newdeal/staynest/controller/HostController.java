package com.newdeal.staynest.controller;

import com.newdeal.staynest.dto.host.HostResponse;
import com.newdeal.staynest.entity.Host;
import com.newdeal.staynest.entity.UserRoleEnum;
import com.newdeal.staynest.service.HostService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/hosts")
public class HostController {

    private final HostService hostService;

    @Autowired
    public HostController(HostService hostService) {
        this.hostService = hostService;
    }

    // 호스트 회원 정보보기
    @GetMapping
    public ModelAndView hostView() {

        ModelAndView modelAndView = new ModelAndView("host/hostAccom");

        // login한 유저 값으로 바꿔야 함
        Host host = hostService.getHostById(2L);
        modelAndView.addObject("host", host);

        return modelAndView;
    }

    // 회원 정보 수정
    @PatchMapping("/{hostId}")
    public ModelAndView updateHost(@PathVariable Long hostId, @RequestBody Host reqUpdateHost) {

        HostResponse.UpdateHostDTO host = hostService.updateHostDTO(hostId, reqUpdateHost);
        ModelAndView modelAndView = new ModelAndView("host/hostAccom");
        modelAndView.addObject("host", host);

        return modelAndView;
    }

    // 회원 정보 삭제
    @DeleteMapping("/{hostId}")
    public ModelAndView deleteHost(@PathVariable Long hostId) {

        hostService.deleteHost(hostId);

        return new ModelAndView("redirect:/");
    }

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

    // 호스트 숙소 등록
    @GetMapping("/accomEnroll")
    public ModelAndView accomEnroll() {
        return new ModelAndView("host/accomEnroll");
    }

    // 호스트 숙소 수정
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
