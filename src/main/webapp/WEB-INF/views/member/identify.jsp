
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>회원 구분</title>
</head>
<style>
     .tables-container-ysh {
        display: flex;
        justify-content: center;
        gap: 10%;
    }
    .identify-table-ysh table {
        border-collapse: collapse;
        width: 100%;
        transition: border 0.3s;
    }
    .identify-table-ysh table:hover {
        border: 2px solid #4F9F8A;
    }
    .identify-table-ysh th {
        padding: 20px;
        text-align: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .identify-table-ysh th img {
        width: 200px; /* 이미지 크기 조정 */
        height: auto;
        display: block;
        margin: 0 auto; /* 이미지를 가운데 정렬 */
    }
    .identify-table-ysh input[type="button"] {
        transition: background-color 0.3s, color 0.3s; /* 버튼에 마우스가 올려질 때의 효과 추가 */
    }
    .identify-table-ysh input[type="button"]:hover {
        background-color: #555; /* 마우스가 버튼에 올라갈 때 배경색 변경 */
        color: #fff; /* 마우스가 버튼에 올라갈 때 글자색 변경 */
    }
     .identify-table-ysh th img:hover,
     .identify-table-ysh th img:focus {
         transform: scale(1.2); /* 이미지를 1.2배 확대 */
     }
</style>
<body>
<div class="wrapper">
    <!--레이아웃 설정 footer, header-->
    <!--header.jsp-->
    <jsp:include page="${contextPath}/WEB-INF/views/layout/header.jsp">
        <jsp:param name="pageName" value="header"/>
    </jsp:include>
    <div class="main-content">
        <section>
            <form>
                <div class="identify-info-ysh col-12" align="center">
                    <div class="register">
                        <h1>회원가입</h1>
                        <h6>회원가입 유형을 선택해주세요</h6>
                    </div>
                </div>
                <br>
                <div class="tables-container-ysh">
                    <div class="identify-table-ysh">
                        <table>
                            <tbody>
                            <tr class="identify-table-img-ysh">
                                <th>
                                    <img src="/images/user.png" alt="유저">
                                </th>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr align="center">
                                <th>
                                    <input type="button" class="btn btn-lg btn-dark rounded fs-5" style="color: white; background-color: #0D31B2; border: none;" value="게스트 가입하기">
                                </th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="identify-table-ysh">
                        <table>
                            <tbody>
                            <tr class="identify-table-img-ysh">
                                <th>
                                    <img src="/images/host.png" alt="호스트">
                                </th>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr align="center">
                                <th>
                                    <input type="button" class="btn btn-lg btn-dark rounded fs-5" style="color: white; background-color: #A598FF; border: none;" value="호스트 가입하기">
                                </th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </form>
        </section>
    </div>
    <jsp:include page="${contextPath}/WEB-INF/views/layout/footer.jsp">
        <jsp:param name="pageName" value="footer"/>
    </jsp:include>
</div>
</body>
</html>
