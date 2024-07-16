document.addEventListener('DOMContentLoaded', function () {
    getAccomListByHostId();
});

function getAccomListByHostId() {
    const token = sessionStorage.getItem('token');

    // 여기에 결제 관련 처리도 추가해야함
    fetch('/hosts/', {
        method: 'POST',
        headers: {
            'Authorization': token,
            'Content-Type': 'application/json'
        }
    })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP 오류! 상태: ${response.status}`);
            }
            return response.json(); // 응답을 JSON 형식으로 파싱
        })
        .then(data => {
            const raccomList = data;
            const accommodationList = document.getElementById('accommodation-list');
            accommodationList.innerHTML = ''; // 기존 내용을 지우기

            raccomList.forEach(accommodation => {
                const accommodationDiv = document.createElement('div');
                accommodationDiv.classList.add('hm-khs');

                accommodationDiv.innerHTML = `
                    <div class="hmd1-khs">
                        <div style="margin: 10px; width: 400px;">
                            <img src="/image/${accommodation.imgUrl}" style="padding:10px;width: 100%;
            height: 100%;
            object-fit: cover; /* 이미지가 잘리지 않고 채워지도록 설정 */
            object-position: center; /* 이미지를 가운데 정렬 */" alt="">
                        </div>
                        <div class="hmdd-khs">
                            <div style="font-size: 30px;">
                                ${accommodation.name}
                            </div>
                            <div>
                                ${accommodation.roomCategory}
                            </div>
                            <div>
                                ${accommodation.content}
                            </div>
                            <div>
                                <img style="width: 20px; height: 20px" src="/images/star.png" alt="">&nbsp;${accommodation.rating} (후기 ${accommodation.reviewCount}개)
                            </div>
                        </div>
                    </div>
                    <div class="hmd2-khs">
                        <div style="margin-bottom: 10px;">
                            <a href="" onclick="showReservationDetails(${accommodation.id})">예약 내역</a>
                        </div>
                        <div>
                            <button class="grlb1-khs" onclick="updateAccommodation(${accommodation.id})">숙소 정보 수정</button>
                        </div>
                    </div>
    `;
                accommodationList.appendChild(accommodationDiv);
            });
        })
        .catch(error => {
            console.error('Error submitting reservation:', error);

        });
}

//예약 내역 보는 함수 설정해야함
function showReservationDetails(accommodationId) {

}

//등록 숙소 수정하는 함수 설정해야함
function updateAccommodation(accommodationId) {

}

function accomEnroll() {
    window.location.href = "accomEnroll";
}