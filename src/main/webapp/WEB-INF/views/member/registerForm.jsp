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
<title>회원가입</title>

<style>
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

#quantity-check {
	margin: 0%;
	padding: 0%;
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

.joinUs-box {
	background: #101318;
	width: 550px;
	margin: auto;
	margin-bottom: 5em;
	height: 90%;
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
	width: 80%;
	height: 80%;
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
</style>

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
				<li><strong>Join Us</strong></li>
			</ul>
		</div>
	</div>
	
	<br>
	<br>
	
	<div class="container">
		<div class="contents d-flex align-items-start flex-column mb-2">
			<div class="joinUs-box">
				<form class="form-horizontal" role="registerForm" method="post" name="registerForm"
					action="${contextPath}/member/registerMember.do">
					<div class="form-group" id="login-margin">
						<div class="logo">
							JOIN US
							<div class="joinUs-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100"
									fill="currentColor" class="bi bi-person-plus-fill"
									viewBox="0 0 16 16" id="login-icon">
                    <path
										d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                    <path fill-rule="evenodd"
										d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z" />
                  </svg>
							</div>
						</div>

						<div class="form-group col-mb-3">
							<input type="text" class="form-control" width="30px" id="email"
								name="email" placeholder="이메일" aria-label="Username">
						</div>

						<div class="form-group col-m-3">
							<input type="password" class="form-control " width="50px"
								height="30" id="pwd" name="pwd" maxlength="" placeholder="비밀번호">
						</div>

						<div class="form-group col-m-3">
							<input type="password" class="form-control " width="50px"
								height="30" id="repwd" maxlength=""
								placeholder="비밀번호 확인">
						</div>

						<div class="form-group col-mb-3 ">
							<input type="tel" class="form-control" id="name" name="name"
								aria-label="" placeholder="이름"> 
						</div>
						
						<div class="form-group col-mb-3 ">
							<select
								class="form-select " id="gender" name="gender"
								aria-label="Default select example">
								<option selected>성별</option>
								<option value="M">남성</option>
								<option value="F">여성</option>
							</select>
						</div>	
						
						<div class="form-group col-mb-3">
							<input type="text" class="form-control " width="50px" height="30"
								id="nick" name="nick" maxlength="" placeholder="닉네임">
						</div>

						<div class="input-group col-mb-3 phone" >
							<select class="form-select" id="phone1"
								name="phone1" aria-label="Default select example">
								<option selected value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
							<span class="input-group-text">-</span>
							<input type="tel"
								class="form-control" id="phone2" placeholder="" aria-label="">
							<span class="input-group-text">-</span>
							<input type="tel"
								class="form-control" id="phone3" placeholder="" aria-label="">	
						</div>
						
						<div class="input-group col-mb-3">
							<label class="form-control text-center" for="date"> 생년월일 </label>
							<input type="date" class="form-control " width="50px" height="30"
								id="birth" name="birth" maxlength="" > 
						</div>

						<div class="input-group mb-3">
							<input type="text" class="form-control" id="zipcode"
								name="zipcode" placeholder="우편번호">

							<div class="form-group d-grid" id="loginbtn">
								<button class="btn btn btn-defalut"
									style="color: rgb(255, 255, 255) " type="button"
									onclick=" daumZipCode()" data-bs-toggle="modal"
									data-bs-target="#staticBackdrop">우편번호찾기</button>
							</div>

							<div class="input-group">
								<input type="text" class="form-control" placeholder="주소"
									id="address1" name="address1">
							</div>

							<div class="input-group col-mb-3">
								<div class="form-floating">
									<input class="form-control" style="width: 100%"
										placeholder="Leave a comment here" id="address2"
										name="address2">
									<label for="floatingTextarea">상세주소</label>
								</div>
							</div>
						</div>
							
						<div class="subscribed"
							style="border-radius: 5px; background-color: rgb(217, 232, 238);">

							<strong>[키커쇼핑몰의 개인 정보 수집 및 이용 안내]</strong> 개인 정보 제3자 제공 동의 <br>①
							개인정보를 제공받는 자: 키커쇼핑몰 <br>② 개인정보를 제공받는 자의 개인 정보 이용 목적 : 영업관리,
							설문조사 및 프로모션, 이벤트 경품 제공, eDM 발송, 행사 관련 마케팅 <br>③ 제공하는 개인정보항목
							: 이름, 이메일주소, 회사명, 직무/직책, 연락처, 휴대전화 <br>④ 개인정보를 제공받는 자의 개인
							정보 보유 및 이용 기간 : 개인정보 취급 목적을 달성하여 더 이상 개인정보가 불 필요하게 된 경우이거나 5년이
							지나면 지체 없이 해당 정보를 파기할 것입니다. <br>귀하는 위와 같은 키커쇼핑몰의 개인정보 수집 및
							이용정책에 동의하지 않을 수 있으나, 키커쇼핑몰로부터 솔루션, 최신 IT정보, 행사초청안내 등의 유용한 정보를
							제공받지 못 할 수 있습니다. <br> 개인 정보 보호에 대한 자세한 내용은
							http://www.kikerDay.com 을 참조바랍니다.
							<div class="checkbox" align="center">
								<label> <input type="checkbox" id="is_subscribed"
									name="is_subscribed" value="o" />
								</label> kikerDay의 개인정보 수집 및 이용에 동의합니다.
							</div>
						</div>

						<div class=" form-group " style="width: 100%; margin-top: 5%">
							<div class="d-flex justify-content-center">
								<button type="submit" style="color: rgb(231, 154, 11)"
									class="btn">Join Us</button>
								<button type="reset" style="color: rgb(231, 154, 11)"
									class="btn">Reset</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="../common/footer.jsp" flush="false" />



	<!-------------우편번호 API------------->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function daumZipCode() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업창에서 검색한 결과 중 항목을 클릭하였을 경우에 실행할 코드를 이곳에 작성한다.
				
				// 각 주소의 노출 규칙에 따라서 주소를 조합해야 한다.
				// 내려오는 변수가 값이 없는 경우에는 공백('') 값을 가지므로 이름을 참고하여 분기한다.
				let fullAddr = '';	// 최종 주소를 담을 변수
				let subAddr = '';	// 조합형 주소를 담을 변수
			
				// 사용자가 선택한 주소의 타입에 따라서 해당 주소값을 가져온다.
				if(data.userSelectedType == 'R') {	// 도로명 주소를 선택한 경우
					fullAddr = data.roadAddress;
				} else {	// 지번 주소를 선택한 경우
					fullAddr = data.jibunAddress;
				}
				
				// 사용자가 선택한 주소가 도로명 타입일 때 조합
				if(data.userSelectedType == 'R') {
					// 법정동명이 있을 경우에 추가한다.
					if(data.bname != '') {
						subAddr += data.bname;
					}
					// 건물명이 있을 경우에 추가한다.
					if(data.buildingName != '') {
						subAddr += (subAddr != '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (subAddr != '' ? '(' + subAddr + ')' : '');
				}
				
				// 우편번호와 주소정보를 화면의 해당 필드에 출력시킨다.
				// 5자리의 새 우편번호
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById('address1').value = fullAddr;
				
				// 커서를 상세주소 입력란으로 이동시킨다.
				document.getElementById('address2').focus();
  			
			}	// End - oncomplete: function(data)
		
		}).open({
			// 우편번호 팝업 창이 여러개 뜨는것을 방지하기 위해 popupName을 사용한다.
			// 이거 안쓰면 버튼 누를때마다 주소입력 팝업 창 계속 뜸
			popupName: 'postcodePopup'
		});
	}	// End - function daumZipCode()

	</script>
	<!------------END---우편번호 API------------->



	<!-- phone 조합 Script -->
	<script>
	let phoneObj = $(".phone");
	let regiFormObj = $("form[role='registerForm']");
	
	$("button[type='submit']").on("click",function(e){
		e.preventDefault();
		console.log("Submit Clicked");
		
		let str ="";
		let phone = $('select[id=phone1]').val() + $('input[id=phone2]').val()+ $('input[id=phone3]').val();
		str += "<input type='hidden' name=phone value= ' " + phone + " ' >" ;
		
		phoneObj.append(str);
		regiFormObj.submit();
		
	})
	</script>

</body>
<!------------------- END body------------------------------------------------------------------------------------------------>

</html>