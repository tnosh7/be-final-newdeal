package com.newdeal.staynest.dto.review;

import java.util.List;

public record HostReply(
        int star,
        String content,
        List<String> imgUrl
) {
}
