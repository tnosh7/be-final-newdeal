<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>비밀번호 재설정</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/logins/login-12/assets/css/login-12.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<style>
    .password-btn-ysh input {
        background-color: #0D31B2;
        color: white;
        margin-bottom: 20px;
        text-align: center;
        display: flex;
        justify-content: center; /* 버튼을 가운데 정렬 */
        border: none; /* 버튼 테두리 제거 */
        font-size: 18px; /* 글꼴 크기 조절 */
        width: 100%;
        height: 50px;
        border-radius: 10px;
    }
    .password-btn-ysh input {
        display: flex;
        justify-content: center; /* 버튼을 가운데 정렬 */
        margin-top: 20px; /* 위쪽 마진 추가 */
    }
    .password-btn-ysh input:hover {
        background-color: #A598FF; /* 호버 시 배경색 변경 */
    }
    .text-end-ysh {
        text-align: right;
    }

</style>
<body>
<!-- Login -->
<section class="py-3 py-md-5 py-xl-8">
    <div class="container-ysh">
        <div class="row">
            <div class="col-12">
                <div class="mb-5" align="center">
                    <img src="${contextPath}/images/logo.png" alt="로고" width="250" onclick="location.href='${contextPath}/'">
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 col-lg-10 col-xl-8">
                <div class="row gy-5 justify-content-center">
                    <div class="col-12 col-lg-5">
                        <form action="#" method="post">
                            <div class="row gy-3 overflow-hidden">
                                <span style="color: #005241">비밀번호를 재설정할 이메일을 입력해 주세요.</span>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="email" class="form-control border-0 border-bottom rounded-0" name="email" id="email" placeholder="name@example.com" required maxlength="30">
                                        <label for="email" class="email-label">이메일</label>
                                        <div id="emailCheckWarn" class="error-message"></div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control border-0 border-bottom rounded-0" name="emailNumber" id="emailNumber" placeholder="인증번호" required maxlength="6">
                                        <label for="emailNumber" class="emailNumber-label">인증번호 입력</label>
                                        <div id="emailNumberWarn" class="error-message"></div>
                                    </div>
                                </div>
                                <span style="color: #005241">새로 설정할 비밀번호를 입력해 주세요.</span>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control border-0 border-bottom rounded-0" name="password" id="password" placeholder="비밀번호" required maxlength="16">
                                        <label for="password" class="password-label">비밀번호</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control border-0 border-bottom rounded-0" name="passwordCheck" id="passwordCheck" value="" placeholder="passwordCheck" required maxlength="16">
                                        <label for="passwordCheck" class="passwordCheck-label">비밀번호 확인</label>
                                        <div id="passwordCheckWarn" class="error-message"></div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="password-btn-ysh">
                                        <input type="button" value="비밀번호 변경"></input>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="text-end-ysh">
                                        <a href="${contextPath}/member/register" class="text-end-register-ysh text-decoration-none" >회원가입</a>&emsp;
                                        <a href="${contextPath}/member/login-page" class="link-secondary text-decoration-none">로그인</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
