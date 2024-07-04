// script.js
document.addEventListener("DOMContentLoaded", function() {
    var dropdown = document.querySelector(".dropdown");
    var dropdownContent = document.querySelector(".dropdown-content");

    dropdown.addEventListener("click", function() {
        dropdown.classList.toggle("active");
    });

    // Close the dropdown if the user clicks outside of it
    document.addEventListener("click", function(event) {
        if (!dropdown.contains(event.target)) {
            dropdown.classList.remove("active");
        }
    });
});


document.addEventListener("DOMContentLoaded", function() {
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커를 표시할 위치와 title 객체 배열입니다
    var positions = [
        {
            title: '카카오',
            latlng: new kakao.maps.LatLng(33.450705, 126.570677)
        },
        {
            title: '생태연못',
            latlng: new kakao.maps.LatLng(33.450936, 126.569477)
        },
        {
            title: '텃밭',
            latlng: new kakao.maps.LatLng(33.450879, 126.569940)
        },
        {
            title: '근린공원',
            latlng: new kakao.maps.LatLng(33.451393, 126.570738)
        }
    ];

    // 마커 이미지의 이미지 주소입니다
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

    for (var i = 0; i < positions.length; i ++) {

        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(24, 35);

        // 마커 이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : markerImage // 마커 이미지
        });
    }
});

$(document).ready(function() {
    // 알림 아이콘 클릭 시 드롭다운 표시/숨김
    $('.modal-notification-icon-cyj').on('click', function() {
        $('.modal-notification-dropdown-cyj').toggle();
    });

    // 다른 곳 클릭 시 드롭다운 숨김
    $(document).on('click', function(event) {
        if (!$(event.target).closest('.modal-notification-cyj').length) {
            $('.modal-notification-dropdown-cyj').hide();
        }
    });
});


document.addEventListener('DOMContentLoaded', function() {
    // 모든 알림 항목을 선택
    const modalNotificationItems = document.querySelectorAll('.modal-notification-item-cyj');

    // 각 알림 항목에 대해 클릭 이벤트 리스너 추가
    modalNotificationItems.forEach(item => {
        item.addEventListener('click', function(event) {
            const id = item.getAttribute('data-id');
            const type = item.getAttribute('data-type');
            console.log(`Item ID: ${id}, Type: ${type}`); // 데이터 로그 출력

            // 조건에 따라 다른 URL로 이동
            if (type === 'checkout') {
                window.location.href = '../review/fullReview?checkout';
            } else if (type === 'completed') {
                window.location.href = '../review/fullReview?completed';
            } else {
                window.location.href = '../review/fullReview';
            }
        });
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const viewAllLink = document.querySelector('.view-all-cyj');

    if (viewAllLink) {
        viewAllLink.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작 방지
            window.location.href = '../review/fullReview'; // 원하는 URL로 이동
        });
    }
});



