package com.newdeal.staynest.service;

import com.newdeal.staynest.dto.MemberDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

public interface MemberService {
    public String checkDuplicateEmail(String email);
    public void registerMember(MemberDto memberDto);
    //public void login(MemberDto memberDto,  HttpServletResponse res);
}
