<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
    <head>
        <meta charset="UTF-8">
        <title>fullNotify</title>
        <link rel="stylesheet" href="${contextPath}/css/fullNotify.css">
    </head>
    <body>
        <div class="wrapper">
            <!--header.jsp-->
            <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
                <jsp:param name="pageName" value="header"/>
            </jsp:include>
            <div class="main-content">
                <div class="fullNotify-box-cyj">
                    <div class="fullNotify-container-cyj">
                        <h1>알림 전체 목록</h1>
                        <div class="notifications-cyj">
                            <div class="notification-item-cyj">
                                <div class="notification-header-cyj">
                                    <span class="notification-title-cyj">1[퇴실] 퇴실 시간 1시간 전입니다</span>
                                    <span class="notification-date-cyj">2023-07-04</span>
                                </div>
                                <div class="notification-body-cyj">
                                    놔두고 가시는 물건이 없도록 숙소를 확인해 주세요!
                                </div>
                                <div class="notification-actions-cyj">
                                    <button class="submit-button-submit-cyj">확인</button>
                                    <button class="submit-button-delete-cyj">삭제</button>
                                </div>
                            </div>
                            <div class="notification-item-cyj">
                                <div class="notification-header-cyj">
                                    <span class="notification-title-cyj">2[리뷰] 숙소이용이 완료되었습니다!</span>
                                    <span class="notification-date-cyj">2023-07-03</span>
                                </div>
                                <div class="notification-body-cyj">
                                    사진과 함께 리뷰 작성을 해주세요!
                                </div>
                                <div class="notification-actions-cyj">
                                    <button class="submit-button-submit-cyj">확인</button>
                                    <button class="submit-button-delete-cyj">삭제</button>
                                </div>
                            </div>
                            <div class="notification-item-cyj">
                                <div class="notification-header-cyj">
                                    <span class="notification-title-cyj">3[퇴실] 추천숙소가 도착했습니다. </span>
                                    <span class="notification-date-cyj">2023-07-03</span>
                                </div>
                                <div class="notification-body-cyj">
                                    전날 가장 인기가 많았던 숙소들을 확인해보세요!
                                </div>
                                <div class="notification-actions-cyj">
                                    <button class="submit-button-submit-cyj">확인</button>
                                    <button class="submit-button-delete-cyj">삭제</button>
                                </div>
                            </div>

                            <div class="notification-item-cyj">
                                <div class="notification-header-cyj">
                                    <span class="notification-title-cyj">4[퇴실] 퇴실 시간 1시간 전입니다</span>
                                    <span class="notification-date-cyj">2023-07-04</span>
                                </div>
                                <div class="notification-body-cyj">
                                    놔두고 가시는 물건이 없도록 숙소를 확인해 주세요!
                                </div>
                                <div class="notification-actions-cyj">
                                    <button class="submit-button-submit-cyj">확인</button>
                                    <button class="submit-button-delete-cyj">삭제</button>
                                </div>
                            </div>
                            <div class="notification-item-cyj">
                                <div class="notification-header-cyj">
                                    <span class="notification-title-cyj">5[리뷰] 숙소이용이 완료되었습니다!</span>
                                    <span class="notification-date-cyj">2023-07-03</span>
                                </div>
                                <div class="notification-body-cyj">
                                    사진과 함께 리뷰 작성을 해주세요!
                                </div>
                                <div class="notification-actions-cyj">
                                    <button class="submit-button-submit-cyj">확인</button>
                                    <button class="submit-button-delete-cyj">삭제</button>
                                </div>
                            </div>
                            <div class="notification-item-cyj">
                                <div class="notification-header-cyj">
                                    <span class="notification-title-cyj">6[퇴실] 추천숙소가 도착했습니다. </span>
                                    <span class="notification-date-cyj">2023-07-03</span>
                                </div>
                                <div class="notification-body-cyj">
                                    전날 가장 인기가 많았던 숙소들을 확인해보세요!
                                </div>
                                <div class="notification-actions-cyj">
                                    <button class="submit-button-submit-cyj">확인</button>
                                    <button class="submit-button-delete-cyj">삭제</button>
                                </div>
                            </div>

                            <div class="notification-item-cyj">
                                <div class="notification-header-cyj">
                                    <span class="notification-title-cyj">7[퇴실] 퇴실 시간 1시간 전입니다</span>
                                    <span class="notification-date-cyj">2023-07-04</span>
                                </div>
                                <div class="notification-body-cyj">
                                    놔두고 가시는 물건이 없도록 숙소를 확인해 주세요!
                                </div>
                                <div class="notification-actions-cyj">
                                    <button class="submit-button-submit-cyj">확인</button>
                                    <button class="submit-button-delete-cyj">삭제</button>
                                </div>
                            </div>
                            <div class="notification-item-cyj">
                                <div class="notification-header-cyj">
                                    <span class="notification-title-cyj">8[리뷰] 숙소이용이 완료되었습니다!</span>
                                    <span class="notification-date-cyj">2023-07-03</span>
                                </div>
                                <div class="notification-body-cyj">
                                    사진과 함께 리뷰 작성을 해주세요!
                                </div>
                                <div class="notification-actions-cyj">
                                    <button class="submit-button-submit-cyj">확인</button>
                                    <button class="submit-button-delete-cyj">삭제</button>
                                </div>
                            </div>
                            <div class="notification-item-cyj">
                                <div class="notification-header-cyj">
                                    <span class="notification-title-cyj">9[퇴실] 추천숙소가 도착했습니다. </span>
                                    <span class="notification-date-cyj">2023-07-03</span>
                                </div>
                                <div class="notification-body-cyj">
                                    전날 가장 인기가 많았던 숙소들을 확인해보세요!
                                </div>
                                <div class="notification-actions-cyj">
                                    <button class="submit-button-submit-cyj">확인</button>
                                    <button class="submit-button-delete-cyj">삭제</button>
                                </div>
                            </div>
                            <!-- 추가적인 알림 항목들 -->
                        </div>
                        <div class="fullNotify-pagination-cyj">
                            <button class="fullNotify-page-button-cyj active-cyj" onclick="gotoNotiPage(1, event)">1</button>
                            <button class="fullNotify-page-button-cyj" onclick="gotoNotiPage(2, event)">2</button>
                            <button class="fullNotify-page-button-cyj" onclick="gotoNotiPage(3, event)">3</button>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
                <jsp:param name="pageName" value="footer"/>
            </jsp:include>
        </div>
        <script src="${contextPath}/js/fullNotify.js"></script>
    </body>
</html>
