package com.newdeal.staynest.service;

import com.newdeal.staynest.core.exception.ResourceNotFoundException;
import com.newdeal.staynest.dto.guest.GuestResponse;
import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.Reservation;
import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.repository.AccommodationRepository;
import com.newdeal.staynest.repository.GuestRepository;
import com.newdeal.staynest.repository.ReservationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * repository 조회
 * 조회된 entity 값을 DTO로 업데이트
 * 업데이트 된 DTO -> DB저장 -> entity 반환
 */
@RequiredArgsConstructor
@Service
public class GuestService {

    private final GuestRepository guestRepository;
    private final ReservationRepository reservationRepository;
    private final AccommodationRepository accommodationRepository;

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

    @Transactional
    public void cancelReservation(Long reservationId) {
        Reservation reservation = reservationRepository.findById(reservationId)
                .orElseThrow(() -> new ResourceNotFoundException("Reservation not found with id " + reservationId));

        reservationRepository.delete(reservation);
    }

    @Transactional
    public List<Accommodation> getFavoriteAccommodationsByGuestId(Long guestId) {
        // 찜한 숙소를 가져오는 로직 구현
        return accommodationRepository.findFavoritesByGuestId(guestId);
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

    @Transactional
    public List<Reservation> getReservationsByGuestId(Long guestId) {
        return reservationRepository.findByGuestId(guestId);
    }

    private GuestResponse.UpdateGuestDTO mapToUpdateGuestDTO(Guest guest) {
        return new GuestResponse.UpdateGuestDTO(
                guest.getGuestName(),
                guest.getEmail(),
                guest.getPhone(),
                guest.getAddress()
        );
    }

    @Transactional
    public Guest findByGuestName(String guestName) {
        return guestRepository.findByGuestName(guestName);
    }
}