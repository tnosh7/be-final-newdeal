//package com.newdeal.staynest.controller;
//
//import com.newdeal.staynest.dto.review.ReviewResponse;
//import com.newdeal.staynest.entity.Review;
//import com.newdeal.staynest.service.ReviewReplyService;
//import lombok.RequiredArgsConstructor;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.servlet.ModelAndView;
//
//import java.util.List;
//@RequiredArgsConstructor
//@RestController
//@RequestMapping("/review")
//public class ReviewReplyController {
//    private final ReviewReplyService reviewReplyService;
//
////    전체보기 리스트로 리스폰스부터 만들어야됨
////    @GetMapping("/fullReview")
////    public ResponseEntity<List<Review>> fullReview() {
////        return new ModelAndView("review/fullReview");
////    }
//
//    @GetMapping("/Review/{reviewId}")
//    public ResponseEntity<ReviewResponse> getRe
//            (@PathVariable("reviewId") Long reviewId) {
//        ReviewResponse reviewResponse = reviewReplyService.getReview(reviewId);
//
//        return ResponseEntity
//                .ok()
//                .body(reviewResponse);
//    }
//
//
//
//}
