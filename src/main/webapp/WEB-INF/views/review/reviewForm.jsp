<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<%
	String result = request.getParameter("productId");
	int productId = Integer.parseInt(result);
%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
		  rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
		  crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<style>
		body {
			padding-top: 70px;
			padding-bottom: 30px;
		}
	</style>

	<title>리뷰작성</title>
</head>
<body>

<article>
	<div class="container" role="main">
		<h2>상품번호: <%=productId %> </h2>
		<br>
		<h2>리뷰작성</h2>
		<form name="form" id="form" role="form" method="post" action="/registerReview">
			<div class="mb-3">
				<label for="contents">리뷰내용</label>
				<textarea class="form-control" rows="5" name="contents" id="contents" placeholder="내용을 입력해 주세요"></textarea>
			</div>
			<div class="mb-3">
				<label for="grade">평점</label>
				<input type="number" class="form-control" name="grade" id="grade" placeholder="평점을 선택해 주세요">
			</div>
		<jsp:include page="../util/upload/uploadAjax.jsp" flush="false"/>
		</form>
		<div>
			<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장하기</button>
			<button type="button" class="btn btn-sm btn-primary" id="btnBack">뒤로가기</button>
		</div>
	</div>
</article>

<script src="${contextPath}/resources/js/upload.js"></script>
<script>
	$("#btnSave").on("click", function(e) {
		e.preventDefault();

		if($("#contents").val() == "") {
			alert("리뷰 내용은 필수입니다.");
			$("#contents").focus();
			return false;
		}

		if($("#grade").val() == "") {
			alert("평점은 필수입니다.");
			$("#grade").focus();
			return false;
		}
        let formObj = $("form[role='form']");
         let str = "";

        $("#uploadResult li").each(function(i,obj){
        let jobj = $(obj);
        console.log(jobj)
        str +=
                  "<input type='text' name='reviewImgItems[" +
                  i +
                  "].orgImgName' value='" +
                  jobj.data("filename") +
                  "'>";
                str +=
                  "<input type='text' name='reviewImgItems[" +
                  i +
                  "].imgUUID' value='" +
                  jobj.data("uuid") +
                  "'>";
                str +=
                  "<input type='text' name='reviewImgItems[" +
                  i +
                  "].uploadPath' value='" +
                  jobj.data("path") +
                  "'>";
        });
    formObj.append(str);
    //.submit();
    //데이터가 어떻게 추가되는지 확인하기 위해 submit을 주석처리
	});

	$("#btnBack").on("click", function(e) {
		e.preventDefault();
		location.href="${contextPath}/product/detail?id=" + <%=productId%>;
	});
</script>

</body>
</html>