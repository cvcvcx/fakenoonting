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
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
            crossorigin="anonymous">
    </script>
    <style>
        .page-link {
            color: #000;
            background-color: #fff;
            border: 1px solid #ccc;
        }

        .page-item.active .page-link {
            z-index: 1;
            color: #555;
            font-weight:bold;
            background-color: #f1f1f1;
            border-color: #ccc;
        }

        .page-link:focus, .page-link:hover {
            color: #000;
            background-color: #fafafa;
            border-color: #ccc;
        }
    </style>
    <title>kikerday</title>
</head>
<body>
<!-- header -->
<jsp:include page="../common/header.jsp" flush="false" />

<!-- article -->
<article>
    <section>
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-12 text-center mt-4 mb-4">
                    <h4 class="fw-bold">Q&amp;A</h4>
                    <div class="text-secondary mb-3" style="font-size: 14px;">상품 Q&amp;A입니다.</div>
                </div>
            </div>
            <div class="row">
                <div class="col mb-3 text-center">
                    <a href="#" data-sort="5" onclick="fn_sort5('${pagination.page}', '${pagination.range}', '${question.productId}', '${keyword}')" class="btn btn-secondary" id="sort5" style="text-decoration: none">Q&amp;A전체보기</a>
                    <a href="#" data-sort="1" onclick="fn_sort1('${pagination.page}', '${pagination.range}', '${question.productId}', '${keyword}')" class="btn btn-light" id="sort1" style="text-decoration: none">상품문의</a>
                    <a href="#" data-sort="2" onclick="fn_sort2('${pagination.page}', '${pagination.range}', '${question.productId}', '${keyword}')" class="btn btn-light" id="sort2" style="text-decoration: none">배송문의</a>
                    <a href="#" data-sort="3" onclick="fn_sort3('${pagination.page}', '${pagination.range}', '${question.productId}', '${keyword}')" class="btn btn-light" id="sort3" style="text-decoration: none">교환/반품/취소문의</a>
                    <a href="#" data-sort="4" onclick="fn_sort4('${pagination.page}', '${pagination.range}', '${question.productId}', '${keyword}')" class="btn btn-light" id="sort4" style="text-decoration: none">기타문의</a>
                </div>
            </div>

            <div class="row">
                <div class="col my-3">
                    <div class="btn-group">
                        <button class="btn btn-light btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            배송문의
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">전체</a></li>
                            <li><a class="dropdown-item" href="#">상품문의</a></li>
                            <li><a class="dropdown-item" href="#">배송문의</a></li>
                            <li><a class="dropdown-item" href="#">교환/반품/취소문의</a></li>
                            <li><a class="dropdown-item" href="#">기타문의</a></li>
                        </ul>
                    </div>
                    <div class="btn-group">
                        <button class="btn btn-light btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            전체글보기
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">전체글보기</a></li>
                            <li><a class="dropdown-item" href="#">답변전 글보기</a></li>
                            <li><a class="dropdown-item" href="#">답변완료 글보기</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="">
                <table class="table table-hover text-center align-middle">
                    <thead class="table-light">
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">상품정보</th>
                            <th scope="col">카테고리</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                      </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                          <c:when test="${empty quesList}" >
                            <tr><td colspan="6" align-text="center">문의내역이 없습니다.</td></tr>
                          </c:when>
                          <c:when test="${!empty quesList}">
                            <c:forEach var="list" items="${quesList}" varStatus="status">
                              <tr>
                                <td scope="row">${prodQuesCnt - status.index - pagination.startList}</td>
                                <td>
                                  <c:forEach items="${productImg}" var="pImg">
                                    <c:if test="${list.productId eq pImg.foreignId}">
                                      <a href="${contextPath}/product/detail?id=${pImg.foreignId}">
                                        <img src="${contextPath}/util/upload/display?fileName=${pImg.uploadPath}/s_${pImg.imgUUID}_${pImg.orgImgName}"
                                             class="link-dark fw-bold" width="48" height="48" alt="상품사진">
                                      </a>
                                    </c:if>
                                  </c:forEach>
                                </td>
                                <td>
                                    <c:choose>
                                      <c:when test="${list.category eq '1'.charAt(0)}">
                                        상품문의
                                      </c:when>
                                      <c:when test="${list.category eq '2'.charAt(0)}">
                                        배송문의
                                      </c:when>
                                      <c:when test="${list.category eq '3'.charAt(0)}">
                                        교환/반품/취소문의
                                      </c:when>
                                      <c:when test="${list.category eq '4'.charAt(0)}">
                                        기타문의
                                      </c:when>
                                    </c:choose>
                                </td>
                                <td>${list.title}</td>
                                <td>${list.nickname}</td>
                                <td><fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd"/></td>
                              </tr>
                            </c:forEach>
                          </c:when>
                        </c:choose>
                    </tbody>
                </table>
<%--        <div class="d-flex justify-content-end">--%>
<%--          <a href="#" class="btn btn-secondary m-1 btn-sm">상품문의하기</a>--%>
<%--          <a href="#" class="btn btn-light m-1 btn-sm">모두보기</a>--%>
<%--        </div>--%>
            </div>
<!-- end tab item -->
            <div class="">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <c:if test="${pagination.prev}">
                            <li class="page-item">
                                <a class="page-link"
                                   href="#"
                                   onclick="fn_quesPrev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${question.productId}', '${sortNum}')"
                                   aria-label="Previous">
                                  <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach var="idx" begin="${pagination.startPage}" end="${pagination.endPage}">
                            <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
                                <a class="page-link"
                                   href="#"
                                   onclick="fn_quesNum('${idx}', '${pagination.range}', '${question.productId}', '${sortNum}')">
                                    ${idx}
                                </a>
                            </li>
                        </c:forEach>
                        <c:if test="${pagination.next}">
                            <li class="page-item">
                                <a class="page-link"
                                   href="#"
                                   onclick="fn_quesNext('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${question.productId}', '${sortNum}')"
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
<jsp:include page="../common/footer.jsp" flush="false" />

<script>
  function fn_quesPrev(page, range, rangeSize, productId, sortNum) {
    var page = ((range - 2) * rangeSize) + 1;
    var range = range - 1;

    $.ajax({
      type: "get",
      url: "${contextPath}/allQuestionList",
      data: {
        page: page,
        range: range,
        productId: productId,
        sortNum: sortNum
      },
      success: function (result) {
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

  function fn_quesNum(page, range, productId, sortNum) {
    $.ajax({
      type: "get",
      url: "${contextPath}/allQuestionList",
      data: {
        page: page,
        range: range,
        productId: productId,
        sortNum: sortNum
      },
      success: function (result) {
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

  function fn_quesNext(page, range, rangeSize, productId, sortNum) {
    var page = parseInt((range * rangeSize)) + 1;
    var range = parseInt(range) + 1;

    $.ajax({
      type: "get",
      url: "${contextPath}/allQuestionList",
      data: {
        page: page,
        range: range,
        productId: productId,
        sortNum: sortNum
      },
      success: function (result) {
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

  function fn_quesSortCommon(page, range, productId, sortNum, contents) {
    $.ajax({
      type: "get",
      url: "${contextPath}/allQuestionList",
      data: {
        productId: productId,
        page: 1,
        range: 1,
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

  function fn_sort5(page, range, productId, contents) {
    var element = document.getElementById("sort5");
    var sortNum = element.dataset.sort;
    fn_quesSortCommon(page, range, productId, sortNum, contents);
  }

  function fn_sort1(page, range, productId, contents) {
    var element = document.getElementById("sort1");
    var sortNum = element.dataset.sort;
    fn_quesSortCommon(page, range, productId, sortNum, contents);
  }

  function fn_sort2(page, range, productId, contents) {
    var element = document.getElementById("sort2");
    var sortNum = element.dataset.sort;
    fn_quesSortCommon(page, range, productId, sortNum, contents);
  }

  function fn_sort3(page, range, productId, contents) {
    var element = document.getElementById("sort3");
    var sortNum = element.dataset.sort;
    fn_quesSortCommon(page, range, productId, sortNum, contents);
  }

  function fn_sort4(page, range, productId, contents) {
    var element = document.getElementById("sort4");
    var sortNum = element.dataset.sort;
    fn_quesSortCommon(page, range, productId, sortNum, contents);
  }
</script>
</body>
</html>