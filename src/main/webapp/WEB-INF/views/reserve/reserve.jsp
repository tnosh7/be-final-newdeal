<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <!-- 페이지에 변경할 때마다 타이틀, 바디 부분 변경해주세요 -->
    <title>예약하기</title>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"/>
</head>
<body>
<div class="wrapper">
    <!--레이아웃 설정 footer, header-->
    <!--header.jsp-->
    <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
        <jsp:param name="pageName" value="header"/>
    </jsp:include>

    <div class="main-content">
        <div style="display: flex;
            align-items: center;
            height: 30px; /* 높이를 설정해야 가운데 정렬이 가능 */
            "><span class="material-symbols-outlined">
arrow_back_ios
</span>&nbsp;&nbsp; 예약요청
        </div>
        <div style="margin: 20px; display: flex;">
            <div style="width: 50%; margin: 20px;">
                <div class="reservebox-khs">
                    <div>예약 정보</div>
                    <div class="reservebox1-khs">날짜</div>
                    <div>${reserveDto.checkInDate} ~ ${reserveDto.checkOutDate}</div>
                    <div class="reservebox1-khs">게스트 인원</div>
                    <div>${reserveDto.guests}명</div>
                </div>
                <div class="reservebox-khs">
                    <div>호스트에게 메시지 보내기</div>
                    <div style="margin-top: 5px;">여행목적, 동반 일행 등을 알려주세요.</div>
                    <input type="text" id="message" name="message"/>
                </div>
                <div class="reservebox-khs">
                    <div>기본 규칙</div>
                    <div style="margin-top: 5px;">훌륭한 게스트가 되기 위한 몇 가지 간단한 규칙을 지켜주실 것을 모든 게스트에게 당부드리고 있습니다.</div>
                    <div>- 숙소 이용규칙을 준수하세요.</div>
                    <div>- 호스트의 집도 자신의 집처럼 아껴주세요.</div>
                </div>
                <div class="paybtn">
                    <button onclick="finishReservation()">결제하기</button>
                </div>
            </div>
            <div style="width:400px; height:50%; padding:20px; margin: 20px; border: 1px solid gray; border-radius: 10px">
                    <div style="display: flex; padding-bottom:20px; border-bottom: 1px solid gray">
                        <div>
                            <img style="width: 200px;" src="/images/room.png" alt="">
                        </div>
                        <div style="align-content: center; margin: 20px;">
                            <div style="font-size: 30px;">
                                가산 아네스트
                            </div>
                            <div>
                                오피스텔 원룸
                            </div>
                            <div>
                                <img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5 (후기 12개)
                            </div>
                        </div>
                    </div>
                    <div style="margin-top:15px; padding-bottom:15px; border-bottom: 1px solid gray;">
                        <div>
                            요금 세부정보
                        </div>
                        <div style="display: flex; margin-top: 10px; justify-content: space-between;">
                            <div>
                                50,000 원 X 2박
                            </div>
                            <div>
                                100,000 원
                            </div>
                        </div>
                        <div style="display: flex; justify-content: space-between;">
                            <div>
                                청소비
                            </div>
                            <div>
                                20,000 원
                            </div>
                        </div>
                        <div style="display: flex; justify-content: space-between;">
                            <div>
                                서비스 수수료
                            </div>
                            <div>
                                18,000 원
                            </div>
                        </div>
                    </div>
                    <div style="margin-top: 15px;">
                        <div style="display: flex; justify-content: space-between;">
                            <div>
                                총 합계
                            </div>
                            <div>
                                138,000 원
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>

    <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
        <jsp:param name="pageName" value="footer"/>
    </jsp:include>
</div>
</body>
</html>
