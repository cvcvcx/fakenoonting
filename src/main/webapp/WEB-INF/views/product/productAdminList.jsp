<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="f"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <!-- 상단 메뉴 -->
    <jsp:include page="../common/header.jsp" flush="false" />

    <div class="container">
      <form class="form_horizontal" id="frm">
        <div class="form-group">
          <div>
            <h2 align="center">상품 목록(admin)</h2>
          </div>
        </div>
        <table class="table table-bordered table-striped table-hover">
          <thead>
            <tr class="info">
              <th class="col-sm1 text-center">상품번호</th>
              <th class="col-sm1 text-center">상품대표이미지</th>
              <th class="col-sm1 text-center">상품이름</th>
              <th class="col-sm1 text-center">상품설명</th>
              <th class="col-sm1 text-center">작성일자</th>
              <th class="col-sm1 text-center">상품가격</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${list}" var="list">
              <tr>
                <td align="center">${list.id}</td>
                <td>

                </td>
                <td>
                  <a href="${contentPath}/main/board/boardDetail?seq=${list.id}"
                    >${list.productName}</a
                  >
                </td>

                <td>${list.content}</td>
                <td align="center">
                  <f:formatDate
                    value="${list.uploadDate}"
                    pattern="yyyy년 MM월 dd일 hh시 mm분"
                  ></f:formatDate>
                </td>
                <td align="right">${list.price}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </form>
    </div>
    <jsp:include page="../common/footer.jsp" flush="false" />
  </body>
</html>