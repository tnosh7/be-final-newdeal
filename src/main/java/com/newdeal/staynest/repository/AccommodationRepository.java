package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.accommodation.Accommodation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AccommodationRepository extends JpaRepository<Accommodation, Long> {
    List<Accommodation> findByAddressAndMaxGuestsGreaterThanEqual(String location, int numGuests);
}
