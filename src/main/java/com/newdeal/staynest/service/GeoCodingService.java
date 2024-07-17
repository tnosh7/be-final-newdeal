package com.newdeal.staynest.service;

import com.newdeal.staynest.dto.GeocodingResponse;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;


@Service
public class GeoCodingService {

    private final String API_KEY = "aa18a88b1bf075cc048d8fd61211ce50";
    private final String GEOCODING_API_URL = "https://dapi.kakao.com/v2/local/search/address.json";

    public Map<String, Double> getCoordinates(String address) {
        RestTemplate restTemplate = new RestTemplate();

        // Set the headers
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "KakaoAK " + API_KEY);

        // Create an entity with the headers
        HttpEntity<String> entity = new HttpEntity<>(headers);

        // Build the URL
        String url = GEOCODING_API_URL + "?query=" + address;

        // Make the request
        ResponseEntity<GeocodingResponse> response = restTemplate.exchange(
                url,
                HttpMethod.GET,
                entity,
                GeocodingResponse.class
        );

        // Handle the response
        if (response.getStatusCode() == HttpStatus.OK) {
            GeocodingResponse geocodingResponse = response.getBody();
            if (geocodingResponse != null && geocodingResponse.getDocuments().size() > 0) {
                GeocodingResponse.Document document = geocodingResponse.getDocuments().get(0);
                Map<String, Double> coordinates = new HashMap<>();
                coordinates.put("latitude", Double.valueOf(document.getY()));
                coordinates.put("longitude", Double.valueOf(document.getX()));

                return coordinates;
            }
        }
        return Collections.emptyMap();
    }
}