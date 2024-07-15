package com.newdeal.staynest.controller;

import com.newdeal.staynest.dto.HostDto;
import com.newdeal.staynest.jwt.TokenProvider;
import com.newdeal.staynest.dto.guest.GuestRequest;
import com.newdeal.staynest.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


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
    public ModelAndView guestLogin() {
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

    // OAuth2 회원가입 페이지
    @GetMapping("/oAuth2Register")
    public ModelAndView oAuth2Register() {
        return new ModelAndView("member/oAuth2Register");
    }
}
