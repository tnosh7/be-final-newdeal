package com.newdeal.staynest.dto.Acoomodation;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class AccomDto {
    private String name;
    private String category;
    private String address;
    private String detailAddress;
    private int maxGuests;
    private Long price;
    private String checkIn;
    private String checkOut;
    private String content;
    private String roomCategory;
}
