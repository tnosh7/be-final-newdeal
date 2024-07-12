package com.newdeal.staynest.controller;

import com.newdeal.staynest.dto.review.ReviewRequest;
import com.newdeal.staynest.dto.review.ReviewResponse;
import com.newdeal.staynest.entity.Reservation;
import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.service.ReviewReplyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequiredArgsConstructor
@Controller
@RequestMapping("/review")
public class ReviewReplyController {
    private final ReviewReplyService reviewReplyService;

    @GetMapping("/insertReview/{reservationId}/{accomId}")
    public ModelAndView insertReview(
            @PathVariable Long reservationId,
            @PathVariable Long accomId
//            @RequestHeader("Authorization") String token
    ) {
        // 여기에 토큰을 검증하는 로직을 추가할 수 있습니다.
//        if (!isTokenValid(token)) {
//            // 토큰이 유효하지 않은 경우 처리 로직 추가 (예: 에러 페이지로 이동)
//            ModelAndView mav = new ModelAndView("error/unauthorized");
//            return mav;
//        }
        Reservation reservation = reviewReplyService.getReservationByReservation(reservationId);
        Accommodation accom = reviewReplyService.getAccomodationByAccomodation(accomId);
        ModelAndView mav = new ModelAndView("review/insertReview");
        mav.addObject("reservation", reservation);
        mav.addObject("accom", accom);
        return mav;
    }

    private boolean isTokenValid(String token) {
        // 실제 토큰 검증 로직을 구현합니다.
        return true; // 임시로 항상 유효한 것으로 설정
    }


    @PostMapping("/insertReview/{reservationId}/{accomId}")
    public ModelAndView insertReview(
            @RequestBody ReviewRequest reviewRequest,
            @PathVariable Long reservationId,
            @PathVariable Long accomId
    ) {
        reviewReplyService.ReviewSave(reviewRequest, reservationId, accomId);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("review/fullReview/" + accomId);
        mav.addObject("accomId", accomId);
        return mav;
    }

    @GetMapping("/fullReview/{accommId}")
    public ModelAndView fullReview(@PathVariable Long accommId) {
        List<ReviewResponse> reviewResponses = reviewReplyService.getReviewsByAccommodationId(accommId);
        ModelAndView mav = new ModelAndView("review/fullReview");
        mav.addObject("reviewResponses", reviewResponses);
        return mav;
    }

}
