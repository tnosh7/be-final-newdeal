<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
    <head>
        <link rel="stylesheet" href="${contextPath}/css/fullReview.css">
        <title>FullReview</title>
    </head>
    <body>
        <%-- header 추가해야 될 <div class="wrapper"> --%>
        <div class="wrapper">
            <!--레이아웃 설정 footer, header-->
            <!--header.jsp-->
            <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
                <jsp:param name="pageName" value="header"/>
            </jsp:include>
            <%--        <br><br><br><br>--%>
            <%-- content 시작 전 전체를 <div class="main-content"> 로 감싸야됨--%>
            <div class="main-content">
                <c:forEach var="response" items="${reviewResponses}">
                    <div>
                        <p>Review ID: ${response.reviewId}</p>
                        <p>Star: ${response.star}</p>
                        <p>Content: ${response.content}</p>
                        <p>Created At: ${response.createdAt}</p>
                        <p>Images:</p>
                        <c:forEach var="image" items="${response.images}">
                            <img src="${image.url}" alt="Review Image"/>
                        </c:forEach>
                    </div>
                </c:forEach>
                <hr>
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
                        <button class="tab-button-cyj active-cyj" data-tab="recent" onclick="toggleActive(this)">최신순
                        </button>
                        <button class="tab-button-cyj" data-tab="oldest" onclick="toggleActive(this)">오래된순</button>
                        <span class="btn-review-insert-box-cyj">
                            <a href="#" class="btn-review-insert-cyj">리뷰쓰기</a>
                        </span>
                    </div>
                    <!-- 리뷰 모달 구조 -->
                    <div id="review-reservation-modal-cyj" class="review-modal-cyj">
                        <div class="review-modal-content-cyj">
                            <span class="review-close-cyj" onclick="closeModal()">&times;</span>
                            <p>숙소를 예약한 경우에만 리뷰를 작성할 수 있습니다!</p>
                        </div>
                    </div>
                    <div class="review-list-cyj">
                        <!-- 답글 모달 구조  -->
                        <div id="replyModal-cyj" class="modal-re-cyj">
                            <div class="modal-content-re-cyj">
                                <span class="close-re-cyj" onclick="closeReplyModal()">&times;</span>
                                <h2>답글 작성</h2>
                                <textarea id="replyText-cyj" class="textarea-re-cyj" rows="5"
                                          placeholder="답글을 입력하세요..."></textarea>
                                <button class="btn-submit-re-cyj" onclick="submitReply()">완료</button>
                                <button class="btn-submit-re-cyj" onclick="submitReply()">삭제</button>
                                <%--삭제 버튼 만들기--%>
                            </div>
                        </div>
                        <div class="review-item-cyj best-cyj">
                            <div class="review-header-cyj">
                                <div class="review-user-info-cyj">
                                    <span class="profile-image-cyj">
                                        <img src="https://cdn-icons-png.flaticon.com/128/4202/4202831.png"
                                             alt="profile Image 1">
                                    </span>
                                    <span class="review-username-cyj">블라아이디1</span>
                                    <br>
                                </div>
                                <div class="review-user-id-cyj" data-owner="user1">
                                    <span class="review-stars-cyj">★★★★★</span>
                                    <br>
                                    <span class="review-date-cyj">&nbsp;2024.06.20</span>
                                    <br>
                                    <span class="btn-review-edit-delete-box-cyj">
                                        <a href="#" class="btn-review-edit-delete-cyj">수정/삭제</a>
                                    </span>
                                </div>
                            </div>
                            <div class="review-body-cyj">
                                <div class="review-image-cyj">
                                    <img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg"
                                         alt="Review Image 1">
                                </div>
                                <div class="review-content-cyj">
                                    <p>
                                        블라블라블라블라블라블라블라블라블라블라블좋았고 블라블랄브라라발발발발블라라라행복했고 블라블라블라블라블라블라블라블라블라블라블좋았고
                                        블라블랄브라라발발발발블라라라행복했고 블라블라블라블라블라블라블라블라블라블라블좋았고 블라블랄브라라발발발발블라라라행복했고 블라 했습니다.</p>
                                </div>
                            </div>
                            <div class="reply-container-cyj">
                                <p class="re-host-cyj"><span>호스트의 답글</span> <span
                                        class="re-host-date-cyj">2024.07.04</span></p>
                                <p class="replyContent-cyj">이용해주셔서 감사하고 감사하고 감사하고 또 감사하고 이용해주셔서 감사하고 감사하고 감사하고 또감사하고이용해주셔서 감사하고 감사하고 감사하고 또 감사하고이용해주셔서 감사하고 감사하고 감사하고 또 감사하고이용해주셔서 감사하고 감사하고 감사하고 또 감사하고이용해주셔서 감사하고 감사하고 감사하고 또 감사하고이용해주셔서 감사하고 감사하고 감사하고 또 감사하고이용해주셔서 감사하고 감사하고 감사하고 또 감사하고
                                </p>
                            </div>
                            <button class="btn-reply-cyj" onclick="openReplyModal()">답글 작성(수정,삭제)</button>
                        </div>
                        <div class="review-item-cyj best-cyj">
                            <div class="review-header-cyj">
                                <div class="review-user-info-cyj">
                                    <span class="profile-image-cyj">
                                        <img src="https://cdn-icons-png.flaticon.com/128/4202/4202831.png"
                                             alt="profile Image 1">
                                    </span>
                                    <span class="review-username-cyj">블라아이디1</span>
                                    <br>
                                </div>
                                <div class="review-user-id-cyj" data-owner="user2">
                                    <span class="review-stars-cyj">★★★★★</span>
                                    <br>
                                    <span class="review-date-cyj">&nbsp;2024.06.20</span>
                                    <br>
                                    <span class="btn-review-edit-delete-box-cyj">
                                        <a href="#" class="btn-review-edit-delete-cyj">수정/삭제</a>
                                    </span>
                                </div>

                            </div>
                            <div class="review-body-cyj">
                                <div class="review-image-cyj">
                                    <img src="https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg"
                                         alt="Review Image 1">
                                </div>
                                <div class="review-content-cyj">
                                    <p>
                                        블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
                                </div>
                            </div>
                            <div class="reply-container-cyj" style="display: none;">
                                <h3>호스트의 답글</h3>
                                <p class="replyContent-cyj">123</p>
                            </div>
                            <button class="btn-reply-cyj" onclick="openReplyModal()">답글 작성</button>
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
                                    <p>
                                        블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
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
                                    <p>
                                        블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
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
                                    <p>
                                        블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
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
                                    <p>
                                        블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
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
                                    <p>
                                        블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라.</p>
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
            </div>

            <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
                <jsp:param name="pageName" value="footer"/>
            </jsp:include>
        </div>
        <script src="${contextPath}/js/fullReview.js"></script>
    </body>
</html>
