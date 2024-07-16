<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <!-- 페이지에 변경할 때마다 타이틀, 바디 부분 변경해주세요 -->
    <title>숙소예약내역</title>
</head>
<body>
<div class="wrapper">
    <!--레이아웃 설정 footer, header-->
    <!--header.jsp-->
    <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
        <jsp:param name="pageName" value="header"/>
    </jsp:include>

    <div class="main-content">
        <div class="hmain-khs">
            <div style="font-size: 30px; text-align: left;">숙소 메인</div>
            <div id="accommodation-list">
                
            </div>

            <div style="margin: 20px 0 20px 0; text-align: left;">
                <button class="grlb1-khs" onclick="accomEnroll()">숙소 추가</button>
            </div>
        </div>
    </div>

    <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
        <jsp:param name="pageName" value="footer"/>
    </jsp:include>
</div>
<script src="/js/hostMain.js"></script>
</body>
</html>
