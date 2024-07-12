document.addEventListener('DOMContentLoaded', function() {

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
        onChange: function(selectedDates, dateStr, instance) {
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

    maxGuests.addEventListener('click', function() {
        numDropdown.classList.toggle('show');
    });

    minusBtn.addEventListener('click', function() {
        var currentValue = parseInt(maxGuests.value);
        if (currentValue > 1) {
            maxGuests.value = currentValue - 1;
            numValue.textContent = maxGuests.value;
        }
    });

    plusBtn.addEventListener('click', function() {
        var currentValue = parseInt(maxGuests.value);
        maxGuests.value = currentValue + 1;
        numValue.textContent = maxGuests.value;
    });

    document.addEventListener('click', function(event) {
        if (!event.target.matches('#maxGuests') && !event.target.matches('.num-btn')) {
            numDropdown.classList.remove('show');
        }
    });
});