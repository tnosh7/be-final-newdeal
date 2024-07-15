package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.Host;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface HostRepository extends JpaRepository<Host, Long> {

    Optional<Host> findById(Long aLong);
    Host findByEmail(String email);

    @Modifying
    @Transactional
    @Query("UPDATE Host h SET h.password = :password WHERE h.email = :email")
    void updateHostPasswordByEmail(@Param("email") String email, @Param("password") String password);
}
