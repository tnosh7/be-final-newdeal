package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.Guest;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface GuestRepository extends JpaRepository<Guest, Long> {

    Optional<Guest> findById(Long aLong);
    Guest findByEmail(String email);
}
