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
    });


    // 카테고리 선택 이벤트
    document.querySelectorAll('.cat-khs').forEach(function (categoryElement) {
        categoryElement.addEventListener('click', function () {
            const category = categoryElement.getAttribute('data-category');

            // 현재 선택된 카테고리와 비교
            var isSelected = categoryElement.classList.contains('selected');

            // 모든 카테고리에서 'selected' 클래스 제거
            document.querySelectorAll('.cat-khs').forEach(function (el) {
                el.classList.remove('selected');
            });

            if (!isSelected) {
                // 선택된 카테고리에 'selected' 클래스 추가
                categoryElement.classList.add('selected');
                // 선택된 카테고리로 숙소 리스트 업데이트
                updateAccommodationList(category, getMinPrice(), getMaxPrice());
            } else {
                // 이미 선택된 카테고리를 다시 클릭했을 경우, 카테고리 선택 해제 (선택된 카테고리 없음)
                updateAccommodationList(null, getMinPrice(), getMaxPrice());
            }
        });
    });


    // 초기 로딩 시 숙소 리스트 불러오기
    updateAccommodationList(null, null, null);

});

// 가격 필터 적용 함수
function applyPriceFilter() {
    var minPrice = document.getElementById('minPrice').value;
    var maxPrice = document.getElementById('maxPrice').value;
    var priceRangeDisplay = document.getElementById('priceRangeDisplay');

    // 가격이 입력되었는지 확인
    if (minPrice.trim() === '' || maxPrice.trim() === '') {
        alert('최소 가격과 최대 가격을 모두 입력해주세요.');
        return;
    }

    // 가격 필터 결과를 표시
    priceRangeDisplay.textContent = minPrice + '원 - ' + maxPrice + '원';
    priceRangeDisplay.style.display = 'block';

    // X 버튼을 생성하여 priceRangeDisplay 바로 옆에 추가
    var clearPriceFilterBtn = document.createElement('button');
    clearPriceFilterBtn.setAttribute('type', 'button');
    clearPriceFilterBtn.setAttribute('class', 'xBtn-khs');
    clearPriceFilterBtn.setAttribute('id', 'clearPriceFilterBtn'); // 버튼 id 추가
    clearPriceFilterBtn.textContent = 'X';
    var selectedCategory = getSelectedCategory();
    updateAccommodationList(selectedCategory, minPrice, maxPrice);
    clearPriceFilterBtn.addEventListener('click', function () {
        document.getElementById('minPrice').value = '';
        document.getElementById('maxPrice').value = '';
        priceRangeDisplay.textContent = '';
        priceRangeDisplay.style.display = 'none';
        clearPriceFilterBtn.remove(); // 버튼 삭제
        var selectedCategory = getSelectedCategory(); // 선택된 카테고리 가져오기
        updateAccommodationList(selectedCategory, null, null); // 선택된 카테고리와 가격 필터 초기화
    });

    // 기존의 clearPriceFilterBtn이 있으면 삭제
    var existingClearBtn = document.getElementById('clearPriceFilterBtn');
    if (existingClearBtn) {
        existingClearBtn.parentNode.removeChild(existingClearBtn);
    }

    // priceRangeDisplay 바로 옆에 추가
    priceRangeDisplay.insertAdjacentElement('afterend', clearPriceFilterBtn);
}


// 숙소 리스트 업데이트 요청 함수
function updateAccommodationList(category = null, minPrice = null, maxPrice = null) {
    var checkInDate = document.getElementById('checkInDate').value;
    var checkOutDate = document.getElementById('checkOutDate').value;
    var address = document.getElementById('address').value;
    var maxGuests = document.getElementById('maxGuests').value;

    // 서버로 데이터 전송
    $.ajax({
        url: '/search/accommodations',
        method: 'GET',
        data: {
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            address: address,
            maxGuests: maxGuests,
            minPrice: minPrice,
            maxPrice: maxPrice,
            category: category
        },
        success: function (data) {
            console.log(data);
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
                accommodationDiv.addEventListener('click', function () {
                    // 클릭된 숙소의 번호를 가져와서 숙소 상세 정보 페이지로 이동
                    window.location.href = '/accommodation/detailAccom/' + accommodation.id; // 예시 URL
                });
                accommodationList.appendChild(accommodationDiv);
            });
        },
        error: function (xhr, status, error) {
            console.error('숙소 목록을 불러오는데 실패했습니다.', error);
        }
    });
}

// 최소 가격 가져오는 함수
function getMinPrice() {
    var minPrice = document.getElementById('minPrice').value;
    return minPrice.trim() === '' ? undefined : parseFloat(minPrice);
}

// 최대 가격 가져오는 함수
function getMaxPrice() {
    var maxPrice = document.getElementById('maxPrice').value;
    return maxPrice.trim() === '' ? undefined : parseFloat(maxPrice);
}

// 선택된 카테고리 가져오는 함수
function getSelectedCategory() {
    var selectedCategoryElement = document.querySelector('.cat-khs.selected');
    if (selectedCategoryElement) {
        return selectedCategoryElement.getAttribute('data-category');
    }
    return null; // 선택된 카테고리가 없을 경우 null 반환
}