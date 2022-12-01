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
<title>회원 가입</title>
<link rel="stylesheet" href="/style.css">

</head>



<!------ body----------------------------------------->
<body>

	<!-- 메뉴바 -->
	<jsp:include page="../common/header.jsp" flush="false" />

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
				<li><strong>JOIN US</strong></li>
			</ul>
		</div>
	</div>

	<br>
	<br>

	<div class="container">
		<div class="contents d-flex align-items-start flex-column mb-2">
			<div class="joinUs-box">
				<form class="form-horizontal" method="post" name="registerForm"	action="${contextPath}/member/registerMember.do">
					<div class="form-group" id="login-margin">
						<div class="logo">
							<div class="joinUs-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200"
									fill="currentColor" class="bi bi-person-plus-fill"
									viewBox="0 0 16 16" id="login-icon">
			                    <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
  				                <path fill-rule="evenodd"
										d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z" />
            				    </svg>
							</div>
						</div>

						<div class="form-group" id="login-margin">
							<div class="input-group col-mb-3">
								<input type="text" class="form-control" width="30px"
									placeholder="Email" aria-label="Email"> <span
									class="input-group-text">@</span> <input type="text"
									class="form-control" placeholder="직접입력" aria-label="Username">

								<select class="form-select" aria-label="Default select example">
									<option selected>선택</option>
									<option value="2">naver.com</option>
									<option value="2">gmail.com</option>
									<option value="3">daum.net</option>
									<option value="3">nate.com</option>
								</select>
							</div>

							<div class="col-m-3">
								<input type="password" class="form-control " width="50px"
									height="30" id="pwd" name="pwd" maxlength=""
									placeholder="Password">
							</div>

							<div class="col-m-3">
								<input type="password" class="form-control " width="50px"
									height="30" id="retry-pwd" name="retry-pwd" maxlength=""
									placeholder="Retry-Password">
							</div>

							<div class="col-m-3">
								<input type="text" class="form-control " width="50px"
									height="30" id="nickname" name="nickname" maxlength=""
									placeholder="Nickname">
							</div>

							<div class="input-group col-mb-3">
								<select class="form-select" aria-label="Default select example">
									<option selected>010</option>
									<option value="2">011</option>
									<option value="3">017</option>
									<option value="3">019</option>
								</select> <span class="input-group-text">-</span> <input type="tel"
									class="form-control" placeholder="" aria-label=""> <span
									class="input-group-text">-</span> <input type="tel"
									class="form-control" placeholder="" aria-label="">
							</div>

							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="우편번호"
									aria-label="Recipient's username"
									aria-describedby="basic-addon2">

								<div class="form-group d-grid" id="loginbtn">
									<button class="btn btn btn-outline-warning"
										style="color: rgb(255, 255, 253)" type="button"
										data-bs-toggle="modal" data-bs-target="#staticBackdrop">우편번호찾기</button>
								</div>

								<div class="input-group col-mb-3">
									<div class="form-floating">
										<textarea class="form-control" style="width: 100%"
											placeholder="Leave a comment here" id="floatingTextarea"></textarea>
										<label for="floatingTextarea">상세주소</label>
									</div>
								</div>
							</div>

							<br>
							
							<div class="subscribed">
								<strong>[키커쇼핑몰의 개인 정보 수집 및 이용 안내]</strong> 개인 정보 제3자 제공 동의 <br>①
								개인정보를 제공받는 자: 키커쇼핑몰 <br>② 개인정보를 제공받는 자의 개인 정보 이용 목적 : 영업관리,
								설문조사 및 프로모션, 이벤트 경품 제공, eDM 발송, 행사 관련 마케팅 <br>③ 제공하는 개인정보항목
								: 이름, 이메일주소, 회사명, 직무/직책, 연락처, 휴대전화 <br>④ 개인정보를 제공받는 자의 개인
								정보 보유 및 이용 기간 : 개인정보 취급 목적을 달성하여 더 이상 개인정보가 불 필요하게 된 경우이거나 5년이
								지나면 지체 없이 해당 정보를 파기할 것입니다. <br>귀하는 위와 같은 키커쇼핑몰의 개인정보 수집 및
								이용정책에 동의하지 않을 수 있으나, 키커쇼핑몰로부터 솔루션, 최신 IT정보, 행사초청안내 등의 유용한 정보를
								제공받지 못 할 수 있습니다. <br> 개인 정보 보호에 대한 자세한 내용은
								http://www.kikerDay.com 을 참조바랍니다.
							</div>
							<br>
							<div class="checkbox" align="center">
								<label> <input type="checkbox" id="is_subscribed"
									name="is_subscribed" value="o" />
								</label> kikerDay의 개인정보 수집 및 이용에 동의합니다.
							</div>
							<br>
							<div class="form-group " align="center">
								<button type="submit" style="color: rgb(231, 154, 11)" class="btn">Join Us</button>
								<button type="reset" style="color: rgb(231, 154, 11)" class="btn">Reset</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<hr>
	
	<!-- 푸터 -->
	<jsp:include page="../common/footer.jsp" flush="false" />

</body>
<!------------------- END body------------------------------------------------------------------------------------------------>

</html>