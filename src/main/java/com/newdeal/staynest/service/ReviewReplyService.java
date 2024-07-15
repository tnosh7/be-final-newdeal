package com.newdeal.staynest.service;

import com.newdeal.staynest.dto.hostReply.HostReplyRequest;
import com.newdeal.staynest.dto.review.ReviewRequest;
import com.newdeal.staynest.dto.review.ReviewResponse;
import com.newdeal.staynest.entity.HostReply;
import com.newdeal.staynest.entity.Reservation;
import com.newdeal.staynest.entity.Review;
import com.newdeal.staynest.entity.ReviewImg;
import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.repository.*;
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
    private final ReviewImgRepositoty reviewImgRepositoty;
    private final HostReplyRepository hostReplyRepository;

    @Transactional
    public void ReviewSave(ReviewRequest reviewRequest, Long reservationId, Long accomId) {
        // 이미지 URL 리스트를 ReviewImg 객체로 변환
        List<ReviewImg> reviewImgs = reviewRequest.imgUrl().stream()
                .map(url -> ReviewImg.builder().imgUrl(url).createdAt(LocalDateTime.now()).build())
                .collect(Collectors.toList());

        // Review 객체 생성
        Review review = Review.builder()
                .content(reviewRequest.content())
                .star(reviewRequest.star())
                .createdAt(LocalDateTime.now())
                .reservation(Reservation.builder().reservationId(reservationId).build())
                .accommodation(Accommodation.builder().id(accomId).build())
                .build();

        // Review 객체를 저장하고, 저장된 Review 객체를 반환
        Review savedReview = reviewRepository.save(review);

        // 저장된 Review 객체의 ID를 각 ReviewImg 객체에 설정
        reviewImgs.forEach(img -> {
            img.setReview(savedReview);
            reviewImgRepositoty.save(img); // ReviewImg 객체를 저장
        });

        // 저장된 Review 객체에 ReviewImg 객체들을 설정하고 다시 저장
        savedReview.setImages(reviewImgs);
        reviewRepository.save(savedReview);
    }


    @Transactional(readOnly = true)
    public Review findByReservationId(Long reservationId) {
        Review review = reviewRepository.findByReservationId(reservationId);
//        System.out.println("Review 객체가 성공적으로 받아왔습니다: " + review.toString());
//        System.out.println(reservationId);
        return review;
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

    @Transactional
    public void ReplySave(HostReplyRequest hostReplyRequest, Long reviewId) {
        Review review = reviewRepository.findById(reviewId).orElse(null);
        HostReply hostReply = HostReply.builder()
                .content(hostReplyRequest.content())
                .review(review)
                .createdAt(LocalDateTime.now())
                .build();
        hostReplyRepository.save(hostReply);
    }
}
