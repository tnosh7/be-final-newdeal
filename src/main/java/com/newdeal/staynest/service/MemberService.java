package com.newdeal.staynest.service;

import com.newdeal.staynest.dto.GuestDto;
import com.newdeal.staynest.dto.HostDto;

public interface MemberService {
    public String checkDuplicateGuestEmail(String email);
    public String checkDuplicateHostEmail(String email);
    public void registerGuest(GuestDto guestDto);
    public void registerHost(HostDto hostDto);
    //public void login(MemberDto memberDto,  HttpServletResponse res);
}
