<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%  request.setCharacterEncoding("UTF-8"); %>


    <style>
        body {
            padding-top: 70px;
            padding-bottom: 30px;
        }
    </style>
    <title>문의리스트</title>
</head>
<body>
<article>

    <div>
        <div class="row align-items-center justify-content-center">
            <div class="col-12 text-center mt-4 mb-4">
                <h4>Q and A</h4>
                <div class="text-secondary">상품에 대해 궁금한 점을 해결해 드립니다.</div>
            </div>
        </div>
        <div class="container">
            <!--
                        <h2>문의개수 ${allQuestionCount}</h2>
                        <h2>문의조회, 수정, 삭제, 검색기능 추가필요</h2>
                        -->
            <table class="table table-hover text-center">
                <thead class="table-light">
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">카테고리</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>배송문의</td>
                    <td>옷 언제와요</td>
                    <td>조**</td>
                    <td>2022-12-07</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>배송문의</td>
                    <td>주말은 배송안하나요</td>
                    <td>조**</td>
                    <td>2022-12-07</td>
                </tr>
                </tbody>
            </table>
            <div class="d-flex justify-content-end">
                <a href="#" class="btn btn-secondary m-1 btn-sm">상품문의하기</a>
                <a href="#" class="btn btn-light m-1 btn-sm">모두보기</a>
            </div>
        </div>
        <!-- end tab item -->
        <div class="">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link link-dark" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link link-dark" href="#">1</a></li>
                    <li class="page-item"><a class="page-link link-dark" href="#">2</a></li>
                    <li class="page-item"><a class="page-link link-dark" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link link-dark" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>


</article>

<%--<script>--%>
<%--    $("#registerQuestion").on("click", function(e) {--%>
<%--        e.preventDefault();--%>
<%--        location.href="${contextPath}/questionForm";--%>
<%--    });--%>

<%--    $(function checkSuccess() {--%>
<%--        let result = "${result}";--%>

<%--        if(result === '') {--%>
<%--            return;--%>
<%--        }--%>

<%--        if(result === "success") {--%>
<%--            alert("문의가 등록되었습니다.");--%>
<%--        }--%>
<%--    });--%>

<%--    $("#btnProductDetails").on("click", function(e) {--%>
<%--        e.preventDefault();--%>
<%--        location.href="/product/detail";--%>
<%--    });--%>
<%--</script>--%>

<%--<script>--%>
<%--    // 이전 버튼 이벤트--%>
<%--    function fn_prev(page, range, rangeSize) {--%>
<%--        var page = ((range - 2) * rangeSize) + 1;--%>
<%--        var range = range - 1;--%>

<%--        var url = "${pageContext.request.contextPath}/questionTest";--%>
<%--        url = url + "?page=" + page;--%>
<%--        url = url + "&range=" + range;--%>

<%--        location.href = url;--%>
<%--    }--%>

<%--    // 페이지 번호 클릭--%>
<%--    function fn_pagination(page, range) {--%>
<%--        var url = "${pageContext.request.contextPath}/questionTest";--%>
<%--        url = url + "?page=" + page;--%>
<%--        url = url + "&range=" + range;--%>

<%--        location.href = url;--%>
<%--    }--%>

<%--    // 다음 버튼 이벤트--%>
<%--    function fn_next(page, range, rangeSize) {--%>
<%--        var page = parseInt((range * rangeSize)) + 1;--%>
<%--        var range = parseInt(range) + 1;--%>

<%--        var url = "${pageContext.request.contextPath}/questionTest";--%>
<%--        url = url + "?page=" + page;--%>
<%--        url = url + "&range=" + range;--%>

<%--        location.href = url;--%>
<%--    }--%>
<%--</script>--%>



<%--<div class="container">--%>
<%--    <br>--%>
<%--    <h2>문의개수 ${allQuestionCount}</h2>--%>
<%--    <h2>문의조회, 수정, 삭제, 검색기능 추가필요</h2>--%>
<%--    <br>--%>
<%--    <div class="table-responsive">--%>
<%--        <table class="table table-striped table-sm">--%>
<%--            <colgroup>--%>
<%--                <col style="width:10%;" />--%>
<%--                <col style="width:10%;" />--%>
<%--                <col style="width:auto;" />--%>
<%--                <col style="width:10%;" />--%>
<%--                <col style="width:10%;" />--%>
<%--            </colgroup>--%>
<%--            <thead>--%>
<%--            <tr>--%>
<%--                <th>NO</th>--%>
<%--                <th>카테고리</th>--%>
<%--                <th>제목</th>--%>
<%--                <th>작성자</th>--%>
<%--                <th>작성일</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <c:choose>--%>
<%--                <c:when test="${empty boardList}" >--%>
<%--                    <tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>--%>
<%--                </c:when>--%>
<%--                <c:when test="${!empty boardList}">--%>
<%--                    <c:forEach var="list" items="${boardList}">--%>
<%--                        <tr>--%>
<%--                            <td><c:out value="${list.questionId}"/></td>--%>
<%--                            <td><c:out value="${list.category}"/></td>--%>
<%--                            <td><c:out value="${list.title}"/></td>--%>
<%--                            <td><c:out value="${list.memberId}"/></td>--%>
<%--                            <td><fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd"/></td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                </c:when>--%>
<%--            </c:choose>--%>
<%--            </tbody>--%>
<%--        </table>--%>

<%--        <button type="button" class="btn btn-sm btn-primary" id="registerQuestion">문의하기</button>--%>
<%--        <button type="button" class="btn btn-sm btn-primary" id="btnProductDetails">뒤로가기</button>--%>
<%--        <br>--%>
<%--        <br>--%>

<%--        <div id="paginationBox">--%>
<%--            <ul class="pagination">--%>
<%--                <c:if test="${pagination.prev}">--%>
<%--                    <li class="page-item">--%>
<%--                        <a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>--%>
<%--                    </li>--%>
<%--                </c:if>--%>

<%--                <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">--%>
<%--                    <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">--%>
<%--                        <a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>--%>
<%--                    </li>--%>
<%--                </c:forEach>--%>

<%--                <c:if test="${pagination.next}">--%>
<%--                    <li class="page-item">--%>
<%--                        <a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a>--%>
<%--                    </li>--%>
<%--                </c:if>--%>
<%--            </ul>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--</div>--%>