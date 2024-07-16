package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.entity.accommodation.Favorite;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FavoriteRepository extends JpaRepository<Favorite, Long> {
    boolean existsByAccommodationAndGuest(Accommodation accommodation, Guest guest);
    void deleteByAccommodationAndGuest(Accommodation accommodation, Guest guest);
}
