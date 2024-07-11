<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>RoomDetail</title>
</head>

<div class="wrapper">
    <!-- header.jsp -->
    <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
        <jsp:param name="pageName" value="header"/>
    </jsp:include>


<!-- body start -->
    <div class="main-content">
        <input type="hidden" id="contextPath" value="${contextPath}" />
        <div class="container mt-5-mjp">
            <div class="row align-items-center-mjp">
                <div class="col-md-6">
                    <h1 id="accommodation-name">오션스퀘어 스위트(객실이름)</h1>
                </div>
                <div class="col-md-6 text-end">
                    <span id="heartIcon" class="unliked-mjp">♡</span> 저장
                </div>
            </div>
        </div>
    </div>

         <hr style="border-top: 1px solid #cccccc;"/> <!-- 회색 얇은 선 -->

        <div class="container mt-5" >
            <!-- Carousel Container -->
            <div class="carousel-container-mjp">
                <!-- Carousel -->
                <div style="width: 500px; height: 400px;">
                <div id="imageCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${contextPath}/images/test.png" class="d-block w-100 fixed-image-mjp" alt="Image 1">
                        </div>
                        <div class="carousel-item">
                            <img src="${contextPath}/images/room.png" class="d-block w-100 fixed-image-mjp" alt="Image 2">
                        </div>
                        <div class="carousel-item">
                            <img src="${contextPath}/images/star.png" class="d-block w-100 fixed-image-mjp" alt="Image 3">
                        </div>
                        <div class="carousel-item">
                            <img src="${contextPath}/images/test.png" class="d-block w-100 fixed-image-mjp" alt="Image 4">
                        </div>
                        <div class="carousel-item">
                            <img src="${contextPath}/images/room.png" class="d-block w-100 fixed-image-mjp" alt="Image 5">
                        </div>
                        <div class="carousel-item">
                            <img src="${contextPath}/images/star.png" class="d-block w-100 fixed-image-mjp" alt="Image 6">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#imageCarousel" role="button" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#imageCarousel" role="button" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </a>
                </div>
                </div>
            </div>

        <!-- 예제 내용 -->
            <div class="details-section">
            <!-- 정보 섹션 -->
            <div class="row">
                <!-- 2/3 부분 -->
                <div class="col-md-8">
                    <div class="info-section-mjp text-start">
                        <hr style="border-top: 1px solid #cccccc;"/> <!-- 회색 얇은 선 -->
                        <h1>성산읍, 서귀포시 한국의 리조트의 개인실</h1>
                        <h3>최대 인원4명 , 침실2개, 욕실2개</h3>
                        <p> ★ 5.0  후기 17개</p>

                        <hr style="border-top: 1px solid #cccccc;"/> <!-- 회색 얇은 선 -->
                        <img src="${contextPath}/images/test.png" alt="프로필 사진" class="me-3" style="width: 50px; height: 50px; object-fit: cover; border-radius: 50%;">
                        <p>호스트 : Minsuk</p>

                        <hr style="border-top: 1px solid #cccccc;"/> <!-- 회색 얇은 선 -->
                        <p>원하시는 날짜에 이미 예약이 완료되어 있다면 저희 프로필 사진을 클릭하여 다른 숙소들도 확인해 주시길 바랍니다</p>
                        <p>제주 동쪽 성산 일출봉과 섭지코지를 가까이 둔 고요한 마을 온평리에 위치한 힐링 숙소 입니다. 아늑하고 편안한 객실과
                            자연 그대로의 풍광과 함께 자연의 소리를 들을수 있는 숙소에서...</p>
                    </div>
                </div>


                <!-- 1/3 부분 -->
                <div class="col-md-4">
                    <div class="mb-5"></div>
                    <div class="mb-5"></div>
                    <%--                <div class="reservation-box">--%>
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">
                                <h5 class="card-title">78,000원 /박 </h5>
                                <!-- hidden input을 사용하여 숙소 ID를 설정 -->
                                <input type="hidden" id="accommodationId" value="1"> <!-- 추후에 들어오는 hotel_id로 변경 -->
                                    <div class="mb-3">
                                        <label for="checkInDate" class="form-label">체크인</label>
                                        <input type="date" class="form-control" id="checkInDate" name="checkInDate" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="checkOutDate" class="form-label">체크아웃</label>
                                        <input type="date" class="form-control" id="checkOutDate" name="checkOutDate" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="guests" class="form-label">인원 수</label>
                                        <select class="form-select" id="guests" name="guests" required>
                                            <option value="1">1명</option>
                                            <option value="2">2명</option>
                                            <option value="3">3명</option>
                                            <option value="4">4명</option>
                                            <option value="5">5명</option>
                                        </select>
                                    </div>
                                    <button type="button" class="btn" style="background-color: #4F9F8A; color: white; width: 200px; height: 40px;" onclick="submitReservation()">예약하기</button>

                                    <hr>
                                    <p>예약확정 전에는 요금이 청구 되지않습니다.</p>

                                <hr style="border-top: 1px solid #cccccc;"/> <!-- 회색 얇은 선 -->
                                <p>78,000원 * 5박 = 390,000원</p>
                                <p>수수료 150,000</p>
                                <hr style="border-top: 1px solid #cccccc;"/> <!-- 회색 얇은 선 -->
                                <p>총금액 : 540,000원 </p>
                            </div>
                        </div>

                    </div>
                </div>
    <%--        </div>--%>
        </div>
            <!-- 정보 섹션 끝 -->
            <!-- 지도 삽입 -->
            <hr style="border-top: 1px solid #cccccc;"/> <!-- 회색 얇은 선 -->
            <div class="row mt-5">
                <h2>숙소위치</h2>
                <div class="col-md-12">
                    <jsp:include page="${contextPath}/WEB-INF/views/accommodation/map.jsp"/>
                </div>
            </div>
            <!-- 지도 삽입끝 -->

            <!-- 리뷰 섹션  -->
            <hr style="border-top: 1px solid #ccc;"/> <!-- 회색 얇은 선 -->
            <div class="reviews-section d-flex justify-content-between align-items-center">
                <h1> ★5.0  후기 17개</h1>
                <div class="text-end">
                    <a href="#">더보기</a>
                </div>
            </div>

            <!-- 리뷰 섹션 -->
            <hr style="border-top: 1px solid #ccc;"/> <!-- 회색 얇은 선 -->

        <div class="row">
            <!-- 첫 번째 리뷰 -->
            <div class="col-md-6">
                <div class="review-item">
                    <!-- 첫 번째 줄: 프로필 이미지와 작성자 -->
                    <div class="d-flex align-items-center mb-2">
                        <!-- 호스트 프로필 사진 -->
                        <img src="${contextPath}/images/test.png" alt="프로필 사진" class="me-3" style="width: 50px; height: 50px; object-fit: cover; border-radius: 50%;">
                        <!-- 작성자 -->
                        <div class="flex-grow-1">
                            <p class="mb-0">작성자: 박민정</p>
                        </div>
                    </div>
                    <!-- 두 번째 줄: 리뷰 내용과 작성일자 -->
                    <div>
                        <p class="mb-1">리뷰 내용: 바쿠벌레나옴요.</p>
                        <p class="mb-0">작성일자: 2024-07-02</p>
                    </div>
                </div>
            </div>

            <!-- 두 번째 리뷰 -->
            <div class="col-md-6 ms-auto">
                <div class="review-item">
                    <!-- 첫 번째 줄: 프로필 이미지와 작성자 -->
                    <div class="d-flex align-items-center mb-2">
                        <!-- 호스트 프로필 사진 -->
                        <img src="${contextPath}/images/test.png" alt="프로필 사진" class="me-3" style="width: 50px; height: 50px; object-fit: cover; border-radius: 50%;">
                        <!-- 작성자 -->
                        <div class="flex-grow-1">
                            <p class="mb-0">작성자: 김형섭</p>
                        </div>
                    </div>
                    <!-- 두 번째 줄: 리뷰 내용과 작성일자 -->
                    <div>
                        <p class="mb-1">리뷰 내용: 호스트님 친절해요.</p>
                        <p class="mb-0">작성일자: 2024-07-05</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <!-- 세 번째 리뷰 -->
            <div class="col-md-6">
                <div class="review-item">
                    <!-- 첫 번째 줄: 프로필 이미지와 작성자 -->
                    <div class="d-flex align-items-center mb-2">
                        <!-- 호스트 프로필 사진 -->
                        <img src="${contextPath}/images/test.png" alt="프로필 사진" class="me-3" style="width: 50px; height: 50px; object-fit: cover; border-radius: 50%;">
                        <!-- 작성자 -->
                        <div class="flex-grow-1">
                            <p class="mb-0">작성자: 최영준</p>
                        </div>
                    </div>
                    <!-- 두 번째 줄: 리뷰 내용과 작성일자 -->
                    <div>
                        <p class="mb-1">리뷰 내용: 조식 마싯어욤.</p>
                        <p class="mb-0">작성일자: 2024-07-01</p>
                    </div>
                </div>
            </div>

            <!-- 네 번째 리뷰 -->
            <div class="col-md-6 ms-auto">
                <div class="review-item">
                    <!-- 첫 번째 줄: 프로필 이미지와 작성자 -->
                    <div class="d-flex align-items-center mb-2">
                        <!-- 호스트 프로필 사진 -->
                        <img src="${contextPath}/images/test.png" alt="프로필 사진" class="me-3" style="width: 50px; height: 50px; object-fit: cover; border-radius: 50%;">
                        <!-- 작성자 -->
                        <div class="flex-grow-1">
                            <p class="mb-0">작성자: 박민정</p>
                        </div>
                    </div>
                    <!-- 두 번째 줄: 리뷰 내용과 작성일자 -->
                    <div>
                        <p class="mb-1">리뷰 내용: 강아지가 귀여워요.</p>
                        <p class="mb-0">작성일자: 2024-07-03</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="mb-5"></div>


</div>

    <!-- body end -->

    <!-- footer.jsp -->
        <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
            <jsp:param name="pageName" value="footer"/>
        </jsp:include>
    </div>

    </div>
</div>
<script src="${contextPath}/static/js/roomDetail.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>