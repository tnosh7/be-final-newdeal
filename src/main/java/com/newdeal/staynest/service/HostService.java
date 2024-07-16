package com.newdeal.staynest.service;

import com.newdeal.staynest.core.exception.ResourceNotFoundException;
import com.newdeal.staynest.dto.host.HostResponse;
import com.newdeal.staynest.entity.Host;
import com.newdeal.staynest.repository.HostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor // final constructor
@Service
public class HostService {

    private final HostRepository hostRepository;

//    // DI
//    @Autowired
//    public HostService(HostRepository hostRepository) {
//        this.hostRepository = hostRepository;
//    }

    public Host getHostById(Long hostId) {
        return hostRepository.findById(hostId).orElseThrow(() -> new ResourceNotFoundException("Host not found with id" + hostId));
    }

    @Transactional
    public HostResponse.UpdateHostDTO updateHostDTO(Long hostId, Host reqUpdateHost) {

        // repository 조회
        Host host = hostRepository.findById(hostId).orElseThrow(() -> new ResourceNotFoundException("Host not found with id" + hostId));

        // 데이터 가공 & DTO 업데이터
        checkNull(host, reqUpdateHost);

        // DB 저장
        host = hostRepository.save(host);

        // DTO 반환
        return mapToUpdateHostDTO(host);
    }

    @Transactional
    public void deleteHost(Long hostId) {
        // 유저 체크
        Host host = hostRepository.findById(hostId).orElseThrow(() -> new ResourceNotFoundException("Host not fount with id" + hostId));

        // DB에서 삭제
        hostRepository.delete(host);
    }

    // 데이터 없을 경우 null
    // 없는 경우 데이터 처리를 해야함
    private void checkNull(Host host, Host reqUpdateHost) {
        if (reqUpdateHost.getHostName() != null) {
            host.setHostName(reqUpdateHost.getHostName());
        }

        if (reqUpdateHost.getEmail() != null) {
            host.setEmail(reqUpdateHost.getEmail());
        }

        if (reqUpdateHost.getPhone() != null) {
            host.setPhone(reqUpdateHost.getPhone());
        }
    }

    private HostResponse.UpdateHostDTO mapToUpdateHostDTO(Host host) {
        return new HostResponse.UpdateHostDTO(
                host.getHostName(),
                host.getEmail(),
                host.getPhone()
        );
    }

}
