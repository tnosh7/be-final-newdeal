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

const photoUpload = document.getElementById('photoUpload');
const selectedFileName = document.getElementById('selectedFileName');

photoUpload.addEventListener('change', function() {
    const file = this.files[0];

    if (file) {
        selectedFileName.textContent = `선택된 파일: ${file.name}`;
        // 여기서 파일을 서버에 업로드하거나 다른 작업을 수행할 수 있습니다.
    } else {
        selectedFileName.textContent = '사진을 첨부해주세요. (최대 1장)';
    }
});

