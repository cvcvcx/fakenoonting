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

           <div class="container">
                <form
                  class="form-horizontal"
                  action="${contextPath}/util/upload/uploadImage"
                  method="post"
                  enctype="multipart/form-data"
                >
                  <!-- file의 변수명과 컨트롤러의 MultipartFile file이 일치해야 한다. -->
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

          </div>
        </div>
        <button type="submit" class="col-sm-2 offset-md-5 btn btn-primary mt-2">
          상품 등록
        </button>
      </form>
    </div>

    <jsp:include page="../common/footer.jsp" flush="false" />

  <script>
    let maxSize = 1048576; //1MB
    $("input[type='file']").on("change", function (e) {
      /* 이미지 존재시 삭제
      		if($(".imgDeleteBtn").length > 0){
      			deleteFile();
      		}
    */
      let formData = new FormData();
      let inputFile = $('input[name="uploadFile"]');
      let files = inputFile[0].files;

      for (let i = 0; i < files.length; i++) {
        formData.append("uploadFile", files[i]);
      }
      /*
      		if(!fileCheck(fileObj.orgImgName, fileObj.size)){
      			return false;
      		}
    */

      $.ajax({
        url: "${contextPath}/util/upload/uploadImage",
        processData: false,
        contentType: false,
        data: formData,
        type: "POST",
        dataType: "json",
        success: function (result) {
          console.log(result);
          showUploadImage(result);
        },
        error: function (result) {
          alert("이미지 파일이 아닙니다.");
        },
      });
    });
    function showUploadImage(uploadResultArr) {
      /* 전달받은 데이터 검증 */
      if (!uploadResultArr || uploadResultArr.length == 0) {
        return;
      }

      let uploadResult = $("#uploadResult");
      let str = "";
      $(uploadResultArr).each(function (i, obj) {
        let fileCallPath =
          obj.uploadPath + "/s_" + obj.imgUUID + "_" + obj.orgImgName;

        str += "<li data-path='"+obj.uploadPath+"'";
        str += " data-uuid='"+obj.imgUUID+"' data-filename= '"+obj.orgImgName+"'>"
        str += "<div id='result_card'>";
        str +=
          "<img src='${contextPath}/util/upload/display?fileName=" +
          fileCallPath +
          "'>";
        str +=
          "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";

        str += "</div>";
        str += "</li>";
      });
      uploadResult.append(str);

      //let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.imgUUID + "_" + obj.orgImgName);
      //replace 적용 하지 않아도 가능
    }

    function fileCheck(fileName, fileSize) {
      if (fileSize >= maxSize) {
        alert("파일 사이즈 초과");
        return false;
      }

      if (!regex.test(fileName)) {
        alert("해당 종류의 파일은 업로드할 수 없습니다.");
        return false;
      }

      return true;
    }
    /* 이미지 삭제 버튼 동작 */
    $("#uploadResult").on("click", ".imgDeleteBtn", function (e) {
      deleteFile();
    });

    function deleteFile() {
      let targetFile = $(".imgDeleteBtn").data("file");

      let targetDiv = $("#result_card");

      $.ajax({
        url: "${contextPath}/util/upload/deleteFile",
        data: { fileName: targetFile },
        dataType: "text",
        type: "POST",
        success: function (result) {
          console.log(result);

          targetDiv.remove();
          $("input[type='file']").val("");
        },
        error: function (result) {
          console.log(result);

          alert("파일을 삭제하지 못하였습니다.");
        },
      });
    }

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
  //formObj.append(str);
    formObj.append(str).submit();

    });
  </script>

  </body>
</html>
