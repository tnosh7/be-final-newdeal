function toggleActive(button) {
    // 모든 탭 버튼에서 active 클래스 제거
    const tabButtons = document.querySelectorAll(".tab-button-cyj");
    tabButtons.forEach(function (btn) {
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

document.addEventListener('DOMContentLoaded', function() {
    gotoPage(1, { target: document.querySelector('.page-button-cyj') });
});

function gotoPage(pageNum, event) {
    // 페이지 번호에 따라 스크롤 위치 계산 혹은 다른 페이지 리뷰 로드 처리
    const reviewItems = document.querySelectorAll('.review-item-cyj');
    const itemsPerPage = 5; // 페이지당 리뷰 수

    // 페이지 번호에 따라 보여줄 리뷰 아이템의 시작 인덱스 계산
    const startIndex = (pageNum - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;

    // 모든 리뷰 아이템 숨기기
    reviewItems.forEach(function (item) {
        item.style.display = 'none';
    });

    // 해당 페이지의 리뷰 아이템만 보이도록 설정
    for (let i = startIndex; i < endIndex && i < reviewItems.length; i++) {
        reviewItems[i].style.display = 'block';
    }

    // 페이지 버튼 스타일 조정 (예시: 모든 버튼의 active 클래스 제거 후 클릭된 버튼에 active 클래스 추가)
    const pageButtons = document.querySelectorAll('.page-button-cyj');
    pageButtons.forEach(function (button) {
        button.classList.remove('active-cyj');
    });
    event.target.classList.add('active-cyj'); // 클릭된 버튼에 active 클래스 추가
}


// 예약 여부를 나타내는 변수
var isReserved = false; // false로 해놓고 백에서 처리해야되는걸 바로 밑에서 처리해야됨

// 예약 여부를 확인하는 함수 // 테스트 끝나면 주석 풀기
// function checkReservation() {
//     fetch('/api/checkReservation') // 실제 예약 확인 API URL로 변경
//         .then(response => response.json())
//         .then(data => {
//             isReserved = data.isReserved; // 서버로부터 예약 여부를 받아와 설정
//         })
//         .catch(error => {
//             console.error('Error checking reservation:', error);
//         });
// }

// 페이지 로드 시 예약 여부 확인
// window.onload = checkReservation; 테스트 끝나면 주석 풀기
isReserved = true; // 테스트 끝나면 이거 지우고 백에서 받아서 하는데로 하기

// 리뷰 쓰기 버튼 클릭 이벤트 핸들러
document.querySelector('.btn-review-insert-cyj').addEventListener('click', function (event) {
    if (!isReserved) {
        event.preventDefault();
        showReviewModal();
    } else {
        // 예약한 사람은 리뷰 쓰기 페이지로 이동
        window.location.href = './insertReview'; // 실제 리뷰 쓰기 페이지 URL로 변경
    }
});

// 리뷰 수정, 삭제 핸들러
document.addEventListener('DOMContentLoaded', function() {
    // 현재 로그인한 사용자의 ID (예시로 "user1" 사용)
    const currentUserId = 'user1';

    // 모든 리뷰 id를 가져옴
    const reviews = document.querySelectorAll('.review-user-id-cyj');

    reviews.forEach(function(review) {
        // 리뷰의 소유자 ID 가져오기
        const ownerId = review.getAttribute('data-owner');

        // 현재 사용자와 리뷰 소유자가 다르면 수정/삭제 버튼 숨기기
        if (ownerId !== currentUserId) {
            const editDeleteButtonBox = review.querySelector('.btn-review-edit-delete-box-cyj');
            if (editDeleteButtonBox) {
                editDeleteButtonBox.style.display = 'none';
            }
        } else {
            // 현재 사용자와 리뷰 소유자가 같으면 버튼 클릭 시 페이지 이동
            const editDeleteButton = review.querySelector('.btn-review-edit-delete-cyj');
            if (editDeleteButton) {
                editDeleteButton.addEventListener('click', function(event) {
                    event.preventDefault();
                    // 페이지 이동 (수정/삭제 페이지로 이동하는 URL 지정)
                    window.location.href = './insertReview'; // 기존 작성한거 나타나게 해야 됨
                });
            }
        }
    });
});


// 리뷰모달 열기 함수
function showReviewModal() {
    document.getElementById('review-reservation-modal-cyj').style.display = "block";
}

// 리뷰모달 닫기 함수
function closeReviewModal() {
    document.getElementById('review-reservation-modal-cyj').style.display = "none";
}

// 리뷰모달을 클릭하여 닫기
window.onclick = function (event) {
    var modal = document.getElementById('review-reservation-modal-cyj');
    if (event.target == modal) {
        modal.style.display = "none";
    }
}


function openReplyModal() {
    document.getElementById("replyModal-cyj").style.display = "block";
}

function closeReplyModal() {
    document.getElementById("replyModal-cyj").style.display = "none";
}

document.addEventListener("DOMContentLoaded", function() {
    // 페이지 로드 시 모든 답글 요소를 확인
    var replyContentElements = document.getElementsByClassName("replyContent-cyj");
    Array.prototype.forEach.call(replyContentElements, function(element) {
        if (element.innerText.trim() !== "") {
            element.parentElement.style.display = "block";
        } else {
            element.parentElement.style.display = "none";
        }
    });
});

function submitReply() {
    var replyText = document.getElementById("replyText-cyj").value;
    if (replyText.trim() !== "") {
        document.getElementById("replyContent-cyj").innerText = replyText;
    }
    closeReplyModal();
}

// 문서의 어디든 클릭하면 모달을 닫기
window.onclick = function (event) {
    const modal = document.getElementBy
}



