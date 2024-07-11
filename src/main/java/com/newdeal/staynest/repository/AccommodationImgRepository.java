package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.entity.accommodation.AccommodationImg;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccommodationImgRepository extends JpaRepository<AccommodationImg, Long> {
    void deleteByAccommodation(Accommodation accommodation);

}
