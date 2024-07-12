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


// 토글 드롭다운 메뉴
function toggleDropdown() {
    var dropdownMenu = document.getElementById("myDropdown-khs");
    if (dropdownMenu.style.display === "block") {
        dropdownMenu.style.display = "none";
    } else {
        dropdownMenu.style.display = "block";
    }
}

// 정렬 옵션에 따른 동작 함수들
function sortByLatest() {
    console.log('최신순으로 정렬');
    // 여기에 최신순 정렬 처리 로직 추가
}

function sortByRating() {
    console.log('평점순으로 정렬');
    // 여기에 평점순 정렬 처리 로직 추가
}

function sortByPriceLow() {
    console.log('가격 낮은 순으로 정렬');
    // 여기에 가격 낮은 순 정렬 처리 로직 추가
}

// 클릭 이외의 영역 클릭 시 드롭다운 메뉴 닫기
window.onclick = function(event) {
    if (!event.target.matches('.dropbtn-khs')) {
        var dropdowns = document.getElementsByClassName("dropdown-content-khs");
        for (var i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.style.display === 'block') {
                openDropdown.style.display = 'none';
            }
        }
    }
}


function submitReservation() {
    const checkInDate = document.getElementById('checkInDate').value;
    const checkOutDate = document.getElementById('checkOutDate').value;
    const guests = document.getElementById('guests').value;
    const accommodationId = document.getElementById('accommodationId').value; // 숙소 ID 가져오기

    const data = {
        accommodationId: accommodationId,
        checkInDate: checkInDate,
        checkOutDate: checkOutDate,
        guests: guests
    };

    fetch('/reserve', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(data => {
            window.location.href = `/reserve`;
        })
        .catch(error => {
            console.error('Error submitting reservation:', error);

        });
}

function finishReservation() {

    const message = document.getElementById('message').value;

    // 여기에 결제 관련 처리도 추가해야함
    fetch('/reserveComplete', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(message)
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(data => {
            window.location.href = `/reserveComplete`;
        })
        .catch(error => {
            console.error('Error submitting reservation:', error);

        });
}