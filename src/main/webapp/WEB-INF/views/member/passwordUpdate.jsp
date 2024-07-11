<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>비밀번호 재설정</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/logins/login-12/assets/css/login-12.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/style.css">
    <link rel="stylesheet" href="${contextPath}/css/member.css">
    <script src="${contextPath}/js/member.js"></script>
</head>
<body>
<!-- Login -->
<section class="py-3 py-md-5 py-xl-8">
    <div class="container-ysh">
        <div class="row">
            <div class="col-12">
                <div class="mb-5" align="center">
                    <img src="${contextPath}/images/logo.png" alt="로고" width="250"
                         onclick="location.href='${contextPath}/'">
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 col-lg-10 col-xl-8">
                <div class="row gy-5 justify-content-center">
                    <div class="col-12 col-lg-5">
                        <form action="#" method="post">
                            <div class="row gy-3 overflow-hidden">
                                <span style="color: #005241; font-size: 20px;">비밀번호를 재설정할 이메일을 입력해 주세요.</span>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="email" class="form-control border-0 border-bottom rounded-0"
                                               name="email" id="email" placeholder="name@example.com" required
                                               maxlength="30">
                                        <label for="email" class="email-label">이메일</label>
                                        <div id="emailCheckWarn" class="error-message"></div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control border-0 border-bottom rounded-0"
                                               name="emailNumber" id="emailNumber" placeholder="인증번호" required
                                               maxlength="6">
                                        <label for="emailNumber" class="emailNumber-label">인증번호 입력</label>
                                        <div id="emailNumberWarn" class="error-message"></div>
                                    </div>
                                </div>
                                <span style="color: #005241; font-size: 20px;">새로 설정할 비밀번호를 입력해 주세요.</span>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control border-0 border-bottom rounded-0"
                                               name="password" id="password" placeholder="비밀번호" required maxlength="16">
                                        <label for="password" class="password-label">비밀번호</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control border-0 border-bottom rounded-0"
                                               name="passwordCheck" id="passwordCheck" value=""
                                               placeholder="passwordCheck" required maxlength="16">
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
                                        <a href="${contextPath}/member/identify"
                                           class="text-end-register-ysh text-decoration-none">회원가입</a>&emsp;
                                        <a href="${contextPath}/member/login-page"
                                           class="link-secondary text-decoration-none">로그인</a>
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
