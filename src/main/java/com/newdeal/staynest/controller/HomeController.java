package com.newdeal.staynest.controller;

import com.newdeal.staynest.dto.ReserveDto;
import com.newdeal.staynest.dto.SearchRequestDTO;
import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.Reservation;
import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.service.AccommodationService;
import com.newdeal.staynest.service.GuestService;
import com.newdeal.staynest.service.ReservationService;
import com.newdeal.staynest.service.SearchService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Objects;

@RequiredArgsConstructor
@Controller
public class HomeController {

    private final SearchService searchService;

    @GetMapping("/")
    public ModelAndView main() {
        return new ModelAndView("main");
    }

    @PostMapping("/search")
    public ModelAndView searchAccommodations(@ModelAttribute SearchRequestDTO requestDTO) {
        ModelAndView mav = new ModelAndView("search/search");
        List<Accommodation> accommodations = searchService.findAvailableAccommodations(requestDTO.getAddress(), requestDTO.getCheckInDate(), requestDTO.getCheckOutDate(), requestDTO.getMaxGuests());
        mav.addObject("accommodations", accommodations);
        mav.addObject("requestDTO", requestDTO);
        return mav;
    }



}