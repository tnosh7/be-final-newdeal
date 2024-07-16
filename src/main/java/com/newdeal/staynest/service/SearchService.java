package com.newdeal.staynest.service;

import com.newdeal.staynest.entity.accommodation.Accommodation;

import com.newdeal.staynest.entity.accommodation.QAccommodation;
import com.newdeal.staynest.repository.AccommodationRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.jpa.impl.JPAQuery;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import lombok.Builder;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.time.LocalDate;
import java.util.List;

@Builder
@Service
@RequiredArgsConstructor
public class SearchService {

    private final AccommodationRepository accommodationRepository;
    private final EntityManager entityManager;

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


    @Transactional(readOnly = true)
    public List<Accommodation> searchAvailableAccommodations(LocalDate checkInDate, LocalDate checkOutDate,
                                                             String address, int maxGuests,
                                                             Integer minPrice, Integer maxPrice,
                                                             String category) {

        // 체크인 날짜와 체크아웃 날짜 사이에 예약되지 않은 숙소 검색 쿼리
        String jpql = "SELECT a FROM Accommodation a " +
                "WHERE a.id NOT IN (" +
                "  SELECT r.accommodation.id FROM Reservation r " +
                "  WHERE r.checkInDate <= :checkOutDate " +
                "  AND r.checkOutDate > :checkInDate" +
                ")";

        // 주소 필터링: %addressKeyword%와 같이 like 구문으로 포함 여부 확인
        if (!StringUtils.isEmpty(address)) {
            jpql += " AND a.address LIKE :address";
        }

        // 최대 인원 필터링
        jpql += " AND a.maxGuests >= :maxGuests";

        // 가격 범위 필터링
        if (minPrice != null) {
            jpql += " AND a.price >= :minPrice";
        }
        if (maxPrice != null) {
            jpql += " AND a.price <= :maxPrice";
        }

        // 카테고리 필터링
        if (!StringUtils.isEmpty(category)) {
            jpql += " AND a.category = :category";
        }

        TypedQuery<Accommodation> query = entityManager.createQuery(jpql, Accommodation.class);
        query.setParameter("checkInDate", checkInDate);
        query.setParameter("checkOutDate", checkOutDate);
        query.setParameter("maxGuests", maxGuests);

        if (!StringUtils.isEmpty(address)) {
            query.setParameter("address", "%" + address + "%");
        }

        if (minPrice != null) {
            query.setParameter("minPrice", minPrice);
        }

        if (maxPrice != null) {
            query.setParameter("maxPrice", maxPrice);
        }

        if (!StringUtils.isEmpty(category)) {
            query.setParameter("category", category);
        }

        return query.getResultList();
    }
}
