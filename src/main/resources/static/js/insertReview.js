
const rateWrap = document.querySelectorAll('.rating-cyj'),
    label = document.querySelectorAll('.rating-cyj .rating__label-cyj'),
    input = document.querySelectorAll('.rating-cyj .rating__input-cyj'),
    labelLength = label.length,
    opacityHover = '0.5';

let stars = document.querySelectorAll('.rating-cyj .star-icon-cyj');

checkedRate();

rateWrap.forEach(wrap => {
    wrap.addEventListener('mouseenter', () => {
        stars = wrap.querySelectorAll('.star-icon-cyj');

        stars.forEach((starIcon, idx) => {
            starIcon.addEventListener('mouseenter', () => {
                initStars();
                filledRate(idx, labelLength);

                for (let i = 0; i < stars.length; i++) {
                    if (stars[i].classList.contains('filled')) {
                        stars[i].style.opacity = opacityHover;
                    }
                }
            });

            starIcon.addEventListener('mouseleave', () => {
                starIcon.style.opacity = '1';
                checkedRate();
            });

            wrap.addEventListener('mouseleave', () => {
                starIcon.style.opacity = '1';
            });

            starIcon.addEventListener('click', () => {
                const ratingValue = idx + 1;
                console.log(`별점: ${ratingValue}`);
                input[idx].value = ratingValue;
                input[idx].checked = true;
            });
        });
    });
});

function filledRate(index, length) {
    if (index <= length) {
        for (let i = 0; i <= index; i++) {
            stars[i].classList.add('filled');
        }
    }
}

function checkedRate() {
    let checkedRadio = document.querySelectorAll('.rating-cyj input[type="radio"]:checked');

    initStars();
    checkedRadio.forEach(radio => {
        let previousSiblings = prevAll(radio);

        for (let i = 0; i < previousSiblings.length; i++) {
            previousSiblings[i].querySelector('.star-icon-cyj').classList.add('filled');
        }

        radio.nextElementSibling.classList.add('filled');

        function prevAll() {
            let radioSiblings = [],
                prevSibling = radio.parentElement.previousElementSibling;

            while (prevSibling) {
                radioSiblings.push(prevSibling);
                prevSibling = prevSibling.previousElementSibling;
            }
            return radioSiblings;
        }
    });
}

function initStars() {
    for (let i = 0; i < stars.length; i++) {
        stars[i].classList.remove('filled');
    }
}

function getPathVariables() {
    const path = window.location.pathname;
    const pathSegments = path.split('/');
    const reservationId = pathSegments[pathSegments.length - 2];
    const accomId = pathSegments[pathSegments.length - 1];
    return { accomId, reservationId };
}

const { accomId, reservationId } = getPathVariables();

function submitReview() {
    const token = 'YOUR_TOKEN_HERE'; // 실제 토큰 값으로 대체해야 합니다.

    fetch(`${contextPath}/review/insertReview/${reservationId}/${accomId}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            // 'Authorization': `Bearer ${token}`
        },
        body: JSON.stringify({
            star: parseInt(getSelectedRating()),
            content: document.querySelector('.review-textarea-cyj').value,
            imgUrl: getSelectedImages()
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

function deleteReview() {
    const token = 'YOUR_TOKEN_HERE'; // 실제 토큰 값으로 대체해야 합니다.

    fetch(`${contextPath}/review/deleteReview/${reservationId}/${accomId}`, {
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


function getSelectedRating() {
    const selectedRating = document.querySelector('.rating-cyj input[type="radio"]:checked');
    return selectedRating ? selectedRating.value : null;
}

function getSelectedImages() {
    const imageUrl = document.getElementById('photoUrl').value;
    return imageUrl ? [imageUrl] : [];
}
