package com.newdeal.staynest.dto.hostReply;

public record HostReplyRequest(
        int reviewId,
        String content
) {
    public HostReplyRequest {
        if (reviewId <= 0) {
            throw new IllegalArgumentException("존재하지 않는 리뷰아이디입니다.");
        }
        if (content == null || content.isEmpty()) {
            throw new IllegalArgumentException("내용이 비어있습니다");
        }
    }
}
