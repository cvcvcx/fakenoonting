
let contextPath = getContextPath();

function getContextPath() {
       var hostIndex = location.href.indexOf( location.host ) + location.host.length;
       return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

$()

$("input[type='file']").on("change", function (e) {
    let formData = new FormData();
    let inputFile = $('input[name="uploadFile"]');
    let files = inputFile[0].files;

    for (let i = 0; i < files.length; i++) {
      formData.append("uploadFile", files[i]);
    }

    $.ajax({
      url: contextPath + "/util/upload/uploadImage",
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

      str += "<li class='result_li' data-path='"+obj.uploadPath+"'";
      str += " data-uuid='"+obj.imgUUID+"' data-filename= '"+obj.orgImgName+"'>"
      str += "<div id='result_card'>";
      str +=
        "<img src='"+contextPath +"/util/upload/display?fileName=" +
        fileCallPath +
        "'>";
      str +=
        "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";

      str += "</div>";
      str += "</li>";
    });
    uploadResult.append(str);
  }
   let maxSize = 1048576; //1MB

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
          url: contextPath+"/util/upload/deleteFile",
          data: { fileName: targetFile },
          dataType: "text",
          type: "POST",
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

