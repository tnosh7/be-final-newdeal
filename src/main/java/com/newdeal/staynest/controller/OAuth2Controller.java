package com.newdeal.staynest.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j(topic = "소셜 로그인 ")
@RestController
@RequestMapping("/login/oauth2/code")
public class OAuth2Controller {


    @PostMapping("/kakao")
    public @ResponseBody String kakao(@RequestParam String code) {
        System.out.println(code);


        return "";
    }

    @PostMapping("/naver")
    public @ResponseBody String naver(@RequestParam String code) {
        System.out.println("ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
        log.info("naver code:{}", code);
        return "";
    }



}
