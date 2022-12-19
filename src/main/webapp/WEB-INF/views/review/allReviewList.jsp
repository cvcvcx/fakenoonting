<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%  request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined|Material+Icons+Round"
          rel="stylesheet">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
          crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous">
    </script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
            crossorigin="anonymous">
    </script>
    <style>
        footer {
            background-color: rgb(249, 249, 249);
        }
        a {
            text-decoration: none;
        }
    </style>
    <title>kikerday</title>
</head>
<body>
<!-- header -->
<jsp:include page="../common/header.jsp" flush="false" />
<hr>

<article>
    <section>
        <div class="container">
            <div class="row mt-4">
                <div class="col-9 mb-3">
                    <h5 class="fw-bold">REVIEW<div class="vr mx-1"></div>전체 리뷰 보기</h5>
                </div>
                <div class="col-3">
                    <div class="modal fade" id="textModal" aria-hidden="true" aria-labelledby="textModalLabel" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5 text-secondary" id="textModalLabel">공지사항 1</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <button class="btn btn-light" data-bs-target="#textModal2" data-bs-toggle="modal"><b>리뷰 적립금 안내</b><br>[리뷰 포인트 적립 기준]<br>2022.12.09</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="textModal2" aria-hidden="true" aria-labelledby="textModalLabel2" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5 text-secondary" id="textModalLabel2">공지사항 자세히 보기</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <h3>리뷰 적립금 안내</h3>
                                    <div class="text-secondary mb-3">2022.12.09</div><hr />
                                    [리뷰 포인트 적립 기준]<br />
                                    <b>포토리뷰 1000원 / 텍스트 리뷰 500원</b><br />
                                    1만원 미만 상품은 적립금이 지급 되지 않습니다.<br />
                                    비회원으로 구매시 적립금이 지급 되지 않습니다.<br />
                                    후기 작성 후 교환/반품 할 경우 적립된 포인트는 자동으로 차감됩니다.<br />
                                    품절된 지 10일 지난 상품일 경우 적립금이 지급 되지 않습니다.<br />
                                    상품 배송 완료 후 30일이 지난 경우 적립금이 지급되지 않습니다.<br />
                                    적립금으로만 구매한 상품일 경우 적립금이 지급되지 않습니다.
                                    <p class="text-decoration-underline">*문의글 혹은 악의 적인 비방글은 무통보 삭제된다는 점 유의해주세요!*</p>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-secondary" data-bs-target="#textModal" data-bs-toggle="modal">뒤로 가기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="link-secondary" data-bs-toggle="modal" href="#textModal" role="button">공지사항 1</a>
                </div>
            </div>
            <hr class="m-0"/>
            <div class="row">
                <div class="col my-auto" style="font-size:20px;">
                    <a href="#" data-sort="1" onclick="fn_sortRecommend('${pagination.page}', '${pagination.range}', '${review.productId}', '${keyword}')" class="link-secondary" id="recommend" style="text-decoration: none">추천순</a>
                    <a href="#" data-sort="2" onclick="fn_sortRecently('${pagination.page}', '${pagination.range}', '${review.productId}', '${keyword}')" class="link-secondary" id="recently" style="text-decoration: none">최신순</a>
                    <a href="#" data-sort="3" onclick="fn_sortGrade('${pagination.page}', '${pagination.range}', '${review.productId}', '${keyword}')" class="link-secondary" id="grade" style="text-decoration: none">평점순</a>
                </div>
                <div class="col">
                    <div class="input-group">
                        <div class="form-floating">
                            <input type="search" name="q" class="form-control" id="searchKeyword" placeholder="search" value="${keyword}">
                            <label for="searchKeyword">리뷰 키워드 검색</label>
                        </div>
                        <a type="button" class="btn btn-secondary" id="searchBtn" href="#" onclick="fn_searchBtn(${sortNum})">
                            <span class="material-icons-round">
                                search
                            </span>
                        </a>
                    </div>
                </div>
            </div>
            <hr class="mt-0 mb-2"/>
            <div class="row">
                <div class="col">
                    <div class="btn-group">
                        <button class="btn btn-outline-dark btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
                            전체 카테고리
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><button class="dropdown-item btn btn-black">확인</button></li>
                        </ul>
                    </div>
                    <div class="btn-group">
                        <button class="btn btn-outline-dark btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
                            별점
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item btn" href="#">확인</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <hr class="mt-2" />
            <c:choose>
                <c:when test="${empty dataList}" >
                    <tr><td colspan="5" align-text="center">리뷰가 없습니다.</td></tr>
                </c:when>
                <c:when test="${!empty dataList}">
                    <c:forEach var="list" items="${dataList}">
                    <div class="row">
                        <div class="col-8">
                            <div class="col-12">
                                <c:forEach var="star" begin="1" end="${list.grade}">
                                    <span class="material-icons-round" style="color: yellow; font-size: 2em;">
                                        star
                                    </span>
                                </c:forEach>
                                <c:forEach var="star" begin="1" end="${5-list.grade}">
                                    <span class="material-icons-round" style="color: gray; font-size: 2em;">
                                        star
                                    </span>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${list.grade == 1}">
                                        <span>별로에요</span>
                                    </c:when>
                                    <c:when test="${list.grade == 2}">
                                        <span>그냥 그래요</span>
                                    </c:when>
                                    <c:when test="${list.grade == 3}">
                                        <span>보통이에요</span>
                                    </c:when>
                                    <c:when test="${list.grade == 4}">
                                        <span>맘에 들어요</span>
                                    </c:when>
                                    <c:when test="${list.grade == 5}">
                                        <span>아주 좋아요</span>
                                    </c:when>
                                </c:choose>
                                <div class="text-secondary"><td><fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd"/></td></div>
                            </div>
                            <div class="col-12 my-2">
                                <c:forEach items="${productImg}" var="pImg">
                                    <c:if test="${list.productId eq pImg.foreignId}">
                                        <a href="${contextPath}/product/detail?id=${pImg.foreignId}">
                                            <img src="${contextPath}/util/upload/display?fileName=${pImg.uploadPath}/s_${pImg.imgUUID}_${pImg.orgImgName}"
                                                 class="link-dark fw-bold" width="48" height="48" alt="상품사진">
                                                    <c:forEach items="${productName}" var="pName">
                                                        <c:if test="${list.productId eq pName.id}">
                                                            ${pName.productName}
                                                        </c:if>
                                                    </c:forEach>
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="col-12 mt-2">
                                <td>
                                    <p><c:out value="${list.contents}"/></p>
                                </td>
                                <div class="col-12 mt-3">
                                    <c:forEach items="${reviewImg}" var="img">
                                        <c:if test="${list.reviewId eq img.reviewId}">
                                            <a href="#">
                                                <img src="${contextPath}/util/upload/display?fileName=${img.uploadPath}/s_${img.imgUUID}_${img.orgImgName}"
                                                     class="card-img-top" style="width:142px; height:157px" alt="리뷰사진">
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="col-12 mt-2">
                                <a href="#" class="link-secondary">
                                            <span class="material-icons-outlined">
                                                thumb_up
                                            </span>도움돼요 3
                                </a>
                                <a href="#" class="link-secondary mx-2">
                                            <span class="material-icons-outlined">
                                                thumb_down
                                            </span>
                                    도움안돼요 1
                                </a>
                                <div class="vr"></div>
                                <a href="#" class="link-secondary mx-2">댓글 0</a>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="col-12 mb-1">
                                <div><span class="fw-bold"><c:out value="${list.nickname}"/></span>님의 리뷰입니다.</div>
                            </div>
                            <div class="row text-secondary">
                                <div>키 : <span class="mx-1">160cm</span></div>
                                <div>몸무게 : <span class="mx-1">40kg</span></div>
                                <div>평소사이즈-상의 : <span class="mx-1">S</span></div>
                                <div>평소사이즈-하의 : <span class="mx-1">25</span></div>
                                <div>색상 : <span class="mx-1">블랙</span></div>
                                <div>사이즈 : <span class="mx-1">S</span></div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    </c:forEach>
                </c:when>
            </c:choose>


            <div class="m-3">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <c:if test="${pagination.prev}">
                            <li class="page-item">
                                <a class="page-link link-dark"
                                   href="#"
                                   onclick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${review.productId}', '${sortNum}', '${keyword}')"
                                   aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach var="idx" begin="${pagination.startPage}" end="${pagination.endPage}">
                            <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
                                <a class="page-link link-dark"
                                   href="#"
                                   onclick="fn_pagination('${idx}', '${pagination.range}', '${review.productId}', '${sortNum}', '${keyword}')">
                                        ${idx}
                                </a>
                            </li>
                        </c:forEach>

                        <c:if test="${pagination.next}">
                            <li class="page-item">
                                <a class="page-link link-dark"
                                   href="#"
                                   onclick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${review.productId}', '${sortNum}', '${keyword}')"
                                   aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </section>
</article>

<!-- footer -->
<hr />
<jsp:include page="../common/footer.jsp" flush="false" />

<script>
    function fn_sortCommon(page, range, productId, sortNum, contents) {
        $.ajax({
            type: "get",
            url: "${contextPath}/allReviewList",
            data: {
                productId: productId,
                page: page,
                range: range,
                sortNum: sortNum,
                keyword: contents
            },
            success: function(result){
                $("body").html(result);
            },
            error: function(request, error){
                alert(
                    "code:" +
                    request.status +
                    "\n" +
                    "message:" +
                    request.responseText +
                    "\n" +
                    "error:" +
                    error
                );
            }
        });
    }

    function fn_sortRecommend(page, range, productId, contents) {
        var element = document.getElementById("recommend");
        var sortNum = element.dataset.sort;
        fn_sortCommon(page, range, productId, sortNum, contents);
    }

    function fn_sortRecently(page, range, productId, contents) {
        var element = document.getElementById("recently");
        var sortNum = element.dataset.sort;
        fn_sortCommon(page, range, productId, sortNum, contents);
    }

    function fn_sortGrade(page, range, productId, contents) {
        var element = document.getElementById("grade");
        var sortNum = element.dataset.sort;
        fn_sortCommon(page, range, productId, sortNum, contents);
    }

    function fn_pagingCommon(page, range, productId, sortNum, contents) {
        $.ajax({
            type: "get",
            url: "${contextPath}/allReviewList",
            data: {
                page: page,
                range: range,
                productId: productId,
                sortNum: sortNum,
                keyword: contents
            },
            success: function(result){
                $("body").html(result);
            },
            error: function(request, error){
                alert(
                    "code:" +
                    request.status +
                    "\n" +
                    "message:" +
                    request.responseText +
                    "\n" +
                    "error:" +
                    error
                );
            }
        });
    }

    function fn_prev(page, range, rangeSize, productId, sortNum, contents) {
        var page = ((range - 2) * rangeSize) + 1;
        var range = range - 1;
        fn_pagingCommon(page, range, productId, sortNum, contents);
    }

    function fn_pagination(page, range, productId, sortNum, contents) {
        fn_pagingCommon(page, range, productId, sortNum, contents);
    }

    function fn_next(page, range, rangeSize, productId, sortNum, contents) {
        var page = parseInt((range * rangeSize)) + 1;
        var range = parseInt(range) + 1;
        fn_pagingCommon(page, range, productId, sortNum, contents);
    }

    function fn_searchBtn(sortNum) {
        $.ajax({
            type: "get",
            url: "${contextPath}/allReviewList",
            data: {
                page: 1,
                range: 1,
                sortNum: sortNum,
                keyword: $("#searchKeyword").val()
            },
            success: function(result){
                $("body").html(result);
            },
            error: function(request, error){
                alert(
                    "code:" +
                    request.status +
                    "\n" +
                    "message:" +
                    request.responseText +
                    "\n" +
                    "error:" +
                    error
                );
            }
        });
    }

    var input = document.getElementById("searchKeyword");
    input.addEventListener("keyup", function (event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("searchBtn").click();
        }
    });

</script>

</body>
</html>