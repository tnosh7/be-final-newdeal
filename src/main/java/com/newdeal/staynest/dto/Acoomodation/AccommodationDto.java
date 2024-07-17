package com.newdeal.staynest.dto.Acoomodation;


import com.newdeal.staynest.entity.Host;
import com.newdeal.staynest.entity.accommodation.AccommodationImg;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Builder
public class AccommodationDto {

    private Host host;
    private String name;
    private String category;
    private String roomCategory;
    private String address;
    private String detailAddress;
    private int maxGuests;
    private Long price;
    private String checkIn;
    private String checkOut;
    private String content;
    private double latitude;
    private double longitude;
    private List<AccommodationImg> images;
    private double rating;
    private int reviewCount;
}

