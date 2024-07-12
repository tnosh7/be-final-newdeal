package com.newdeal.staynest.controller;

import com.newdeal.staynest.dto.SearchRequestDTO;
import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.service.AccommodationService;
import com.newdeal.staynest.service.SearchService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class HomeController {

    private final SearchService searchService;

    @GetMapping("/")
    public ModelAndView main() {
        ModelAndView mav = new ModelAndView("main");
        return mav;
    }

    @GetMapping("/accommodations")
    public ResponseEntity<List<Accommodation>> getAllAccommodations(@RequestParam(required = false) String category,
                                                                    @RequestParam(defaultValue = "최신순") String sort) {
        System.out.println(category);
        System.out.println(sort);
        if(category.equals("")) category=null;
        return ResponseEntity.ok(searchService.getAccommodations(category,sort));
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