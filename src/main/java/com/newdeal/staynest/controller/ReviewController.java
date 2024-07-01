package com.newdeal.staynest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/review")
public class ReviewController {
    //    private final ReviewService reviewService;
    @GetMapping("/fullReview")
    public ModelAndView login() {
        return new ModelAndView("review/fullReview");
    }
}
