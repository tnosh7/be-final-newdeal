package com.newdeal.staynest.service;

public interface MailService {
    public void sendEmail(String toEmail, String title, String content, String authCode);
}
