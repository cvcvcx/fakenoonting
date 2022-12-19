<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>find pwd</title>
<link rel="stylesheet" href="/style.css">

</head>
<body>

	<!-- 메뉴바 -->
	<jsp:include page="../common/header.jsp" flush="false" />

	<!------ body----------------------------------------->

	<div class="path ">
		<div>
			<ul>
				<li><a class="text-decoration-none" href="/">HOME</a></li>
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-chevron-compact-right"
					viewBox="0 0 16 16">
            <path fill-rule="evenodd"
						d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
          </svg>
				<li><strong>FIND PASSWORD</strong></li>
			</ul>
		</div>
	</div>
	<br>
	<br>
	<!---------------------------------------------------------------------------------------->
	<div class="container">
		<div class="contents d-flex align-items-start flex-column mb-2">

			<!---------------------------------------------------------------------------------------->
			<div class="login-box">
				<form class="form-horizontal" method="post" name=""
					action="${contextPath}">
					<div class="form-group" id="login-margin">

						<div class="logo">Find Your Password!</div>
						<div class="login-icon">
							<i id="login-icon" class="fa fa-cloud-upload fa-5x "
								style="color: rgb(243, 235, 235)" aria-hidden="false"></i>
						</div>

					</div>

					<div class="form-group" id="login-margin">

						<div class="col-m-3">
							<input type="text" class="form-control " width="50px" height="30"
								id="email" name="email" maxlength="" placeholder="name">
						</div>


						<div class="col-m-3">
							<input type="text" class="form-control " width="50px" height="30"
								id="email" name="email" maxlength="" placeholder="E-mail">
						</div>
						<br>
						<div class="form-group d-grid" id="loginbtn">
							<a class="btn" style="color: aliceblue" type="button"
								data-bs-toggle="modal" data-bs-target="#staticBackdrop">인증번호
								받기</a>
						</div>
					</div>

					<div class="form-group" id="login-margin">

						<div class="col-m-3">
							<input type="text" class="form-control " width="50px" height="30"
								id="findPwd" name="findPwd" maxlength=""
								placeholder="인증번호를 입력하세요">
						</div>
					</div>



					<div class="form-group d-grid" id="loginbtn">
						<a class="btn btn-outline-warning btn-dark btn-lg" type="button">SIGN
							IN</a>
					</div>

					<div class="form-group d-grid" id="loginbtn">
						<a class="btn" style="color: aliceblue" type="button"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop">인증번호가
							오지 않나요?</a>
					</div>






				</form>
			</div>
		</div>
	</div>

	<!------------------- END body------------------------------------------------------------------------------------------------>

	<hr>
	<!-- 푸터 -->
	<jsp:include page="../common/footer.jsp" flush="false" />


</body>
</html>