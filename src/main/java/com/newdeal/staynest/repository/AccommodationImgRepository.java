package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.entity.accommodation.AccommodationImg;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface AccommodationImgRepository extends JpaRepository<AccommodationImg, Long> {
    @Modifying
    @Transactional
    @Query("DELETE FROM AccommodationImg ai WHERE ai.accommodation = :accommodation")
    void deleteByAccommodation(Accommodation accommodation);
}


