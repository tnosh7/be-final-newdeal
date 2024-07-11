//package com.newdeal.staynest.service;
//
//import com.newdeal.staynest.dto.review.ReviewRequest;
//import com.newdeal.staynest.dto.review.ReviewResponse;
//import com.newdeal.staynest.entity.Review;
//import com.newdeal.staynest.repository.ReviewRepository;
//import lombok.Builder;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//@Builder
//@Service
//@RequiredArgsConstructor
//
//public class ReviewReplyService {
//    private final ReviewRepository reviewRepository;
//
//    @Transactional
//    public void ReviewSave(ReviewRequest reviewRequest, Long reservationId) {
//        Review review = Review.builder()
//                .content(reviewRequest.content())
//                        .star(reviewRequest.star())
//                                .()
//        reviewRepository.save(review);
//    }
//
//    public ReviewResponse getReview(Long reviewId) {
//        Review review = reviewRepository.getOne(reviewId);
//        return ReviewResponse.fromEntity(review);
//    }
//}
