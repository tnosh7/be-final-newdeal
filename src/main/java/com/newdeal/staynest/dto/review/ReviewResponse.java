package com.newdeal.staynest.dto.review;

import com.newdeal.staynest.entity.Review;
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
    private String guestName;
    private HostReplyResponse hostReply;

    public ReviewResponse(Long reviewId, int star, String content, LocalDateTime createdAt, List<ReviewImgResponse> images, String guestName, HostReplyResponse hostReply) {
        this.reviewId = reviewId;
        this.star = star;
        this.content = content;
        this.createdAt = createdAt;
        this.images = images;
        this.guestName = guestName;
        this.hostReply = hostReply;
    }

    public static ReviewResponse fromEntity(Review review) {
        List<ReviewImgResponse> imageResponses = review.getImages().stream()
                .map(ReviewImgResponse::fromEntity)
                .collect(Collectors.toList());

        return new ReviewResponse(
                review.getReviewId(),
                review.getStar(),
                review.getContent(),
                review.getCreatedAt(),
                imageResponses,
                review.getReservation().getGuest().getGuestName(),
                HostReplyResponse.fromEntity(review.getHostReply())
        );
    }

    public static List<ReviewResponse> fromEntity(List<Review> reviews) {
        return reviews.stream()
                .map(ReviewResponse::fromEntity)
                .collect(Collectors.toList());
    }
}
