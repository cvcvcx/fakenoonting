<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>


                <div class="container">
                <form
                  class="form-horizontal"
                  action="${contextPath}/util/upload/uploadImage"
                  method="post"
                  enctype="multipart/form-data"
                >
                  <!-- file의 변수명(name)과 upload컨트롤러의 MultipartFile file이 일치해야 한다. -->
                  <div class="form-group">
                    <div class="col-sm-8">
                      <input
                        type="file"
                        name="uploadFile"
                        class="btn btn-warning"
                        multiple
                      />
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-12" id="uploadResult"></div>
                  </div>
                </form>
              </div>
