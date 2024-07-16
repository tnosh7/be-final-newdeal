package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.HostReply;
import com.newdeal.staynest.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface HostReplyRepository extends JpaRepository<HostReply, Long> {
    HostReply findByReview(Review review);

    @Query("SELECT hr FROM HostReply hr WHERE hr.review = :review")
    HostReply findByReviewExistingReply(@Param("review") Review review);

    @Query("select hr from HostReply hr where hr.hostReplyId = :replyId")
    HostReply findByHostReplyId(Long replyId);

    void deleteByHostReplyId(Long hostReplyId);
}
