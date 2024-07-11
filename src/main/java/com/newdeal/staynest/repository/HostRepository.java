package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.Host;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface HostRepository extends JpaRepository<Host, Long> {


    Optional<Host> findById(Long aLong);
    Host findByEmail(String email);
}
