<!--  prettier-ignore -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  prettier-ignore -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  prettier-ignore -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!--  prettier-ignore -->
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp" flush="false" />

	<div class="container">
		<form action="${contextPath}/product/upload" method="post" role="form">
			<div class="form-group">
				<div class="col-sm-12">
					<h2 align="center">상품 수정</h2>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">상품명</label>
				<div class="col-sm-12">
					<input type="text" class="form-control" id="productName"
						name="productName" maxlength="200" required
						value="${product.productName}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">상품사이즈</label>
				<c:forEach items="${product.productSizeList}" var="productSizeList">
					<div class="col-sm-12 row" id="size-div">
						<div class="col-sm-6">
							<input type="text" class="form-control"
								id="productSizeList.size" name="productSizeList.size"
								maxlength="200" required value="${productSizeList.size}" />
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control"
								id="productSizeList.productCount"
								name="productSizeList.productCount" maxlength="200" required
								value="${productSizeList.productCount}" />
						</div>
					</div>
				</c:forEach>
				<div class="col-sm-3 mt-2">
					<button class="btn btn-primary" id="addSize">사이즈 추가</button>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">상품가격</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="price" name="price"
						maxlength="20" required value="${product.price}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">상품상세설명</label>
				<div class="col-sm-12 mb-2">
					<textarea class="form-control" id="content" name="content"
						rows="30" maxlength="1000" required >${product.content}</textarea>
				</div>
				<div id="productThumbnailImg">
					<label class="col-sm-2 control-label">썸네일용 이미지 업로드</label>
					<div class="container">
						<form class="form-horizontal"
							action="${contextPath}/util/upload/uploadImage" method="post"
							enctype="multipart/form-data">
							<!-- file의 변수명(name)과 upload컨트롤러의 MultipartFile file이 일치해야 한다. -->
							<div class="col-sm-8">
								<input type="file" name="uploadFile" class="form-control"
									id="thumbnailInput" multiple />
							</div>
							<div class="form-group">
								<div class="col-sm-12" id="thumbnailUploadResult"></div>
							</div>
						</form>
					</div>
				</div>
				<div id="productContentImg">
					<label class="col-sm-2 control-label">내용 이미지 업로드</label>
					<div class="container">
						<form class="form-horizontal"
							action="${contextPath}/util/upload/uploadImage" method="post"
							enctype="multipart/form-data">
							<!-- file의 변수명(name)과 upload컨트롤러의 MultipartFile file이 일치해야 한다. -->
							<div class="col-sm-8">
								<input type="file" name="uploadFile" class="form-control"
									id="contentInput" multiple />
							</div>
							<div class="form-group">
								<div class="col-sm-12" id="contentUploadResult"></div>
							</div>
						</form>
					</div>
					<div></div>
				</div>
				<button type="submit"
					class="col-sm-2 offset-md-5 btn btn-primary mt-2">
					상품 수정 완료</button>
			</div>
		</form>
	</div>

	<jsp:include page="../common/footer.jsp" flush="false" />
	
	
	
	<!-- ============================================================================ -->
	<!-- script -->
	<!-- ============================================================================ -->
	<script>

	// =================================================================================//
	// 이미지(thumnail, content) 업로드 script												//
	// =================================================================================//

	// thumnail 이미지 업로드
      $("input[id='thumbnailInput']").on("change", function (e) {
        let formData = new FormData();
        let inputFile = $('input[id="thumbnailInput"]');
        let files = inputFile[0].files;

        for (let i = 0; i < files.length; i++) {
        	
        	// 파일 확장자 및 개별 사이즈 검사
        	if(checkExtAndSize(files[i].name, files[i].size)){
        		return false;
        	}
        	
        	formData.append("uploadFile", files[i]);
        }

        $.ajax({
          url: "${contextPath}/util/upload/uploadImage",
          processData: false,
          contentType: false,
          data: formData,
          type: "POST",
          dataType: "json",
          async: false,
      	  cache: false,
          success: function (result) {
            console.log(result);
            showThumbnailUploadImage(result);
          },
          error: function (result) {
            alert("이미지 파일이 아닙니다.");
          },
        });
      });
      
	// thumnail 업로드 한 이미지 보이게 하기
      function showThumbnailUploadImage(uploadResultArr) {
        /* 업로드 한 파일 검증 */
        if (!uploadResultArr || uploadResultArr.length == 0) {
          return;
        }

        let thumbnailUploadResult = $("#thumbnailUploadResult");
        let str = "";
        
        // 받은 result 이미지가 여러개일 수 있으므로 each로 각각 썸네일을 보이게 할 수 있는 태그 생성
        $(uploadResultArr).each(function (i, obj) {
        	// result 의  uploadPath, imgUUID, orgImgName 들을 하나의 String으로 합친다
          let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.imgUUID + "_" + obj.orgImgName);
          console.log(fileCallPath);
          
          str += "<li class='result_li' data-path='" + obj.uploadPath + "'";
          str +=
            " data-uuid='" +
            obj.imgUUID +
            "' data-filename= '" +
            obj.orgImgName +
            "'>";
          str += "<div id='result_card'>";
          str +=
            "<img src='"+
            "${contextPath}/util/upload/display?fileName=" +
            fileCallPath +
            "'>";
          str +=
            "<div class='imgDeleteBtn' data-file='" +
            fileCallPath +
            "'>x</div>";

          str += "</div>";
          str += "</li>";
        });
        
        thumbnailUploadResult.append(str);
      }

	
	
  	// content 이미지 업로드
      $("input[id='contentInput']").on("change", function (e) {
        let formData = new FormData();
        let inputFile = $('input[id="contentInput"]');
        let files = inputFile[0].files;

        for (let i = 0; i < files.length; i++) {
        	
        	// 파일 확장자 및 개별 사이즈 검사
        	if(checkExtAndSize(files[i].name, files[i].size)){
        		return false;
        	}
        	
        	formData.append("uploadFile", files[i]);
        }

        $.ajax({
          url: "${contextPath}/util/upload/uploadImage",
          processData: false,
          contentType: false,
          data: formData,
          type: "POST",
          dataType: "json",
          async: false,
          cache: false,
          success: function (result) {
            console.log(result);
            showContentUploadImage(result);
          },
          error: function (result) {
            alert("이미지 파일이 아닙니다.");
          },
        });
      });
      
  	// content 업로드 한 이미지 보이게 하기
      function showContentUploadImage(uploadResultArr) {
        /* 전달받은 데이터 검증 */
        if (!uploadResultArr || uploadResultArr.length == 0) {
          return;
        }

        let uploadResult = $("#contentUploadResult");
        let str = "";
        $(uploadResultArr).each(function (i, obj) {
          let fileCallPath =encodeURIComponent(obj.uploadPath + "/s_" + obj.imgUUID + "_" + obj.orgImgName);

          str += "<li class='result_li' data-path='" + obj.uploadPath + "'";
          str +=
            " data-uuid='" +
            obj.imgUUID +
            "' data-filename= '" +
            obj.orgImgName +
            "'>";
          str += "<div id='result_card'>";
          str +=
            "<img src='" +
            " ${contextPath}/util/upload/display?fileName=" +
            fileCallPath +
            "'>";
          str +=
            "<div class='imgDeleteBtn' data-file='" +
            fileCallPath +
            "'>x</div>";

          str += "</div>";
          str += "</li>";
        });
        
        uploadResult.append(str);
      }



  	// 파일 확장자 및 크기 검사 함수
  	let resFileExt = new RegExp("(.*?)\.(exe|sh|zip|alz)"); // 제한을 걸 확장자
  	let maxSizePerFile = 10485760; // 10MB
  	
  	function checkExtAndSize(fileName, fileSize){
  		
  		if(fileSize >= maxSizePerFile ){
  			alert("올린 파일 중 사이즈가 10MB가 넘는 파일이 있습니다.");
  			return true;
  		}
  		
  		if(resFileExt.test(fileName) ){
  			alert("해당 확장자의 파일은 올릴 수 없습니다.");
  			return true;
  		}
  		
  		return false;
  	}
  	
  	
  	
    // 업로드 후 보여지는 이미지 삭제 버튼 동작
    $("#thumbnailUploadResult").on("click", ".imgDeleteBtn", function (e) {
		// 바로 아래에 함수 있음
    	deleteFile();
    });

    function deleteFile() {
        let targetFile = $(".imgDeleteBtn").data("file");
        let targetDiv = $("#result_card");

        $.ajax({
          url:  "${contextPath}/util/upload/deleteFile",
          data: { fileName: targetFile },
          dataType: "text",
          type: "POST",
          async: false,
          cache: false,
          success: function (result) {
            console.log(result);
            targetDiv.unwrap();
            targetDiv.remove();
            $("input[type='file']").val("");
          },
          error: function (result) {
            console.log(result);
            alert("파일을 삭제하지 못하였습니다.");
          },
        });
    }

  	// =================================================================================//
  	// End - 이미지(thumnail, content) 업로드 script																	//
  	// =================================================================================//

  	
  	
  	
      let sizeDiv = $("#size-div");
      let sizeListCount = 0;
      $("button[id='addSize']").on("click", function (e) {
        e.preventDefault();
        console.log("addSize Clicked!");
        sizeListCount++;
        let sizeDiv1 = $("<div></div>");
        let sizeDiv2 = $("<div></div>");
        sizeDiv1.attr("class", "col-sm-6 ");
        sizeDiv2.attr("class", "col-sm-6 ");
        sizeDiv1.append(
          $("<input/>", {
            type: "text",
            name: "productSizeList[" + sizeListCount + "].size",
            maxlength: "200",
            class: "form-control",
            placeholder: "상품사이즈를 입력하세요",
          })
        );
        sizeDiv2.append(
          $("<input/>", {
            type: "text",
            name: "productSizeList[" + sizeListCount + "].productCount",
            maxlength: "200",
            class: "form-control",
            placeholder: "상품개수를 입력하세요",
          })
        );
        sizeDiv1.appendTo("#size-div");
        sizeDiv2.appendTo("#size-div");
      });

      let formObj = $("form[role='form']");
      $("button[type='submit']").on("click", function (e) {

        e.preventDefault();
        console.log("submit clicked");

        let str = "";

        $("#contentUploadResult li").each(function (i, obj) {
          let jobj = $(obj);
          str +=
            "<input type='text' name='productContentImgItems[" +
            i +
            "].orgImgName' value='" +
            jobj.data("filename") +
            "'>";
          str +=
            "<input type='text' name='productContentImgItems[" +
            i +
            "].imgUUID' value='" +
            jobj.data("uuid") +
            "'>";
          str +=
            "<input type='text' name='productContentImgItems[" +
            i +
            "].uploadPath' value='" +
            jobj.data("path") +
            "'>";
        });
        $("#thumbnailUploadResult li").each(function (i, obj) {
          let jobj = $(obj);
          str +=
            "<input type='text' name='productImgItems[" +
            i +
            "].orgImgName' value='" +
            jobj.data("filename") +
            "'>";
          str +=
            "<input type='text' name='productImgItems[" +
            i +
            "].imgUUID' value='" +
            jobj.data("uuid") +
            "'>";
          str +=
            "<input type='text' name='productImgItems[" +
            i +
            "].uploadPath' value='" +
            jobj.data("path") +
            "'>";
        });
        formObj.append(str).submit();
      });
    </script>
    <!-- ============================================================================ -->
	<!-- End - script -->
	<!-- ============================================================================ -->
    
</body>
</html>
