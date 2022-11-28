<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>ajax파일업로드</title>
    <style>
      .fileDrop {
        width: 100%;
        height: 200px;
        border: 1px dotted blue;
      }
      small {
        margin-left: 3px;
        font-weight: bold;
        color: gray;
      }
    </style>
  </head>
  <body>
    <jsp:include page="../../common/header.jsp" flush="false"></jsp:include>
    <div class="container">
      <form
        action="${contextPath}/util/upload/uploadImage"
        enctype="multipart/form-data"
        method="post"
      >
        <div class="form_section">
          <div class="form_section_title">
            <label>상품 이미지</label>
          </div>
          <div class="form_section_content">
            <input
              type="file"
              id="fileItem"
              name="uploadFile"
              multiple
              style="height: 30px"
            />
          </div>
        </div>
        <button type="submit"></button>
      </form>
    </div>
    <jsp:include page="../../common/footer.jsp" flush="false"></jsp:include>
  </body>
</html>
