package com.newdeal.staynest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/accommodation")
public class AccomController {
    //    private final ReviewService reviewService;
    @GetMapping("/detailAccom")
    public ModelAndView detailAccom() {
        return new ModelAndView("accommodation/detailAccom");
    }
}
