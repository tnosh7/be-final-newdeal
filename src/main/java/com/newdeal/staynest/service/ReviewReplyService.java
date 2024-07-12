package com.newdeal.staynest.service;

import com.newdeal.staynest.dto.review.ReviewRequest;
import com.newdeal.staynest.dto.review.ReviewResponse;
import com.newdeal.staynest.entity.Reservation;
import com.newdeal.staynest.entity.Review;
import com.newdeal.staynest.entity.ReviewImg;
import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.repository.AccommodationRepository;
import com.newdeal.staynest.repository.ReservationRepository;
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
    private final ReservationRepository reservationRepository;

    @Transactional
    public void ReviewSave(ReviewRequest reviewRequest, Long reservationId, Long accomId) {
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
                .accommodation(Accommodation.builder().id(accomId).build())
                .reservation(Reservation.builder().reservationId(reservationId).build())
                .build();

        reviewRepository.save(review);
    }

    @Transactional(readOnly = true)
    public List<ReviewResponse> getReviewsByAccommodationId(Long accommId) {
        // 숙소 ID를 기준으로 해당 숙소에 속하는 모든 예약의 ID 조회
        List<Long> reservationIds = reservationRepository.findReservationIdsByAccommId(accommId);
        System.out.println(reservationIds);
        // 조회된 예약 ID들을 기준으로 해당 예약들에 속하는 모든 리뷰 조회
        List<Review> reviews = reviewRepository.findAllByReservation_ReservationIdIn(reservationIds);

        // Review 엔티티를 ReviewResponse DTO로 변환하여 반환
        return ReviewResponse.fromEntity(reviews);
    }
}
