<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>회원 구분</title>
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
        <section>
            <form>
                <div class="identify-ysh">
                    <div class="identify-info-ysh col-12" align="center">
                        <div class="register">
                            <h1>회원가입</h1>
                            <h3>회원가입 유형을 선택해주세요</h3>
                        </div>
                    </div>
                    <br>
                    <div class="tables-container-ysh">
                        <div class="identify-table-ysh">
                            <table>
                                <tbody>
                                <tr class="identify-table-img-ysh">
                                    <th>
                                        <img src="${contextPath}/images/user.png" alt="유저"
                                             onclick="location.href='${contextPath}/member/guestRegister'">
                                    </th>
                                </tr>
                                </tbody>
                                <tfoot>
                                <tr align="center">
                                    <th style="color: #0D31B2">
                                        게스트 가입하기
                                    </th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="identify-table-ysh">
                            <table>
                                <tbody>
                                <tr class="identify-table-img-ysh">
                                    <th>
                                        <img src="${contextPath}/images/host.png" alt="호스트"
                                             onclick="location.href='${contextPath}/member/hostRegister'">
                                    </th>
                                </tr>
                                </tbody>
                                <tfoot>
                                <tr align="center">
                                    <th style="color: #A598FF">
                                        호스트 가입하기
                                    </th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
        </section>

    </div>
    <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
        <jsp:param name="pageName" value="footer"/>
    </jsp:include>
</div>
</body>
</html>
