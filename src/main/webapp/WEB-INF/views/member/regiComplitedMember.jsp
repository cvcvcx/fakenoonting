<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="
    -8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 가입 완료</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
/*
body{
    background: #204063;
    background:linear-gradient(
        to right,
        #2c5364,
        #203a43,
        #0f2027
    );
}
*/
body {
	background: tomato;
	background: linear-gradient(to right, white, yellow, yellowgreen, skyblue, rgb(143,
		143, 229), rgb(86, 86, 205), rgb(79, 79, 245), rgb(199, 37, 172),
		rgb(199, 37, 99), rgb(238, 30, 82), red);
}

.container {
	display: flex;
	justify-content: center;
	margin-top: 18em;
	height: 100vh;
	/* 가로중앙 후에 세로 중앙이 안된는 이유는
    높이 값을 안줘서다. */
}

.inner {
	text-align: center;
	color: whitesmoke;
	overflow: hidden;
	padding: 0.4em;
}

.inner>h1 {
	font-size: 5.5em;
	animation: Slide_UP 1.1s ease;
}

.inner>p {
	font-size: 1.5em;
	animation: Slide_UP 1.8s ease;
}

.inner>button {
	animation: Slide_UP 2.1s ease;
}

.btn {
	margin-top: 2em;
	background-color: none;
	border: none;
	font-size: 35px;
	padding: 20px 40px;
	width: 250px;
	cursor: pointer;
	position: relative;
	bottom: 5%;
	border-radius: 5em;
	background: whitesmoke;
	color: black;
}

.btn-swap span {
	position: absolute;
	top: 0;
	left: 0;
	padding: 20px 40px;
	width: 100%;
	opacity: 0;
	transition: opacity 0.5s;
}

.btn-swap:hover span {
	opacity: 1;
}

.btn-swap::before {
	content: "";
	width: 0%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	background-color: #ed4848;
	transition: width 0.5s;
	border-radius: 5em;
}

.btn-swap:hover::before {
	width: 100%;
}

@
keyframes Slide_UP { 0%{
	transform: translateX(400px);
}
50
%
{
transform
:
translateY(
200px
);
}
70
%
{
transform
:
translateX(
100px
);
}
100
%
{
transform
:
translateY(
0
);
}
}
</style>

</head>

<body>

	<!-- 메뉴바 -->
	<jsp:include page="../common/header.jsp" flush="false" />

	<div class="container">
		<div class="inner">
			<h1>Welcome To Kikerday</h1>
			<p style="background: rgb(235, 45, 127); border-radius: 4em;">Member
				registration completed</p>
			<p>The Day of Dream and Hope! Welcome to kickerday.</p>
			<p>You are the one who sets the trends for the younger generation</p>
			<p>We'll be with you on your day.</p>
			<p>The style you want to go out of the house. kikerday</p>

			<button type="submit" class="btn btn-swap">
				welcome <span>shopping </span>
			</button>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" flush="false" />

</body>

</html>