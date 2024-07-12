package com.newdeal.staynest.controller;

import com.newdeal.staynest.dto.guest.GuestResponse;
import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.UserRoleEnum;
import com.newdeal.staynest.service.GuestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/guests")
public class GuestController {

    private final GuestService guestService;

    /**
     * GuestService 객체 주입(DI)
     * GuestController -> GuestService 에 의존
     * @param guestService
     */
    @Autowired
    public GuestController(GuestService guestService) {
        this.guestService = guestService;
    }
    
    // 회원 정보 보기
    @GetMapping
    public ModelAndView guestView() {

        ModelAndView modelAndView = new ModelAndView("guest/guestAccount");
        
        // login한 유저 값으로 바꿔야 함
        Guest guest = guestService.getGuestById(1L);
        modelAndView.addObject("guest", guest);

        return modelAndView;
    }

    // 회원 정보 수정
    @PatchMapping("/{guestId}")
    public ModelAndView updateGuest(@PathVariable Long guestId, @RequestBody Guest reqUpdateGuest) {

        GuestResponse.UpdateGuestDTO guest = guestService.updateGuest(guestId, reqUpdateGuest);
        ModelAndView modelAndView = new ModelAndView("guest/guestAccount");
        modelAndView.addObject("guest", guest);

        return modelAndView;
    }

    // 회원 정보 삭제
    @DeleteMapping("/{guestId}")
    public ModelAndView deleteGuest(@PathVariable Long guestId) {

        guestService.deleteGuest(guestId);

        return new ModelAndView("redirect:/");
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