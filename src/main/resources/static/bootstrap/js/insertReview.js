document.addEventListener('DOMContentLoaded', function() {
    const stars = document.querySelector('.stars-cyj');
    const photoUploadButton = document.querySelector('.photo-upload-button-cyj');
    const submitButton = document.querySelector('.submit-button-cyj');
    const reviewTextarea = document.querySelector('.review-textarea-cyj');

    stars.addEventListener('click', function(event) {
        const selectedStars = event.target.textContent.length;
        this.textContent = '★'.repeat(selectedStars) + '☆'.repeat(5 - selectedStars);
        this.classList.add('selected');
    });

    photoUploadButton.addEventListener('click', function() {
        // 사진 업로드 로직 추가
        alert('사진 업로드 기능은 아직 구현되지 않았습니다.');
    });

    submitButton.addEventListener('click', function() {
        if (reviewTextarea.value.length < 20) {
            alert('리뷰는 최소 20자 이상 작성해주세요.');
        } else {
            // 리뷰 제출 로직 추가
            alert('리뷰가 성공적으로 제출되었습니다.');
        }
    });
});
