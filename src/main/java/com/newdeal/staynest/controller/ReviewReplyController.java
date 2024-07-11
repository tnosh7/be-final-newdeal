package com.newdeal.staynest.controller;

import com.newdeal.staynest.dto.review.ReviewRequest;
import com.newdeal.staynest.dto.review.ReviewResponse;
import com.newdeal.staynest.entity.Review;
import com.newdeal.staynest.repository.ReviewRepository;
import com.newdeal.staynest.service.ReviewReplyService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.net.URI;
import java.util.List;
@RequiredArgsConstructor
@RestController
@RequestMapping("/review")
public class ReviewReplyController {
    private final ReviewReplyService reviewReplyService;
    private final ReviewRepository reviewRepository;
//    private final JwtUtil jwtUtil;
//public ReviewController(ReviewReplyService reviewReplyService, JwtUtil jwtUtil) {
//    this.reviewReplyService = reviewReplyService;
//    this.jwtUtil = jwtUtil;
//}
//    @PostMapping("/insertReview/{reservationId}")
//    public ResponseEntity<Void> insertReview(
//            @RequestBody final ReviewRequest reviewRequest,
//            @PathVariable final Long reservationId
//    ) {
//        reviewReplyService.ReviewSave(reviewRequest, reservationId);
//        return ResponseEntity
//                .ok()
//                .build();
//    }

    @PostMapping("/insertReview/{reservationId}/{accomId}")
    public ModelAndView insertReview(
            @RequestBody ReviewRequest reviewRequest,
            @PathVariable Long reservationId,
            @PathVariable Long accomId
//            @RequestHeader(HttpHeaders.AUTHORIZATION) String authorizationHeader
    ) {
//        String token = authorizationHeader.substring(7); // "Bearer " 제거
//        if (jwtUtil.validateToken(token)) {
            reviewReplyService.ReviewSave(reviewRequest, reservationId, accomId);

            ModelAndView mav = new ModelAndView();
            mav.setViewName("review/fullReview/{reservationId}");
            mav.addObject("accomId", accomId);
            return mav;
//        } else {
//            // 토큰이 유효하지 않으면 오류 페이지로 리디렉션
//            ModelAndView modelAndView = new ModelAndView();
//            modelAndView.setViewName("error/unauthorized");
//            return modelAndView;
//        }
    }

    @GetMapping("/fullReview/{accommId}")
    public ModelAndView fullReview(@PathVariable Long accommId) {
        List<ReviewResponse> reviewResponses = reviewReplyService.getReviewsByAccommodationId(accommId);
        ModelAndView mav = new ModelAndView("review/fullReview"); // 뷰 이름을 지정하여 ModelAndView 객체 생성
        mav.addObject("reviewResponses", reviewResponses);
        return mav; // ModelAndView 객체 반환
    }



//    @GetMapping("/Review/{reviewId}")
//    public ResponseEntity<ReviewResponse> getRe
//            (@PathVariable("reviewId") Long reviewId) {
//        ReviewResponse reviewResponse = reviewReplyService.getReview(reviewId);
//
//        return ResponseEntity
//                .ok()
//                .body(reviewResponse);
//    }



}
