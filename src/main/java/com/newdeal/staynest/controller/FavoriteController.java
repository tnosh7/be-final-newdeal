package com.newdeal.staynest.controller;

import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.service.AccommodationService;
import com.newdeal.staynest.service.FavoriteService;
import com.newdeal.staynest.service.GuestService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@RestController
@RequestMapping("/favorites")
public class FavoriteController {
    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private AccommodationService accommodationService;

    @Autowired
    private GuestService guestService;

    @PostMapping("/{accommodationId}")
    public ResponseEntity<String> toggleFavorite(@PathVariable Long accommodationId, @RequestBody Long guestId) {
        Accommodation accommodation = accommodationService.getAccomById(accommodationId);
        Guest guest = guestService.getGuestById(guestId);
        if (favoriteService.isFavorite(accommodation, guest)) {
            favoriteService.removeFavorite(accommodation, guest);
            return ResponseEntity.ok("즐겨찾기에서 삭제되었습니다.");
        } else {
            favoriteService.addFavorite(accommodation, guest);
            return ResponseEntity.ok("즐겨찾기에 추가되었습니다.");
        }
    }
    @GetMapping("/page")
    public String favoritePage(Model model, Principal principal) {
        // 로그인된 사용자 정보 가져오기
        Guest loggedInGuest = guestService.findByGuestName(principal.getName());
        model.addAttribute("loggedInGuestId", loggedInGuest.getId());
        return "favoritesPage";
    }


}

