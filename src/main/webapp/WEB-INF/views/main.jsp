<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <!-- 페이지에 변경할 때마다 타이틀, 바디 부분 변경해주세요 -->
    <title>StayNest</title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <!-- flatpickr CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/js/search.js"></script>
</head>
<body>
<%
    // 현재 날짜 계산
    Calendar calendar = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    // 오늘 날짜
    String todayDate = sdf.format(calendar.getTime());

    // 내일 날짜
    calendar.add(Calendar.DAY_OF_YEAR, 1);
    String tomorrowDate = sdf.format(calendar.getTime());
%>
<div class="wrapper">
    <!--레이아웃 설정 footer, header-->
    <!--header.jsp-->
    <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
        <jsp:param name="pageName" value="header"/>
    </jsp:include>

    <div class="main-content">
        <form action="/search" method="post">
            <div class="searchBox-khs">
                <div style="width: 28%;">
                    <div class="searchtitle-khs">여행지</div>
                    <input type="text" class="button-item-khs sb1-khs" name="address" id="address"
                           placeholder="여행지를 검색해 주세요.">
                </div>
                <div style="width: 18%;">
                    <div class="searchtitle-khs">체크인</div>
                    <input type="date" class="button-item-khs sb2-khs" name="checkInDate" id="checkInDate"
                           value="<%= todayDate %>">
                </div>
                <div style="width: 18%;">
                    <div class="searchtitle-khs">체크아웃</div>
                    <input type="date" class="button-item-khs sb3-khs" name="checkOutDate" id="checkOutDate"
                           value="<%= tomorrowDate %>">
                </div>
                <div style="width: 13%;">
                    <div class="searchtitle-khs">인원</div>
                    <div class="sb4-khs">
                        <div class="num-input-container">
                            <input type="number" class="button-item-khs num-input" name="maxGuests" id="maxGuests" readonly value="1">
                            <div class="num-dropdown" id="numDropdown">
                                <div style="display: flex; padding: 10px; margin: 0 auto; text-align: center; align-items: center;">
                                    <span class="num-btn minus-btn">-</span>
                                    <span class="num-value">1</span>
                                    <span class="num-btn plus-btn">+</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="width: 13%;">
                    <div>&nbsp;</div>
                    <button type="submit" class="sb5-khs">검색</button>
                </div>
            </div>
        </form>
        <hr style="margin-top: 30px;border: none; /* 기본 테두리 없애기 */
    height: 1px; /* 선의 두께 */
    background-color: gainsboro; /* 배경색 설정 */">
        <div style="display: flex;">
            <div class="selCat-khs">
                <div class="cat-khs" data-category="아파트"><img src="/images/apartment.png" alt="">아파트</div>
                <div class="cat-khs" data-category="게스트하우스"><img src="/images/guest_house.png" alt="">게스트하우스</div>
                <div class="cat-khs" data-category="오피스텔"><img src="/images/Officetels.png" alt="">오피스텔</div>
                <div class="cat-khs" data-category="원룸"><img src="/images/oneRoom.png" alt="">원룸</div>
                <div class="cat-khs" data-category="펜션"><img src="/images/pension.png" alt="">펜션</div>
                <div class="cat-khs" data-category="한옥"><img src="/images/hanok.png" alt="">한옥</div>
            </div>
            <div class="dropdown-khs">
                <button onclick="toggleDropdown()" class="dropbtn-khs">최신순</button>
                <div id="myDropdown-khs" class="dropdown-content-khs">
                    <a href="#" data-sort="최신순">최신순</a>
                    <a href="#" data-sort="평점순">평점순</a>
                    <a href="#" data-sort="가격낮은순">가격낮은순</a>
                </div>
            </div>

        </div>
        <div id="accommodation-list" class="accomList-khs">

        </div>
    </div>
</div>


<jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
    <jsp:param name="pageName" value="footer"/>
</jsp:include>
</div>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</body>
</html>