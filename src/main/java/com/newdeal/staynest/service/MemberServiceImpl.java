package com.newdeal.staynest.service;

import com.newdeal.staynest.dto.HostDto;
import com.newdeal.staynest.dto.guest.GuestRequest;
import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.Host;
import com.newdeal.staynest.entity.UserRoleEnum;
import com.newdeal.staynest.repository.GuestRepository;
import com.newdeal.staynest.repository.HostRepository;
import jakarta.persistence.PersistenceException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MemberServiceImpl implements MemberService {

    private final GuestRepository guestRepository;
    private final HostRepository hostRepository;
    private final PasswordEncoder passwordEncoder;
    private final MailService mailService;
    private static final String AUTH_CODE_PREFIX = "AuthCode";

    public MemberServiceImpl(GuestRepository guestRepository, HostRepository hostRepository, PasswordEncoder passwordEncoder, MailService mailService) {
        this.guestRepository = guestRepository;
        this.hostRepository = hostRepository;
        this.passwordEncoder = passwordEncoder;
        this.mailService = mailService;
    }

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

    public void registerGuest(GuestRequest guestDto) {
        // 비밀번호 암호화

        String encodedPassword = passwordEncoder.encode(guestDto.getPassword());
        guestDto.setPassword(encodedPassword);

        guestDto.setRole(UserRoleEnum.GUEST);
        Guest guest = GuestRequest.toEntity(guestDto);
        guestRepository.save(guest);
    }
    @Override
    public void registerHost(HostDto hostDto) {
        String encodedPassword = passwordEncoder.encode(hostDto.getPassword());
        hostDto.setPassword(encodedPassword);
        hostDto.setRole(UserRoleEnum.HOST);
        Host host = HostDto.toEntity(hostDto);
        hostRepository.save(host);
    }
    
    // 이메일 인증번호 전송
    @Override
    public String sendEmailCheck(String email) {
        String authCode = this.createCode();
        String title = "Stay Nest 이메일 인증 번호";
        String content = "인증번호는 " + authCode + "입니다.";
               content += "해당 인증번호를 인증번호 확인란에 입력해주세요.";
        mailService.sendEmail(email, title, content, authCode);
        return authCode;
    }
    
    // 비밀번호 재설정
    @Override
    public void updateGuestPassword(String email, String password) {
        password = encodePassword(password);
        guestRepository.updateGuestPasswordByEmail(email, password);
    }

    @Override
    public void updateHostPassword(String email, String password) {
        password = encodePassword(password);
        hostRepository.updateHostPasswordByEmail(email, password);
    }

    // 이메일 인증 번호 생성
    private String createCode() {
        String code = String.valueOf((int)((Math.random() * 900000) + 100000));
        return code;
    }

    public String encodePassword(String password) {
        return passwordEncoder.encode(password);
    }
}
