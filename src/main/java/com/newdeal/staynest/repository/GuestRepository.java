package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.Guest;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface GuestRepository extends JpaRepository<Guest, Long> {

    Optional<Guest> findById(Long aLong);
    Guest findByEmail(String email);

    @Modifying
    @Transactional
    @Query("UPDATE Guest g SET g.password = :password WHERE g.email = :email")
    int updateGuestPasswordByEmail(@Param("email") String email, @Param("password") String password);


}
