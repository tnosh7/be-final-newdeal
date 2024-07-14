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
import java.util.Optional;
import java.util.stream.Collectors;

@Builder
@Service
@RequiredArgsConstructor

public class ReviewReplyService {
    private final ReviewRepository reviewRepository;
    private final AccommodationRepository accommodationRepository;
    private final ReservationRepository reservationRepository;
//    private final Reser

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
                .reservation(Reservation.builder().reservationId(reservationId).build())
                .accommodation(Accommodation.builder().id(accomId).build())
                .build();

        reviewRepository.save(review);
    }


    @Transactional(readOnly = true)
    public List<ReviewResponse> getReviewsByAccommodationId(Long accommId) {
        List<Review> reviews = reviewRepository.getReviewsByAccommodationId(accommId);
        return ReviewResponse.fromEntity(reviews);
    }

    @Transactional(readOnly = true)
    public Reservation getReservationByReservation(Long reservationId) {
        Optional<Reservation> optionalReservation = reservationRepository.findById(reservationId);
        return optionalReservation.orElse(null); // orElse(null)은 reservationId에 해당하는 Reservation이 없을 때 null을 반환합니다.
    }

    public Accommodation getAccomodationByAccomodation(Long accomId) {
        return accommodationRepository.findById(accomId).orElse(null);
    }

}
