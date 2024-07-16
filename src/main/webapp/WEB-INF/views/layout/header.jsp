<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/3.0.1/js.cookie.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <script src="/js/script.js"></script>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
</head>
<script>
    $().ready(function () {
        const token = sessionStorage.getItem("token");
        const role = sessionStorage.getItem("role");
        const dropdownContent = document.getElementById("dropdownContent");
        const menuText = document.getElementById("menuText");
        const changeRoleLink = document.getElementById("changeRole");

        if (token) {
            let roleSpecificLinks = '';
            if (role === "ROLE_GUEST") {
                console.log("조건문안")
                roleSpecificLinks = `
                    <a href="${contextPath}/account/manage">계정 관리</a>
                    <a href="${contextPath}/chat/list">채팅 내역</a>
                `;
                changeRoleLink.innerText = "호스트 모드로 전환";
                changeRoleLink.onclick = function () {
                    if (token) {
                        removeSession();
                        changeRoleLink.href = "${contextPath}/member/hostLogin-page";
                    } else {
                        changeRoleLink.href = "${contextPath}/member/hostLogin-page";
                    }
                };
            } else if (role === "ROLE_HOST") {
                roleSpecificLinks = `
                    <a href="${contextPath}/account/manage">계정 관리</a>
                    <a href="${contextPath}/chat/list">채팅 내역</a>
                `;
                changeRoleLink.innerText = "게스트 모드로 전환";
                changeRoleLink.onclick = function () {
                    if (token) {
                        removeSession();
                        changeRoleLink.href = "${contextPath}/member/guestLogin-page";
                    } else {
                        changeRoleLink.href = "${contextPath}/member/guestLogin-page";
                    }
                };
            }

            dropdownContent.innerHTML = roleSpecificLinks + `
            <a onclick="logout()">로그아웃</a>
        `;
            menuText.innerText = "메뉴";
        } else {
            dropdownContent.innerHTML = `
                <a href="${contextPath}/member/identify">회원가입</a>
                <a href="${contextPath}/member/guestLogin-page">로그인</a>
            `;
            menuText.innerText = "회원가입 / 로그인";
            changeRoleLink.innerText = "호스트 모드로 전환";
            changeRoleLink.onclick = function () {
                changeRoleLink.href = "${contextPath}/member/hostLogin-page";
            };
        }
    });

    function logout() {
        sessionStorage.removeItem("token");
        sessionStorage.removeItem("role");
        window.location.href = `/member/logout`;
        window.location.href='http://localhost:8090/';
    }

    function removeSession() {
        sessionStorage.removeItem("token");
        sessionStorage.removeItem("role");
        window.location.href = `/member/logout`;
    }

</script>
<body>
<div class="outer-container">
    <div class="left-aligned">
        <img class="logo" onclick="window.location.href='http://localhost:8090/'" src="/images/logo.png" alt="logo">
    </div>
    <div class="modal-notification-cyj"> <!-- (알림) 알림 버튼 스타일 추가 -->
        <img src="https://cdn-icons-png.flaticon.com/128/3607/3607235.png" alt="알림" class="modal-notification-icon-cyj">
        <!-- (알림) 알림 아이콘 스타일 추가 -->
        <span class="modal-notification-count-cyj">5</span> <!-- (알림) 알림 개수 스타일 추가 -->
        <div class="modal-notification-dropdown-cyj"> <!-- (알림) 알림 드롭다운 스타일 추가 -->
            <div class="modal-notification-item-cyj" data-id="1" data-type="checkout">
                <div class="modal-notification-header-cyj">
                    <span class="modal-notification-title-cyj">퇴실 시간 1시간 전입니다</span>
                    <span class="modal-notification-date-cyj">2023-07-04</span>
                </div>
                <div class="modal-notification-body-cyj">
                    놔두고 가시는 물건이 없도록 숙소를 확인해 주세요!
                </div>
            </div>

            <div class="modal-notification-item-cyj modal-is-read-notify" data-id="2" data-type="completed">
                <div class="modal-notification-header-cyj">
                    <span class="modal-notification-title-cyj">숙소이용이 완료되었습니다!</span>
                    <span class="modal-notification-date-cyj">2023-07-04</span>
                </div>
                <div class="modal-notification-body-cyj">
                    사진과 함께 리뷰 작성을 해주세요!
                </div>
            </div>
            <div class="modal-notification-item-cyj">
                <div class="modal-notification-header-cyj">
                    <span class="modal-notification-title-cyj">추천숙소가 도착했습니다.</span>
                    <span class="modal-notification-date-cyj">2023-07-04</span>
                </div>
                <div class="modal-notification-body-cyj">
                    전날 가장 인기가 많았던 숙소들을 확인해보세요!
                </div>
            </div>
            <div class="modal-notification-item-cyj">
                <div class="modal-notification-header-cyj">
                    <span class="modal-notification-title-cyj">퇴실 시간이 1시간 남았습니다!</span>
                    <span class="modal-notification-date-cyj">2023-07-04</span>
                </div>
                <div class="modal-notification-body-cyj">
                    놔두고 가시는 물건이 없도록 숙소를 확인해 주세요!
                </div>
            </div>
            <div class="modal-notification-item-cyj">
                <div class="modal-notification-header-cyj">
                    <span class="modal-notification-title-cyj">호스트의 답글이 달렸습니다.</span>
                    <span class="modal-notification-date-cyj">2023-07-04</span>
                </div>
                <div class="modal-notification-body-cyj">
                    고객님의 리뷰에 대한 답글을 확인해 주세요!
                </div>
            </div>
            <a href="#" class="view-all-cyj">전체보기</a> <!-- (알림) 전체보기 버튼 스타일 추가 -->
        </div>
    </div>
    <div class="host right-aligned">
        <a id="changeRole">호스트 모드로 전환</a>
    </div>
    <div class="right-aligned">
        <div class="dropdown">
            <button class="dropbtn">
                <span class="material-symbols-outlined">menu</span>
                &nbsp;&nbsp;<span id="menuText">회원가입 / 로그인</span>
            </button>
            <div class="dropdown-content" id="dropdownContent">
                <!-- Content will be dynamically generated by JavaScript -->
            </div>
        </div>
    </div>
</div>
</body>
</html>
