package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.HostReply;
import com.newdeal.staynest.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HostReplyRepository extends JpaRepository<HostReply, Long> {
    HostReply findByReview(Review review);
}
