package com.newdeal.staynest.controller;

import com.newdeal.staynest.auth.PrincipalDetails;
import com.newdeal.staynest.dto.Acoomodation.AccomDto;
import com.newdeal.staynest.dto.Acoomodation.AccommodationDto;
import com.newdeal.staynest.dto.host.HostResponse;
import com.newdeal.staynest.entity.Host;
import com.newdeal.staynest.entity.UserRoleEnum;

import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.jwt.TokenProvider;
import com.newdeal.staynest.service.AccommodationService;
import com.newdeal.staynest.service.HostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/hosts")
public class HostController {

    private final HostService hostService;
    private final TokenProvider tokenProvider;
    private final AccommodationService accommodationService;

    @Autowired
    public HostController(HostService hostService, TokenProvider tokenProvider, AccommodationService accommodationService) {
        this.hostService = hostService;
        this.tokenProvider = tokenProvider;
        this.accommodationService = accommodationService;
    }

    // 호스트 회원 정보보기
    @GetMapping
    @Secured({UserRoleEnum.Authority.ROLE_HOST, UserRoleEnum.Authority.ROLE_ADMIN})
    public ModelAndView hostView() {
        ModelAndView modelAndView = new ModelAndView("host/hostAccom");

        // login한 유저 값으로 바꿔야 함
        Host host = hostService.getHostById(2L);
        modelAndView.addObject("host", host);

        return modelAndView;
    }

    // 회원 정보 수정
    @PatchMapping("/{hostId}")
    @Secured({UserRoleEnum.Authority.ROLE_HOST, UserRoleEnum.Authority.ROLE_ADMIN})
    public ModelAndView updateHost(@PathVariable Long hostId, @RequestBody Host reqUpdateHost) {

        HostResponse.UpdateHostDTO host = hostService.updateHostDTO(hostId, reqUpdateHost);
        ModelAndView modelAndView = new ModelAndView("host/hostAccom");
        modelAndView.addObject("host", host);

        return modelAndView;
    }

    // 회원 정보 삭제
    @DeleteMapping("/{hostId}")
    @Secured({UserRoleEnum.Authority.ROLE_HOST, UserRoleEnum.Authority.ROLE_ADMIN})
    public ModelAndView deleteHost(@PathVariable Long hostId) {

        hostService.deleteHost(hostId);

        return new ModelAndView("redirect:/");
    }

    // Host 개인 정보
    @GetMapping("/accommodations")
    @Secured({UserRoleEnum.Authority.ROLE_HOST, UserRoleEnum.Authority.ROLE_ADMIN})
    public ModelAndView hostAccom() {
        return new ModelAndView("host/hostAccom");
    }

    // 예약 내역 정보
    @GetMapping("/reservations")
    @Secured({UserRoleEnum.Authority.ROLE_HOST, UserRoleEnum.Authority.ROLE_ADMIN})
    public ModelAndView hostReservation() {
        return new ModelAndView("host/hostReservation");
    }

    // 호스트 숙소 등록 페이지로
    @GetMapping("/accomEnroll")
    public ModelAndView accomEnroll() {
        return new ModelAndView("host/accomEnroll");
    }

    @PostMapping("/accomEnroll")
    public ResponseEntity<String> accommodationEnroll(@AuthenticationPrincipal PrincipalDetails principalDetails, @RequestPart("files") List<MultipartFile> files, @RequestPart("accommodationDto") AccomDto accommodationDto) throws IOException {
        System.out.println("컨트롤러오나");
        System.out.println(files.size());
        Host host = principalDetails.getHost();
        accommodationService.registerAccomm(files,accommodationDto, host);
        return ResponseEntity.ok("숙소등록완료");
    }

    // 호스트 숙소 수정
    @GetMapping("/accomUpdate")
    @Secured({UserRoleEnum.Authority.ROLE_HOST, UserRoleEnum.Authority.ROLE_ADMIN})
    public ModelAndView accomUpdate() {
        return new ModelAndView("host/accomUpdate");
    }

    //숙소 메인
    @GetMapping("/")
    public ModelAndView hostMain() {
        return new ModelAndView("host/hostMain");
    }

    // 로그인한 Host의 숙소 조회
    @PostMapping("/")
    public ResponseEntity<List<Accommodation>> getAccommodations(@AuthenticationPrincipal PrincipalDetails principalDetails) {
        Long id = null;
        id = principalDetails.getHost().getId();
        List<Accommodation> accommodationList = accommodationService.getAllAccommodationsByHostId(id);
        return ResponseEntity.ok(accommodationList);
    }
}
