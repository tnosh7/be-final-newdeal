function toggleActive(button) {
    // 모든 탭 버튼에서 active 클래스 제거
    const tabButtons = document.querySelectorAll(".tab-button-cyj");
    tabButtons.forEach(function (btn) {
        btn.classList.remove("active-cyj");
    });

    // 클릭한 버튼에 active 클래스 추가
    button.classList.add("active-cyj");

    // 현재 선택된 탭의 데이터 탭 속성 값 가져오기
    const selectedTab = button.getAttribute("data-tab");

    // 모든 리뷰 항목 숨기기
    const reviewItems = document.querySelectorAll(".review-item-cyj");
    reviewItems.forEach(function (item) {
        item.style.display = "none";
    });

    // 선택된 탭에 해당하는 리뷰 항목만 보이기
    reviewItems.forEach(function (item) {
        if (item.classList.contains(selectedTab)) {
            item.style.display = "block";
        }
    });
}


function showReviewModal() {
    const modal = document.getElementById("review-reservation-modal-cyj");
    modal.style.display = "block";
}

function closeModal() {
    const modal = document.getElementById("review-reservation-modal-cyj");
    modal.style.display = "none";
}

function openReplyModal(reviewId) {
    const modal = document.getElementById("replyModal-cyj");
    modal.style.display = "block";

    // 답글 작성 모달에서 reviewId 사용 예시
    document.getElementById("replyText-cyj").setAttribute("data-review-id", reviewId);
}

function closeReplyModal() {
    const modal = document.getElementById("replyModal-cyj");
    modal.style.display = "none";
}

const accomId = 1; // 실제 숙소 ID로 대체해야 합니다.
const reservationId = 1; // 실제 예약 ID로 대체해야 합니다.
const isReserved = true; // 여기에 예약 여부를 확인하는 로직을 추가해야 합니다.

document.querySelector('.btn-review-insert-cyj').addEventListener('click', function (event) {

    const token = 'YOUR_TOKEN_HERE'; // 실제 토큰 값으로 대체해야 합니다.



    if (!isReserved) {
        event.preventDefault();
        showReviewModal();
    } else {
        // 예약한 사람은 리뷰 쓰기 페이지로 이동
        fetch(`${contextPath}/review/insertReview/${reservationId}/${accomId}`, {
            method: 'GET',
            headers: {
                // 'Authorization': `Bearer ${token}`
            }
        })
            .then(response => {
                if (response.ok) {
                    window.location.href = response.url;
                } else {
                    // 오류 처리
                    console.error('리뷰 작성 페이지로 이동 실패');
                }
            })
            .catch(error => {
                console.error('리뷰 작성 페이지로 이동 중 오류 발생:', error);
            });
    }
});


document.querySelector('.btn-review-edit-delete-cyj').addEventListener('click', function (event) {

    const token = 'YOUR_TOKEN_HERE'; // 실제 토큰 값으로 대체해야 합니다.

    if (!isReserved) {
        event.preventDefault();
        showReviewModal();
    } else {
        // 예약한 사람은 리뷰 수정/삭제 페이지로 이동
        fetch(`${contextPath}/review/insertReview/${reservationId}/${accomId}`, {
            method: 'GET',
            headers: {
                // 'Authorization': `Bearer ${token}`
            }
        })
            .then(response => {
                if (response.ok) {
                    window.location.href = response.url;
                } else {
                    // 오류 처리
                    console.error('리뷰 작성 페이지로 이동 실패');
                }
            })
            .catch(error => {
                console.error('리뷰 작성 페이지로 이동 중 오류 발생:', error);
            });
    }
});

function submitReply() {

    const token = 'YOUR_TOKEN_HERE'; // 실제 토큰 값으로 대체해야 합니다.
    // const reviewId = 1; // 실제 리뷰 ID로 대체해야 합니다.
    const reviewId = document.getElementById("replyText-cyj").getAttribute("data-review-id");
     // 실제 숙소 ID로 대체해야 합니다.

    if (!isReserved) {
        event.preventDefault();
        showReviewModal();
    } else {
        fetch(`${contextPath}/review/insertReply/${reviewId}/${accomId}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                // 'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify({
                content: document.querySelector('.textarea-re-cyj').value,
            })
        }).then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        }).then(data => {
            window.location.href = `${contextPath}/review/fullReview/${accomId}`;
        }).catch(error => {
            console.error('Error:', error);
        });


    }
}



