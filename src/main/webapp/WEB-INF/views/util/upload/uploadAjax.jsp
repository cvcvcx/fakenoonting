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
        class="form-horizontal"
        action="${contextPath}/util/upload/uploadImage"
        method="post"
        enctype="multipart/form-data"
        target="iframe1"
      >
        <!-- file의 변수명과 컨트롤러의 MultipartFile file이 일치해야 한다. -->
        <div class="form-group">
          <div class="col-sm-8">
            <input type="file" name='uploadFile' class="btn btn-warning" multiple />
            <input type="submit" value="파일올리기" class="btn btn-primary" />
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12">
            <iframe name="iframe1"></iframe>
          </div>
        </div>
      </form>
    </div>
    <jsp:include page="../../common/footer.jsp" flush="false"></jsp:include>
  </body>
</html>
