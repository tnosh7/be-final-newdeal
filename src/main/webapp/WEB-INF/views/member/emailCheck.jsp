<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>이메일 인증</title>
    <link rel="stylesheet" href="${contextPath}/css/member.css">
    <script src="${contextPath}/js/member.js"></script>
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
                            <img src="${contextPath}/images/email.png" alt="이메일아이콘">
                        </div>
                        <br>
                        <h1>이메일 인증</h1>
                        <div class="emailCheck-ysh">
                            <div><label style="font-size: 20px">가입된 이메일로 전송된 이메일 인증번호를 입력하세요.</label></div>
                            <input type="text" placeholder="인증번호" id="emailCheck" name="emailCheck" maxlength="6">
                            <div id="emailCheckWarn" class="error-message-ysh"></div>
                        </div>
                    </div>
                    <br>
                    <div class="email-btn-ysh">
                        <button type="submit">인증 확인</button>
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