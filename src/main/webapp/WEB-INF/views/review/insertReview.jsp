<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
    <head>
        <link rel="stylesheet" href="${contextPath}/bootstrap/css/insertReview.css">
        <title>FullReview</title>
    </head>
    <body>
        <!--레이아웃 설정 footer, header-->
        <!--header.jsp-->
        <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
            <jsp:param name="pageName" value="header"/>
        </jsp:include>

        <div>
            리뷰작성페이지
        </div>
        <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
            <jsp:param name="pageName" value="footer"/>
        </jsp:include>
        <script src="${contextPath}/bootstrap/js/insertReview.js"></script>
    </body>
</html>
