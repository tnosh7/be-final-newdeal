package com.newdeal.staynest.entity.accommodation;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AccommodationImgRepository extends JpaRepository<AccommodationImg, Long> {
    void deleteByAccommodation(Accommodation accommodation);

}
