<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>

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

	<title>문의작성</title>
</head>
<body>

<article>
	<div class="container" role="main">
		<h2>문의작성</h2>
		<form name="form" id="form" role="form" method="post" action="/registerQuestion">
			<div class="mb-3">
				<label for="contents">카테고리</label>
				<textarea class="form-control" rows="1" name="category" id="category" placeholder="카테고리를 선택해 주세요"></textarea>
			</div>
			<div class="mb-3">
				<label for="contents">문의제목</label>
				<textarea class="form-control" rows="1" name="title" id="title" placeholder="제목을 입력해 주세요"></textarea>
			</div>
			<div class="mb-3">
				<label for="contents">문의내용</label>
				<textarea class="form-control" rows="5" name="contents" id="contents" placeholder="내용을 입력해 주세요"></textarea>
			</div>
			<div class="mb-3">
				<label for="contents">비밀글선택여부</label>
				<textarea type="number" class="form-control" rows="1" name="isLock" id="isLock" placeholder="비밀글 여부를 선택하세요"></textarea>
			</div>
<%--			<div class="mb-3">--%>
<%--				<label for="contents">비밀번호? 이메일? 작성자이름?</label>--%>
<%--				<textarea class="form-control" rows="5" name="isLock" id="isLock" placeholder="비밀번호를 입력해 주세요"></textarea>--%>
<%--			</div>--%>
		</form>
		<div>
			<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장하기</button>
			<button type="button" class="btn btn-sm btn-primary" id="btnList">뒤로가기</button>
		</div>
	</div>
</article>

<script>
	$("#btnSave").on("click", function(e) {
		e.preventDefault();

		if($("#category").val() == "") {
			alert("카테고리 선택은 필수입니다.");
			$("#category").focus();
			return false;
		}

		if($("#title").val() == "") {
			alert("제목은 필수입니다.");
			$("#title").focus();
			return false;
		}

		if($("#contents").val() == "") {
			alert("문의 내용은 필수입니다.");
			$("#contents").focus();
			return false;
		}

		if($("#isLock").val() == "") {
			alert("비밀글설정 여부는 필수입니다.");
			$("#isLock").focus();
			return false;
		}

		$("#form").submit();
	});

	$("#btnList").on("click", function(e) {
		e.preventDefault();
		location.href="/questionTest";
	});
</script>

</body>
</html>