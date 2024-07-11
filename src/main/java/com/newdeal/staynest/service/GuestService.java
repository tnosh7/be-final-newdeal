package com.newdeal.staynest.service;

import com.newdeal.staynest.dto.guest.GuestRequest;
import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.repository.GuestRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class GuestService {

    private final GuestRepository guestRepository;

    @Transactional
    public ResponseEntity<?> updateGuest(Long guestId, GuestRequest.UpdateDTO dto) {
        Optional<Guest> guestFindId = guestRepository.findById(guestId);
        return null;
    }
}