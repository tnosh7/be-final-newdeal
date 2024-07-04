<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/registrations/registration-12/assets/css/registration-12.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<style>
    .kakao-register-btn {
        background-color: #FEE500;
        color: rgba(0, 0, 0, 0.85);
        display: flex;
        align-items: center;
        justify-content: center;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        width: 100%; /* 기본 너비 100% */
    }
    .kakao-register-symbol, .naver-register-symbol {
        margin-right: 10px;
        border: none; /* 이미지 테두리 제거 */
    }
    .naver-register-btn {
        background-color: #03C75A;
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        width: 100%; /* 기본 너비 100% */
    }
    .kakao-btn:hover, .naver-btn:hover {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 적당한 그림자 효과 */
    }
</style>
<script>
    // Validator 객체 정의 - 유효성 검사용
    const Validator = {
        isValid: true,
        //비밀번호 유효성 검사
        validatePassword: function() {
            const password = document.getElementById("password").value;
            const passwordCheck = document.getElementById("passwordCheck").value;
            const passwdCheckWarn = document.getElementById("passwdCheckWarn");
            const passwordPattern = /^(?=.*[!@#$])[A-Za-z\d!@#$]{8,16}$/;

            if (!passwordPattern.test(password)) {
                passwdCheckWarn.innerText = "비밀번호는 8자 이상 16자 이하이고, 특수문자(!@#$)를 포함해야 합니다.";
                passwdCheckWarn.style.color = "red";
                this.isValid = false;
            } else if (password !== passwordCheck) {
                passwdCheckWarn.innerText = "비밀번호가 일치하지 않습니다.";
                passwdCheckWarn.style.color = "red";
                this.isValid = false;
            } else {
                passwdCheckWarn.innerText = "비밀번호가 일치합니다.";
                passwdCheckWarn.style.color = "green";
                this.isValid = true;
            }
            return this.isValid;
        },
        //핸드폰 유효성 검사
        validatePhone: function() {
            const phone = document.getElementById("phone").value;
            const phoneCheckWarn = document.getElementById("phoneCheckWarn");
            const phonePattern = /^0\d{10}$/;

            if (!phonePattern.test(phone)) {
                phoneCheckWarn.innerText = "핸드폰 번호를 정확히 입력해 주세요.";
                phoneCheckWarn.style.color = "red";
                this.isValid = false;
            } else {
                phoneCheckWarn.innerText = "";
                this.isValid = true;
            }
            return this.isValid;
        },
        // 폼 유효성 검사
        validateForm: function() {
            this.isValid = true; // 초기화

            const isPasswordValid = this.validatePassword();
            const isPhoneValid = this.validatePhone();
            if (!isPasswordValid || !isPhoneValid) {
                alert("회원정보를 정확하게 입력해주세요.");
                return false;
            }
            return true;
        }
    };

    $(document).ready(function() {
        // 입력 필드에 이벤트 리스너 추가
        $("#passwordCheck").on("input", function() {
            Validator.validatePassword();
        });
        $("#password").on("input", function() {
            Validator.validatePassword();
        });
        $("#phone").on("input", function() {
            Validator.validatePhone();
        });

        // 제출 전 유효성 검사
        $("form").submit(function(event) {
            if (!Validator.validateForm()) {
                //컨트롤러에서 예외처리 메시지 전송
                alert(${message});
                event.preventDefault(); // 폼 제출을 막음
            }
        });
    });
    function checkDuplicateEmail() {
        const email = document.getElementById("email").value;
        const emailCheckWarn = document.getElementById("emailCheckWarn");

        $.ajax({
            url: '/member/duplicateEmail',
            type: 'POST',
            data: { email: email },
            success: function(response) {
               emailCheckWarn.innerText = response;
               emailCheckWarn.style.color = "green";
            },
            error: function(error) {
               emailCheckWarn.innerText = error;
               emailCheckWarn.style.color = "red";
            }
        });
    }
</script>
<body>
<!-- 회원가입 -->
    <section class="py-3 py-md-5 py-xl-8">
        <div class="container">
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
                            <!--폼 시작-->
                            <form action="${contextPath}/member/register" method="post">
                                <div class="row gy-3 overflow-hidden">
                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control border-0 border-bottom rounded-0" name="name" id="name" placeholder="name" required>
                                            <label for="name" class="form-label-ysh">성명</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control border-0 border-bottom rounded-0" name="phone" id="phone" placeholder="휴대폰 번호" maxlength="11" required onchange="validatePhone();">
                                            <label for="phone" class="form-label-ysh">휴대폰 번호</label>
                                            <div id="phoneCheckWarn" class="error-message-ysh"></div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <input type="email" class="form-control border-0 border-bottom rounded-0" name="email" id="email" placeholder="이메일 주소" required onkeyup="checkDuplicateEmail();" >
                                            <label for="email" class="form-label-ysh">이메일</label>
                                            <div id="emailCheckWarn" class="error-message-ysh"></div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <input type="password" class="form-control border-0 border-bottom rounded-0" name="password" id="password" value="" placeholder="Password" required maxlength="16">
                                            <label for="password" class="form-label-ysh">비밀번호</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <input type="password" class="form-control border-0 border-bottom rounded-0" name="passwordCheck" id="passwordCheck" value="" placeholder="Password" required maxlength="16" onchange="validatePassword();">
                                            <label for="passwordCheck" class="form-label-ysh">비밀번호 확인</label>
                                            <div id="passwdCheckWarn" class="error-message-ysh"></div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" name="iAgree" id="iAgree" required>
                                            <label class="form-check-label text-secondary" for="iAgree">
                                                전체동의 <a href="#!" class="link-primary text-decoration-none">이용약관</a>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="d-grid">
                                            <button class="btn btn-lg btn-dark rounded-0 fs-6"  style="color: white; background-color: #0D31B2" type="submit">회원가입</button>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="d-grid">
                                            <p class="text-center m-0">Already have an account? <a href="${contextPath}/member/login-page" class="link-primary text-decoration-none">로그인</a></p>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-12 col-lg-2 d-flex align-items-center justify-content-center gap-3 flex-lg-column">
                            <div class="bg-dark h-100 d-none d-lg-block" style="width: 1px; --bs-bg-opacity: .1;"></div>
                            <div class="bg-dark w-100 d-lg-none" style="height: 1px; --bs-bg-opacity: .1;"></div>
                            <div>or</div>
                            <div class="bg-dark h-100 d-none d-lg-block" style="width: 1px; --bs-bg-opacity: .1;"></div>
                            <div class="bg-dark w-100 d-lg-none" style="height: 1px; --bs-bg-opacity: .1;"></div>
                        </div>
                        <div class="col-12 col-lg-5 d-flex align-items-center">
                            <div class="d-flex gap-3 flex-column" style="align-items: center" >
                                <button class="kakao-register-btn" onclick="location.href='${contextPath}/oauth2/authorization/naver'">
                                    <img src="${contextPath}/images/kakao-btn.png" alt="카카오 심볼" class="kakao-register-symbol">
                                    카카오로 시작하기
                                </button>
                                <button class="naver-register-btn" onclick="location.href='${contextPath}/oauth2/authorization/naver'">
                                    <img src="${contextPath}/images/naver-btn.png" width="45px" height="40px" alt="네이버 심볼" class="naver-register-symbol">
                                    네이버로 시작하기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
