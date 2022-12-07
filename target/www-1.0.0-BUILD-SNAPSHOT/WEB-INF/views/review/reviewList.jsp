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

    <title>리뷰리스트</title>
</head>
<body>
<article>
    <div class="container" id ="test">
        <br>
        <h2>평균 ★ ${avgGrade}</h2>
        <h2>리뷰개수 ${allReviewCount}</h2>
        <br>
        <div>리뷰내용쪽에 사진도 같이 나오게 수정예정</div>
        <div class="table-responsive">
            <table class="table table-striped table-sm">
                <colgroup>
                    <col style="width:10%;" />
                    <col style="width:auto;" />
                    <col style="width:10%;" />
                    <col style="width:10%;" />
                </colgroup>
                <thead>
                <tr>
                    <th>NO</th>
                    <th>리뷰내용</th>
                    <th>평점</th>
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
                                <td><c:out value="${list.reviewId}"/></td>
                                <td><c:out value="${list.contents}"/></td>
                                <td><c:out value="${list.grade}"/></td>
                                <td><fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd"/></td>
                            </tr>
                        </c:forEach>
                    </c:when>
                </c:choose>
                </tbody>
            </table>

            <button type="button" class="btn btn-sm btn-primary" id="registerReview">리뷰쓰기</button>
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
                            <a class="page-link" data-page="${idx}"> ${idx} </a>
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
    $("#registerReview").on("click", function(e) {
        e.preventDefault();
        //뷰 경로 앞에 항상 ${contextPath}를 붙여주세요 -- 서버 설정에 따라 오류가 날 수 있음
        //서버 앱 경로가 빈칸인 경우에는 /reviewForm과 같은 식으로 써도 되는데
        //서버 앱 경로가 빈칸이 아닌 경우에는 ${contextPath} 가 안붙어있으면 에라가 납니다.
        location.href="${contextPath}/reviewForm";
    });

    $(function checkSuccess() {
        let result = "${result}";

        if(result === '') {
            return;
        }

        if(result === "success") {
            alert("리뷰가 등록되었습니다.");
        }
    });
    $(".page-link").on("click", function(e){
        e.preventDefault();
        let pageButton = $(e.target);
        console.log("click"+pageButton);
        let page = pageButton.data("page");
        fn_pagination(page, '${pagination.range}');
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

        var url = "${contextPath}/reviewTest";
        url = url + "?page=" + page;
        url = url + "&range=" + range;

        location.href = url;
    }

    // 페이지 번호 클릭
    function fn_pagination(page, range) {
        var url = "${contextPath}/reviewTest";
        url = url + "?page=" + page;
        url = url + "&range=" + range;

        $.ajax({
        type:"GET",
        url:url,
        success: function(result){
            $("#test").html(result);
        },
        error: function(result){
        alert("에러가 발생했습니다.");
        }

        });

    }

    // 다음 버튼 이벤트
    function fn_next(page, range, rangeSize) {
        var page = parseInt((range * rangeSize)) + 1;
        var range = parseInt(range) + 1;

        var url = "${pageContext.request.contextPath}/reviewTest";
        url = url + "?page=" + page;
        url = url + "&range=" + range;

        location.href = url;
    }
</script>

</body>
</html>