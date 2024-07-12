package com.newdeal.staynest.dto.Acoomodation;


import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Builder
public class AccommodationDto {

    private Long hostId;
    private String name;
    private String category;
    private String roomCategory;
    private String address;
    private String detailAddress;
    private int maxGuests;
    private String price;
    private String checkIn;
    private String checkOut;
    private String content;
    private double latitude;
    private double longitude;
    private List<String> imgUrls;
    private int avg;
}

