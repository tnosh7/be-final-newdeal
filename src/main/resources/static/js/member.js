//멤버 & 호스트 register.jsp
// Validator 객체 정의 - 유효성 검사용
const Validator = {
    isValid: true,
    //비밀번호 유효성 검사
    validatePassword: function () {
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
    validatePhone: function () {
        const phone = document.getElementById("phone").value;
        const phoneCheckWarn = document.getElementById("phoneCheckWarn");
        const phonePattern = /^0\d{10}$/;

        if (!phonePattern.test(phone)) {
            phoneCheckWarn.innerText = "휴대폰 번호를 정확히 입력해 주세요.";
            phoneCheckWarn.style.color = "red";
            this.isValid = false;
        } else {
            phoneCheckWarn.innerText = "";
            this.isValid = true;
        }
        return this.isValid;
    },
    // 폼 유효성 검사
    validateForm: function () {
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

$(document).ready(function () {
    // 입력 필드에 이벤트 리스너 추가
    $("#passwordCheck").on("input", function () {
        Validator.validatePassword();
    });
    $("#password").on("input", function () {
        Validator.validatePassword();
    });
    $("#phone").on("input", function () {
        Validator.validatePhone();
    });

    // 제출 전 유효성 검사
    $("form").submit(function (event) {
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
    if (email === "") {
        emailCheckWarn.innerText="이메일을 정확히 입력해주세요."
        emailCheckWarn.style.color = "red";
        return;
    }
    $.ajax({
        url: '/member/duplicateEmail?identity=guest',
        type: 'POST',
        data: {email: email},
        success: function (response) {
            emailCheckWarn.innerText = response;
            emailCheckWarn.style.color = "green";
        },
        error: function (error) {
            emailCheckWarn.innerText = "이미 가입된 이메일입니다.";
            emailCheckWarn.style.color = "red";
        }
    });
}
// jwt설정

/*let user = 'http://' + window.location.host;

$(document).ready(function () {
    const auth = getToken();
    if(auth === '') {
        window.location.href = host + "/member/login-page";
    } else {
        $('#login-true').show();
        $('#login-false').hide();
    }
})

function logout() {
    // 토큰 삭제
    Cookies.remove('Authorization', { path: '/' });
    window.location.href = host + "/api/user/login-page";
}

function getToken() {
    let auth = Cookies.get('Authorization');

    if(auth === undefined) {
        return '';
    }*/

//     return auth;
// }

