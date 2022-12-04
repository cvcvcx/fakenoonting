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
      <form action = "${contextPath}/product/upload" method="post" role="form">
        <div class="form-group">
          <div class="col-sm-12">
            <h2 align="center">상품 등록</h2>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">상품명</label>
          <div class="col-sm-12">
            <input
              type="text"
              class="form-control"
              id="productName"
              name="productName"
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
              id="price"
              name="price"
              maxlength="20"
              required
              placeholder="상품가격"
            />
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">상품상세설명</label>
          <div class="col-sm-12 mb-2">
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

            <jsp:include page = "../util/upload/uploadAjax.jsp" flush="false"/>

          </div>
        </div>
        <button type="submit" class="col-sm-2 offset-md-5 btn btn-primary mt-2">
          상품 등록
        </button>
      </form>
    </div>

    <jsp:include page="../common/footer.jsp" flush="false" />
<script src="${contextPath}/resources/js/upload.js"></script>
  <script>

    let formObj = $("form[role='form']");
    $("button[type='submit']").on("click",function(e){
        e.preventDefault();
        console.log("submit clicked");

        let str = "";

        $("#uploadResult li").each(function(i,obj){
        let jobj = $(obj);
        console.log(jobj)
        str +=
                  "<input type='hidden' name='productImgItems[" +
                  i +
                  "].orgImgName' value='" +
                  jobj.data("filename") +
                  "'>";
                str +=
                  "<input type='hidden' name='productImgItems[" +
                  i +
                  "].imgUUID' value='" +
                  jobj.data("uuid") +
                  "'>";
                str +=
                  "<input type='hidden' name='productImgItems[" +
                  i +
                  "].uploadPath' value='" +
                  jobj.data("path") +
                  "'>";
        });
    formObj.append(str).submit();

    });
  </script>

  </body>
</html>
