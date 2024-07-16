<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <!-- 페이지에 변경할 때마다 타이틀, 바디 부분 변경해주세요 -->
    <title>StayNest</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <style>
        .form-info-ysh {
            width: 70%;
            margin: 0 auto;
            margin-bottom: 30px;
            max-width: 400px;
        }

        .form-info-ysh input[type="text"],
        input[type="number"],
        input[type="time"],
        textarea,
        button,
        select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        .registerBtn {
            background-color: #0D31B2;
            color: white;
            border: white;
            height: 80px;
            border-radius: 10px;
        }

        .form-group-ysh {
            margin-bottom: 15px;
        }

        .form-group-ysh label {
            color: #4F9F8A;
            display: block;
            margin-bottom: 5px;
        }

        .section-title-ysh {
            color: #005241;
        }

        .delete-button {
            width: 20px;
            height: 20px;
            background-color: transparent;
            color: black;
            border: 2px solid black;
            border-radius: 50%; /* 원형 모양 */
            cursor: pointer;
            position: absolute;
            top: 0;
            right: 0; /* 이미지 오른쪽에 정렬 */
            padding: 0;
            margin: 0;
            font-weight: bolder;
        }

        .pic-container {
            margin-top: 15px;
            display: flex;
        }

        .image-container {
            position: relative; /* 내부 요소의 절대 위치를 지정하기 위해 상대 위치 설정 */
            align-items: center;
            display: flex;
            margin-right: 10px;
            width: 80px;
            height: 60px;
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* 이미지가 잘리지 않고 채워지도록 설정 */
            object-position: center; /* 이미지를 가운데 정렬 */
            position: relative; /* 상대 위치 설정 */
        }

        .image-container .delete-button {
            z-index: 1; /* X 버튼이 이미지 위에 표시되도록 설정 */
        }

    </style>
</head>
<body>
<div class="wrapper">
    <!-- 레이아웃 설정 footer, header -->
    <!-- header.jsp -->
    <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
        <jsp:param name="pageName" value="header"/>
    </jsp:include>
    <div class="main-content">
            <div class="form-info-ysh" >
                <h1>숙소 등록하기</h1>
                <h3>StayNest 호스팅을 시작하고 남는 공간으로 수입을 만들어 보세요.</h3>
            </div>
            <div class="form-info-ysh">
                <div class="form-group-ysh">
                    <div class="section-title-ysh"><h3>숙소 기본 정보</h3></div>
                    <label for="name">숙소명</label>
                    <input type="text" id="name" placeholder="숙소 이름을 입력하세요.">
                </div>
                <div class="form-group-ysh">
                    <label for="room-type">숙소 유형</label>
                    <select id="room-type">
                        <option value="아파트">아파트</option>
                        <option value="게스트하우스">게스트하우스</option>
                        <option value="오피스텔">오피스텔</option>
                        <option value="원룸">원룸</option>
                        <option value="팬션">팬션</option>
                        <option value="한옥">한옥</option>
                        <option value="기타">기타</option>
                    </select>
                </div>
                <div class="form-group-ysh">
                    <label>주소</label>
                    <input type="text" id="sample4_postcode" placeholder="우편번호">
                    <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                    <input type="text" id="address" placeholder="도로명주소">
                    <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
                    <span id="guide" style="color:#999;display:none"></span>
                    <input type="text" id="detailAddress" placeholder="상세주소">
                    <input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
                </div>
                <div class="section-title-ysh"><h3>객실구성</h3></div>
                <div class="form-group-ysh">
                    <label>수용 인원</label>
                    <input type="number" id="maxGuests" placeholder="최대 5명" min="1" max="5">
                </div>
                <div class="form-group-ysh">
                    <label>방 종류</label>
                    <input type="text" id="roomCategory" placeholder="ex) 방 2">
                </div>
                <div class="form-group-ysh">
                    <label>가격</label>
                    <input type="text" id="price" placeholder="가격을 입력하세요.">
                </div>
                <div class="form-group-ysh">
                    <label>입실 시간</label>
                    <input type="time" id="checkIn">
                </div>
                <div class="form-group-ysh">
                    <label>퇴실 시간</label>
                    <input type="time" id="checkOut">
                </div>
                <div class="section-title-ysh"><h3>숙소 정보</h3></div>
                <div class="form-group-ysh">
                    <label class="form-label mt-6">숙소 사진 추가 (최대 5장)</label>
                    <input type="file" id="pic" name="files" accept="image/*" style="display: none;" multiple>
                    <input type="button" id="addImageBtn" value="+">
                    <div class="pic-container"></div>
                </div>
                <div class="form-group-ysh">
                    <label for="additional-info">숙소 추가 정보</label>
                    <textarea id="additional-info" rows="4" maxlength="500" placeholder="숙소 소개글을 적어주세요."></textarea>
                    <br>
                    <small>500자 이내로 적어주세요.</small>
                </div>
                <button class="registerBtn" onclick="submitForm()">숙소 등록</button>
            </div>
    </div>

    <!-- footer.jsp -->
    <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
        <jsp:param name="pageName" value="footer"/>
    </jsp:include>
</div>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("address").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if (roadAddr !== '') {
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if (data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'none';

                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'none';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

    const imgList = []; // 이미지 파일을 저장할 배열

    // 사진 첨부 시 프리뷰 및 X 버튼 추가
    function previewImage(event) {
        const files = event.target.files;

        // 이미지 파일을 imgList 배열에 추가
        Array.from(files).forEach(file => imgList.push(file));

        if (!files.length) return;

        const picContainer = document.querySelector('.pic-container');

        // X 버튼 클릭 시 이미지와 imgList에서 해당 이미지 제거
        function addDeleteButton(imgElement, file) {
            const imageContainer = document.createElement('div');
            imageContainer.classList.add('image-container');

            const img = document.createElement('img');
            img.src = URL.createObjectURL(file);

            const closeButton = document.createElement('button');
            closeButton.textContent = 'X';
            closeButton.classList.add('delete-button');

            closeButton.addEventListener('click', function () {
                picContainer.removeChild(imageContainer);
                imgList.splice(imgList.indexOf(file), 1); // imgList에서 해당 file 제거
                if (picContainer.childElementCount === 0) {
                    document.getElementById('pic').value = null; // 모든 이미지가 삭제되면 파일 인풋 초기화
                }
            });

            imageContainer.appendChild(img);
            imageContainer.appendChild(closeButton);
            picContainer.appendChild(imageContainer);
        }

        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            const reader = new FileReader();
            reader.onload = function (e) {
                addDeleteButton(e.target.result, file);
            };
            reader.readAsDataURL(file);
        }
    }

    // 파일 첨부 input에 change 이벤트 리스너 추가
    document.getElementById('pic').addEventListener('change', previewImage);

    // 폼 제출 시 처리
    async function submitForm() {
        const token = sessionStorage.getItem('token');

        const formData = new FormData();
        formData.append('accommodationDto', new Blob([JSON.stringify({
            name: document.getElementById('name').value,
            category: document.getElementById('room-type').value,
            address: document.getElementById('address').value,
            detailAddress: document.getElementById('detailAddress').value,
            maxGuests: document.getElementById('maxGuests').value,
            price: document.getElementById('price').value,
            checkIn: document.getElementById('checkIn').value,
            checkOut: document.getElementById('checkOut').value,
            content: document.getElementById('additional-info').value,
            roomCategory: document.getElementById('roomCategory').value
        })], { type: "application/json" }));

        // 이미지 파일 추가
        for (let i = 0; i < imgList.length; i++) {
            formData.append('files', imgList[i]);
        }

        try {
            const response = await fetch('/hosts/accomEnroll', {
                method: 'POST',
                headers: {
                    'Authorization': token
                },
                body: formData
            });

            if (response.ok) {
                alert('숙소 등록이 완료되었습니다.');
                window.location.href = "/hosts/";
            } else {
                alert('숙소 등록에 실패했습니다.');
            }
        } catch (error) {
            console.error('Error:', error);
            alert('숙소 등록 중 오류가 발생했습니다.');
        }
    }
    document.getElementById('addImageBtn').addEventListener('click', function() {
        if (imgList.length >= 5) {
            alert('이미지는 최대 5개까지 첨부할 수 있습니다.');
            return;
        } else {
            document.getElementById('pic').click();
        }
    });
</script>
</body>
</html>
