<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%  request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
          crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
    <div class="container">
        <br>
        <h2>문의개수 ${allQuestionCount}</h2>
        <h2>문의조회, 수정, 삭제, 검색기능 추가필요</h2>
        <br>
        <div class="table-responsive">
            <table class="table table-striped table-sm">
                <colgroup>
                    <col style="width:10%;" />
                    <col style="width:10%;" />
                    <col style="width:auto;" />
                    <col style="width:10%;" />
                    <col style="width:10%;" />
                </colgroup>
                <thead>
                <tr>
                    <th>NO</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${empty boardList}" >
                        <tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
                    </c:when>
                    <c:when test="${!empty boardList}">
                        <c:forEach var="list" items="${boardList}">
                            <tr>
                                <td><c:out value="${list.questionId}"/></td>
                                <td><c:out value="${list.category}"/></td>
                                <td><c:out value="${list.title}"/></td>
                                <td><c:out value="${list.memberId}"/></td>
                                <td><fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd"/></td>
                            </tr>
                        </c:forEach>
                    </c:when>
                </c:choose>
                </tbody>
            </table>

            <button type="button" class="btn btn-sm btn-primary" id="registerQuestion">문의하기</button>
            <button type="button" class="btn btn-sm btn-primary" id="btnProductDetails">뒤로가기</button>
            <br>
            <br>

            <div id="paginationBox">
                <ul class="pagination">
                    <c:if test="${pagination.prev}">
                        <li class="page-item">
                            <a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
                        </li>
                    </c:if>

                    <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
                        <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
                            <a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
                        </li>
                    </c:forEach>

                    <c:if test="${pagination.next}">
                        <li class="page-item">
                            <a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a>
                        </li>
                    </c:if>
                </ul>
            </div>

        </div>
    </div>
</article>

<script>
    $("#registerQuestion").on("click", function(e) {
        e.preventDefault();
        location.href="${contextPath}/questionForm";
    });

    $(function checkSuccess() {
        let result = "${result}";

        if(result === '') {
            return;
        }

        if(result === "success") {
            alert("문의가 등록되었습니다.");
        }
    });

    $("#btnProductDetails").on("click", function(e) {
        e.preventDefault();
        location.href="/product/detail";
    });
</script>

<script>
    // 이전 버튼 이벤트
    function fn_prev(page, range, rangeSize) {
        var page = ((range - 2) * rangeSize) + 1;
        var range = range - 1;

        var url = "${pageContext.request.contextPath}/questionTest";
        url = url + "?page=" + page;
        url = url + "&range=" + range;

        location.href = url;
    }

    // 페이지 번호 클릭
    function fn_pagination(page, range) {
        var url = "${pageContext.request.contextPath}/questionTest";
        url = url + "?page=" + page;
        url = url + "&range=" + range;

        location.href = url;
    }

    // 다음 버튼 이벤트
    function fn_next(page, range, rangeSize) {
        var page = parseInt((range * rangeSize)) + 1;
        var range = parseInt(range) + 1;

        var url = "${pageContext.request.contextPath}/questionTest";
        url = url + "?page=" + page;
        url = url + "&range=" + range;

        location.href = url;
    }
</script>

</body>
</html>