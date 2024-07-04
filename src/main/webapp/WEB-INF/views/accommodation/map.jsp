<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Google Map</title>
    <style>
        /* 지도의 크기를 설정합니다 */
        #map {
            height: 500px; /* 높이를 원하는 크기로 조정하세요 */
            width: 85%;
        }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap" async defer></script>
    <script>
        function initMap() {
            var location = {lat: 33.450701, lng: 126.570667}; // 원하는 위치의 위도와 경도
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 14,
                center: location
            });
            var marker = new google.maps.Marker({
                position: location,
                map: map
            });
        }
    </script>
</head>
<body>
<div id="map"></div>
</body>
</html>