package com.newdeal.staynest.guest;

import com.newdeal.staynest.controller.GuestController;
import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.service.GuestService;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;

@SpringBootTest
public class GuestControllerFavoriteTest {

    @Autowired
    private GuestController guestController;

    @MockBean
    private GuestService guestService;

    @BeforeEach
    public void setup() {
        // Given
        Guest guest = new Guest();
        guest.setId(1L);
        guest.setGuestName("John Doe");
        guest.setEmail("john.doe@example.com");

        Accommodation accommodation1 = new Accommodation();
        accommodation1.setId(1L);
        accommodation1.setName("Accommodation 1");
        accommodation1.setCategory("Category 1");
        accommodation1.setRoomCategory("Room Category 1");
        accommodation1.setAddress("123 Main St");
        accommodation1.setDetailAddress("Apt 1");
        accommodation1.setMaxGuests(4);
        accommodation1.setPrice("100");
        accommodation1.setCheckIn("14:00");
        accommodation1.setCheckOut("11:00");
        accommodation1.setContent("Content 1");
        accommodation1.setRating(4.5);
        accommodation1.setReviewCount(10);
        accommodation1.setLatitude(37.7749);
        accommodation1.setLongitude(-122.4194);

        Accommodation accommodation2 = new Accommodation();
        accommodation2.setId(2L);
        accommodation2.setName("Accommodation 2");
        accommodation2.setCategory("Category 2");
        accommodation2.setRoomCategory("Room Category 2");
        accommodation2.setAddress("456 Elm St");
        accommodation2.setDetailAddress("Suite 2");
        accommodation2.setMaxGuests(2);
        accommodation2.setPrice("150");
        accommodation2.setCheckIn("15:00");
        accommodation2.setCheckOut("12:00");
        accommodation2.setContent("Content 2");
        accommodation2.setRating(4.0);
        accommodation2.setReviewCount(5);
        accommodation2.setLatitude(34.0522);
        accommodation2.setLongitude(-118.2437);

        List<Accommodation> favoriteAccommodations = Arrays.asList(accommodation1, accommodation2);

        Mockito.when(guestService.getGuestById(1L)).thenReturn(guest);
        Mockito.when(guestService.getFavoriteAccommodationsByGuestId(1L)).thenReturn(favoriteAccommodations);
    }

    @Test
    public void testGuestFavorite() {
        // When
        ModelAndView modelAndView = guestController.guestFavorite();

        // Then
        Assertions.assertThat(modelAndView).isNotNull();
        Assertions.assertThat(modelAndView.getViewName()).isEqualTo("guest/guestFavorite");
        Assertions.assertThat(modelAndView.getModel()).containsKey("favorites");

        List<Accommodation> favorites = (List<Accommodation>) modelAndView.getModel().get("favorites");
        Assertions.assertThat(favorites).hasSize(2);

        Assertions.assertThat(favorites.get(0).getId()).isEqualTo(1L);
        Assertions.assertThat(favorites.get(1).getId()).isEqualTo(2L);
    }

}
