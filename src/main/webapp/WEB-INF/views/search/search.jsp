<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<html>
<head>
    <!-- 페이지에 변경할 때마다 타이틀, 바디 부분 변경해주세요 -->
    <title>StayNest</title>
</head>
<body>
<div class="wrapper">
    <!--레이아웃 설정 footer, header-->
    <!--header.jsp-->
    <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
        <jsp:param name="pageName" value="header"/>
    </jsp:include>

    <div class="main-content">
        <div class="searchBox-khs">
            <button class="button-item-khs sb1-khs sbwc-khs">강릉 속초</button>
            <button class="button-item-khs sb6-khs sbwc-khs">2024.07.03 ~ 2024.07.05</button>
            <button class="button-item-khs sb4-khs sbwc-khs">2명</button>
            <button class="button-item-khs sb5-khs">검색</button>
        </div>
        <hr style="margin-top: 30px;border: none; /* 기본 테두리 없애기 */
    height: 1px; /* 선의 두께 */
    background-color: gainsboro; /* 배경색 설정 */">
        <div class="selCat-khs">
            <div class="cat-khs" onclick=""><img src="/images/apartment.png" alt="">아파트</div>
            <div class="cat-khs"><img src="/images/guest_house.png" alt="">게스트하우스</div>
            <div class="cat-khs"><img src="/images/Officetels.png" alt="">오피스텔</div>
            <div class="cat-khs"><img src="/images/oneRoom.png" alt="">원룸</div>
            <div class="cat-khs"> <img src="/images/pension.png" alt="">펜션</div>
            <div class="cat-khs"><img src="/images/hanok.png" alt="">한옥</div>
            <div class="filter-khs"><div><img src="/images/filter.png" alt=""></div> <div>&nbsp;&nbsp;필터</div></div>
        </div>
        <div class="accomList-khs">
            <div class="accom-khs"><img src="/images/room.png" alt=""><div class="accomD1-khs"><div class="accomD1-1-khs">가산아네스트오피스텔</div><div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5</div></div><div class="accomD2-khs">도심 속 숙소</div><div class="accomD3-khs">방1개, 침대 2개</div><div class="accomD4-khs">50000 원 / 박</div></div>
            <div class="accom-khs"><img src="/images/room.png" alt=""><div class="accomD1-khs"><div class="accomD1-1-khs">가산아네스트오피스텔</div><div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5</div></div><div class="accomD2-khs">도심 속 숙소</div><div class="accomD3-khs">방1개, 침대 2개</div><div class="accomD4-khs">50000 원 / 박</div></div>
            <div class="accom-khs"><img src="/images/room.png" alt=""><div class="accomD1-khs"><div class="accomD1-1-khs">가산아네스트오피스텔</div><div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5</div></div><div class="accomD2-khs">도심 속 숙소</div><div class="accomD3-khs">방1개, 침대 2개</div><div class="accomD4-khs">50000 원 / 박</div></div>
            <div class="accom-khs"><img src="/images/room.png" alt=""><div class="accomD1-khs"><div class="accomD1-1-khs">가산아네스트오피스텔</div><div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5</div></div><div class="accomD2-khs">도심 속 숙소</div><div class="accomD3-khs">방1개, 침대 2개</div><div class="accomD4-khs">50000 원 / 박</div></div>
        </div>
    </div>

    <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
        <jsp:param name="pageName" value="footer"/>
    </jsp:include>
</div>
</body>
</html>
