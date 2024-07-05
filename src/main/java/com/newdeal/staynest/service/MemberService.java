package com.newdeal.staynest.service;

import com.newdeal.staynest.dto.GuestDto;

public interface MemberService {
    public String checkDuplicateEmail(String email);
    public void registerMember(GuestDto guestDto);
    //public void login(MemberDto memberDto,  HttpServletResponse res);
}
