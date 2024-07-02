<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link rel="stylesheet" href="${contextPath}/bootstrap/css/insertReview.css">
    <title>리뷰 쓰기</title>
</head>
<body>
<div class="review-container-cyj">
    <div class="review-header-cyj">
        리뷰 쓰기
    </div>
    <div class="review-content-cyj">
        <div class="accommodation-info-cyj">
            <img src="https://cdn.tourtoctoc.com/news/photo/202305/549_2970_1553.jpg" alt="숙소에 등록된 이미지" class="accommodation-image-cyj"/>
            <div class="accommodation-details-cyj">
                <span class="accommodation-title-cyj">오션뷰 호텔 스위트룸</span>
                <span class="accommodation-subtitle-cyj">위치: 제주도 / 객실 유형: 스위트룸</span>
            </div>
        </div>
        <div class="rating-section-cyj">
            <span>별점</span>
            <div class="stars-cyj">
                ★★★★★
            </div>
        </div>
        <div class="photo-upload-section-cyj">
            <button class="photo-upload-button-cyj">사진 첨부하기</button>
            <span>사진을 첨부해주세요. (최대 1장)</span>
        </div>
        <div class="review-text-section-cyj">
            <textarea class="review-textarea-cyj" maxlength="100" placeholder="최소 20자 이상, 최대 100자 미만"></textarea>
        </div>
        <div class="submit-button-section-cyj">
            <button class="submit-button-cyj">완료</button>
        </div>
    </div>
</div>

<script src="${contextPath}/bootstrap/js/insertReview.js"></script>
</body>
</html>
