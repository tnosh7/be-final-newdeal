package com.newdeal.staynest.dto.review;

import com.newdeal.staynest.entity.Review;
import com.newdeal.staynest.entity.ReviewImg;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

public class ReviewResponse {
    private Long reviewId;
    private int star;
    private String content;
    private LocalDateTime createdAt;
    private List<ReviewImgResponse> images;

    public ReviewResponse(Long reviewId, int star, String content, LocalDateTime createdAt, List<ReviewImgResponse> images) {
        this.reviewId = reviewId;
        this.star = star;
        this.content = content;
        this.createdAt = createdAt;
        this.images = images;
    }

    // Getters
    public Long getReviewId() {
        return reviewId;
    }

    public int getStar() {
        return star;
    }

    public String getContent() {
        return content;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public List<ReviewImgResponse> getImages() {
        return images;
    }

    // Review 엔티티를 ReviewResponse DTO로 변환하는 메서드
    public static ReviewResponse fromEntity(Review review) {
        // Review 엔티티의 images 리스트를 ReviewImgResponse DTO 리스트로 변환
        List<ReviewImgResponse> imageResponses = review.getImages().stream()
                .map(ReviewImgResponse::fromEntity) // ReviewImgResponse의 fromEntity 메서드를 이용하여 변환
                .collect(Collectors.toList()); // 리스트로 변환하여 imageResponses에 저장

        // ReviewResponse 객체 생성하여 반환
        return new ReviewResponse(
                review.getReviewId(), // Review 엔티티의 reviewId 필드 사용
                review.getStar(), // Review 엔티티의 star 필드 사용
                review.getContent(), // Review 엔티티의 content 필드 사용
                review.getCreatedAt(), // Review 엔티티의 createdAt 필드 사용
                imageResponses // 변환된 이미지 리스트를 ReviewResponse에 포함
        );
    }

}

class ReviewImgResponse {
    private Long id;
    private String url;

    public ReviewImgResponse(Long id, String url) {
        this.id = id;
        this.url = url;
    }

    // Getters
    public Long getId() {
        return id;
    }

    public String getUrl() {
        return url;
    }

    // Factory method to create ReviewImgResponse from ReviewImg entity
    public static ReviewImgResponse fromEntity(ReviewImg reviewImg) {
        return new ReviewImgResponse(
                reviewImg.getId(),
                reviewImg.getUrl()
        );
    }
}
