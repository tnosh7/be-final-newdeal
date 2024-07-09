package com.newdeal.staynest.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@Builder
public class SearchRequestDTO {
    private String address;
    private LocalDate startdate;
    private LocalDate enddate;
    private int maxGuests;

}
