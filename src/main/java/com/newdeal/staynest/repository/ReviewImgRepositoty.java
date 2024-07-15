package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.Review;
import com.newdeal.staynest.entity.ReviewImg;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ReviewImgRepositoty extends JpaRepository<ReviewImg, Integer> {

    @Query("select im from ReviewImg im where im.review.reviewId = :reviewId")
    ReviewImg findByReviewId(Long reviewId);

    void deleteByReview(Review review);

    List<ReviewImg> findByReview(Review review);
}
