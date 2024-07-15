package com.newdeal.staynest.dto.review;

import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.Review;
import com.newdeal.staynest.entity.ReviewImg;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@NoArgsConstructor
public class ReviewResponse {
    private Long reviewId;
    private int star;
    private String content;
    private LocalDateTime createdAt;
    private List<ReviewImgResponse> images;
    private String guestName; // Guest 이름 추가

    public ReviewResponse(Long reviewId, int star, String content, LocalDateTime createdAt, List<ReviewImgResponse> images, String guestName) {
        this.reviewId = reviewId;
        this.star = star;
        this.content = content;
        this.createdAt = createdAt;
        this.images = images;
        this.guestName = guestName;
    }

    // Review 엔티티를 ReviewResponse DTO로 변환하는 메서드
    public static ReviewResponse fromEntity(Review review) {
        // Review 엔티티의 images 리스트를 ReviewImgResponse DTO 리스트로 변환
        List<ReviewImgResponse> imageResponses = review.getImages().stream()
                .map(ReviewImgResponse::fromEntity)
                .collect(Collectors.toList());

        // ReviewResponse 객체 생성하여 반환
        return new ReviewResponse(
                review.getReviewId(),
                review.getStar(),
                review.getContent(),
                review.getCreatedAt(),
                imageResponses,
                review.getReservation().getGuest().getGuestName() // 리뷰에서 예약 -> 게스트 -> 이름을 가져옴
        );
    }

    // List<Review>를 List<ReviewResponse>로 변환하는 메서드
    public static List<ReviewResponse> fromEntity(List<Review> reviews) {
        return reviews.stream()
                .map(ReviewResponse::fromEntity)
                .collect(Collectors.toList());
    }
}


