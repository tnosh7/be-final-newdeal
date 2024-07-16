package com.newdeal.staynest.guest;

import com.newdeal.staynest.controller.GuestController;
import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.Reservation;
import com.newdeal.staynest.service.GuestService;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.web.servlet.ModelAndView;


import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

@SpringBootTest
public class GuestControllerReservationTeset {

    @Autowired
    private GuestController guestController;

    @MockBean
    private GuestService guestService;

    @AfterEach
    public void afterEach() {

    }

    @BeforeEach
    public void setup() {
        Guest guest = new Guest();
        guest.setId(1L);
        guest.setGuestName("John Doe");
        guest.setEmail("john.doe@example.com");

        Reservation reservation1 = new Reservation();
        reservation1.setReservationId(1L);
        reservation1.setCheckInDate(LocalDate.now().plusDays(1));
        reservation1.setCheckOutDate(LocalDate.now().plusDays(2));
        reservation1.setGuests(2);

        Reservation reservation2 = new Reservation();
        reservation2.setReservationId(2L);
        reservation2.setCheckInDate(LocalDate.now().plusDays(3));
        reservation2.setCheckOutDate(LocalDate.now().plusDays(4));
        reservation2.setGuests(3);

        Reservation reservation3 = new Reservation();
        reservation3.setReservationId(3L);
        reservation3.setCheckInDate(LocalDate.now().plusDays(5));
        reservation3.setCheckOutDate(LocalDate.now().plusDays(6));
        reservation3.setGuests(4);

        List<Reservation> reservations = Arrays.asList(reservation1, reservation2, reservation3);

        Mockito.when(guestService.getGuestById(1L)).thenReturn(guest);
        Mockito.when(guestService.getReservationsByGuestId(1L)).thenReturn(reservations);
    }

    @Test
    public void testGuestReservation() {
        // When
        ModelAndView modelAndView = guestController.guestReservation();

        // Then
        Assertions.assertThat(modelAndView).isNotNull();
        Assertions.assertThat(modelAndView.getViewName()).isEqualTo("guest/guestReservation");
        Assertions.assertThat(modelAndView.getModel()).containsKey("reservations");

        List<Reservation> reservations = (List<Reservation>) modelAndView.getModel().get("reservations");
        Assertions.assertThat(reservations).hasSize(3);

        Assertions.assertThat(reservations.get(0).getReservationId()).isEqualTo(1L);
        Assertions.assertThat(reservations.get(1).getReservationId()).isEqualTo(2L);
        Assertions.assertThat(reservations.get(2).getReservationId()).isEqualTo(3L);
    }



}
