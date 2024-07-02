<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
    <head>
        <link rel="stylesheet" href="${contextPath}/bootstrap/css/fullReview.css">
        <title>FullReview</title>
    </head>
    <body>
        <br><br><br><br>
        <div class="review-summary">
            <div class="summary-header">
                <span class="review-title">리뷰</span>
                <span class="total-reviews">14,891</span>
            </div>
            <div class="review-average-body">
                <div class="average-rating">
                    <div class="stars">
                        <span class="star">★</span>
                        <span class="star">★</span>
                        <span class="star">★</span>
                        <span class="star">★</span>
                        <span class="star">☆</span>
                    </div>
                    <span class="rating-value">4.7</span>
                </div>

                <div class="rating-distribution">
                    <div class="distribution">
                        <span>5점</span>
                        <div class="bar">
                            <div class="filled" style="width: 78%;"></div>
                        </div>
                        <span>11,601</span>
                    </div>
                    <div class="distribution">
                        <span>4점</span>
                        <div class="bar">
                            <div class="filled" style="width: 18%;"></div>
                        </div>
                        <span>2,771</span>
                    </div>
                    <div class="distribution">
                        <span>3점</span>
                        <div class="bar">
                            <div class="filled" style="width: 3%;"></div>
                        </div>
                        <span>450</span>
                    </div>
                    <div class="distribution">
                        <span>2점</span>
                        <div class="bar">
                            <div class="filled" style="width: 0.5%;"></div>
                        </div>
                        <span>44</span>
                    </div>
                    <div class="distribution">
                        <span>1점</span>
                        <div class="bar">
                            <div class="filled" style="width: 0.2%;"></div>
                        </div>
                        <span>25</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="review-tabs">
            <button class="tab-button active" data-tab="recent" onclick="toggleActive(this)">최신순</button>
            <button class="tab-button" data-tab="oldest" onclick="toggleActive(this)">오래된순</button>
        </div>
        <div class="review-list">
            <div class="review-item best">
                <div class="review-header">
                    <div class="review-user-info">
                        <span class="profile-image">
                            <img src="https://cdn-icons-png.flaticon.com/128/4202/4202831.png" alt="profile Image 1">
                        </span>
                        <span class="review-username">블라아이디1</span>
                        <br>

                    </div>
                    <div>
                        <span class="review-stars">★★★★★</span>
                        <br>
                        <span class="review-date">&nbsp;2024.06.20</span>
                    </div>

                </div>
                <div class="review-body">
                    <div class="review-image">
                        <img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg" alt="Review Image 1">
                    </div>
                    <div class="review-content">
                        <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
                    </div>
                </div>
            </div>
            <div class="review-item best">
                <div class="review-header">
                    <div class="review-user-info">
                        <span class="profile-image">
                            <img src="https://cdn-icons-png.flaticon.com/128/4202/4202831.png" alt="profile Image 1">
                        </span>
                        <span class="review-username">블라아이디2</span>
                        <br>

                    </div>
                    <div>
                        <span class="review-stars">★★★★☆</span>
                        <br>
                        <span class="review-date">&nbsp;2024.06.20</span>
                    </div>
                </div>
                <div class="review-body">
                    <div class="review-image">
                        <img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg" alt="Review Image 1">
                    </div>
                    <div class="review-content">
                        <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
                    </div>
                </div>
            </div>
            <div class="review-item best">
                <div class="review-header">
                    <div class="review-user-info">
                        <span class="profile-image">
                            <img src="https://cdn-icons-png.flaticon.com/128/4202/4202831.png" alt="profile Image 1">
                        </span>
                        <span class="review-username">블라아이디3</span>
                        <br>

                    </div>
                    <div>
                        <span class="review-stars">★★☆☆☆</span>
                        <br>
                        <span class="review-date">&nbsp;2024.06.20</span>
                    </div>
                </div>
                <div class="review-body">
                    <div class="review-image">
                        <img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg" alt="Review Image 1">
                    </div>
                    <div class="review-content">
                        <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
                    </div>
                </div>
            </div>
            <div class="review-item best">
                <div class="review-header">
                    <div class="review-user-info">
                        <span class="profile-image">
                            <img src="https://cdn-icons-png.flaticon.com/128/4202/4202831.png" alt="profile Image 1">
                        </span>
                        <span class="review-username">블라아이디4</span>
                        <br>

                    </div>
                    <div>
                        <span class="review-stars">★★★★★</span>
                        <br>
                        <span class="review-date">&nbsp;2024.06.20</span>
                    </div>
                </div>
                <div class="review-body">
                    <div class="review-image">
                        <img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg" alt="Review Image 1">
                    </div>
                    <div class="review-content">
                        <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
                    </div>
                </div>
            </div>
            <div class="review-item best">
                <div class="review-header">
                    <div class="review-user-info">
                        <span class="profile-image">
                            <img src="https://cdn-icons-png.flaticon.com/128/4202/4202831.png" alt="profile Image 1">
                        </span>
                        <span class="review-username">블라아이디5</span>
                        <br>

                    </div>
                    <div>
                        <span class="review-stars">★★★★★</span>
                        <br>
                        <span class="review-date">&nbsp;2024.06.20</span>
                    </div>
                </div>
                <div class="review-body">
                    <div class="review-image">
                        <img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg" alt="Review Image 1">
                    </div>
                    <div class="review-content">
                        <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
                    </div>
                </div>
            </div>
            <div class="review-item best">
                <div class="review-header">
                    <div class="review-user-info">
                        <span class="profile-image">
                            <img src="https://cdn-icons-png.flaticon.com/128/4202/4202831.png" alt="profile Image 1">
                        </span>
                        <span class="review-username">블라아이디6</span>
                        <br>

                    </div>
                    <div>
                        <span class="review-stars">★★★★★</span>
                        <br>
                        <span class="review-date">&nbsp;2024.06.20</span>
                    </div>
                </div>
                <div class="review-body">
                    <div class="review-image">
                        <img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg" alt="Review Image 1">
                    </div>
                    <div class="review-content">
                        <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
                    </div>
                </div>
            </div>

            <div class="pagination">
                <button class="page-button active" onclick="gotoPage(1, event)">1</button>
                <button class="page-button" onclick="gotoPage(2, event)">2</button>
                <button class="page-button" onclick="gotoPage(3, event)">3</button>
            </div>
        </div>

        <script src="${contextPath}/bootstrap/js/fullReview.js"></script>
    </body>
</html>
