package com.newdeal.staynest.dto.review;

import java.util.List;

public record ReviewRequest(
        int star,
        String content,
        List<String> imgUrl
) {
    public ReviewRequest {
        if (star < 1 || star > 5) {
            throw new IllegalArgumentException("별점이 1이상 5이하의 값이 아닙니다.");
        }
        if (content == null || content.isEmpty()) {
            throw new IllegalArgumentException("내용이 비어있습니다.");
        }
    }
}
