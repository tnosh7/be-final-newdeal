package com.newdeal.staynest.controller;

import com.newdeal.staynest.dto.GuestDto;
import com.newdeal.staynest.dto.HostDto;
import com.newdeal.staynest.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;

    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    //로그인 페이지
    @GetMapping("/login-page")
    public ModelAndView login() {
        return new ModelAndView("member/login");
    }
    //로그인
//    @PostMapping("/login")
//    public void login(@ModelAttribute("member") MemberDto memberDto,  HttpServletResponse res) {
//        memberService.login(memberDto, res);
//
//    }

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


    // 게스트&호스트 이메일 중복 확인
    @PostMapping("/duplicateEmail")
    public @ResponseBody String duplicateEmail(@RequestParam("email") String email,
                                               @RequestParam("identity") String identity) {
        return (identity.equals("guest")) ?
                memberService.checkDuplicateGuestEmail(email) : memberService.checkDuplicateHostEmail(email);
    }

    @GetMapping("/emailCheck")
    public ModelAndView emailCheck() {
        return new ModelAndView("member/emailCheck");
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
