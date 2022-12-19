<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined|Material+Icons+Round"
		  rel="stylesheet">
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
		  rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
		  crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
			crossorigin="anonymous">
	</script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"
			integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
			crossorigin="anonymous">
	</script>
	<style>
		footer {
			background-color: rgb(249, 249, 249);
		}
		a {
			text-decoration: none;
		}
	</style>
	<title>kikerday</title>
</head>
<body>
<!-- header -->
<jsp:include page="../common/header.jsp" flush="false" />

<!-- article -->

<article>
	<section>
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-12 text-center mt-4 mb-4">
					<h4 class="fw-bold">Q&amp;A</h4>
					<div class="text-secondary mb-3" style="font-size: 14px;">상품 Q&amp;A입니다.</div>
				</div>
			</div>
			<div class="row">
				<div class="col border border-secondary border-opacity-25 pt-3 pb-2 mb-3">
					<div class="row">
						<div class="col-lg-11 col-md-10 col-sm-10 text-left">
							<c:forEach items="${productImg}" var="pImg">
								<a href="${contextPath}/product/detail?id=${pImg.foreignId}">
									<img src="${contextPath}/util/upload/display?fileName=${pImg.uploadPath}/s_${pImg.imgUUID}_${pImg.orgImgName}"
										 class="link-dark fw-bold" width="48" height="48" alt="상품사진">
									<c:forEach items="${productName}" var="pName">
										${pName.productName}
									</c:forEach>
								</a>
								<div class="row">
									<div class="col-12 mt-2">
										<a href="${contextPath}/product/detail?id=${pImg.foreignId}" class="btn btn-secondary btn-sm">상품상세보기</a>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<form name="form" id="form" role="form" method="post" action="/registerQuestion">
					<input type="hidden" name="productId" value="${param.productId}">
					<div class="row mb-2">
						<label for="category" class="col-2 col-form-label">제목</label>
						<div class="col-3">
							<select id="category" class="form-select" name="category">
								<option selected value="1">상품문의</option>
								<option value="2">배송문의</option>
								<option value="3">교환/반품/취소문의</option>
								<option value="4">기타문의</option>
							</select>
						</div>
						<div class="col-7">
							<input type="text" class="form-control" name="title" id="title" placeholder="제목 입력해주세요.">
						</div>
					</div>
					<div class="row mb-2">
						<label for="inputWriter" class="col-sm-2 col-form-label">작성자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputWriter" placeholder="작성자를 입력해주세요.">
						</div>
					</div>
					<div class="row mb-2">
						<label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="inputEmail" placeholder="이메일을 입력해주세요.">
						</div>
					</div>
					<div class="row mb-2">
						<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="inputPassword" placeholder="비밀번호를 입력해주세요.">
						</div>
					</div>
					<div class="row">
						<label class="col-sm-2 col-form-label">비밀글설정</label>
						<div class="col-sm-10 d-flex align-items-center">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="isLock" id="open1" value="0">
								<label class="form-check-label" for="open1">
									공개글
								</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="isLock" id="notopen1" value="1" checked>
								<label class="form-check-label" for="notopen1">
									비밀글
								</label>
							</div>
						</div>
					</div>
					<div class="form-floating">
						<textarea class="form-control my-3" placeholder="Leave a comment here" name="contents" id="contents" style="height: 300px"></textarea>
						<label for="contents">문의글을 입력해주세요.</label>
					</div>
					<fieldset class="row mb-2">
						<legend class="col-form-label col-sm-2">개인정보 수집 및 이용 동의</legend>
						<div class="col-sm-10">
                                    <textarea class="form-control mb-2" aria-label="agree textarea" style="height: 200px;" readonly>
★개인정보의 수집·이용 목적
서비스 제공 및 계약의 이행, 구매 및 대금결제, 물품배송 또는 청구지 발송, 회원관리 등을 위한 목적

★수집하려는 개인정보의 항목
이름, 주소, 연락처, 이메일 등

★개인정보의 보유 및 이용 기간
회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외없이 해당정보를 파기합니다.
                                    </textarea>
							<span>개인정보 수집 및 이용에 동의하십니까?</span>
							<div class="form-check form-check-inline">
								<input class="form-check-input mx-2" type="radio" name="doyouagree" id="agree1" value="agree">
								<label class="form-check-label" for="agree1">
									동의함
								</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="doyouagree" id="notagree1" value="notagree" checked>
								<label class="form-check-label" for="notagree1">
									동의안함
								</label>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="row">
				<div class="col text-end">
					<button type="button" class="btn btn-secondary" id="btnSave">등록</button>
					<button type="button" class="btn btn-light" id="btnBack">취소</button>
				</div>
			</div>
		</div>
	</section>
</article>


<!-- footer -->
<jsp:include page="../common/footer.jsp" flush="false" />


<script>
	$("#btnSave").on("click", function(e) {
		e.preventDefault();

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

		if ($("input[name='doyouagree']:checked").val() == "notagree") {
			alert("개인정보 수집 및 이용에 동의하셔야 합니다.");
			return false;
		}

		$("#form").submit();
	});

	$("#btnBack").on("click", function(e) {
		e.preventDefault();
		location.href="${contextPath}/product/detail?id=" + ${param.productId};
	});
</script>
</body>
</html>