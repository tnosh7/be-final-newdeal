package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReviewRepository extends JpaRepository<Review, Long> {
}
