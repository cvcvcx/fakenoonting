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
<title>login</title>

<style>
/*모두적용*/
ul {
	list-style: none;
}

.path {
	margin-left: 80em;
}

.path li {
	display: inline-block;
	padding: 0 0 0 4px;
	margin: 0 0 0 4px;
	color: #757575;
}

/*=====body===============================================================================================*/
.login-box {
	background: #101318;
	width: 400px;
	margin: auto;
	height: 500px;
	padding: 30px;
	border-radius: 10px;
	-webkit-box-shadow: 0px 0px 3px 1px rgb(30, 29, 39);
	box-shadow: 0px 0px 3px 1px rgba(38, 35, 128, 1);
}

.login-box .logo {
	color: white;
	font-family: sans-serif;
	font-size: 30px;
	font-weight: 600;
	text-align: center;
}

.login-icon {
	position: relative;
	width: 100%;
	height: 100%;
	display: inline-flex;
}

.login-icon #login-icon {
	margin: auto;
}

.login-box #login-margin {
	padding: 10px;
	margin: auto;
	font-style: sans-serif;
	color: #ededed;
}
/*------end-login-box--------*/
.joinUs-box {
	background: #101318;
	width: 550px;
	margin: auto;
	height: 750px;
	padding: 30px;
	border-radius: 10px;
	-webkit-box-shadow: 0px 0px 3px 1px rgb(30, 29, 39);
	box-shadow: 0px 0px 3px 1px rgba(38, 35, 128, 1);
}

.joinUs-box .logo {
	color: white;
	font-family: sans-serif;
	font-size: 30px;
	font-weight: 600;
	text-align: center;
}

.joinUs-icon {
	position: relative;
	width: 100%;
	height: 100%;
	display: inline-flex;
}

.joinUs-icon #login-icon {
	margin: auto;
}

.subscribed {
	background-color: rgb(246, 249, 249);
	font-size: 12px;
	border-radius: 5px;
	padding: 2px;
}

/*------cart-------------------------------------*/
.cart-table {
	width: 80%;
	margin: auto;
	display: block;
}

#quantity-checkbox {
	width: 80%;
	justify-content: center;
}

#quantity-check {
	margin: 0%;
	padding: 0%;
	width: 30%;
	height: 50px;
	font-size: 15px;
	text-align: center;
	vertical-align: middle;
}

#quantity-check input {
	border-radius: 8%;
	width: 100%;
	height: 50%;
}

/*-----end-cart-------------------------------------*/

/*========================================================================================================*/

/* 모바일 TOP 버튼 */
#scrollTopMob {
	display: none;
	position: fixed;
	bottom: 64px; /* 브라우저 아래쪽 끝에서부터의 거리 */
	right: 30px; /* 브라우저 오른쪽 끝에서부터의 거리 */
	z-index: 99;
}

/* PC DOWN 버튼 */
#scrollDownPc {
	display: none;
	position: fixed;
	bottom: 20px; /* 브라우저 아래쪽 끝에서부터의 거리 */
	right: 30px; /* 브라우저 오른쪽 끝에서부터의 거리 */
	cursor: pointer;
	z-index: 99;
}

/* 모바일 DOWN 버튼 */
#scrollDownMob {
	display: none;
	position: fixed;
	bottom: 20px; /* 브라우저 아래쪽 끝에서부터의 거리 */
	right: 30px; /* 브라우저 오른쪽 끝에서부터의 거리 */
	z-index: 99;
}
</style>

</head>

<!------ body----------------------------------------->
<body>

	<!-- 메뉴바 -->
	<jsp:include page="../common/header.jsp" flush="false" />

	<div class="path ">
		<div>
			<ul>
				<li><a class="text-decoration-none" href="${contextPath}/">HOME</a></li>
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-chevron-compact-right"
					viewBox="0 0 16 16">
            <path fill-rule="evenodd"
						d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
          </svg>
				<li><strong>LOGIN</strong></li>
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

						<div class="logo">PLEASE LOG IN!</div>
						<div class="login-icon">
							<i id="login-icon" class="fa fa-cloud-upload fa-5x "
								style="color: rgb(243, 235, 235)" aria-hidden="false"></i>
						</div>

					</div>

					<div class="form-group" id="login-margin">

						<div class="col-m-3">
							<input type="text" class="form-control " width="50px" height="30"
								id="email" name="email" maxlength="" placeholder="E-mail">
						</div>
					</div>

					<div class="form-group" id="login-margin">

						<div class="col-m-3">
							<input type="password" class="form-control " width="50px"
								height="30" id="pwd" name="pwd" maxlength=""
								placeholder="Password">
						</div>
					</div>

					<div class="form-group" id="login-margin">
						<svg xmlns="http://www.w3.org/2000/svg" width="4" height="14"
							fill="currentColor" class="bi bi-safe" viewBox="0 0 16 16">
              <path
								d="M1 1.5A1.5 1.5 0 0 1 2.5 0h12A1.5 1.5 0 0 1 16 1.5v13a1.5 1.5 0 0 1-1.5 1.5h-12A1.5 1.5 0 0 1 1 14.5V13H.5a.5.5 0 0 1 0-1H1V8.5H.5a.5.5 0 0 1 0-1H1V4H.5a.5.5 0 0 1 0-1H1V1.5zM2.5 1a.5.5 0 0 0-.5.5v13a.5.5 0 0 0 .5.5h12a.5.5 0 0 0 .5-.5v-13a.5.5 0 0 0-.5-.5h-12z" />
              <path
								d="M13.5 6a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5zM4.828 4.464a.5.5 0 0 1 .708 0l1.09 1.09a3.003 3.003 0 0 1 3.476 0l1.09-1.09a.5.5 0 1 1 .707.708l-1.09 1.09c.74 1.037.74 2.44 0 3.476l1.09 1.09a.5.5 0 1 1-.707.708l-1.09-1.09a3.002 3.002 0 0 1-3.476 0l-1.09 1.09a.5.5 0 1 1-.708-.708l1.09-1.09a3.003 3.003 0 0 1 0-3.476l-1.09-1.09a.5.5 0 0 1 0-.708zM6.95 6.586a2 2 0 1 0 2.828 2.828A2 2 0 0 0 6.95 6.586z" />
            </svg>
						<label class="form-check-label" for="flexCheckChecked">보안접속</label>

						<input class="form-check-input " type="checkbox" value=""
							id="flexCheckChecked" checked> <label
							class="form-check-label" for="flexCheckChecked">이메일 저장</label>
					</div>

					<div class="form-group d-grid" id="loginbtn">
						<a class="btn btn-outline-warning btn-dark btn-lg" type="button">SIGN
							IN</a>
					</div>
					<br>
					<div class="form-group d-grid" id="loginbtn">
						<a class="btn" style="color: aliceblue" type="button"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop">Forgot
							Password?</a>
					</div>

				</form>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="false" />

</body>
<!------------------- END body------------------------------------------------------------------------------------------------>

</html>