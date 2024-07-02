<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <script src="/js/script.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
</head>
<body>
<div class="outer-container">
    <div class="left-aligned">
        <img class="logo" src="/images/logo.png" alt="logo">
    </div>
    <div class="host right-aligned"> <a href="#">호스트 모드로 전환 </a></div>
    <div class="dropdown right-aligned">
        <button class="dropbtn">
            <span class="material-symbols-outlined">menu</span>
            &nbsp;&nbsp;회원가입 / 로그인
        </button>
        <div class="dropdown-content">
            <a href="#">회원가입</a>
            <a href="#">로그인</a>
        </div>
    </div>
</div>
</body>
</html>