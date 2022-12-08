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
        <h2>아이템번호 ${product.id}</h2>
        <h2>평점 ★
            <c:choose>
                <c:when test="${avgGrade == 0}">
                    <c:out value="0" />
                </c:when>
                <c:when test="${avgGrade != 0}">
                    <c:out value="${avgGrade}" />
                </c:when>
            </c:choose>
        </h2>
        <h2>리뷰개수
            <c:choose>
                <c:when test="${productReviewCount == null}">
                    <div>리뷰가 없습니다.</div>
                </c:when>
                <c:when test="${productReviewCount != null}">
                    <c:out value="${productReviewCount}" />
                </c:when>
            </c:choose>
        </h2>
        <br>

        <a class="sortRegDate">최신순</a>

<%--        sort값을 전달해야함--%>
        <a class="sortGrade" href="#" data-sort="2">평점순</a>
        <br>

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

            <form action="${contextPath}/reviewForm">
                <input type="hidden" name="productId" value="${product.id}">
                <button type="submit" class="btn btn-sm btn-primary" id="registerReview">리뷰쓰기</button>
            </form>
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
                            <a class="page-link" data-page="${idx}" data-sort="${sort}"> ${idx} </a>
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
    function fn_grade() {
        // 여기서 sort값만 정달해주면되늗??

    }
</script>

<script>
    $(function checkSuccess() {
        let result = "${result}";

        if(result === '') {
            return;
        }

        if(result === "success") {
            alert("리뷰가 등록되었습니다.");
        }
    });
</script>

<script>

    $(".sortGrade").on("click", function(e){
        e.preventDefault();
        let sort = 2;
        <%--alert(${sort});--%>

        // let pageButton = $(e.target);
        // let sort = pageButton.data("sort");
        // alert("sort값 2로 변경   sort: " + sort);
        // return true;
        // 이 값을 유지해서 밑에 보내줘야하는데

        var url = "${contextPath}/product/detail";
        url = url + "?id=" + ${product.id};
        url = url + "&page=" + page;
        url = url + "&range=" + range;

        $.ajax({
            type: "POST",
            url: url,
            data: "sort" + sort,
            success: function(result){
                alert("sort성공");
            },
            error: function(result){
                alert("sort에러");
            }
        });
    });


    // let val = $(".sortGrade").data("sort");
    // alert("sortGrade값은" + val);

    $(".page-link").on("click", function(e){
        e.preventDefault();
        let pageButton = $(e.target);
        let page = pageButton.data("page");

        let sort;
        if (fn_grade() == true) {
            sort = 2;
        } else {
            sort = 1;
        }

        alert("넘어가는sort값은????   " + sort);
        fn_pagination(page, '${pagination.range}', sort);
    });

    // 이전 버튼 이벤트
    function fn_prev(page, range, rangeSize) {
        var page = ((range - 2) * rangeSize) + 1;
        var range = range - 1;

        var url = "${contextPath}/product/detail";
        url = url + "?id=" + ${product.id};
        url = url + "&page=" + page;
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

    // 페이지 번호 클릭
    function fn_pagination(page, range, sort) {
        if(page == null) return false;

        <%--alert("asdasdasdasd" + ${param.sort});--%>
        var url = "${contextPath}/product/detail";
        url = url + "?id=" + ${product.id};
        url = url + "&page=" + page;
        url = url + "&range=" + range;
        url = url + "&sort=" + sort;

        $.ajax({
            type:"GET",
            url:url,
            data:{"sort": "sort"},
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

        var url = "${contextPath}/product/detail";
        url = url + "?id=" + ${product.id};
        url = url + "&page=" + page;
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
</script>

</body>
</html>