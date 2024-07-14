package com.newdeal.staynest.auth;

import com.newdeal.staynest.entity.Guest;
import com.newdeal.staynest.entity.Host;
import com.newdeal.staynest.repository.GuestRepository;
import com.newdeal.staynest.repository.HostRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.management.relation.RoleNotFoundException;

@Service
public class PrincipalDetailsService implements UserDetailsService {

    private final GuestRepository guestRepository;
    private final HostRepository hostRepository;
    private final HttpServletRequest request;
    private final HttpSession session;


    public PrincipalDetailsService(GuestRepository guestRepository, HostRepository hostRepository, HttpServletRequest request, HttpSession session) {
        this.guestRepository = guestRepository;
        this.hostRepository = hostRepository;
        this.request = request;
        this.session = session;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        try {
            String memberRole = memberRole();
        } catch (RoleNotFoundException e) {
            throw new RuntimeException(e);
        }
        if (email == null) {
            throw new UsernameNotFoundException("이메일 값이 null임.");
        }
        UserDetails userDetails = null;
        try {
            userDetails = findUserByEmail(email);
        } catch (RoleNotFoundException e) {
            throw new RuntimeException(e);
        }
        if (userDetails == null) {
            throw new UsernameNotFoundException("이메일을 찾을 수 없습니다.");
        }
        return userDetails;
    }

    private UserDetails findUserByEmail(String email) throws RoleNotFoundException {
        String memberRole = memberRole();
        if (memberRole.equals("ROLE_GUEST")) {
            Guest guest = guestRepository.findByEmail(email);
            return new PrincipalDetails(guest);
        }
        else if (memberRole.equals("ROLE_HOST")) {
            Host host = hostRepository.findByEmail(email);
            return new PrincipalDetails(host);
        }
        return null;
    }

    public String memberRole() throws RoleNotFoundException {
        String role = request.getParameter("role");
        if (role == null) {
           role = (String) session.getAttribute("role");
        }
        if (role == null || role.isEmpty()) {
            throw new RoleNotFoundException("롤을 찾을 수 없습니다.");
        }
        return role;
    }

}
