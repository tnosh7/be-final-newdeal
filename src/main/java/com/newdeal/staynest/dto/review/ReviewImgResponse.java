package com.newdeal.staynest.dto.review;

import com.newdeal.staynest.entity.ReviewImg;
import com.newdeal.staynest.dto.review.ReviewImgResponse;
import lombok.Getter;

@Getter
public class ReviewImgResponse {
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
                reviewImg.getImgUrl() // 여기서 getUrl()을 getImgUrl()로 변경
        );
    }
}
