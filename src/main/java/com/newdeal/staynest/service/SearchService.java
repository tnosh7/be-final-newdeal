package com.newdeal.staynest.service;

import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.repository.AccommodationRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class SearchService {

    private final AccommodationRepository accommodationRepository;

    public SearchService(AccommodationRepository accommodationRepository) {
        this.accommodationRepository = accommodationRepository;
    }

    public List<Accommodation> findAvailableAccommodations(String location, LocalDate checkInDate, LocalDate checkOutDate, int numGuests) {
        // 예약 가능한 숙소 조회 로직 구현
        // 1. 지역과 숙박인원 조건으로 숙소 조회
        List<Accommodation> accommodations = accommodationRepository.findByAddressAndMaxGuestsGreaterThanEqual(location, numGuests);

//        // 2. 예약된 숙소 필터링
//        accommodations.removeIf(accommodation -> {
//            // 숙소가 예약되어 있는지 확인
//            List<Reservation> reservations = reservationRepository.findByAccommodationIdAndDates(accommodation.getId(), checkInDate, checkOutDate);
//            // 예약된 숙소는 제외
//            return !reservations.isEmpty();
//        });

        return accommodations;
    }
}
