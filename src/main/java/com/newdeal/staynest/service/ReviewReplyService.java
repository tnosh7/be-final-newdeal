package com.newdeal.staynest.service;

import com.newdeal.staynest.dto.review.ReviewRequest;
import com.newdeal.staynest.dto.review.ReviewResponse;
import com.newdeal.staynest.entity.Reservation;
import com.newdeal.staynest.entity.Review;
import com.newdeal.staynest.entity.ReviewImg;
import com.newdeal.staynest.repository.AccommodationRepository;
import com.newdeal.staynest.repository.ReviewRepository;
import lombok.Builder;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Builder
@Service
@RequiredArgsConstructor

public class ReviewReplyService {
    private final ReviewRepository reviewRepository;
    private final AccommodationRepository accommodationRepository;
//    private final Reser

    @Transactional
    public void ReviewSave(ReviewRequest reviewRequest, Long reservationId) {
        // 이미지 URL 리스트를 ReviewImg 객체로 변환
        List<ReviewImg> reviewImgs = reviewRequest.imgUrl().stream()
                .map(url -> ReviewImg.builder().imgUrl(url).build())
                .collect(Collectors.toList());

        // Review 객체 생성
        Review review = Review.builder()
                .content(reviewRequest.content())
                .star(reviewRequest.star())
                .images(reviewImgs)
                .createdAt(LocalDateTime.now())
                .reservation(Reservation.builder().reservationId(reservationId).build())
                .build();

        reviewRepository.save(review);
    }

//    @Transactional(readOnly = true)
//    public List<ReviewResponse> fullReview(Long accommId) {
//        List<Review> reviews = reviewRepository.findAllByReservation_ReservationId(accommId);
//        return ReviewResponse.fromEntity(reviews);
//    }
}
