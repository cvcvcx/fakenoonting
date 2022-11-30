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
            <input type="file" name='uploadFile' class="btn btn-warning" multiple />
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-12 " id ="uploadResult"></div>
        </div>
      </form>
    </div>
  </body>
  <script>

  	let maxSize = 1048576; //1MB
  $("input[type='file']").on("change", function(e){

  		/* 이미지 존재시 삭제
  		if($(".imgDeleteBtn").length > 0){
  			deleteFile();
  		}
*/
  		let formData = new FormData();
  		let fileInput = $('input[name="uploadFile"]');
  		let fileList = fileInput[0].files;
  		let fileObj = fileList[0];
/*
  		if(!fileCheck(fileObj.orgImgName, fileObj.size)){
  			return false;
  		}
*/
  		formData.append("uploadFile", fileObj);


  		$.ajax({
  			url: '${contextPath}/util/upload/uploadImage',
  	    	processData : false,
  	    	contentType: false,
  	    	data : formData,
  	    	type : 'POST',
  	    	dataType : 'json',
  	    	success : function(result){
  	    		console.log(result);
  	    		showUploadImage(result);
  	    	},
  	    	error : function(result){
  	    		alert("이미지 파일이 아닙니다.");
  	    	}
  		});

  	});
    function showUploadImage(uploadResultArr){

    		/* 전달받은 데이터 검증 */
    		if(!uploadResultArr || uploadResultArr.length == 0){return}

    		let uploadResult = $("#uploadResult");

    		let obj = uploadResultArr[0];

    		let str = "";
    		//let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.imgUUID + "_" + obj.orgImgName);
    		//replace 적용 하지 않아도 가능
    		let fileCallPath = (obj.uploadPath + "/s_" + obj.imgUUID + "_" + obj.orgImgName);
            console.log("fileCallPath 확인)"+fileCallPath);

    		str += "<div id='result_card'>";
    		str += "<img src='${contextPath}/util/upload/display?fileName=" + fileCallPath +"'>";
    		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
    		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.orgImgName +"'>";
    		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.imgUUID +"'>";
    		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
    		str += "</div>";

       		uploadResult.append(str);

       		console.log(uploadResultArr);

    	}

  	function fileCheck(fileName, fileSize){
    		if(fileSize >= maxSize){
    			alert("파일 사이즈 초과");
    			return false;
    		}

    		if(!regex.test(fileName)){
    			alert("해당 종류의 파일은 업로드할 수 없습니다.");
    			return false;
    		}

    		return true;

    	}
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){

		deleteFile();

	});


  	function deleteFile(){

    		let targetFile = $(".imgDeleteBtn").data("file");

    		let targetDiv = $("#result_card");

    		$.ajax({
    			url: '${contextPath}/util/upload/deleteFile',
    			data : {fileName : targetFile},
    			dataType : 'text',
    			type : 'POST',
    			success : function(result){
    				console.log(result);

    				targetDiv.remove();
    				$("input[type='file']").val("");

    			},
    			error : function(result){
    				console.log(result);

    				alert("파일을 삭제하지 못하였습니다.")
    			}
    		});
    	}

  </script>
</html>
