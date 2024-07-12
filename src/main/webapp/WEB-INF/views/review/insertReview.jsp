<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
    <meta charset="UTF-8">
    <title>reviewInsert</title>
    <link rel="stylesheet" href="${contextPath}/css/insertReview.css">
</head>
    <body>

    <div class="wrapper">
        <!--header.jsp-->
        <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
            <jsp:param name="pageName" value="header"/>
        </jsp:include>
        <div class="main-content">
            <div class="review-container-cyj">
                <div class="review-header-cyj">
                    리뷰 쓰기
                </div>
                <div class="review-content-cyj">
                    <div class="accommodation-info-cyj">
                        <img src="https://cdn.tourtoctoc.com/news/photo/202305/549_2970_1553.jpg" alt="숙소에 등록된 이미지" class="accommodation-image-cyj"/>
                        <div class="accommodation-details-cyj">
                            <span class="accommodation-title-cyj">${accom.content}</span>
                            <span class="accommodation-subtitle-cyj">위치: ${accom.address} / 객실 유형: ${accom.category}</span>
                            <span class="accommodation-subtitle-cyj">이용날짜 : ${reservation.checkInDate} ~ ${reservation.checkOutDate} </span>
                        </div>
                    </div>
                    <div class="rating-section-cyj">
                        <span>별점</span>
                        <div class="rating-cyj">
                            <label class="rating__label-cyj rating__label--full-cyj" for="star1-cyj">
                                <input type="radio" id="star1-cyj" class="rating__input-cyj" name="rating" value="1">
                                <span class="star-icon-cyj"></span>
                            </label>
                            <label class="rating__label-cyj rating__label--full-cyj" for="star2-cyj">
                                <input type="radio" id="star2-cyj" class="rating__input-cyj" name="rating" value="2">
                                <span class="star-icon-cyj"></span>
                            </label>
                            <label class="rating__label-cyj rating__label--full-cyj" for="star3-cyj">
                                <input type="radio" id="star3-cyj" class="rating__input-cyj" name="rating" value="3">
                                <span class="star-icon-cyj"></span>
                            </label>
                            <label class="rating__label-cyj rating__label--full-cyj" for="star4-cyj">
                                <input type="radio" id="star4-cyj" class="rating__input-cyj" name="rating" value="4">
                                <span class="star-icon-cyj"></span>
                            </label>
                            <label class="rating__label-cyj rating__label--full-cyj" for="star5-cyj">
                                <input type="radio" id="star5-cyj" class="rating__input-cyj" name="rating" value="5">
                                <span class="star-icon-cyj"></span>
                            </label>
                        </div>
                    </div>
                    <div class="photo-upload-section-cyj">
                        <input type="file" id="photoUpload" accept="image/*" style="display: none;">
                        <button class="photo-upload-button-cyj" onclick="document.getElementById('photoUpload').click()">사진 첨부하기</button>
                        <span id="selectedFileName">사진을 첨부해주세요. (최대 1장)</span>
                    </div>

                    <div class="review-text-section-cyj">
                        <textarea class="review-textarea-cyj" maxlength="100" placeholder="최소 20자 이상, 최대 100자 미만"></textarea>
                    </div>
                    <div class="submit-button-section-cyj">
                        <button class="submit-button-cyj">완료</button>
                        <button class="delete-button-cyj">삭제</button>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
            <jsp:param name="pageName" value="footer"/>
        </jsp:include>
    </div>

    <script src="${contextPath}/js/insertReview.js"></script>
    </body>
</html>