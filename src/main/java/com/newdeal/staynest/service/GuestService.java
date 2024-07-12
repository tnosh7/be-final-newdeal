package com.newdeal.staynest.service;

import com.newdeal.staynest.core.exception.ResourceNotFoundException;
import com.newdeal.staynest.dto.guest.GuestResponse;
import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.repository.GuestRepository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * repository 조회
 * 조회된 entity 값을 DTO로 업데이트
 * 업데이트 된 DTO -> DB저장 -> entity 반환
 */
@Service
public class GuestService {

    private final GuestRepository guestRepository;

    @Autowired
    public GuestService(GuestRepository guestRepository) {
        this.guestRepository = guestRepository;
    }

    /**
     * guestId 로 회원정보 가져오기
     * @param guestId
     * @return
     */
    @Transactional
    public Guest getGuestById(Long guestId) {

        return guestRepository.findById(guestId).orElseThrow(() -> new ResourceNotFoundException("Guest not found with id " + guestId));
    }

    @Transactional
    public GuestResponse.UpdateGuestDTO updateGuest(Long guestId, Guest reqUpdateGuest) {

        // repository 조회
        Guest guest = guestRepository.findById(guestId).orElseThrow(() -> new ResourceNotFoundException("Guest not found with id " + guestId));

        // 데이터 가공
        // DTO 업데이트
        checkNull(guest, reqUpdateGuest);

        // DB 저장
        guest = guestRepository.save(guest);

        // DTO 반환
        return mapToUpdateGuestDTO(guest);
    }

    @Transactional
    public void deleteGuest(Long guestId) {
        // 유저 체크
        Guest guest = guestRepository.findById(guestId)
                .orElseThrow(() -> new ResourceNotFoundException("Guest not found with id " + guestId));

        // DB에서 삭제
        guestRepository.delete(guest);
    }

    // 데이터 없을 경우 null
    // 없는 경우 데이터 처리를 해야함
    public void checkNull(Guest guest, Guest reqUpdateGuest) {
        if (reqUpdateGuest.getGuestName() != null) {
            guest.setGuestName(reqUpdateGuest.getGuestName());
        }

        if (reqUpdateGuest.getEmail() != null) {
            guest.setEmail(reqUpdateGuest.getEmail());
        }

        if (reqUpdateGuest.getPhone() != null) {
            guest.setPhone(reqUpdateGuest.getPhone());
        }

        if (reqUpdateGuest.getAddress() != null) {
            guest.setAddress(reqUpdateGuest.getAddress());
        }

    }

    private GuestResponse.UpdateGuestDTO mapToUpdateGuestDTO(Guest guest) {
        return new GuestResponse.UpdateGuestDTO(
                guest.getGuestName(),
                guest.getEmail(),
                guest.getPhone(),
                guest.getAddress()
        );
    }
}