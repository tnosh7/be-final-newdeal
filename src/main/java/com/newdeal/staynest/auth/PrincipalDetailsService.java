package com.newdeal.staynest.auth;

import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.Host;
import com.newdeal.staynest.repository.GuestRepository;
import com.newdeal.staynest.repository.HostRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class PrincipalDetailsService implements UserDetailsService {

    private final GuestRepository guestRepository;
    private final HostRepository hostRepository;
    private final HttpServletRequest request;


    public PrincipalDetailsService(GuestRepository guestRepository, HostRepository hostRepository, HttpServletRequest request) {
        this.guestRepository = guestRepository;
        this.hostRepository = hostRepository;
        this.request = request;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

        if (email == null) {
            throw new UsernameNotFoundException("이메일 값이 null임.");
        }
        UserDetails userDetails = findUserByEmail(email);
        if (userDetails == null) {
            throw new UsernameNotFoundException("이메일을 찾을 수 없습니다.");
        }
        return userDetails;
    }

    private UserDetails findUserByEmail(String email) {
        Guest guest = guestRepository.findByEmail(email);
        if (guest != null) {
            return new PrincipalDetails(guest);
        }
        Host host = hostRepository.findByEmail(email);
        if (host != null) {
            return new PrincipalDetails(host);
        }
        return null;
    }

}
