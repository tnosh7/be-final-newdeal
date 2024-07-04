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
            <div class="hm-khs">
                <div class="hmd1-khs">
                    <div style="margin: 10px;">
                        <img style="width: 200px;" src="/images/room.png" alt="">
                    </div>
                    <div class="hmdd-khs">
                        <div style="font-size: 30px;">
                            가산 아네스트
                        </div>
                        <div>
                            오피스텔 원룸
                        </div>
                        <div>
                            숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소
                            상세정보~숙소 상세정보~
                        </div>
                        <div>
                            <img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5 (후기 12개)
                        </div>
                    </div>
                </div>
                <div class="hmd2-khs">
                    <div style="margin-bottom: 10px;">
                        <a href="#">예약 내역</a>
                    </div>
                    <div>
                        <button class="grlb1-khs">숙소 정보 수정</button>
                    </div>
                </div>
            </div>
            <div class="hm-khs">
                <div class="hmd1-khs">
                    <div style="margin: 10px;">
                        <img style="width: 200px;" src="/images/room.png" alt="">
                    </div>
                    <div class="hmdd-khs">
                        <div style="font-size: 30px;">
                            가산 아네스트
                        </div>
                        <div>
                            오피스텔 원룸
                        </div>
                        <div>
                            숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소 상세정보~숙소
                            상세정보~숙소 상세정보~
                        </div>
                        <div>
                            <img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;4.5 (후기 12개)
                        </div>
                    </div>
                </div>
                <div class="hmd2-khs">
                    <div style="margin-bottom: 10px;">
                        <a href="#">예약 내역</a>
                    </div>
                    <div>
                        <button class="grlb1-khs">숙소 정보 수정</button>
                    </div>
                </div>
            </div>

            <div style="margin: 20px 0 20px 0; text-align: left;">
                <button class="grlb1-khs">숙소 추가</button>
            </div>
        </div>
    </div>

    <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
        <jsp:param name="pageName" value="footer"/>
    </jsp:include>
</div>
</body>
</html>
