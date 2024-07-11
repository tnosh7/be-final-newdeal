<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>회원가입</title>
    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://unpkg.com/bs-brain@2.0.4/components/registrations/registration-12/assets/css/registration-12.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/style.css">
    <link rel="stylesheet" href="${contextPath}/css/member.css">
</head>
<script>
    let emailCheckNumberInput = null;
    // Validator 객체 정의 - 유효성 검사용
    const Validator = {
        isValid: true,

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

                alert(${message});
                event.preventDefault();
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
    function emailCheckNumber() {
        const email = document.getElementById("email").value;
        const emailCheckNumber = document.getElementById("emailCheckNumber");
        if (!Validator.validateForm()) {
        }
        else {
            $("#register-btn").show();
            $("#emailCheckYn-btn").hide();
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
    }
    function varifiedEmailNunber() {
        const userNumber = document.getElementById("emailCheckYn").value;
        const emailCheckYnWarn = document.getElementById("emailCheckYnWarn");
        if (emailCheckNumberInput !== userNumber) {
            emailCheckYnWarn.innerText ="인증번호를 바르게 입력해주세요.";
            emailCheckYnWarn.style.color = "red";
        } else {
            emailCheckYnWarn.innerText ="";
            $("button[type='submit']").prop('disabled', false);
        }
    }
</script>
<body>
<!-- 회원가입 -->
<section class="py-3 py-md-5 py-xl-8">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="mb-5" align="center">
                    <img src="${contextPath}/images/logo.png" alt="로고" width="250"
                         onclick="location.href='${contextPath}/'">
                    <h1>게스트 회원가입</h1>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 col-lg-10 col-xl-8">
                <div class="row gy-5 justify-content-center">
                    <div class="col-12 col-lg-5">
                        <!--폼 시작-->
                        <form action="${contextPath}/member/register?identity=guest" method="post">
                            <div class="row gy-3 overflow-hidden">
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control border-0 border-bottom rounded-0"
                                               name="guestName" id="guestName" placeholder="name" required>
                                        <label for="guestName" class="form-label-ysh">성명</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control border-0 border-bottom rounded-0"
                                               name="phone" id="phone" placeholder="휴대폰 번호" maxlength="11" required
                                               onfocusout="validatePhone();">
                                        <label for="phone" class="form-label-ysh">휴대폰 번호</label>
                                        <div id="phoneCheckWarn" class="error-message-ysh"></div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="email" class="form-control border-0 border-bottom rounded-0"
                                               name="email" id="email" placeholder="이메일 주소" required
                                               onfocusout="checkDuplicateEmail();">
                                        <label for="email" class="form-label-ysh">이메일</label>
                                        <div id="emailCheckWarn" class="error-message-ysh"></div>
                                    </div>
                                </div>
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
                                               required maxlength="16" onfocusout="validatePassword();">
                                        <label for="passwordCheck" class="form-label-ysh">비밀번호 확인</label>
                                        <div id="passwdCheckWarn" class="error-message-ysh"></div>
                                    </div>
                                </div>
                                <div class="col-12" id="emailCheckNumber-div">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control border-0 border-bottom rounded-0"
                                               name="emailCheckYn" id="emailCheckYn" placeholder="이메일 인증번호" required maxlength="6" onfocusout="varifiedEmailNunber()">
                                        <label for="email" class="form-label-ysh" >이메일 인증번호</label>
                                        <input type="hidden" id=" emailCheckNumber" value="">
                                        <div id="emailCheckYnWarn" class="error-message-ysh"></div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" name="iAgree"
                                               id="iAgree" required readonly>
                                        <label class="form-check-label text-secondary" for="iAgree">
                                            전체동의 <a href="#popup" class="link-primary text-decoration-none"
                                                    id="staynestLow">이용약관</a>
                                        </label>
                                    </div>
                                    <div class="popup-overlay" id="popupOverlay"></div>
                                    <div class="popup" id="popup">
                                        <div class="popup-content" id="popupContent">
                                            <!--이용약관-->
                                            <p>
                                                개인정보보호법에 따라 StayNest에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적,
                                                개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기
                                                바랍니다.<br>

                                                1. 수집하는 개인정보<br>
                                                이용자는 회원가입을 하지 않아도 정보 검색 등 대부분의 StayNest 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가
                                                숙소 예약 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, StayNest는 서비스 이용을 위해 필요한
                                                최소한의 개인정보를 수집합니다.<br>

                                                회원가입 시점에 StayNest가 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br>
                                                - 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 휴대전화번호, 본인확인 이메일주소를 수집합니다. 실명 인증된 아이디로
                                                가입 시, 암호화된 동일인 식별정보(CI), 중복가입 확인정보(DI), 내외국인 정보를 함께 수집합니다. 만 14세 미만 아동의
                                                경우, 법정대리인의 동의를 받고 있으며, 휴대전화번호 또는 아이핀 인증을 통해 법정대리인의 동의를 확인하고 있습니다. 이 과정에서
                                                법정대리인의 정보(법정대리인의 이름, 중복가입확인정보(DI), 휴대전화번호(아이핀 인증인 경우 아이핀번호))를 추가로 수집합니다.<br>
                                                - 단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을
                                                수집합니다.<br>
                                                서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br>
                                                - 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다.<br>
                                                - StayNest 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이
                                                발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목,
                                                개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.<br>

                                                서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및
                                                음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.<br>
                                                구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하거나 이용자가 입력한 정보를 저장(수집)하거나,
                                                2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다.<br>
                                                서비스 이용 과정에서 위치정보가 수집될 수 있으며,StayNest에서 제공하는 위치기반 서비스에 대해서는 'StayNest
                                                위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다.<br>
                                                이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도
                                                있습니다.<br>
                                                생성정보 수집에 대한 추가 설명<br>
                                                - IP(Internet Protocol) 주소란?<br>
                                                IP 주소는 인터넷 망 사업자가 인터넷에 접속하는 이용자의 PC 등 기기에 부여하는 온라인 주소정보 입니다. IP 주소가
                                                개인정보에 해당하는지 여부에 대해서는 각국마다 매우 다양한 견해가 있습니다.<br>
                                                - 서비스 이용기록이란?<br>
                                                네이버 접속 일시, 이용한 서비스 목록 및 서비스 이용 과정에서 발생하는 정상 또는 비정상 로그 일체,메일 수발신 과정에서
                                                기록되는 이메일주소, 친구 초대하기 또는 선물하기 등에서 입력하는 휴대전화번호, 스마트스토어 판매자와 구매자간 상담내역(네이버톡톡
                                                및 상품 Q&A 게시글) 등을 의미합니다. 정보주체가 식별되는 일부 서비스 이용기록(행태정보 포함)과 관련한 처리 목적 등에
                                                대해서는 본 개인정보 처리방침에서 규정하고 있는 수집하는 개인정보, 수집한 개인정보의 이용, 개인정보의 파기 등에서 설명하고
                                                있습니다. 이는 서비스 제공을 위해 수반되는 것으로 이를 거부하시는 경우 서비스 이용에 제한이 있을 수 있으며, 관련하여서는
                                                고객센터로 문의해주시길 바랍니다. 이 외에 정보주체를 식별하지 않고 행태정보를 처리하는 경우와 관련하여서는 '네이버 맞춤형 광고
                                                안내'에서 확인하실 수 있습니다.<br>
                                                - 기기정보란?<br>
                                                본 개인정보처리방침에 기재된 기기정보는 생산 및 판매 과정에서 기기에 부여된 정보뿐 아니라, 기기의 구동을 위해 사용되는 S/W를
                                                통해 확인 가능한 정보를 모두 일컫습니다. OS(Windows, MAC OS 등) 설치 과정에서 이용자가 PC에 부여하는 컴퓨터의
                                                이름, PC에 장착된 주변기기의 일련번호, 스마트폰의 통신에 필요한 고유한 식별값(IMEI, IMSI), AAID 혹은 IDFA,
                                                설정언어 및 설정 표준시, USIM의 통신사 코드 등을 의미합니다. 단, 네이버는 IMEI와 같은 기기의 고유한 식별값을 수집할
                                                필요가 있는 경우, 이를 수집하기 전에 네이버도 원래의 값을 알아볼 수 없는 방식으로 암호화 하여
                                                식별성(Identifiability)을 제거한 후에 수집합니다.<br>
                                                - 쿠키(cookie)란?<br>
                                                쿠키는 이용자가 웹사이트를 접속할 때에 해당 웹사이트에서 이용자의 웹브라우저를 통해 이용자의 PC에 저장하는 매우 작은 크기의
                                                텍스트 파일입니다. 이후 이용자가 다시 웹사이트를 방문할 경우 웹사이트 서버는 이용자 PC에 저장된 쿠키의 내용을 읽어 이용자가
                                                설정한 서비스 이용 환경을 유지하여 편리한 인터넷 서비스 이용을 가능케 합니다. 또한 방문한 서비스 정보, 서비스 접속 시간 및
                                                빈도, 서비스 이용 과정에서 생성된 또는 제공(입력)한 정보 등을 분석하여 이용자의 취향과 관심에 특화된 서비스(광고 포함)를
                                                제공할 수 있습니다. 이용자는 쿠키에 대한 선택권을 가지고 있으며, 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나,
                                                쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 다만, 쿠키의 저장을 거부할 경우에는
                                                로그인이 필요한 네이버 일부 서비스의 이용에 불편이 있을 수 있습니다.<br>
                                                [웹 브라우저에서 쿠키 허용 & 차단 방법]<br>
                                                - 크롬(Chrome) : 웹 브라우저 설정 > 개인정보 보호 및 보안 > 인터넷 사용 기록 삭제<br>
                                                - 엣지(Edge) : 웹 브라우저 설정 > 쿠키 및 사이트 권한 > 쿠키 및 사이트 데이터 관리 및 삭제<br>
                                                [모바일 브라우저에서 쿠키 허용 & 차단]<br>
                                                - 크롬(Chrome) : 모바일 브라우저 설정 > 개인정보 보호 및 보안 > 인터넷 사용 기록 삭제<br>
                                                - 사파리(Safari) : 모바일 기기 설정 > 사파리(Safari) > 고급 > 모든 쿠키 차단<br>
                                                - 삼성 인터넷 : 모바일 브라우저 설정 > 인터넷 사용 기록 > 인터넷 사용 기록 삭제<br>
                                                쿠키에 관한 자세한 내용(StayNest 프라이버시 센터) 알아보기<br>
                                                2. 수집한 개인정보의 이용<br>
                                                StayNest 및 StayNest 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한
                                                인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.<br>
                                                - 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴
                                                의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.<br>
                                                - 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에
                                                기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선
                                                등을 위하여 개인정보를 이용합니다. 신규 서비스 요소의 발굴 및 기존 서비스 개선 등에는 정보 검색, 다른 이용자와의
                                                커뮤니케이션, 콘텐츠 생성·제공·추천, 상품 쇼핑 등에서의 인공지능(AI) 기술 적용이 포함됩니다.<br>
                                                - 법령 및 네이버 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을
                                                주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존,
                                                민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.<br>
                                                - 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.<br>
                                                - 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.<br>
                                                - 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재
                                                등에 개인정보를 이용합니다.<br>
                                                - 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.<br>
                                                3. 개인정보의 보관기간<br>
                                                회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.<br>
                                                단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는
                                                해당 기간 동안 개인정보를 안전하게 보관합니다.<br>
                                                이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.<br>
                                                - 부정 가입 및 이용 방지<br>
                                                부정 이용자의 DI (만 14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관<br>
                                                탈퇴한 이용자의 휴대전화번호(휴대전화 인증 시, 복호화가 불가능한 일방향 암호화(해시)하여 보관), DI(아이핀 인증 시) :
                                                탈퇴일로부터 6개월 보관<br>
                                                - 네이버 서비스 제공을 위한 본인 확인<br>
                                                통신사 정보, 휴대전화번호 : 수집 시점으로부터 1년 보관<br>
                                                전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을
                                                규정하는 경우는 아래와 같습니다. 네이버는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대
                                                이용하지 않습니다.<br>
                                                - 전자상거래 등에서 소비자 보호에 관한 법률<br>
                                                계약 또는 청약철회 등에 관한 기록: 5년 보관<br>
                                                대금결제 및 재화 등의 공급에 관한 기록: 5년 보관<br>
                                                소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관<br>
                                                - 전자문서 및 전자거래 기본법<br>
                                                공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관<br>
                                                - 통신비밀보호법<br>
                                                로그인 기록: 3개월<br>
                                                4. 개인정보 수집 및 이용 동의를 거부할 권리<br>
                                                이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한
                                                수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.
                                            </p>
                                        </div>
                                        <button class="popup-button" id="popupButton" type="button">확인</button>
                                    </div>

                                    <script>
                                        document.getElementById("staynestLow").addEventListener('click', function (event) {
                                            event.preventDefault();
                                            document.getElementById('popupOverlay').style.display = 'block';
                                            document.getElementById('popup').style.display = 'block';
                                        });

                                        document.getElementById('popupOverlay').addEventListener('click', function () {
                                            document.getElementById('popupOverlay').style.display = 'none';
                                            document.getElementById('popup').style.display = 'none';
                                        });

                                        document.getElementById('popupButton').addEventListener('click', function () {
                                            document.getElementById('popupOverlay').style.display = 'none';
                                            document.getElementById('popup').style.display = 'none';
                                            document.getElementById('iAgree').disabled = false;
                                            document.getElementById('iAgree').checked = true;
                                        });
                                    </script>
                                </div>
                                <div class="col-12" id="emailCheckYn-btn" >
                                    <div class="d-grid" >
                                        <button class="btn btn-lg btn-dark rounded-10 fs-6"
                                                style="color: white; background-color: #0D31B2" type="button" onclick="emailCheckNumber()">인증요청
                                        </button>
                                    </div>
                                </div>
                                <div class="col-12" id="register-btn">
                                    <div class="d-grid">
                                        <button class="btn btn-lg btn-dark rounded-10 fs-6"
                                                style="color: white; background-color: #0D31B2" type="submit" disabled >회원가입
                                        </button>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="d-grid">
                                        <p class="text-center m-0">Already have an account? <a
                                                href="${contextPath}/member/login-page"
                                                class="link-primary text-decoration-none">로그인</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="identi" id="identi" value="guest">
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
                        <div class="d-flex gap-3 flex-column" style="align-items: center">
                            <button class="kakao-register-btn"
                                    onclick="location.href='${contextPath}/oauth2/authorization/naver'">
                                <img src="${contextPath}/images/kakao-btn.png" alt="카카오 심볼"
                                     class="kakao-register-symbol">
                                카카오로 시작하기
                            </button>
                            <button class="naver-register-btn"
                                    onclick="location.href='${contextPath}/oauth2/authorization/naver'">
                                <img src="${contextPath}/images/naver-btn.png" width="45px" height="40px" alt="네이버 심볼"
                                     class="naver-register-symbol">
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
