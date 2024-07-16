package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.accommodation.Accommodation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AccommodationRepository extends JpaRepository<Accommodation, Long> {

    List<Accommodation> findByHostId(Long id);
    List<Accommodation> findByAddressAndMaxGuestsGreaterThanEqual(String location, int numGuests);

    @Query("SELECT a FROM Accommodation a JOIN Favorite f ON a.id = f.accommodation.id WHERE f.guest.id = :guestId")
    List<Accommodation> findFavoritesByGuestId(Long guestId);
}
