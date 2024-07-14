package com.newdeal.staynest.service;

import com.newdeal.staynest.dto.HostDto;
import com.newdeal.staynest.dto.guest.GuestRequest;

public interface MemberService {
    public String checkDuplicateGuestEmail(String email);
    public String checkDuplicateHostEmail(String email);
    public void registerGuest(GuestRequest guestDto);
    public void registerHost(HostDto hostDto);
    public String sendEmailCheck(String email);
    public void updateGuestPassword(String email, String password);
    public void updateHostPassword(String email, String password);
    //public void login(MemberDto memberDto,  HttpServletResponse res);
}
