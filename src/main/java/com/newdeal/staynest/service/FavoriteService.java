package com.newdeal.staynest.service;

import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.entity.accommodation.Favorite;
import com.newdeal.staynest.repository.FavoriteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FavoriteService {

    @Autowired
    private FavoriteRepository favoriteRepository;

    public void addFavorite(Accommodation accommodation, Guest guest) {
        Favorite favorite = new Favorite();
        favorite.setAccommodation(accommodation);
        favorite.setGuest(guest);
        favoriteRepository.save(favorite);
    }

    @Transactional
    public void removeFavorite(Accommodation accommodation, Guest guest) {
        favoriteRepository.deleteByAccommodationAndGuest(accommodation, guest);
    }

    public boolean isFavorite(Accommodation accommodation, Guest guest) {
        return favoriteRepository.existsByAccommodationAndGuest(accommodation, guest);
    }
}
