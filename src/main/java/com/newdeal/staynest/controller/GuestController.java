package com.newdeal.staynest.controller;

import com.newdeal.staynest.dto.guest.GuestResponse;
import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.Reservation;
import com.newdeal.staynest.entity.UserRoleEnum;
import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.service.GuestService;
import com.newdeal.staynest.service.ReservationService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@RequiredArgsConstructor
@RestController
@RequestMapping("/guests")
public class GuestController {

    private final GuestService guestService;
    private final ReservationService reservationService;

    /**
     * GuestService 객체 주입(DI)
     * GuestController -> GuestService 에 의존
     * @param guestService
     */

    // 회원 정보 보기
    @GetMapping
    public ModelAndView guestView() {

        ModelAndView modelAndView = new ModelAndView("guest/guestAccount");
        Guest guest = guestService.getGuestById(1L); // 예시로 1L 사용, 실제로는 인증된 사용자 ID 사용
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

        Guest guest = guestService.getGuestById(1L); // 예시로 1L 사용, 실제로는 인증된 사용자 ID 사용

        List<Reservation> reservations = guestService.getReservationsByGuestId(guest.getId());

        ModelAndView modelAndView = new ModelAndView("guest/guestReservation");
        modelAndView.addObject("reservations", reservations);


        return modelAndView;
    }

    // 예약 취소
    @DeleteMapping("/reservations/{reservationId}")
    public ModelAndView cancelReservation(@PathVariable Long reservationId) {
        guestService.cancelReservation(reservationId);

        // 취소 후 예약 목록을 다시 가져와서 뷰로 반환
        Guest guest = guestService.getGuestById(1L); // 예시로 1L 사용, 실제로는 인증된 사용자 ID 사용
        List<Reservation> reservations = guestService.getReservationsByGuestId(guest.getId());

        ModelAndView modelAndView = new ModelAndView("guest/guestReservation");
        modelAndView.addObject("reservations", reservations);

        return modelAndView;
    }


    // 찜한 숙소 리스트
    @GetMapping("/favorites")
    public ModelAndView guestFavorite() {
        Guest guest = guestService.getGuestById(1L); // 예시로 1L 사용, 실제로는 인증된 사용자 ID 사용
        List<Accommodation> favoriteAccommodations = guestService.getFavoriteAccommodationsByGuestId(guest.getId());

        ModelAndView modelAndView = new ModelAndView("guest/guestFavorite");
        modelAndView.addObject("favorites", favoriteAccommodations);

        return modelAndView;
    }
}