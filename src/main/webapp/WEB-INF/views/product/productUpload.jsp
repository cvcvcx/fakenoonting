<!--  prettier-ignore -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--  prettier-ignore -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  prettier-ignore -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!--  prettier-ignore -->
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  </head>
  <body>
    <jsp:include page="../common/header.jsp" flush="false" />
<div class="container">
<form>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-12">
        <h2 align="center">상품 등록</h2>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label">상품명</label>
      <div class="col-sm-12">
        <input
          type="text"
          class="form-control"
          id="subject"
          name="subject"
          maxlength="200"
          required
          placeholder="상품이름을 입력하세요"
        />
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label">상품가격</label>
      <div class="col-sm-3">
        <input
          type="text"
          class="form-control"
          id="writer"
          name="writer"
          maxlength="20"
          required
          placeholder="상품가격"
        />
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label">상품상세설명</label>
      <div class="col-sm-12">
        <textarea
          class="form-control"
          id="content"
          name="content"
          rows="30"
          maxlength="1000"
          required
          placeholder="내용"
        ></textarea>
      </div>
    </div>
    </form>
    </div>

    <jsp:include page="../util/upload/uploadAjax.jsp" flush="false" />
    <jsp:include page="../common/footer.jsp" flush="false" />
  </body>
</html>
