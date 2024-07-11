<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <title>지도 생성하기</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<!-- 지도를 표시할 div 입니다 -->--%>
<%--<div id="map" style="width:60%;height:350px;"></div>--%>

<%--<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d68d2716d9ae13cb2658532ac57d097a"></script>--%>
<%--<script>--%>
<%--    var mapContainer = document.getElementById('map'), // 지도를 표시할 div--%>
<%--        mapOption = {--%>
<%--            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표--%>
<%--            level: 3 // 지도의 확대 레벨--%>
<%--        };--%>

<%--    // 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다--%>
<%--    var map = new kakao.maps.Map(mapContainer, mapOption);--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
</head>
<body>
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:60%;height:350px;"></div>

<%
    // 숙소 엔티티에서 위도와 경도 값을 가져오는 부분
    // 예를 들어, 숙소 엔티티가 accommodation이라는 객체로 전달되었다고 가정합니다.
    // 실제로는 세션, 요청 객체 등을 통해 전달받을 수 있습니다.
    double latitude = 33.450701; // 예시 값, 실제로는 accommodation.getLatitude()를 사용
    double longitude = 126.570667; // 예시 값, 실제로는 accommodation.getLongitude()를 사용
%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d68d2716d9ae13cb2658532ac57d097a"></script>
<script>
    // JSP에서 JavaScript로 변수 전달
    var latitude = <%= latitude %>;
    var longitude = <%= longitude %>;

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);
</script>
</body>
</html>
