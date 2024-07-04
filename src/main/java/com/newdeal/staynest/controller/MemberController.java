package com.newdeal.staynest.controller;

import com.newdeal.staynest.dto.MemberDto;
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

    //회원가입 페이지
    @GetMapping("/register")
    public ModelAndView register() {
        return new ModelAndView("member/memberRegister");
    }
    //회원가입
   @PostMapping("/register")
    public ModelAndView register(HttpServletRequest request, MemberDto memberDto) {
        ModelAndView mv = new ModelAndView();
       try {
           memberService.registerMember(memberDto);
           mv.setViewName("/member/login");
       } catch (Exception e) {
           mv.addObject("message", "회원가입 중 오류가 발생했습니다.");
           mv.setViewName("member/memberRegister");
       }
        return mv;
    }

    //이메일 중복 확인
    @PostMapping("/duplicateEmail")
    public @ResponseBody String duplicateEmail(@RequestParam("email") String email) {
//        테스트용 - 나중에 지울것.
//        System.out.println("=================================");
//        System.out.println("memberService.checkDuplicateEmail(email) : " + memberService.checkDuplicateEmail(email));
//        System.out.println("=================================");
        return memberService.checkDuplicateEmail(email);
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
