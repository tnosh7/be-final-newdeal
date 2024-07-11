<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <!-- 페이지에 변경할 때마다 타이틀, 바디 부분 변경해주세요 -->
    <title>StayNest</title>
</head>
<body>
<div class="wrapper">
    <!--레이아웃 설정 footer, header-->
    <!--header.jsp-->
    <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
        <jsp:param name="pageName" value="header"/>
    </jsp:include>

    <div class="main-content">

        <div id="title-kti" style="margin-top: 40px; margin-bottom: 40px;">
            <div style="margin-top: 12px;">
                <h1 tabindex="-1" elementtiming="LCP-target">
                    <div>개인정보</div>
                </h1>
            </div>
        </div>

        <div class="container-kti">
                <div id="screen1">
                    <div class="gad1-khs">
                        <div class="gad2-khs">
                            <div>
                                <div style="font-size: 20px;">
                                    이름
                                </div>
                                <div>
                                    ${guest.guestName}
                                </div>
                            </div>
                            <div>
                                <a href="">수정</a>
                            </div>
                        </div>
                    </div>
                    <div class="gad1-khs">
                        <div class="gad2-khs">
                            <div>
                                <div style="font-size: 20px;">
                                    이메일
                                </div>
                                <div>
                                    ${guest.email}
                                </div>
                            </div>
                            <div>
                                <a href="">수정</a>
                            </div>
                        </div>
                    </div>
                    <div class="gad1-khs">
                        <div class="gad2-khs">
                            <div>
                                <div style="font-size: 20px;">
                                    전화번호
                                </div>
                                <div>
                                    ${guest.phone}
                                </div>
                            </div>
                            <div>
                                <a href="">수정</a>
                            </div>
                        </div>
                    </div>
                    <div class="gad1-khs">
                        <div class="gad2-khs">
                            <div>
                                <div style="font-size: 20px;">
                                    주소
                                </div>
                                <div>
                                    ${guest.address}
                                </div>
                            </div>
                            <div>
                                <a href="">수정</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="screen2">
                    <div id="bottom-kti" style=" border-bottom: 1px solid gainsboro;">
                        <!-- 안내 문서 내용 -->
                        <svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                             role="presentation" focusable="false"
                             style="display: block; height: 48px; width: 48px; fill: rgb(227, 28, 95); stroke: currentcolor;">
                            <g>
                                <g stroke="none">
                                    <path d="M27 5l.585.005c4.29.076 8.837.984 13.645 2.737l.77.288V35.4l-.008.13a1 1 0 0 1-.47.724l-.116.06L27 42.716V25a1 1 0 0 0-.883-.993L26 24H12V8.029l.77-.286c4.797-1.75 9.336-2.658 13.62-2.737L27 5z"
                                          fill-opacity=".2"></path>
                                    <path d="M27 1c5.599 0 11.518 1.275 17.755 3.816a2 2 0 0 1 1.239 1.691L46 6.67V35.4a5 5 0 0 1-2.764 4.472l-.205.097-15.594 6.93L27 47l-2.461-1h2.451a.01.01 0 0 0 .007-.003L27 45.99v-1.085l15.218-6.763a3 3 0 0 0 1.757-2.351l.019-.194.006-.196V6.669l-.692-.278C37.557 4.128 32.121 3 27 3S16.443 4.128 10.692 6.391L10 6.67 9.999 24H8V6.669a2 2 0 0 1 1.098-1.786l.147-.067C15.483 2.275 21.401 1 27 1z"></path>
                                </g>
                                <g fill="none" stroke-width="2">
                                    <path d="M4 24h22a1 1 0 0 1 1 1v20.99a.01.01 0 0 1-.01.01H4a1 1 0 0 1-1-1V25a1 1 0 0 1 1-1z"></path>
                                    <path d="M21 25v-5a6 6 0 1 0-12 0v5"></path>
                                    <circle cx="15" cy="35" r="2"></circle>
                                </g>
                            </g>
                        </svg>
                        <div style="font-size: 20px; padding: 10px 0 10px 0;">여기에 내 개인정보가 표시되지 않는 이유가 무엇인가요?</div>
                        <div>신분이 노출되지 않도록 일부 계정 정보가 숨김 처리되었습니다.</div>
                    </div>
                    <div id="bottom-kti">
                        <svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                             role="presentation" focusable="false"
                             style="display: block; height: 48px; width: 48px; fill: rgb(227, 28, 95); stroke: currentcolor;">
                            <g stroke="none">
                                <path d="m39 15.999v28.001h-30v-28.001z" fill-opacity=".2"></path>
                                <path d="m24 0c5.4292399 0 9.8479317 4.32667079 9.9961582 9.72009516l.0038418.27990484v2h7c1.0543618 0 1.9181651.8158778 1.9945143 1.8507377l.0054857.1492623v32c0 1.0543618-.8158778 1.9181651-1.8507377 1.9945143l-.1492623.0054857h-34c-1.0543618 0-1.91816512-.8158778-1.99451426-1.8507377l-.00548574-.1492623v-32c0-1.0543618.81587779-1.9181651 1.85073766-1.9945143l.14926234-.0054857h7v-2c0-5.5228475 4.4771525-10 10-10zm17 14h-34v32h34zm-17 14c1.6568542 0 3 1.3431458 3 3s-1.3431458 3-3 3-3-1.3431458-3-3 1.3431458-3 3-3zm0 2c-.5522847 0-1 .4477153-1 1s.4477153 1 1 1 1-.4477153 1-1-.4477153-1-1-1zm0-28c-4.3349143 0-7.8645429 3.44783777-7.9961932 7.75082067l-.0038068.24917933v2h16v-2c0-4.418278-3.581722-8-8"></path>
                            </g>
                        </svg>
                        <div style="font-size: 20px; padding: 10px 0 10px 0;"> 수정할 수 있는 세부 정보는 무엇인가요?</div>
                        <div>연락처 정보와 개인정보를 수정하실 수 있습니다. 본인 인증 시 이 정보를 사용했다면 호스팅을 계속하기 위해 또는 다음번 예약 진행 시 다시 인증을 받으셔야 합니다.
                        </div>
                    </div>
                </div>
        </div>
    </div>
    <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
        <jsp:param name="pageName" value="footer"/>
    </jsp:include>
</div>
</body>
</html>
