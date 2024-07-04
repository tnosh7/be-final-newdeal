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
        <div style="font-size: 30px;">예약 내역</div>
        <div class="grl-khs">
            <div class="grld1-khs">아직 예약된 여행이 없습니다!</div>
            <div class="grld2-khs">여행 가방에 쌓인 먼지를 털어내고 다음 여행 계획을 세워보세요.</div>
            <button class="grlb1-khs">숙소 검색하기</button>
        </div>
        <div>
            <table class="grt-khs">
                <thead>
                    <tr>
                        <th>숙소 이름</th>
                        <th>숙소 사진</th>
                        <th>숙소 주소</th>
                        <th>예약 날짜</th>
                        <th>인원</th>
                        <th>결제 금액</th>
                        <th>예약 취소</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>가산 아네스트</td>
                        <td><img style="width: 200px;" src="/images/room.png" alt=""></td>
                        <td>서울 금천구 남부순환로 1314</td>
                        <td>2024.07.03 ~ 2024.07.05</td>
                        <td>2</td>
                        <td>138,000 원</td>
                        <td><button class="grlb1-khs">결제취소</button></td>
                    </tr>
                    <tr>
                        <td>가산 아네스트</td>
                        <td><img style="width: 200px;" src="/images/room.png" alt=""></td>
                        <td>서울 금천구 남부순환로 1314</td>
                        <td>2024.07.03 ~ 2024.07.05</td>
                        <td>2</td>
                        <td>138,000 원</td>
                        <td><button class="grlb1-khs">결제취소</button></td>
                    </tr>
                    <tr>
                        <td>가산 아네스트</td>
                        <td><img style="width: 200px;" src="/images/room.png" alt=""></td>
                        <td>서울 금천구 남부순환로 1314</td>
                        <td>2024.07.03 ~ 2024.07.05</td>
                        <td>2</td>
                        <td>138,000 원</td>
                        <td><button class="grlb1-khs">결제취소</button></td>
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
