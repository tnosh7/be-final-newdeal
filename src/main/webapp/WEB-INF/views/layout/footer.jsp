<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title>
</head>
<body>
<footer>
    <div class="ft" style="">
        <div><img class="logo" src="/images/logo.png" alt="logo"></div>

        <div class="footer-section">
            <h3>About Us</h3>
            <p>에어비앤비, 여기어때, 야놀자 => StayNest</p>
        </div>
        <div class="footer-section">
            <h3>Links</h3>
            <a href="/about">About</a>
            <a href="/contact">Contact</a>
            <a href="/privacy">Privacy Policy</a>
        </div>
        <div class="footer-section social-icons">
            <h3>Follow Us</h3>
            <a href="https://www.facebook.com" target="_blank"><i class="fa fa-facebook"></i></a>
            <a href="https://www.twitter.com" target="_blank"><i class="fa fa-twitter"></i></a>
            <a href="https://www.instagram.com" target="_blank"><i class="fa fa-instagram"></i></a>
        </div>
    </div>
</footer>

</body>
</html>