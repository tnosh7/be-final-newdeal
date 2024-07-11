package com.newdeal.staynest.service;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class MailServiceImpl implements MailService {

    private final JavaMailSender mailSender;

    @Override
    public void sendEmail(String toEmail, String title, String content, String authCode) {
        SimpleMailMessage simpleMailMessage = createEmailMessage(toEmail, title, content);
        try {
            mailSender.send(simpleMailMessage);

        } catch (Exception e) {
            log.debug("메일 서비스 toEmail{}title : {}text : {}", toEmail, title, content, e);
            throw new RuntimeException(e);
        }
    }
    private SimpleMailMessage createEmailMessage(final String toEmail, final String title, final String content) {
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setTo(toEmail);
        simpleMailMessage.setSubject(title);
        simpleMailMessage.setText(content);
        return simpleMailMessage;
    }
}
