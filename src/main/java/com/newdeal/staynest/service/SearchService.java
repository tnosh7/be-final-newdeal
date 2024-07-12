package com.newdeal.staynest.service;

import com.newdeal.staynest.entity.accommodation.Accommodation;
import com.newdeal.staynest.entity.accommodation.QAccommodation;
import com.newdeal.staynest.repository.AccommodationRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.jpa.impl.JPAQuery;
import jakarta.persistence.EntityManager;
import lombok.Builder;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Builder
@Service
@RequiredArgsConstructor
public class SearchService {

    private final AccommodationRepository accommodationRepository;
    private final EntityManager entityManager;

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

    //메인에서 조건별 숙소 조회
    public List<Accommodation> getAccommodations(String category, String sortCriteria) {
        JPAQuery<Accommodation> query = new JPAQuery<>(entityManager);

        QAccommodation accommodation = QAccommodation.accommodation;

        BooleanBuilder where = new BooleanBuilder();

        if (category != null) {
            where.and(accommodation.category.eq(category));
        }

        OrderSpecifier<?> orderSpecifier = getOrderSpecifier(accommodation, sortCriteria);

        List<Accommodation> accommodations = query.from(accommodation)
                .where(where)
                .orderBy(orderSpecifier)
                .fetch();

        return accommodations;
    }

    private OrderSpecifier<?> getOrderSpecifier(QAccommodation accommodation, String sortCriteria) {
        switch (sortCriteria) {
            case "최신순":
                return accommodation.createdAt.desc();
            case "평점순":
                return accommodation.rating.desc();
            case "가격낮은순":
                return accommodation.price.asc();
            default:
                throw new IllegalArgumentException("Invalid sort criteria: " + sortCriteria);
        }
    }
}
