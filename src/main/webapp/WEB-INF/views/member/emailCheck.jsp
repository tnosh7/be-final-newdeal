<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<style>
    .email-info-ysh {
        text-align: center;
        margin: 80px auto 0 auto;
    }
    .emailCheck-ysh input {
        width: 35%; /* 너비 조절 */
        height: 50px; /* 높이 조절 */
        padding: 10px; /* 패딩 조절 */
        font-size: 16px; /* 글꼴 크기 조절 */
        border: 1px solid #ccc; /* 테두리 설정 */
        border-radius: 4px; /* 테두리 둥글게 */
    }
    .emailCheck-ysh input:hover{
        border-color: #A598FF
    }
    .emailCheck-ysh input:hover {
        border-color: #A598FF;
        box-shadow: 0 0 5px rgba(79, 159, 138, 0.5);
    }
    .email-btn-ysh input{
        background-color: #4F9F8A;
        color: white;
        text-align: center;
        display: flex;
        justify-content: center; /* 버튼을 가운데 정렬 */
        border: none; /* 버튼 테두리 제거 */
        font-size: 18px; /* 글꼴 크기 조절 */
        width: 35%;
        height: 50px;
        margin-bottom: 80px;
    }
    .email-btn-ysh {
        display: flex;
        justify-content: center; /* 버튼을 가운데 정렬 */
        margin-top: 20px; /* 위쪽 마진 추가 */
        margin-bottom: 100px;
    }
    .email-btn-ysh input:hover {
        background-color: #A598FF; /* 호버 시 배경색 변경 */
    }

</style>
<html>
<head>
    <title>이메일 인증</title>
</head>
<body>
<div class="wrapper">
    <!--레이아웃 설정 footer, header-->
    <!--header.jsp-->
    <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
        <jsp:param name="pageName" value="header"/>
    </jsp:include>
    <div class="main-content">
        <section class="centered-email-ysh">
            <form>
                <div class="col-12 col-lg-12 col-xl-12">
                    <div class="email-info-ysh">
                        <div class="email-img-ysh">
                            <img src="/images/email.png" alt="이메일아이콘" >
                        </div>
                        <br> <h1>이메일 인증</h1>
                        <div class="emailCheck-ysh">
                            <br>
                                <div><label>가입된 이메일로 전송된 이메일 인증번호를 입력하세요.</label></div>
                                <input type="text" placeholder="인증번호" id="emailCheck" name="emailCheck" maxlength="6">
                                <div id="emailCheckWarn" class="error-message-ysh"></div>
                            </div>
                        </div>
                        <br>
                    <div class="email-btn-ysh">
                        <input type="button"  value="확 인"></input>
                    </div>
                </div>
            </form>
        </section>
    <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
        <jsp:param name="pageName" value="footer"/>
    </jsp:include>
    </div>
</div>
</body>
</html>