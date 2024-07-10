//package com.newdeal.staynest.dto.hostReply;
//
//import com.newdeal.staynest.entity.HostReply;
//
//import java.time.LocalDateTime;
//
//public class HostReplyResponse {
//    private Long hostReplyId;
//    private Long reviewId;
//    private String content;
//    private LocalDateTime createdAt;
//
//    // 기본 생성자
//    public HostReplyResponse() {
//    }
//
//    // 전체 필드를 초기화하는 생성자
//    public HostReplyResponse(Long hostReplyId, Long reviewId, String content, LocalDateTime createdAt) {
//        this.hostReplyId = hostReplyId;
//        this.reviewId = reviewId;
//        this.content = content;
//        this.createdAt = createdAt;
//    }
//
//    // Getters
//    public Long getHostReplyId() {
//        return hostReplyId;
//    }
//
//    public Long getReviewId() {
//        return reviewId;
//    }
//
//    public String getContent() {
//        return content;
//    }
//
//    public LocalDateTime getCreatedAt() {
//        return createdAt;
//    }
//
//    // HostReply 엔티티 객체를 HostReplyResponse로 변환하는 메서드
//    public static HostReplyResponse fromEntity(HostReply hostReply) {
//        return new HostReplyResponse(
//                hostReply.getHostReplyId(),
//                hostReply.getReview().getReviewId(), // HostReply에 연결된 Review의 ID를 가져옴
//                hostReply.getContent(),
//                hostReply.getCreatedAt()
//        );
//    }
//}
