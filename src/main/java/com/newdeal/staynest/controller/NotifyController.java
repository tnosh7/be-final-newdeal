package com.newdeal.staynest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/notify")
public class NotifyController {
    //    private final ReviewService reviewService;
    @GetMapping("/fullNotify")
    public ModelAndView fullNotify() {
        return new ModelAndView("notify/fullNotify");
    }

}
