document.addEventListener('DOMContentLoaded', function () {

    // 오늘 날짜를 가져오는 함수
    function getTodayDate() {
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
        var yyyy = today.getFullYear();

        return yyyy + '-' + mm + '-' + dd;
    }

    // 내일 날짜를 계산하는 함수
    function getTomorrowDate() {
        var tomorrow = new Date();
        tomorrow.setDate(tomorrow.getDate() + 1);

        var dd = String(tomorrow.getDate()).padStart(2, '0');
        var mm = String(tomorrow.getMonth() + 1).padStart(2, '0'); // January is 0!
        var yyyy = tomorrow.getFullYear();

        return yyyy + '-' + mm + '-' + dd;
    }

    // Flatpickr 설정
    var startDatePicker = flatpickr("#checkInDate", {
        dateFormat: "Y-m-d",
        minDate: "today", // 오늘 날짜부터 선택 가능
        defaultDate: document.getElementById('checkInDate').value ? document.getElementById('checkInDate').value : getTodayDate(), // value 값이 있으면 그 값을 사용, 없으면 오늘 날짜로 초기값 설정
        onChange: function (selectedDates, dateStr, instance) {
            var minCheckoutDate = new Date(selectedDates[0]);
            minCheckoutDate.setDate(minCheckoutDate.getDate() + 1); // 체크인 날짜 이후 날짜로 설정
            endDatePicker.set('minDate', minCheckoutDate);
        }
    });

    var endDatePicker = flatpickr("#checkOutDate", {
        dateFormat: "Y-m-d",
        minDate: document.getElementById('checkOutDate').value ? document.getElementById('checkOutDate').value : getTomorrowDate(), // value 값이 있으면 그 값을 사용, 없으면 내일 날짜로 초기값 설정
        defaultDate: document.getElementById('checkOutDate').value ? document.getElementById('checkOutDate').value : getTomorrowDate(), // value 값이 있으면 그 값을 사용, 없으면 내일 날짜로 초기값 설정
    });

    // 인원 선택 영역
    var maxGuests = document.getElementById('maxGuests');
    var numDropdown = document.getElementById('numDropdown');
    var minusBtn = document.querySelector('.minus-btn');
    var plusBtn = document.querySelector('.plus-btn');
    var numValue = document.querySelector('.num-value');

    maxGuests.addEventListener('click', function () {
        numDropdown.classList.toggle('show');
    });

    minusBtn.addEventListener('click', function () {
        var currentValue = parseInt(maxGuests.value);
        if (currentValue > 1) {
            maxGuests.value = currentValue - 1;
            numValue.textContent = maxGuests.value;
        }
    });

    plusBtn.addEventListener('click', function () {
        var currentValue = parseInt(maxGuests.value);
        maxGuests.value = currentValue + 1;
        numValue.textContent = maxGuests.value;
    });

    document.addEventListener('click', function (event) {
        if (!event.target.matches('#maxGuests') && !event.target.matches('.num-btn')) {
            numDropdown.classList.remove('show');
        }
        if (!event.target.matches('.dropbtn-khs')) {
            document.getElementById("myDropdown-khs").classList.remove("show");
        }
    });

    // 초기 로딩 시 숙소 리스트 불러오기
    loadAccommodations();

    // 카테고리 선택 이벤트
    document.querySelectorAll('.cat-khs').forEach(function (categoryElement) {
        categoryElement.addEventListener('click', function () {
            const category = categoryElement.getAttribute('data-category');
            if (categoryElement.classList.contains('selected')) {
                categoryElement.classList.remove('selected');
                loadAccommodations(null, getSelectedSortCriteria());
            } else {
                document.querySelectorAll('.cat-khs').forEach(function (el) {
                    el.classList.remove('selected');
                });
                categoryElement.classList.add('selected');
                loadAccommodations(category, getSelectedSortCriteria());
            }
        });
    });

    // 정렬 기준 선택 이벤트
    document.querySelectorAll('.dropdown-content-khs a').forEach(function (sortElement) {
        sortElement.addEventListener('click', function () {
            const sortCriteria = sortElement.getAttribute('data-sort');
            document.querySelector('.dropbtn-khs').textContent = sortElement.textContent; // 버튼 텍스트 변경
            const selectedCategory = document.querySelector('.cat-khs.selected') ? document.querySelector('.cat-khs.selected').getAttribute('data-category') : null;
            loadAccommodations(selectedCategory, sortCriteria);
            document.getElementById("myDropdown-khs").classList.remove("show"); // 정렬 기준 선택 후 드롭다운 닫기
        });
    });
});

function loadAccommodations(category = null, sortCriteria = '최신순') {
    // AJAX 요청
    $.ajax({
        url: '/accommodations',
        method: 'GET',
        data: {
            category: category,
            sort: sortCriteria
        },
        success: function (data) {
            const accommodationList = document.getElementById('accommodation-list');
            accommodationList.innerHTML = ''; // 기존 내용을 지우기

            data.forEach(accommodation => {
                const accommodationDiv = document.createElement('div');
                accommodationDiv.classList.add('accom-khs');

                accommodationDiv.innerHTML = `
        <img src="/images/room.png" alt="">
        <div class="accomD1-khs">
            <div class="accomD1-1-khs">${accommodation.name}</div>
            <div class="accomD1-2-khs"><img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;${accommodation.rating}</div>
        </div>
        <div class="accomD2-khs">${accommodation.content}</div>
        <div class="accomD3-khs">${accommodation.roomCategory}</div>
        <div class="accomD4-khs">${accommodation.price} 원 / 박</div>
    `;

                accommodationList.appendChild(accommodationDiv);
            });
        },
        error: function (xhr, status, error) {
            console.error('숙소 목록을 불러오는데 실패했습니다.', error);
        }
    });
}

function toggleDropdown() {
    document.getElementById("myDropdown-khs").classList.toggle("show");
}

function getSelectedSortCriteria() {
    return document.querySelector('.dropbtn-khs').textContent.trim(); // trim()을 사용하여 앞뒤 공백을 제거한 텍스트 반환
}
