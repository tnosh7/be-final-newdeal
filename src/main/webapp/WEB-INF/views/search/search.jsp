<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <!-- 페이지에 변경할 때마다 타이틀, 바디 부분 변경해주세요 -->
    <title>검색결과</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <!-- Popper.js (Bootstrap의 일부 컴포넌트에서 사용) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55c1825b3a2528996d0f7f272b884d60"></script>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- flatpickr CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

</head>
<body>
<div class="wrapper">
    <!--레이아웃 설정 footer, header-->
    <!--header.jsp-->
    <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
        <jsp:param name="pageName" value="header"/>
    </jsp:include>

    <div class="main-content">
        <form action="" method="post">
            <div class="searchBox-khs">
                <div style="width: 28%;">
                    <div class="searchtitle-khs">여행지</div>
                    <input type="text" class="button-item-khs sb1-khs" name="address" id="address"
                           placeholder="여행지를 검색해 주세요." value="${requestDTO.address}">
                </div>
                <div style="width: 18%;">
                    <div class="searchtitle-khs">체크인</div>
                    <input type="date" class="button-item-khs sb2-khs" name="checkInDate" id="checkInDate"
                           value="${requestDTO.checkInDate}">
                </div>
                <div style="width: 18%;">
                    <div class="searchtitle-khs">체크아웃</div>
                    <input type="date" class="button-item-khs sb3-khs" name="checkOutDate" id="checkOutDate"
                           value="${requestDTO.checkOutDate}">
                </div>
                <div style="width: 13%;">
                    <div class="searchtitle-khs">인원</div>
                    <div class="sb4-khs">
                        <div class="num-input-container">
                            <input type="text" class="button-item-khs num-input" name="maxGuests" id="maxGuests" readonly value="${requestDTO.maxGuests}">
                            <div class="num-dropdown" id="numDropdown">
                                <div style="display: flex; padding: 10px; margin: 0 auto; text-align: center; align-items: center;">
                                    <span class="num-btn minus-btn">-</span>
                                    <span class="num-value">${requestDTO.maxGuests}</span>
                                    <span class="num-btn plus-btn">+</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="width: 13%;">
                    <div>&nbsp;</div>
                    <button class="sb5-khs">검색</button>
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
            <div>
                <button type="button" class="filter-khs" data-toggle="modal" data-target="#myModal">
                    <img src="/images/filter.png" alt="">필터
                </button>
                <!-- 가격 필터링 결과를 표시할 div -->
                <div style="display: flex; justify-content: center;
  align-items: center;">
                <div id="priceRangeDisplay" style="display: none; color: #0D31B2;"></div>
                </div>
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">가격 필터링</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" style="margin:0 auto; text-align:center;">
                                <form id="priceFilterForm">
                                    <div style="display: flex; align-items: center;">
                                        <input type="text" name="minPrice" id="minPrice" placeholder="최소 가격"/>
                                        <div>&nbsp;원 -&nbsp;</div>
                                        <input type="text" name="maxPrice" id="maxPrice" placeholder="최대 가격"/>
                                        <div>&nbsp;원</div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="grlb1-khs" id="applyPriceFilter" data-dismiss="modal" onclick="applyPriceFilter()">적용</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="display: flex;">
            <div  id="accommodation-list" class="accomList-khs" style="width: 50%; height:600px; overflow-y: scroll;">
            </div>
            <div id="map" style="width:45%; height:600px; margin: 20px; "></div>
        </div>


    </div>

    <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
        <jsp:param name="pageName" value="footer"/>
    </jsp:include>
</div>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="/js/search.js"></script>
<script src="/js/map.js"></script>
</body>
</html>
