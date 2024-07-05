package com.newdeal.staynest.service;

import com.newdeal.staynest.dto.GuestDto;
import com.newdeal.staynest.dto.HostDto;
import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.Host;
import com.newdeal.staynest.entity.UserRoleEnum;
import com.newdeal.staynest.repository.GuestRepository;
import com.newdeal.staynest.repository.HostRepository;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MemberServiceImpl implements MemberService {

    private final GuestRepository guestRepository;
    private final HostRepository hostRepository;
    private final PasswordEncoder passwordEncoder;

    public MemberServiceImpl(GuestRepository guestRepository, HostRepository hostRepository, PasswordEncoder passwordEncoder) {
        this.guestRepository = guestRepository;
        this.hostRepository = hostRepository;
        this.passwordEncoder = passwordEncoder;
    }

// ADMIN_TOKEN
    //private final String ADMIN_TOKEN = "AAABnvxRVklrnYxKZ0aHgTBcXukeZygoC";

    @Override
    public String checkDuplicateGuestEmail(String email) {
        Optional<Guest> member = Optional.ofNullable(guestRepository.findByEmail(email));

        return member.isPresent() ? "이미 등록된 이메일입니다." : "사용가능한 이메일입니다.";
    }

    @Override
    public String checkDuplicateHostEmail(String email) {
        Optional<Host> member = Optional.ofNullable(hostRepository.findByEmail(email));

        return member.isPresent() ? "이미 등록된 이메일입니다." : "사용가능한 이메일입니다.";
    }

    @Override
    public void registerGuest(GuestDto guestDto) {
        // 비밀번호 암호화
        String encodedPassword = passwordEncoder.encode(guestDto.getPassword());
        guestDto.setPassword(encodedPassword);
        // 기본 롤 세팅 - GUEST임
        guestDto.setRole(UserRoleEnum.GUEST);
        Guest guest = GuestDto.toEntity(guestDto);
        guestRepository.save(guest);
    }
    @Override
    public void registerHost(HostDto hostDto) {
        // 비밀번호 암호화
        String encodedPassword = passwordEncoder.encode(hostDto.getPassword());
        hostDto.setPassword(encodedPassword);
        // 기본 롤 세팅 - HOST임
        hostDto.setRole(UserRoleEnum.HOST);
        Host host = HostDto.toEntity(hostDto);
        hostRepository.save(host);
    }

//    @Override
//    public void login( HttpServletResponse res) {
//        String email = memberDto.getEmail();
//        String password = memberDto.getPassword();
//
//        Member member = memberRepository.findByEmail(email).orElseThrow(
//                () -> new IllegalArgumentException("등록된 사용자가 없습니다.")
//        );
//
//        if (!passwordEncoder.matches(password, member.getPassword())) {
//            throw new IllegalArgumentException("비밀번호가 일치하지 않습니다.");
//        }
//    }
}
