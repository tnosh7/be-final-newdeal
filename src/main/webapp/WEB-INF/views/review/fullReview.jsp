<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
    <head>
        <link rel="stylesheet" href="${contextPath}/bootstrap/css/fullReview.css">
        <title>FullReview</title>
    </head>
    <body>
        <!--레이아웃 설정 footer, header-->
        <!--header.jsp-->
        <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
            <jsp:param name="pageName" value="header"/>
        </jsp:include>
        <%--        <br><br><br><br>--%>
        <div class="review-box-cyj">
            <div class="review-summary-cyj">
                <div class="summary-header-cyj">
                    <span class="review-title-cyj">리뷰</span>
                    <span class="total-reviews-cyj">14,891</span>
                </div>
                <div class="review-average-body-cyj">
                    <div class="average-rating-cyj">
                        <div class="stars-cyj">
                            <span class="star-cyj">★</span>
                            <span class="star-cyj">★</span>
                            <span class="star-cyj">★</span>
                            <span class="star-cyj">★</span>
                            <span class="star-cyj">☆</span>
                        </div>
                        <span class="rating-value-cyj">4.7</span>
                    </div>

                    <div class="rating-distribution-cyj">
                        <div class="distribution-cyj">
                            <span>5점</span>
                            <div class="bar-cyj">
                                <div class="filled-cyj" style="width: 78%;"></div>
                            </div>
                            <span>11,601</span>
                        </div>
                        <div class="distribution-cyj">
                            <span>4점</span>
                            <div class="bar-cyj">
                                <div class="filled-cyj" style="width: 18%;"></div>
                            </div>
                            <span>2,771</span>
                        </div>
                        <div class="distribution-cyj">
                            <span>3점</span>
                            <div class="bar-cyj">
                                <div class="filled-cyj" style="width: 3%;"></div>
                            </div>
                            <span>450</span>
                        </div>
                        <div class="distribution-cyj">
                            <span>2점</span>
                            <div class="bar-cyj">
                                <div class="filled-cyj" style="width: 0.5%;"></div>
                            </div>
                            <span>44</span>
                        </div>
                        <div class="distribution-cyj">
                            <span>1점</span>
                            <div class="bar-cyj">
                                <div class="filled-cyj" style="width: 0.2%;"></div>
                            </div>
                            <span>25</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="review-tabs-cyj">
                <button class="tab-button-cyj active-cyj" data-tab="recent" onclick="toggleActive(this)">최신순</button>
                <button class="tab-button-cyj" data-tab="oldest" onclick="toggleActive(this)">오래된순</button>
            </div>
            <div class="review-list-cyj">
                <div class="review-item-cyj best-cyj">
                    <div class="review-header-cyj">
                        <div class="review-user-info-cyj">
                        <span class="profile-image-cyj">
                            <img src="https://cdn-icons-png.flaticon.com/128/4202/4202831.png" alt="profile Image 1">
                        </span>
                            <span class="review-username-cyj">블라아이디1</span>
                            <br>

                        </div>
                        <div>
                            <span class="review-stars-cyj">★★★★★</span>
                            <br>
                            <span class="review-date-cyj">&nbsp;2024.06.20</span>
                        </div>

                    </div>
                    <div class="review-body-cyj">
                        <div class="review-image-cyj">
                            <img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg"
                                 alt="Review Image 1">
                        </div>
                        <div class="review-content-cyj">
                            <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
                        </div>
                    </div>
                </div>
                <div class="review-item-cyj best-cyj">
                    <div class="review-header-cyj">
                        <div class="review-user-info-cyj">
                        <span class="profile-image-cyj">
                            <img src="https://cdn-icons-png.flaticon.com/128/4202/4202831.png" alt="profile Image 1">
                        </span>
                            <span class="review-username-cyj">블라아이디2</span>
                            <br>

                        </div>
                        <div>
                            <span class="review-stars-cyj">★★★★☆</span>
                            <br>
                            <span class="review-date-cyj">&nbsp;2024.06.20</span>
                        </div>
                    </div>
                    <div class="review-body-cyj">
                        <div class="review-image-cyj">
                            <img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg"
                                 alt="Review Image 1">
                        </div>
                        <div class="review-content-cyj">
                            <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
                        </div>
                    </div>
                </div>
                <div class="review-item-cyj best-cyj">
                    <div class="review-header-cyj">
                        <div class="review-user-info-cyj">
                        <span class="profile-image-cyj">
                            <img src="https://cdn-icons-png.flaticon.com/128/4202/4202831.png" alt="profile Image 1">
                        </span>
                            <span class="review-username-cyj">블라아이디3</span>
                            <br>

                        </div>
                        <div>
                            <span class="review-stars-cyj">★★☆☆☆</span>
                            <br>
                            <span class="review-date-cyj">&nbsp;2024.06.20</span>
                        </div>
                    </div>
                    <div class="review-body-cyj">
                        <div class="review-image-cyj">
                            <img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg"
                                 alt="Review Image 1">
                        </div>
                        <div class="review-content-cyj">
                            <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
                        </div>
                    </div>
                </div>
                <div class="review-item-cyj best-cyj">
                    <div class="review-header-cyj">
                        <div class="review-user-info-cyj">
                        <span class="profile-image-cyj">
                            <img src="https://cdn-icons-png.flaticon.com/128/4202/4202831.png" alt="profile Image 1">
                        </span>
                            <span class="review-username-cyj">블라아이디4</span>
                            <br>

                        </div>
                        <div>
                            <span class="review-stars-cyj">★★★★★</span>
                            <br>
                            <span class="review-date-cyj">&nbsp;2024.06.20</span>
                        </div>
                    </div>
                    <div class="review-body-cyj">
                        <div class="review-image-cyj">
                            <img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg"
                                 alt="Review Image 1">
                        </div>
                        <div class="review-content-cyj">
                            <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
                        </div>
                    </div>
                </div>
                <div class="review-item-cyj best-cyj">
                    <div class="review-header-cyj">
                        <div class="review-user-info-cyj">
                        <span class="profile-image-cyj">
                            <img src="https://cdn-icons-png.flaticon.com/128/4202/4202831.png" alt="profile Image 1">
                        </span>
                            <span class="review-username-cyj">블라아이디5</span>
                            <br>

                        </div>
                        <div>
                            <span class="review-stars-cyj">★★★★★</span>
                            <br>
                            <span class="review-date-cyj">&nbsp;2024.06.20</span>
                        </div>
                    </div>
                    <div class="review-body-cyj">
                        <div class="review-image-cyj">
                            <img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg"
                                 alt="Review Image 1">
                        </div>
                        <div class="review-content-cyj">
                            <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
                        </div>
                    </div>
                </div>
                <div class="review-item-cyj best-cyj">
                    <div class="review-header-cyj">
                        <div class="review-user-info-cyj">
                        <span class="profile-image-cyj">
                            <img src="https://cdn-icons-png.flaticon.com/128/4202/4202831.png" alt="profile Image 1">
                        </span>
                            <span class="review-username-cyj">블라아이디6</span>
                            <br>

                        </div>
                        <div>
                            <span class="review-stars-cyj">★★★★★</span>
                            <br>
                            <span class="review-date-cyj">&nbsp;2024.06.20</span>
                        </div>
                    </div>
                    <div class="review-body-cyj">
                        <div class="review-image-cyj">
                            <img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg"
                                 alt="Review Image 1">
                        </div>
                        <div class="review-content-cyj">
                            <p>블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
                        </div>
                    </div>
                </div>

                <div class="pagination-cyj">
                    <button class="page-button-cyj active-cyj" onclick="gotoPage(1, event)">1</button>
                    <button class="page-button-cyj" onclick="gotoPage(2, event)">2</button>
                    <button class="page-button-cyj" onclick="gotoPage(3, event)">3</button>
                </div>
            </div>
        </div>
<%--        <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">--%>
<%--            <jsp:param name="pageName" value="footer"/>--%>
<%--        </jsp:include>--%>
        <script src="${contextPath}/bootstrap/js/fullReview.js"></script>
    </body>
</html>
