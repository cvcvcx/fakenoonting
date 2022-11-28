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
      <h2>Ajax File Upload</h2>
      <!-- 파일을 드래그해서 놓을 영역 -->
      <div class="fileDrop"></div>
      <!-- 업로드한 파일목록을 출력할 영역 -->
      <div class="uploadedList"></div>
    </div>
    <jsp:include page="../../common/footer.jsp" flush="false"></jsp:include>
    <script>
      $(function () {
        $(".fileDrop").on("dragenter dragover", function (event) {
          event.preventDefault();
        });
        $(".fileDrop").on("drop", function (event) {
          event.preventDefault();
          alert("그림을 떨어트렸습니다.");
          var files = event.originalEvent.dataTransfer.files;
          var file = files[0];
          console.log(file);
          var formData = new FormData();

          formData.append("file", file);

          //서버에 파일을 업로드 한다(백그라운드에서 실행이 된다.)
          //contentType : false => multipart/form-data로 처리가 된다.
          //processData : false => 일반적으로 서버에 전달되는 데이터는 쿼리 스크링 형태로 전달되기 때문에, data파라미터로 전달된
          //데이터를 jquery 내부적으로 query string 으로 만든다.
          //파일 전송의 경우에는 이렇게 하지 않아야 하기 때문에 processData False이다.
          $.ajax({
            type: "post",
            url: "${contextPath}/util/upload/uploadAjax",
            data: formData,
            dataType: "text",
            processData: false,
            contentType: false,
            success: function (data, status, req) {
              console.log("data" + data); //업로드된 파일이름
              console.log("status" + status); //성공, 실패여부
              console.log("req" + req.status); //요청 코드값

              let str = "<div>";
              if (checkImageType(data)) {
                // 이미지 파일인 경우
                str +=
                  "<a href='${contextPath}/util/upload/displayFile?fileName=" +
                  getImageLink(data) +
                  "'>";
                str +=
                  "<img src='${contextPath}/util/upload/displayFile?fileName=" +
                  data +
                  "'></a>";
              } else {
                //이미지 타입이 아닌경우
                str +=
                  "<a href='${contextPath}/util/upload/displayFile?fileName=" +
                  getOriginalname(data) +
                  "'>" +
                  data +
                  "</a>";
              }
              str += "<span data-src= '" + data + "'>[삭제]</span></div>";

              $(".uploadedList").append(str);
            },
          }); //end - ajax
        }); // end - fileDrop()

        //이미지 파일인지 아닌지 검사하는 함수
        // i : ignore case()
        function checkImageType(fileName) {
          var pattern = /jpg|jpeg|png|gif/i; //정규표현식 맨 뒤에 i 가 들어가면 ignore case가 되어서 대소문자를 무시한다.
          return fileName.match(pattern); // 규칙에 맞으면 true, 아니면 false
        } //정규식을 사용

        // 이미지의 원래 이름 가져오기
        // /uuid_괴도 고양이의 대물림.jpg
        function getOriginalname(fileName) {
          if (checkImageType(fileName)) {
            // 이미지 파일이면 skip
            return;
          }
          var idx = fileName.indexOf("_") + 1;
          return fileName.substr(idx);
        }

        // 이미지의 원래 이름 가져오기
        function getImageLink(fileName) {
          if (!checkImageType(fileName)) {
            // 이미지 파일이 아니면 skip
            return;
          }
          //이미지 파일이면
          // /2022/11/16/s_uuid_괴도 고양이의 대물림.jpg
          var front = fileName.substr(0, 12); // 연월일 경로(0 부터 12 앞까지)
          var end = fileName.substr(14); // s제거
          console.log(front);
          console.log(end);
          return front + end;
        }

        //[삭제] 버튼 눌렀을 경우 : 첨부파일 삭제하기$(".uploadedList").on("click", "span", function(event) {

        //---------------------------------------------------------------------------------------------------
        // 첨부파일 삭제하기
        //---------------------------------------------------------------------------------------------------
        $(".uploadedList").on("click", "span", function (event) {
          alert("첨부파일 삭제하기");

          // 현재 클릭한 태그
          var that = $(this);
          alert($(this).attr("data-src"));

          $.ajax({
            url: "${contextPath}/util/upload/deleteFile",
            type: "post",
            data: "fileName=" + $(this).attr("data-src"),
            dataType: "text",
            success: function (result) {
              if (result == "deleted") {
                that.parent("div").remove();
              }
            },
            error: function (error) {
              alert("Error !!!");
            },
            complete: function () {
              alert("Complete !!!");
            },
          });
        });
      });

      //첨부파일 배열 : 드래그된 파일의 정보
      //Ctrl 클릭으로 여러개의 파일을 동시에 올릴 수 있다.
    </script>
  </body>
</html>
