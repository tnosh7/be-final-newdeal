<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>비밀번호 재설정</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/logins/login-12/assets/css/login-12.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/style.css">
    <link rel="stylesheet" href="${contextPath}/css/member.css">
    <script src="${contextPath}/js/member.js"></script>
</head>
<script>
    $().ready(function(){
        let identify = "${identify}";
        $("form").submit(function (event) {
        });
    });
    function validatePassword(){
        const password = document.getElementById("password").value;
        const passwordCheck = document.getElementById("passwordCheck").value;
        const passwdCheckWarn = document.getElementById("passwdCheckWarn");
        const passwordPattern = /^(?=.*[!@#$])[A-Za-z\d!@#$]{8,16}$/;

        if (!passwordPattern.test(password)) {
            passwdCheckWarn.innerText = "비밀번호는 8자 이상 16자 이하이고, 특수문자(!@#$)를 포함해야 합니다.";
            passwdCheckWarn.style.color = "red";
            return false;
        } else if (password !== passwordCheck) {
            passwdCheckWarn.innerText = "비밀번호가 일치하지 않습니다.";
            passwdCheckWarn.style.color = "red";
            return false;
        } else {
            passwdCheckWarn.innerText = "비밀번호가 일치합니다.";
            passwdCheckWarn.style.color = "green";
            return true;
        }
    }
    let emailCheckNumberInput = null;
    function checkDuplicateEmail() {
        const email = document.getElementById("email").value;
        const emailCheckWarn = document.getElementById("emailCheckWarn");
        if (email === "") {
            emailCheckWarn.innerText="이메일을 정확히 입력해주세요."
            emailCheckWarn.style.color = "red";
            return;
        }
        const identify = "${identify}"
        $.ajax({
            url: '/member/duplicateEmail?identify=' + "${identify}",
            type: 'POST',
            data: {email: email},
            success: function (response) {
                emailCheckNumber(email);
                emailCheckWarn.innerText = "인증번호가 전송되었습니다.";
                emailCheckWarn.style.color = "green";
                $("#emailCheckNumber-input").show();
            },
            error: function (error) {
                emailCheckWarn.innerText = "등록되지 않은 이메일입니다.";
                emailCheckWarn.style.color = "red";
            }
        });
    }
    function emailCheckNumber() {
        const email = document.getElementById("email").value;
        const emailCheckNumber = document.getElementById("emailCheckNumber");

            $("#emailCheckNumber-div").show();
            $.ajax({
                url: '/member/emailCheck',
                type: 'POST',
                data: {email: email},
                success: function (response) {
                    emailCheckNumberInput = response;
                },
                error: function (error) {
                    alert("error")
                }
            })
    }
    function varifiedEmailNunber() {
        const userNumber = document.getElementById("emailCheckYn").value;
        const emailCheckYnWarn = document.getElementById("emailCheckYnWarn");
        if (emailCheckNumberInput !== userNumber) {
            emailCheckYnWarn.innerText ="인증번호를 바르게 입력해주세요.";
            emailCheckYnWarn.style.color = "red";
            return false;
        } else {
            emailCheckYnWarn.innerText ="";
            $("#setPassword-div").show();
            $("button[type='submit']").prop('disabled', false);
            return true;
        }
    }
    function validateForm() {
        const isPasswordValid = validatePassword();
        const isEmailVerified = varifiedEmailNunber();
        return isPasswordValid && isEmailVerified;
    }

    $(document).ready(function() {
        $("form").on("submit", function(event) {
            if (!validateForm()) {
                event.preventDefault();
            }
        });
    });
</script>
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
                        <form action="${contextPath}/member/passwordUpdate" method="POST">
                            <div class="row gy-3 overflow-hidden">
                                <span style="color: #005241; font-size: 20px;">비밀번호를 재설정할 이메일을 입력해 주세요.</span>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="email" class="form-control border-0 border-bottom rounded-0"
                                               name="email" id="email" placeholder="이메일" required
                                               maxlength="30" onfocusout="checkDuplicateEmail();">
                                        <label for="email" class="email-label">이메일</label>
                                        <div id="emailCheckWarn" class="error-message"></div>
                                    </div>
                                </div>
                                <div class="col-12" id="emailCheckNumber-div">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control border-0 border-bottom rounded-0"
                                               name="emailCheckYn" id="emailCheckYn" placeholder="이메일 인증번호" required maxlength="6" onkeyup="varifiedEmailNunber()">
                                        <label for="email" class="form-label-ysh" >이메일 인증번호</label>
                                        <input type="hidden" id=" emailCheckNumber" value="">
                                        <div id="emailCheckYnWarn" class="error-message-ysh"></div>
                                    </div>
                                </div>
                                <div id="setPassword-div" style="display:none;">
                                    <span style="color: #005241; font-size: 20px;">새로 설정할 비밀번호를 입력해 주세요.</span>
                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <input type="password" class="form-control border-0 border-bottom rounded-0"
                                                   name="password" id="password" value="" placeholder="Password" required
                                                   maxlength="16">
                                            <label for="password" class="form-label-ysh">비밀번호</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <input type="password" class="form-control border-0 border-bottom rounded-0"
                                                   name="passwordCheck" id="passwordCheck" value="" placeholder="Password"
                                                   required maxlength="16" onchange="validatePassword();">
                                            <label for="passwordCheck" class="form-label-ysh">비밀번호 확인</label>
                                            <div id="passwdCheckWarn" class="error-message-ysh"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="password-btn-ysh">
                                    <input type="button" value="비밀번호 변경" onclick="submit()"></input>
                                    <input type="hidden" name="identify" value="${identify}">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="text-end-ysh">
                                    <a href="${contextPath}/member/identify"
                                       class="text-end-register-ysh text-decoration-none">회원가입&ensp; |</a>&emsp;
                                    <a href="${contextPath}/member/guestRegister"
                                       class="link-secondary text-decoration-none">Guest 로그인&ensp; |</a>
                                    <a href="${contextPath}/member/hostRegister"
                                       class="link-secondary text-decoration-none">&ensp; Host 로그인</a>
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
