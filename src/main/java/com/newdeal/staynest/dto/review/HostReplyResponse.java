package com.newdeal.staynest.dto.review;

import com.newdeal.staynest.entity.HostReply;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Getter
@NoArgsConstructor
public class HostReplyResponse {
    private Long hostReplyId;
    private String content;
    private LocalDateTime createdAt;

    public HostReplyResponse(Long hostReplyId, String content, LocalDateTime createdAt) {
        this.hostReplyId = hostReplyId;
        this.content = content;
        this.createdAt = createdAt;
    }

    public static HostReplyResponse fromEntity(HostReply hostReply) {
        if (hostReply == null) {
            return null;
        }
        return new HostReplyResponse(hostReply.getHostReplyId(), hostReply.getContent(), hostReply.getCreatedAt());
    }
}
