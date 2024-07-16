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

function submitReservation() {
    const checkInDate = document.getElementById('checkInDate').value;
    const checkOutDate = document.getElementById('checkOutDate').value;
    const guests = document.getElementById('guests').value;
    const accommodationId = document.getElementById('accommodationId').value; // 숙소 ID 가져오기
    const token = sessionStorage.getItem('token');

    const data = {
        accommodationId: accommodationId,
        checkInDate: checkInDate,
        checkOutDate: checkOutDate,
        guests: guests
    };

    fetch('/reserve', {
        method: 'POST',
        headers: {
            'Authorization': token,
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
    const token = sessionStorage.getItem('token');

    // 여기에 결제 관련 처리도 추가해야함
    fetch('/reserveComplete', {
        method: 'POST',
        headers: {
            'Authorization': token,
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
