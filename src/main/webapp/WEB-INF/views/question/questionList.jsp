<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%  request.setCharacterEncoding("UTF-8"); %>


<article>
    <div>
        <div class="row align-items-center justify-content-center">
            <div class="col-12 text-center mt-4 mb-4">
                <h4>Q and A</h4>
                <div class="text-secondary">상품에 대해 궁금한 점을 해결해 드립니다.</div>
            </div>
        </div>
        <div class="container">
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
                    <c:choose>
                        <c:when test="${empty quesList}" >
                            <tr><td colspan="5" align-text="center">문의내역이 없습니다.</td></tr>
                        </c:when>
                        <c:when test="${!empty quesList}">
                            <c:forEach var="list" items="${quesList}" varStatus="status">
                                <tr>
                                    <th scope="row">${prodQuesCnt - status.index - pagination.startList}</th>
                                    <td>
                                        <c:if test="${list.category == '1'.charAt(0)}">
                                            상품문의
                                        </c:if>
                                        <c:if test="${list.category == '2'.charAt(0)}">
                                            배송문의
                                        </c:if>
                                        <c:if test="${list.category == '3'.charAt(0)}">
                                            교환/반품/취소문의
                                        </c:if>
                                        <c:if test="${list.category == '4'.charAt(0)}">
                                            기타문의
                                        </c:if>
                                    </td>
                                    <td>${list.title}</td>
                                    <td>${list.memberId} 닉네임으로수정</td>
                                    <td><fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd"/></td>
                                </tr>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </tbody>
            </table>
            <div class="d-flex justify-content-end">
                <a href="${contextPath}/questionForm?productId=${question.productId}" class="btn btn-secondary m-1 btn-sm">상품문의하기</a>
                <a href="#" class="btn btn-light m-1 btn-sm">모두보기</a>
            </div>
        </div>
        <!-- end tab item -->
        <div class="">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <c:if test="${pagination.prev}">
                        <li class="page-item">
                            <a class="page-link link-dark"
                               href="#qanda"
                               onclick="fn_quesPrev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${question.productId}')"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="idx" begin="${pagination.startPage}" end="${pagination.endPage}">
                        <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
                            <a class="page-link link-dark"
                               href="#qanda"
                               onclick="fn_quesNum('${idx}', '${pagination.range}', '${question.productId}')">
                                    ${idx}
                            </a>
                        </li>
                    </c:forEach>
                    <c:if test="${pagination.next}">
                        <li class="page-item">
                            <a class="page-link link-dark"
                               href="#qanda"
                               onclick="fn_quesNext('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${question.productId}')"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</article>


<script>
    <%--$(function checkSuccess() {--%>
    <%--    let result = "${quesRegResult}";--%>

    <%--    if(result === '') {--%>
    <%--        return;--%>
    <%--    }--%>

    <%--    if(result === "quesRegSuccess") {--%>
    <%--        alert("문의가 등록되었습니다.");--%>
    <%--    }--%>
    <%--});--%>

    function fn_quesPrev(page, range, rangeSize, productId) {
        var page = ((range - 2) * rangeSize) + 1;
        var range = range - 1;

        $.ajax({
            type: "get",
            url: "${contextPath}/questionList",
            data: {
                page: page,
                range: range,
                productId: productId
            },
            success: function (result) {
                $("#questionList").html(result);
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

    function fn_quesNum(page, range, productId) {
        $.ajax({
            type: "get",
            url: "${contextPath}/questionList",
            data: {
                page: page,
                range: range,
                productId: productId
            },
            success: function (result) {
                $("#questionList").html(result);
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

    function fn_quesNext(page, range, rangeSize, productId) {
        var page = parseInt((range * rangeSize)) + 1;
        var range = parseInt(range) + 1;

        $.ajax({
            type: "get",
            url: "${contextPath}/questionList",
            data: {
                page: page,
                range: range,
                productId: productId
            },
            success: function (result) {
                $("#questionList").html(result);
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
</script>

        <%--$.ajax({--%>
        <%--    type: "get",--%>
        <%--    url: "${contextPath}/questionList",--%>
        <%--    data: {--%>
        <%--        page: ${pagination.page},--%>
        <%--        range: ${pagination.range},--%>
        <%--        productId: ${question.productId}--%>
        <%--    },--%>
        <%--    success: function (result) {--%>
        <%--        alert("성공");--%>
        <%--        $("#questionListForm").html(result);--%>
        <%--    },--%>
        <%--    error: function (request, error) {--%>
        <%--        alert(--%>
        <%--            "code:" +--%>
        <%--            request.status +--%>
        <%--            "\n" +--%>
        <%--            "message:" +--%>
        <%--            request.responseText +--%>
        <%--            "\n" +--%>
        <%--            "error:" +--%>
        <%--            error--%>
        <%--        );--%>
        <%--    }--%>
        <%--});--%>





<%--    $("#btnProductDetails").on("click", function(e) {--%>
<%--        e.preventDefault();--%>
<%--        location.href="/product/detail";--%>
<%--    });--%>




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