package com.newdeal.staynest.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.newdeal.staynest.dto.HostDto;
import com.newdeal.staynest.jwt.TokenProvider;
import com.newdeal.staynest.dto.guest.GuestRequest;
import com.newdeal.staynest.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

@Slf4j(topic="memberController")
@Controller
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;
    private final AuthenticationManager authenticationManager;
    private final TokenProvider tokenProvider;
    private final UserDetailsService userDetailsService;
    private static final String CLIENT_ID = "2_jqBMEoBm3D7oNJBMHy";
    private static final String CLIENT_SECRET = "M1_xj5iG26";
    private static final String REDIRECT_URI = "http://localhost:8090/member/oauth2Register";

    public MemberController(MemberService memberService, AuthenticationManager authenticationManager, TokenProvider tokenProvider, UserDetailsService userDetailsService) {
        this.memberService = memberService;
        this.authenticationManager = authenticationManager;
        this.tokenProvider = tokenProvider;
        this.userDetailsService = userDetailsService;
    }

    // 게스트 회원가입 페이지
    @GetMapping("/guestRegister")
    public ModelAndView guestRegister() {
        ModelAndView mv =  new ModelAndView("member/guestRegister");
        // 상태 토큰으로 사용할 랜덤 문자열 생성
        String state = generateState();
        // 세션 또는 별도의 저장 공간에 상태 토큰을 저장
        mv.addObject("state", state);
        return mv;
    }
    
    //상태코드 생성
    public String generateState()
    {
        SecureRandom random = new SecureRandom();
        return new BigInteger(130, random).toString(32);
    }


    // 호스트 회원가입 페이지
    @GetMapping("/hostRegister")
    public ModelAndView hostRegister() {
        return new ModelAndView("member/hostRegister");
    }

    // 게스트&호스트 회원가입
    @PostMapping("/register")
    public ModelAndView register(HttpServletRequest request,
                                 GuestRequest guestDto, HostDto hostDto,
                                 @RequestParam("identify") String identify) {
        ModelAndView mv = new ModelAndView();
        //가입
        try {
            if ((identify.equals("guest"))) {
                memberService.registerGuest(guestDto);
                mv.setViewName("redirect:/member/guestLogin-page");
            } else {
                memberService.registerHost(hostDto);
                mv.setViewName("redirect:/member/hostLogin-page");
            }

        } catch (Exception e) {
            mv.addObject("message", "회원가입 중 오류가 발생했습니다.");
            if ((identify.equals("guest"))) {
                mv.setViewName("member/guestRegister");
            } else {
                mv.setViewName("member/hostRegister");
            }
        }
        return mv;
    }
    //호스트 로그인 페이지
    @GetMapping("/hostLogin-page")
    public ModelAndView hostLogin() {
        return new ModelAndView("member/hostLogin");
    }

    //게스트 로그인 페이지
    @GetMapping("/guestLogin-page")
    public ModelAndView guestLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        session.removeAttribute("role");
        session.removeAttribute("token");
        return new ModelAndView("member/guestLogin");
    }

    // 게스트&호스트 이메일 중복 확인
    @PostMapping("/duplicateEmail")
    public @ResponseBody String duplicateEmail(@RequestParam("email") String email,
                                               @RequestParam("identify") String identify) {
        return (identify.equals("guest")) ?
                memberService.checkDuplicateGuestEmail(email) : memberService.checkDuplicateHostEmail(email);
    }
    // 이메일 인증
    @PostMapping("/emailCheck")
    public @ResponseBody String emailCheck(@RequestParam String email) {
        String emailCheckCode;
        emailCheckCode = memberService.sendEmailCheck(email);
        System.out.println("---------------------------");
        System.out.println("이메일 인증 코드: " + emailCheckCode);
        System.out.println("---------------------------");
        return emailCheckCode;
    }

    @GetMapping("/identify")
    public ModelAndView identify() {
        return new ModelAndView("member/identify");
    }

    @GetMapping("/passwordUpdate")
    public ModelAndView passwordUpdate(@RequestParam("identify") String identify) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("identify", identify);
        mv.setViewName("member/passwordUpdate");
        return mv;
    }

    @PostMapping("/passwordUpdate")
    public ModelAndView passwordUpdate (@RequestParam("email") String email,
                                        @RequestParam("password") String password,
                                        @RequestParam("identify") String identify) {
        ModelAndView mv = new ModelAndView();
        try {
            if (identify.equals("guest")) {
                memberService.updateGuestPassword(email, password);
                mv.setViewName("member/guestLogin");
            }
            else if (identify.equals("host")) {
                memberService.updateHostPassword(email, password);
                mv.setViewName("member/hostLogin");
            }
        } catch (Exception e) {
            mv.setViewName("member/passwordUpdate?identify=" + identify);
            mv.addObject("message", "비밀번호 재설정에 실패하였습니다.");
        }
        return mv;
    }
}

