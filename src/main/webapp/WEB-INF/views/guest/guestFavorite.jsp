<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <!-- 페이지에 변경할 때마다 타이틀, 바디 부분 변경해주세요 -->
    <title>위시리스트</title>
</head>
<body>
<div class="wrapper">
    <!--레이아웃 설정 footer, header-->
    <!--header.jsp-->
    <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
        <jsp:param name="pageName" value="header"/>
    </jsp:include>

    <div class="main-content">
        <div style="font-size: 30px;">위시리스트</div>
        <div class="grl-khs">
            <div class="grld1-khs">찜한 숙소가 없습니다!</div>
            <div class="grld2-khs">위시리스트에 관심있는 숙소를 등록해보세요.</div>
            <button class="grlb1-khs">숙소 검색하기</button>
        </div>
        <div>
            <table class="grt-khs">
                <thead>
                <tr>
                    <th>숙소 이름</th>
                    <th>숙소 사진</th>
                    <th>숙소 주소</th>
                    <th>기준인원</th>
                    <th>숙박 요금</th>
                    <th>삭제</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>가산 아네스트</td>
                    <td><img style="width: 200px;" src="/images/room.png" alt=""></td>
                    <td>서울 금천구 남부순환로 1314</td>
                    <td>2</td>
                    <td>138,000 원</td>
                    <td><button class="grlb1-khs">삭제</button></td>
                </tr>
                <tr>
                    <td>가산 아네스트</td>
                    <td><img style="width: 200px;" src="/images/room.png" alt=""></td>
                    <td>서울 금천구 남부순환로 1314</td>
                    <td>2</td>
                    <td>138,000 원</td>
                    <td><button class="grlb1-khs">삭제</button></td>
                </tr>
                <tr>
                    <td>가산 아네스트</td>
                    <td><img style="width: 200px;" src="/images/room.png" alt=""></td>
                    <td>서울 금천구 남부순환로 1314</td>
                    <td>2</td>
                    <td>138,000 원</td>
                    <td><button class="grlb1-khs">삭제</button></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
        <jsp:param name="pageName" value="footer"/>
    </jsp:include>
</div>
</body>
</html>
