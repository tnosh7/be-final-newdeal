package com.newdeal.staynest.repository;

import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.Host;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HostRepository extends JpaRepository<Host, Long> {
    Host findByEmail(String email);
}
