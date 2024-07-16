package com.newdeal.staynest.service;

import com.newdeal.staynest.core.exception.ResourceNotFoundException;
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

import static com.newdeal.staynest.entity.QReview.review;

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
    public void ReviewSaveOrUpdate(ReviewRequest reviewRequest, Long reservationId, Long accomId) {
        // 기존 리뷰를 조회
        Review existingReview = reviewRepository.findByReservation_ReservationIdAndAccommodation_Id(reservationId, accomId);

        if (existingReview != null) {
            // 기존 리뷰 업데이트
            existingReview.setContent(reviewRequest.content());
            existingReview.setStar(reviewRequest.star());
            existingReview.setCreatedAt(LocalDateTime.now());

            // 새로운 이미지 URL 리스트를 ReviewImg 객체로 변환하여 저장
            List<ReviewImg> newReviewImgs = reviewRequest.imgUrl().stream()
                    .map(url -> ReviewImg.builder().imgUrl(url).createdAt(LocalDateTime.now()).review(existingReview).build())
                    .collect(Collectors.toList());

            // 기존 이미지 리스트 가져오기
            List<ReviewImg> existingReviewImgs = existingReview.getImages();

            // 기존 이미지와 새로운 이미지를 병합
            existingReviewImgs.clear();
            existingReviewImgs.addAll(newReviewImgs);

            // 리뷰에 이미지 설정
            existingReview.setImages(existingReviewImgs);

            // 리뷰 저장 (이 단계에서는 새로운 이미지를 포함한 리뷰가 저장됩니다)
            reviewRepository.save(existingReview);

        } else {
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
            reviewImgs.forEach(img -> img.setReview(savedReview));

            // ReviewImg 객체를 저장
            reviewImgRepositoty.saveAll(reviewImgs);

            // 저장된 Review 객체에 ReviewImg 객체들을 설정하고 다시 저장
            savedReview.setImages(reviewImgs);
            reviewRepository.save(savedReview);
        }
    }

    @Transactional
    public void deleteReview(Long reservationId) {
        // 예약 ID로 리뷰를 찾아 삭제합니다.
        Review review = reviewRepository.findByReservationId(reservationId);
        if (review == null) {
            throw new ResourceNotFoundException("Review not found for reservation id: " + reservationId);
        }

        // 리뷰에 연결된 이미지 삭제
        List<ReviewImg> reviewImgs = reviewImgRepositoty.findByReview(review);
        reviewImgRepositoty.deleteAll(reviewImgs);

        // 리뷰에 연결된 호스트 답글 삭제
        HostReply hostReply = hostReplyRepository.findByReview(review);
        if (hostReply != null) {
            hostReplyRepository.delete(hostReply);
        }

        // 리뷰 삭제
        reviewRepository.delete(review);
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

    public ReviewImg findByReviewId(Long reviewId) {
        return reviewImgRepositoty.findByReviewId(reviewId);
    }
}
