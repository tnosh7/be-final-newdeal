package com.newdeal.staynest.service;

import com.newdeal.staynest.dto.MemberDto;
import com.newdeal.staynest.entity.Member;
import com.newdeal.staynest.entity.UserRoleEnum;
import com.newdeal.staynest.repository.MemberRepository;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MemberServiceImpl implements MemberService {

    private final MemberRepository memberRepository;
    private final PasswordEncoder passwordEncoder;


    public MemberServiceImpl(MemberRepository memberRepository, PasswordEncoder passwordEncoder, PasswordEncoder passwordEncoder1) {
        this.memberRepository = memberRepository;
        this.passwordEncoder = passwordEncoder1;
    }
    // ADMIN_TOKEN
    //private final String ADMIN_TOKEN = "AAABnvxRVklrnYxKZ0aHgTBcXukeZygoC";

    @Override
    public String checkDuplicateEmail(String email) {
        Optional<Member> member = memberRepository.findByEmail(email);

        return member.isPresent() ? "이미 등록된 이메일입니다." : "사용가능한 이메일입니다.";
    }

    @Override
    public void registerMember(MemberDto memberDto) {
        // 비밀번호 암호화
        String encodedPassword = passwordEncoder.encode(memberDto.getPassword());
        memberDto.setPassword(encodedPassword);
        // 기본 롤 세팅-GUEST임
        memberDto.setRole(UserRoleEnum.GUEST);

        // Member 엔티티로 변환
        Member member = MemberDto.toEntity(memberDto);

        memberRepository.save(member);
    }

//    @Override
//    public void login(MemberDto memberDto,  HttpServletResponse res) {
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
