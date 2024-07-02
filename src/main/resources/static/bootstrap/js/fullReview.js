function toggleActive(button) {
    // 모든 탭 버튼에서 active 클래스 제거
    const tabButtons = document.querySelectorAll(".tab-button-cyj");
    tabButtons.forEach(function(btn) {
        btn.classList.remove("active-cyj");
    });
    button.classList.add("active-cyj");
    const tabType = button.getAttribute("data-tab-cyj");
    // 최신순인지 오래된순인지 판단
    if (tabType === "recent") {
        console.log("최신순");
    } else if (tabType === "oldest") {
        console.log("오래된순");
    }
}

function gotoPage(pageNum, event) {
    // 페이지 번호에 따라 스크롤 위치 계산 혹은 다른 페이지 리뷰 로드 처리
    const reviewItems = document.querySelectorAll('.review-item-cyj');
    const itemsPerPage = 5; // 페이지당 리뷰 수

    // 페이지 번호에 따라 보여줄 리뷰 아이템의 시작 인덱스 계산
    const startIndex = (pageNum - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;

    // 모든 리뷰 아이템 숨기기
    reviewItems.forEach(function(item) {
        item.style.display = 'none';
    });

    // 해당 페이지의 리뷰 아이템만 보이도록 설정
    for (let i = startIndex; i < endIndex && i < reviewItems.length; i++) {
        reviewItems[i].style.display = 'block';
    }

    // 페이지 버튼 스타일 조정 (예시: 모든 버튼의 active 클래스 제거 후 클릭된 버튼에 active 클래스 추가)
    const pageButtons = document.querySelectorAll('.page-button-cyj');
    pageButtons.forEach(function(button) {
        button.classList.remove('active-cyj');
    });
    event.target.classList.add('active-cyj'); // 클릭된 버튼에 active 클래스 추가
}

