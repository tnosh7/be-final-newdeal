// 페이지가 완전히 로드되면 실행되는 함수
document.addEventListener("DOMContentLoaded", function() {
    const notificationsContainer = document.getElementById('notifications-cyj'); // 알림 목록을 표시할 컨테이너 요소를 가져옴
    const paginationContainer = document.getElementById('pagination-cyj'); // 페이지네이션을 표시할 컨테이너 요소를 가져옴

    let currentPage = 1; // 현재 페이지를 초기화
    const notificationsPerPage = 10; // 페이지당 보여줄 알림 수를 설정

    // 특정 페이지의 알림을 가져와서 표시하는 함수
    function fetchNotifications(page) {
        const totalNotifications = 53; // 예시로 설정한 전체 알림 수
        const notifications = [];

        // 모의 데이터 생성
        for (let i = 1; i <= totalNotifications; i++) {
            notifications.push({
                title: `Notification ${i}`, // 알림 제목
                body: `This is the body of notification ${i}.`, // 알림 내용
                date: `2023-07-0${i % 10}` // 알림 날짜 (예시 데이터)
            });
        }

        // 해당 페이지의 알림 목록을 가져와서 표시
        displayNotifications(notifications.slice((page - 1) * notificationsPerPage, page * notificationsPerPage));

        // 페이지네이션 설정
        setupPagination(totalNotifications, notificationsPerPage, page);
    }

    // 알림 목록을 HTML에 표시하는 함수
    function displayNotifications(notifications) {
        notificationsContainer.innerHTML = ''; // 기존 알림 목록을 비움
        notifications.forEach(notification => {
            const notificationElement = document.createElement('div'); // 새로운 알림 요소 생성
            notificationElement.className = 'notification-item-cyj'; // 클래스 설정
            notificationElement.innerHTML = `
                <div class="notification-header-cyj">
                    <span class="notification-title-cyj">${notification.title}</span> // 알림 제목
                    <span class="notification-date-cyj">${notification.date}</span> // 알림 날짜
                </div>
                <div class="notification-body-cyj">${notification.body}</div> // 알림 내용
                <div class="notification-actions-cyj">
                    <button class="submit-button-submit-cyj">확인</button> // 확인 버튼
                    <button class="submit-button-delete-cyj">삭제</button> // 삭제 버튼
                </div>
            `;
            notificationsContainer.appendChild(notificationElement); // 알림 컨테이너에 추가
        });
    }

    // 페이지네이션을 설정하는 함수
    function setupPagination(totalNotifications, notificationsPerPage, currentPage) {
        const totalPages = Math.ceil(totalNotifications / notificationsPerPage); // 전체 페이지 수 계산
        paginationContainer.innerHTML = ''; // 기존 페이지네이션을 비움

        // 각 페이지 링크 생성 및 설정
        for (let page = 1; page <= totalPages; page++) {
            const pageElement = document.createElement('a'); // 새로운 링크 요소 생성
            pageElement.href = "#"; // 링크의 기본 동작을 제거
            pageElement.innerText = page; // 페이지 번호 설정

            // 현재 페이지인 경우 스타일 변경
            if (page === currentPage) {
                pageElement.style.fontWeight = 'bold'; // 글꼴 굵기 설정
                pageElement.style.textDecoration = 'underline'; // 밑줄 설정
            }

            // 페이지 링크를 클릭할 때 해당 페이지의 알림을 가져오는 이벤트 리스너 설정
            pageElement.addEventListener('click', function(event) {
                event.preventDefault(); // 기본 동작 제거
                fetchNotifications(page); // 해당 페이지의 알림 가져오기
            });

            paginationContainer.appendChild(pageElement); // 페이지네이션 컨테이너에 링크 추가
        }
    }

    fetchNotifications(currentPage); // 페이지 로드 시 첫 번째 페이지의 알림 가져오기
});

// 모든 알림 항목을 선택
const notificationItems = document.querySelectorAll('.notification-item-cyj');

// 각 알림 항목에 대해 클릭 이벤트 리스너 추가
notificationItems.forEach(item => {
    // 알림 헤더나 본문을 클릭하면 리뷰 페이지로 이동하는 이벤트 리스너 추가
    item.querySelector('.notification-header-cyj').addEventListener('click', function (event) {
        window.location.href = '../review/fullReview';
    });
    item.querySelector('.notification-body-cyj').addEventListener('click', function (event) {
        window.location.href = '../review/fullReview';
    });
});

// 페이지 번호에 따라 해당 페이지의 알림을 보여주는 함수
function gotoNotiPage(pageNum, event) {
    const notiItems = document.querySelectorAll('.notification-item-cyj'); // 모든 알림 항목을 선택
    const notiItemsPerPage = 5; // 페이지당 보여줄 알림 수 설정

    // 보여줄 알림 항목의 시작 인덱스와 끝 인덱스 계산
    const startIndex = (pageNum - 1) * notiItemsPerPage;
    const endIndex = startIndex + notiItemsPerPage;

    // 모든 알림 항목을 숨기기
    notiItems.forEach(function (item) {
        item.style.display = 'none'; // 알림 항목 숨기기
    });

    // 해당 페이지의 알림 항목만 보이도록 설정
    for (let i = startIndex; i < endIndex && i < notiItems.length; i++) {
        notiItems[i].style.display = 'block'; // 해당 페이지의 알림 항목 보이기
    }

    // 페이지 버튼의 스타일 조정 (예시: 모든 버튼의 active 클래스 제거 후 클릭된 버튼에 active 클래스 추가)
    const pageButtons = document.querySelectorAll('.fullNotify-page-button-cyj');
    pageButtons.forEach(function (button) {
        button.classList.remove('active-cyj'); // 모든 버튼의 active 클래스 제거
    });
    event.target.classList.add('active-cyj'); // 클릭된 버튼에 active 클래스 추가
}

// 페이지 로드 시 첫 번째 페이지를 기본으로 설정하여 알림을 보여주는 함수 호출
window.onload = function () {
    gotoNotiPage(1, { target: document.querySelector('.fullNotify-page-button-cyj') });
};
