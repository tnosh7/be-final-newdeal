package com.newdeal.staynest.controller;

import com.newdeal.staynest.dto.SearchRequestDTO;
import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.service.AccommodationService;
import com.newdeal.staynest.service.SearchService;
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

@Controller
public class HomeController {

    private final SearchService searchService;

    public HomeController(SearchService searchService) {
        this.searchService = searchService;
    }

    @GetMapping("/")
    public ModelAndView main() {
        return new ModelAndView("main");
    }

    @PostMapping("/search")
    public ModelAndView searchAccommodations(@ModelAttribute SearchRequestDTO requestDTO) {
        ModelAndView mav = new ModelAndView("search/search");
        List<Accommodation> accommodations = searchService.findAvailableAccommodations(requestDTO.getAddress(), requestDTO.getStartdate(), requestDTO.getEnddate(), requestDTO.getMaxGuests());
        mav.addObject("accommodations", accommodations);
        mav.addObject("requestDTO",requestDTO);
        return mav;
    }

    @GetMapping("/reserve")
    public ModelAndView reserveAccommodations() { return new ModelAndView("reserve/reserve");}


    @PostMapping("/reserve")
    public ResponseEntity<String> reserve() {
        // 클라이언트로부터 받은 예약 정보 처리
        return ResponseEntity.ok("예약정보보내기!");
    }

    @GetMapping("/reservecomplete")
    public ModelAndView reservecomplete() {
        return new ModelAndView("reserve/reservecomplete");
    }
}
