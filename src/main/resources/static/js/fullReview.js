
function toggleActive(button) {
    const tabButtons = document.querySelectorAll(".tab-button-cyj");
    tabButtons.forEach(function (btn) {
        btn.classList.remove("active-cyj");
    });

    button.classList.add("active-cyj");

    const selectedTab = button.getAttribute("data-tab");

    const reviewItems = document.querySelectorAll(".review-item-cyj");
    reviewItems.forEach(function (item) {
        item.style.display = "none";
    });

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

// function openReplyModal(reviewId) {
//     const modal = document.getElementById("replyModal-cyj");
//     modal.style.display = "block";
//
//     document.getElementById("replyText-cyj").setAttribute("data-review-id", reviewId);
// }
let replyId;
function openReplyModal(passReplyId, reviewId, replyContent) {
    const modal = document.getElementById("replyModal-cyj");
    modal.style.display = "block";

    const replyTextArea = document.getElementById("replyText-cyj");
    replyTextArea.setAttribute("data-review-id", reviewId);
    replyTextArea.setAttribute("data-reply-id", passReplyId);
    replyId = passReplyId;
    // 전달된 replyContent를 텍스트 영역에 설정
    replyTextArea.value = replyContent;
}

function closeReplyModal() {
    const modal = document.getElementById("replyModal-cyj");
    modal.style.display = "none";
}

const accomId = 1; // 실제 숙소 ID로 대체해야 합니다.
const reservationId = 1; // 실제 예약 ID로 대체해야 합니다.
const isReserved = true; // 여기에 예약 여부를 확인하는 로직을 추가해야 합니다.

function handleReviewAction(event, url) {
    const token = 'YOUR_TOKEN_HERE'; // 실제 토큰 값으로 대체해야 합니다.

    if (!isReserved) {
        event.preventDefault();
        showReviewModal();
    } else {
        fetch(url, {
            method: 'GET',
            headers: {
                // 'Authorization': `Bearer ${token}`
            }
        })
            .then(response => {
                if (response.ok) {
                    window.location.href = response.url;
                } else {
                    console.error('페이지로 이동 실패');
                }
            })
            .catch(error => {
                console.error('페이지로 이동 중 오류 발생:', error);
            });
    }
}

// document.querySelector('.btn-review-insert-cyj').addEventListener('click', function (event) {
//     handleReviewAction(event, `${contextPath}/review/insertReview/${reservationId}/${accomId}`);
// });
//
// document.querySelector('.btn-review-edit-delete-cyj').addEventListener('click', function (event) {
//     handleReviewAction(event, `${contextPath}/review/insertReview/${reservationId}/${accomId}`);
// });

function submitReply() {
    const token = 'YOUR_TOKEN_HERE'; // 실제 토큰 값으로 대체해야 합니다.
    const reviewId = document.getElementById("replyText-cyj").getAttribute("data-review-id");

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

function deleteReply() {
    const token = 'YOUR_TOKEN_HERE'; // 실제 토큰 값으로 대체해야 합니다.

    fetch(`${contextPath}/review/deleteReply/${replyId}/${accomId}`, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json',
            // 'Authorization': `Bearer ${token}`
        },
        body: JSON.stringify({
            // 필요한 경우 body에 추가 데이터를 넣을 수 있습니다.
            // 하지만 DELETE 요청의 경우 보통 URL에 필요한 정보가 포함됩니다.
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
