package com.newdeal.staynest.controller;

import com.newdeal.staynest.dto.GuestDto;
import com.newdeal.staynest.dto.HostDto;
import com.newdeal.staynest.jwt.TokenProvider;
import com.newdeal.staynest.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;
    private final AuthenticationManager authenticationManager;
    private final TokenProvider tokenProvider;
    private final UserDetailsService userDetailsService;
    public MemberController(MemberService memberService, AuthenticationManager authenticationManager, TokenProvider tokenProvider, UserDetailsService userDetailsService) {
        this.memberService = memberService;
        this.authenticationManager = authenticationManager;
        this.tokenProvider = tokenProvider;
        this.userDetailsService = userDetailsService;
    }

    // 게스트 회원가입 페이지
    @GetMapping("/guestRegister")
    public ModelAndView guestRegister() {
        return new ModelAndView("member/guestRegister");
    }

    // 호스트 회원가입 페이지
    @GetMapping("/hostRegister")
    public ModelAndView hostRegister() {
        return new ModelAndView("member/hostRegister");
    }

    // 게스트&호스트 회원가입
    @PostMapping("/register")
    public ModelAndView register(HttpServletRequest request,
                                 GuestDto guestDto, HostDto hostDto,
                                 @RequestParam("identity") String identity) {
        ModelAndView mv = new ModelAndView();
        //가입
        try {
            if ((identity.equals("guest"))) {
                memberService.registerGuest(guestDto);
            } else {
                memberService.registerHost(hostDto);
            }
            mv.setViewName("redirect:/member/login-page");
        } catch (Exception e) {
            mv.addObject("message", "회원가입 중 오류가 발생했습니다.");
            if ((identity.equals("guest"))) {
                mv.setViewName("member/guestRegister");
            } else {
                mv.setViewName("member/hostRegister");
            }
        }
        return mv;
    }
    //로그인 페이지
    @GetMapping("/login-page")
    public ModelAndView login() {
        return new ModelAndView("member/login");
    }

    //로그인
    @PostMapping("/login")
    public Map<String, String> login(@RequestParam String email, @RequestParam String password) {

        UsernamePasswordAuthenticationToken authenticationToken
                = new UsernamePasswordAuthenticationToken(email, password);
        Authentication authentication;
        try {
            authentication = authenticationManager.authenticate(authenticationToken);
            SecurityContextHolder.getContext().setAuthentication(authentication);
        } catch (AuthenticationException e) {
            throw new RuntimeException("loginController : 로그인 실패");
        }
        String jwt = tokenProvider.createToken(authentication);
        Map<String, String> response = new HashMap<>();
        response.put("token", jwt);
        return response;
    }

    // 게스트&호스트 이메일 중복 확인
    @PostMapping("/duplicateEmail")
    public @ResponseBody String duplicateEmail(@RequestParam("email") String email,
                                               @RequestParam("identity") String identity) {
        return (identity.equals("guest")) ?
                memberService.checkDuplicateGuestEmail(email) : memberService.checkDuplicateHostEmail(email);
    }
    // 이메일 인증
    @PostMapping("/emailCheck")
    public @ResponseBody String emailCheck(@RequestParam String email) {
        String emailCheckCode;
        emailCheckCode = memberService.sendEmailCheck(email);
        return emailCheckCode;
    }


    @GetMapping("/identify")
    public ModelAndView identify() {
        return new ModelAndView("member/identify");
    }

    @GetMapping("/passwordUpdate")
    public ModelAndView passwordUpdate() {
        return new ModelAndView("member/passwordUpdate");
    }

}
