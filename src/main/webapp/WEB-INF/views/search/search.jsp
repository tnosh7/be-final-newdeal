<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <!-- 페이지에 변경할 때마다 타이틀, 바디 부분 변경해주세요 -->
    <title>검색결과</title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55c1825b3a2528996d0f7f272b884d60"></script>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Bootstrap JS 및 jQuery -->

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>

    <!-- flatpickr CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="/js/search.js"></script>
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
                    <input type="date" class="button-item-khs sb2-khs" name="startdate" id="startdate"
                           value="${requestDTO.startdate}">
                </div>
                <div style="width: 18%;">
                    <div class="searchtitle-khs">체크아웃</div>
                    <input type="date" class="button-item-khs sb3-khs" name="enddate" id="enddate"
                           value="${requestDTO.enddate}">
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
                <div class="cat-khs" onclick=""><img src="/images/apartment.png" alt="">아파트</div>
                <div class="cat-khs"><img src="/images/guest_house.png" alt="">게스트하우스</div>
                <div class="cat-khs"><img src="/images/Officetels.png" alt="">오피스텔</div>
                <div class="cat-khs"><img src="/images/oneRoom.png" alt="">원룸</div>
                <div class="cat-khs"><img src="/images/pension.png" alt="">펜션</div>
                <div class="cat-khs"><img src="/images/hanok.png" alt="">한옥</div>
            </div>
            <div>
                <button type="button" class="filter-khs" data-toggle="modal" data-target="#myModal">
                    <img src="/images/filter.png" alt="">필터
                </button>
                <!-- 모달 구조 -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">가격 필터링</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" style="margin:0 auto; text-align:center;">
                                <div style=" display: flex; align-items: center;">
                                    <input type="text"/>
                                    <div>&nbsp;원 -&nbsp;</div>
                                    <input type="text"/>
                                    <div>&nbsp;원</div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="grlb1-khs" data-dismiss="modal">검색하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="display: flex;">
            <div class="accomList-khs" style="width: 50%; height:600px; overflow-y: scroll;">
                <div class="accom-khs"><img src="/images/room.png" alt="">
                    <div class="accomD1-khs">
                        <div class="accomD1-1-khs">가산아네스트오피스텔</div>
                        <div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5
                        </div>
                    </div>
                    <div class="accomD2-khs">도심 속 숙소</div>
                    <div class="accomD3-khs">방1개, 침대 2개</div>
                    <div class="accomD4-khs">50000 원 / 박</div>
                </div>
                <div class="accom-khs"><img src="/images/room.png" alt="">
                    <div class="accomD1-khs">
                        <div class="accomD1-1-khs">가산아네스트오피스텔</div>
                        <div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5
                        </div>
                    </div>
                    <div class="accomD2-khs">도심 속 숙소</div>
                    <div class="accomD3-khs">방1개, 침대 2개</div>
                    <div class="accomD4-khs">50000 원 / 박</div>
                </div>
                <div class="accom-khs"><img src="/images/room.png" alt="">
                    <div class="accomD1-khs">
                        <div class="accomD1-1-khs">가산아네스트오피스텔</div>
                        <div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5
                        </div>
                    </div>
                    <div class="accomD2-khs">도심 속 숙소</div>
                    <div class="accomD3-khs">방1개, 침대 2개</div>
                    <div class="accomD4-khs">50000 원 / 박</div>
                </div>
                <div class="accom-khs"><img src="/images/room.png" alt="">
                    <div class="accomD1-khs">
                        <div class="accomD1-1-khs">가산아네스트오피스텔</div>
                        <div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5
                        </div>
                    </div>
                    <div class="accomD2-khs">도심 속 숙소</div>
                    <div class="accomD3-khs">방1개, 침대 2개</div>
                    <div class="accomD4-khs">50000 원 / 박</div>
                </div>
                <div class="accom-khs"><img src="/images/room.png" alt="">
                    <div class="accomD1-khs">
                        <div class="accomD1-1-khs">가산아네스트오피스텔</div>
                        <div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5
                        </div>
                    </div>
                    <div class="accomD2-khs">도심 속 숙소</div>
                    <div class="accomD3-khs">방1개, 침대 2개</div>
                    <div class="accomD4-khs">50000 원 / 박</div>
                </div>
                <div class="accom-khs"><img src="/images/room.png" alt="">
                    <div class="accomD1-khs">
                        <div class="accomD1-1-khs">가산아네스트오피스텔</div>
                        <div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5
                        </div>
                    </div>
                    <div class="accomD2-khs">도심 속 숙소</div>
                    <div class="accomD3-khs">방1개, 침대 2개</div>
                    <div class="accomD4-khs">50000 원 / 박</div>
                </div>
                <div class="accom-khs"><img src="/images/room.png" alt="">
                    <div class="accomD1-khs">
                        <div class="accomD1-1-khs">가산아네스트오피스텔</div>
                        <div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5
                        </div>
                    </div>
                    <div class="accomD2-khs">도심 속 숙소</div>
                    <div class="accomD3-khs">방1개, 침대 2개</div>
                    <div class="accomD4-khs">50000 원 / 박</div>
                </div>
                <div class="accom-khs"><img src="/images/room.png" alt="">
                    <div class="accomD1-khs">
                        <div class="accomD1-1-khs">가산아네스트오피스텔</div>
                        <div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5
                        </div>
                    </div>
                    <div class="accomD2-khs">도심 속 숙소</div>
                    <div class="accomD3-khs">방1개, 침대 2개</div>
                    <div class="accomD4-khs">50000 원 / 박</div>
                </div>
                <div class="accom-khs"><img src="/images/room.png" alt="">
                    <div class="accomD1-khs">
                        <div class="accomD1-1-khs">가산아네스트오피스텔</div>
                        <div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5
                        </div>
                    </div>
                    <div class="accomD2-khs">도심 속 숙소</div>
                    <div class="accomD3-khs">방1개, 침대 2개</div>
                    <div class="accomD4-khs">50000 원 / 박</div>
                </div>
                <div class="accom-khs"><img src="/images/room.png" alt="">
                    <div class="accomD1-khs">
                        <div class="accomD1-1-khs">가산아네스트오피스텔</div>
                        <div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5
                        </div>
                    </div>
                    <div class="accomD2-khs">도심 속 숙소</div>
                    <div class="accomD3-khs">방1개, 침대 2개</div>
                    <div class="accomD4-khs">50000 원 / 박</div>
                </div>
                <div class="accom-khs"><img src="/images/room.png" alt="">
                    <div class="accomD1-khs">
                        <div class="accomD1-1-khs">가산아네스트오피스텔</div>
                        <div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5
                        </div>
                    </div>
                    <div class="accomD2-khs">도심 속 숙소</div>
                    <div class="accomD3-khs">방1개, 침대 2개</div>
                    <div class="accomD4-khs">50000 원 / 박</div>
                </div>
                <div class="accom-khs"><img src="/images/room.png" alt="">
                    <div class="accomD1-khs">
                        <div class="accomD1-1-khs">가산아네스트오피스텔</div>
                        <div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5
                        </div>
                    </div>
                    <div class="accomD2-khs">도심 속 숙소</div>
                    <div class="accomD3-khs">방1개, 침대 2개</div>
                    <div class="accomD4-khs">50000 원 / 박</div>
                </div>
            </div>
            <div id="map" style="width:45%; height:600px; margin: 20px; "></div>
        </div>


    </div>

    <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
        <jsp:param name="pageName" value="footer"/>
    </jsp:include>
</div>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</body>
</html>
