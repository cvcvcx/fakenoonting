<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%  request.setCharacterEncoding("UTF-8"); %>

<article>
    <div class="container" id="reviewListForm">
        <div>
            <div class="row mt-4">
                <div class="col mb-3">
                    <h4>REVIEW<div class="vr mx-1"></div>
                        <c:choose>
                            <c:when test="${productReviewCount == null}">
                                <div>리뷰가 없습니다.</div>
                            </c:when>
                            <c:when test="${productReviewCount != null}">
                                <c:out value="${productReviewCount}" />
                            </c:when>
                        </c:choose>
                    </h4>
                </div>
                <div class="col">
                    <div><a href="#" class="link-secondary">전체 상품 리뷰 보기</a><div class="vr mx-1"></div>
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
            </div>
            <div class="row">
                <div class="col-4 text-center">
                    <div>
                        <span class="material-icons-round" style="color: yellow; font-size: 5em;">
                            star
                        </span>
                        <span style="font-size:5em;">
                            <c:choose>
                                <c:when test="${avgGrade == 0.0}">
                                    <c:out value="0" />
                                </c:when>
                                <c:when test="${avgGrade != 0.0}">
                                    <c:out value="${avgGrade}" />
                                </c:when>
                            </c:choose>
                        </span>
                    </div>
                    ${peopleLikeCount}%의 구매자가 이 상품을 좋아합니다.
                    <form action="${contextPath}/reviewForm">
                        <input type="hidden" name="productId" value="${param.productId}">
                        <button type="submit" class="btn btn-secondary mt-4" id="registerReview">상품 리뷰 작성하기</button>
                    </form>
                </div>

                <div class="col-8">
                    <c:forEach var="item1" items="${getReviewCountListByGrade}" varStatus="status1">
                        <c:forEach var="item2" items="${gradeRate}" varStatus="status2">
                            <c:if test="${status1.count == status2.count}">
                                <div class="col-12">
                                    <div class="d-flex flex-row mb-3">
                                        <div class="col-2">
                                            <c:choose>
                                                <c:when test="${status1.count == 1}">
                                                    아주 좋아요
                                                </c:when>
                                                <c:when test="${status1.count == 2}">
                                                    맘에 들어요
                                                </c:when>
                                                <c:when test="${status1.count == 3}">
                                                    보통이에요
                                                </c:when>
                                                <c:when test="${status1.count == 4}">
                                                    그냥 그래요
                                                </c:when>
                                                <c:when test="${status1.count == 5}">
                                                    별로에요
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <div class="progress m-2 col-9">
                                            <div class="progress-bar bg-dark" role="progressbar" aria-label="progressbar label" style="width: '${item2}%';" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <div class="col-1">
                                            ${item1}
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </div>
            </div>
            <hr />


            <div class="row">
                <div class="col">
                    포토 (11)
                </div>
                <div class="col text-end">
                    <a href="#" class="link-secondary">
                        전체보기
                        <span class="material-icons-round">
                            navigate_next
                        </span>
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <a href="#"><img src="${contextPath}/resources/images/cat1.jpg" width="142" height="157"></a>
<%--                    <a href="#"><img src="images/cat10.jpg" width="142" height="157"></a>--%>
<%--                    <a href="#"><img src="images/cat11.png" width="142" height="157"></a>--%>
<%--                    <a href="#"><img src="images/cat12.png" width="142" height="157"></a>--%>
<%--                    <a href="#"><img src="images/cat13.png" width="142" height="157"></a>--%>
<%--                    <a href="#"><img src="images/cat14.jpg" width="142" height="157"></a>--%>
<%--                    <a href="#"><img src="images/cat15.jpg" width="142" height="157"></a>--%>
<%--                    <a href="#"><img src="images/cat16.png" width="142" height="157"></a>--%>
                </div>
            </div>
            <hr class="mb-0"/>
            <div class="row">
                <div class="col my-auto" style="font-size:20px;">
                    <a href="javascript:void(0);" data-sort="1" onclick="fn_sortRecommend('${pagination.page}', '${pagination.range}', '${review.productId}', '${keyword}')" class="link-secondary" id="recommend" style="text-decoration: none">추천순</a>
                    <a href="javascript:void(0);" data-sort="2" onclick="fn_sortRecently('${pagination.page}', '${pagination.range}', '${review.productId}', '${keyword}')" class="link-secondary" id="recently" style="text-decoration: none">최신순</a>
                    <a href="javascript:void(0);" data-sort="3" onclick="fn_sortGrade('${pagination.page}', '${pagination.range}', '${review.productId}', '${keyword}')" class="link-secondary" id="grade" style="text-decoration: none">평점순</a>
                </div>
                <div class="col my-auto" style="font-size:20px;">
                    <a href="#" class="link-secondary d-flex justify-content-end" style="text-decoration: none">
                        <span class="material-icons-outlined">
                            check_circle
                        </span>포토/동영상 먼저보기
                    </a>
                </div>
                <div class="col">
                    <div class="input-group">
                        <div class="form-floating">
                            <input type="search" name="q" class="form-control" id="searchKeyword" placeholder="search" value="${keyword}">
                            <label for="searchKeyword">리뷰 키워드 검색</label>
                        </div>
                        <button type="button" class="btn btn-secondary" id="searchBtn">
                            <span class="material-icons-round">
                                search
                            </span>
                        </button>
                    </div>
                </div>
            </div>


            <hr class="mt-0 mb-2"/>
            <div class="row">
                <div class="col">
                    <div class="btn-group">
                        <button class="btn btn-outline-dark btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
                            별점
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
                            키
                        </button>
                        <ul class="dropdown-menu">
                            <li><input type="radio" class="btn-check" name="options" id="option1" autocomplete="off">
                                <label class="dropdown-item" for="option1">150 cm 이하</label></li>
                            <li><input type="radio" class="btn-check" name="options" id="option2" autocomplete="off">
                                <label class="dropdown-item" for="option2">150 - 160cm</label></li>
                            <li><input type="radio" class="btn-check" name="options" id="option3" autocomplete="off">
                                <label class="dropdown-item" for="option3">160 - 170cm</label></li>
                            <li><input type="radio" class="btn-check" name="options" id="option4" autocomplete="off">
                                <label class="dropdown-item" for="option4">170 - 180cm</label></li>
                            <li><input type="radio" class="btn-check" name="options" id="option5" autocomplete="off">
                                <label class="dropdown-item" for="option5">180 - 190cm</label></li>
                            <li><input type="radio" class="btn-check" name="options" id="option6" autocomplete="off">
                                <label class="dropdown-item" for="option6">190 cm 이상</label></li>
                            <li><a class="dropdown-item btn" href="#">확인</a></li>
                        </ul>
                    </div>
                    <div class="btn-group">
                        <button class="btn btn-outline-dark btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
                            몸무게
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item btn" href="#">확인</a></li>
                        </ul>
                    </div>
                    <div class="btn-group">
                        <button class="btn btn-outline-dark btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
                            평소사이즈-상의
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item btn" href="#">확인</a></li>
                        </ul>
                    </div>
                    <div class="btn-group">
                        <button class="btn btn-outline-dark btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
                            평소사이즈-하의
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


            <div class="row table">
                <tbody>
                <c:choose>
                    <c:when test="${empty dataList}" >
                        <tr><td colspan="5" align-text="center">리뷰가 없습니다.</td></tr>
                    </c:when>
                    <c:when test="${!empty dataList}">
                        <c:forEach var="list" items="${dataList}">
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
                                <div class="text-secondary"><td><fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd"/></td></div>
                            </div>
                            <div class="col-12 mt-2">
                                <td><p><c:out value="${list.contents}"/></p></td>
                                <div class="col-12 mt-3">
                                    사진 사진 사진
<%--                                    <a href="#"><img src="images/cat22.jpg" width="142" height="157"></a>--%>
<%--                                    <a href="#"><img src="images/cat21.jpg" width="142" height="157"></a>--%>
<%--                                    <a href="#"><img src="images/cat20.jpg" width="142" height="157"></a>--%>
                                </div>
                            </div>
                            <div class="col-12 mt-2">
                                <a href="#" class="link-secondary">
                                    <span class="material-icons-outlined">
                                        thumb_up
                                    </span>
                                    도움돼요 3
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
                                <div><span class="fw-bold"><c:out value="${list.memberId}"/>(멤버아이디 닉네임으로수정??)</span>님의 리뷰입니다.</div>
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
                        </c:forEach>
                    </c:when>
                </c:choose>
                </tbody>
            </div>
            <hr />


            <div class="m-3">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <c:if test="${pagination.prev}">
                            <li class="page-item">
                                <a class="page-link link-dark"
                                   href="javascript:void(0);"
                                   onclick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${review.productId}', '${sortNum}', '${keyword}')"
                                   aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach var="idx" begin="${pagination.startPage}" end="${pagination.endPage}">
                            <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
                                <a class="page-link link-dark"
                                   href="javascript:void(0);"
                                   onclick="fn_pagination('${idx}', '${pagination.range}', '${review.productId}', '${sortNum}', '${keyword}')">
                                    ${idx}
                                </a>
                            </li>
                        </c:forEach>

                        <c:if test="${pagination.next}">
                            <li class="page-item">
                                <a class="page-link link-dark"
                                   href="javascript:void(0);"
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
    </div>
</article>



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

    function fn_sortCommon(page, range, productId, sortNum, contents) {
        $.ajax({
            type: "get",
            url: "${contextPath}/reviewList",
            data: {
                productId: productId,
                page: page,
                range: range,
                sortNum: sortNum,
                keyword: contents
            },
            success: function(result){
                $("#reviewListForm").html(result);
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
            url: "${contextPath}/reviewList",
            data: {
                page: page,
                range: range,
                productId: productId,
                sortNum: sortNum,
                keyword: contents
            },
            success: function(result){
                $("#reviewListForm").html(result);
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

    $(function(e){
        $("input[id='keyword']").on(
            "propertychange changer keyup paste input",
            function(e) {
                fn_keywordOnChange($(this));
            }
        );

        $('#searchBtn').on('click', function(e){
            e.preventDefault();

            $.ajax({
                type: "get",
                url: "${contextPath}/reviewList",
                data: {
                    productId: "${review.productId}",
                    page: 1,
                    range: 1,
                    sortNum: "${sortNum}",
                    keyword: $("#searchKeyword").val()
                },
                success: function(result){
                    $("#reviewListForm").html(result);
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
        });
    });

    function fn_keywordOnChange(e) {
        let changedValue = $(e).val();
        e.attr("value", changedValue);
    }

</script>













<%--    <div class="container" id="reviewListForm">--%>

<%--        <br>--%>
<%--        <h2>아이템번호 ${param.productId}</h2>--%>
<%--        <h2>평점 ★--%>
<%--            <c:choose>--%>
<%--                <c:when test="${avgGrade == 0}">--%>
<%--                    <c:out value="0" />--%>
<%--                </c:when>--%>
<%--                <c:when test="${avgGrade != 0}">--%>
<%--                    <c:out value="${avgGrade}" />--%>
<%--                </c:when>--%>
<%--            </c:choose>--%>
<%--        </h2>--%>
<%--        <h2>리뷰개수--%>
<%--            <c:choose>--%>
<%--                <c:when test="${productReviewCount == null}">--%>
<%--                    <div>리뷰가 없습니다.</div>--%>
<%--                </c:when>--%>
<%--                <c:when test="${productReviewCount != null}">--%>
<%--                    <c:out value="${productReviewCount}" />--%>
<%--                </c:when>--%>
<%--            </c:choose>--%>
<%--        </h2>--%>
<%--        <br>--%>

<%--        <div class="col my-auto" style="font-size:20px;">--%>
<%--            <a href="javascript:void(0);" data-sort="1" onclick="fn_sortRecommend('${pagination.page}', '${pagination.range}', '${param.productId}')" class="link-secondary" id="recommend">추천순</a>--%>
<%--            <a href="javascript:void(0);" data-sort="2" onclick="fn_sortRecently('${pagination.page}', '${pagination.range}', '${param.productId}')" class="link-secondary" id="recently">최신순</a>--%>
<%--            <a href="javascript:void(0);" data-sort="3" onclick="fn_sortGrade('${pagination.page}', '${pagination.range}', '${param.productId}')" class="link-secondary" id="grade">평점순</a>--%>
<%--        </div>--%>
<%--        <br>--%>

<%--        <div class="table-responsive">--%>
<%--            <table class="table table-striped table-sm">--%>
<%--                <colgroup>--%>
<%--                    <col style="width:10%;" />--%>
<%--                    <col style="width:auto;" />--%>
<%--                    <col style="width:10%;" />--%>
<%--                    <col style="width:10%;" />--%>
<%--                </colgroup>--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th>NO</th>--%>
<%--                    <th>리뷰내용</th>--%>
<%--                    <th>평점</th>--%>
<%--                    <th>작성일</th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody>--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${empty dataList}" >--%>
<%--                        <tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>--%>
<%--                    </c:when>--%>
<%--                    <c:when test="${!empty dataList}">--%>
<%--                        <c:forEach var="list" items="${dataList}">--%>
<%--                            <tr>--%>
<%--                                <td><c:out value="${list.reviewId}"/></td>--%>
<%--                                <td><c:out value="${list.contents}"/></td>--%>
<%--                                <td><c:out value="${list.grade}"/></td>--%>
<%--                                <td><fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd"/></td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                    </c:when>--%>
<%--                </c:choose>--%>
<%--                </tbody>--%>
<%--            </table>--%>

<%--            <form action="${contextPath}/reviewForm">--%>
<%--                <input type="hidden" name="productId" value="${param.productId}">--%>
<%--                <button type="submit" class="btn btn-sm btn-primary" id="registerReview">리뷰쓰기</button>--%>
<%--            </form>--%>
<%--            <br>--%>

<%--            <div id="paginationBox">--%>
<%--                <ul class="pagination">--%>
<%--                    <c:if test="${pagination.prev}">--%>
<%--                        <li class="page-item">--%>
<%--                            <a class="page-link"--%>
<%--                               href="javascript:void(0);"--%>
<%--                               onclick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${param.productId}', '${param.sortNum}')">Previous</a>--%>
<%--                        </li>--%>
<%--                    </c:if>--%>

<%--                    <c:forEach var="idx" begin="${pagination.startPage}" end="${pagination.endPage}">--%>
<%--                        <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">--%>
<%--                            <a class="page-link"--%>
<%--                               href="javascript:void(0);"--%>
<%--                               onclick="fn_pagination('${idx}', '${pagination.range}', '${param.productId}', '${param.sortNum}')"> ${idx} </a>--%>
<%--                        </li>--%>
<%--                    </c:forEach>--%>

<%--                    <c:if test="${pagination.next}">--%>
<%--                        <li class="page-item">--%>
<%--                            <a class="page-link"--%>
<%--                               href="javascript:void(0);"--%>
<%--                               onclick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${param.productId}', '${param.sortNum}')">Next</a>--%>
<%--                        </li>--%>
<%--                    </c:if>--%>
<%--                </ul>--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </div>--%>