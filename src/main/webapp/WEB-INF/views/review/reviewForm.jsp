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
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"
			integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
			crossorigin="anonymous">
	</script>
	<title>kikerday</title>
	<script src="https://kit.fontawesome.com/2d8c8e46aa.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- header -->
<jsp:include page="../common/header.jsp" flush="false" />

<!-- article -->
<article>
	<section>
		<div class="container">
			<div class="text-center mt-5">
				<h2>상품 리뷰 작성</h2>
			</div>
			<div class="sticky-top bg-white mt-5">
				<div>
					<c:forEach items="${productImg}" var="pImg">
						<a href="${contextPath}/product/detail?id=${pImg.foreignId}" style="text-decoration: none;" class="text-dark">
							<img src="${contextPath}/util/upload/display?fileName=${pImg.uploadPath}/s_${pImg.imgUUID}_${pImg.orgImgName}"
								 class="link-dark fw-bold" width="48" height="48" alt="상품사진">
							<c:forEach items="${productName}" var="pName">
								${pName.productName}
							</c:forEach>
						</a>
					</c:forEach>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="fw-bold text-center">
					${memberVO.nick} 고객님
				</div>
				<div class="text-center mt-2 mb-3">
					구매 상품은 어떠셨나요?<br />
					리뷰를 작성하고 적립금 받으세요!
				</div>
			</div>
			<div class="text-bg-secondary bg-opacity-75 text-center">
				지금 리뷰 남기면 적립금 최대 <b>1,000원!</b>
			</div>
			<hr class="my-4" />
			<div class="border border-secondary border-opacity-25 p-2 mb-3">
				적립금 조건을 더 알아보세요
			</div>
			<form name="form" id="form" role="form" method="post" action="/registerReview">
				<input type="hidden" name="productId" value="${param.productId}">
				<div class="fw-bold">
					<p class="fs-5">
						🐣 리뷰 작성란 🐣
					</p>
				</div>
				<div class="form-floating">
					<textarea class="form-control my-3" placeholder="review write a here" name="contents" id="reviewWrite" style="height: 300px"></textarea>
					<label for="reviewWrite">리뷰를 남겨주세요.</label>
				</div>
				<div class="fw-bold mt-5">
					<p class="fs-5">
						🐤 만족도 🐤
					</p>
				</div>
				<div>
					<label for="grade">평점</label>
					<input class="form-control" type="number" name="grade" id="grade" min="1" max="5" placeholder="만족도를 선택해주세요.">
					<div class="text-secondary mt-2">
						<div>5 - 아주 좋아요</div>
						<div>4 - 맘에 들어요</div>
						<div>3 - 보통이에요</div>
						<div>2 - 그냥 그래요</div>
						<div>1 - 별로에요</div>
					</div>
				</div>
				<br>
				<br>
				<div class="mb-1">
					<label class="form-label"> + 사진 추가</label>
					<jsp:include page="../util/upload/uploadAjax.jsp" flush="false"/>
				</div>
				<div class="text-secondary">
					최대 4장 첨부가능하며 상품과 관련없는 포토 리뷰는 통보없이 삭제될 수 있습니다.
				</div>
				<div class="fw-bold mt-5">
					<p class="fs-5">
						🐤 사이즈 어때요? 🐤
					</p>
				</div>
				<div class="">
					<select class="form-select" id="selectCloth">
						<option>
							많이 작아요
						</option>
						<option>
							조금 작아요
						</option>
						<option selected>
							잘 맞아요
						</option>
						<option>
							조금 커요
						</option>
						<option>
							많이 커요
						</option>
					</select>
				</div>
				<div class="fw-bold mt-5">
					<p class="fs-5">
						🐤 사이즈 한줄평 🐤
					</p>
				</div>
				<div class="form-floating">
					<textarea class="form-control my-3" placeholder="size lol" id="sizeoneline" style="height: 100px"></textarea>
					<label for="sizeoneline">사이즈 한줄평 입력</label>
				</div>
				<div class="fw-bold mt-5">
					<p class="fs-5">
						🐤 키 🐤
					</p>
				</div>
				<div class="">
					<input class="form-control" type="number" id="heinum" min="100" max="210" placeholder="키 입력">
				</div>
				<div class="fw-bold mt-5">
					<p class="fs-5">
						🐤 몸무게 🐤
					</p>
				</div>
				<div class="">
					<input class="form-control" type="number" id="widnum" min="30" max="150" placeholder="몸무게 입력">
				</div>
				<div class="fw-bold mt-5">
					<p class="fs-5">
						🐤 평소사이즈-상의 🐤
					</p>
				</div>
				<div class="">
					<select class="form-select" id="selectSize">
						<option disabled selected>
							평소사이즈-상의 선택
						</option>
						<option>
							XS
						</option>
						<option>
							S
						</option>
						<option>
							M
						</option>
						<option>
							L
						</option>
						<option>
							XL
						</option>
					</select>
				</div>
				<div class="fw-bold mt-5">
					<p class="fs-5">
						🐤 평소사이즈-하의 🐤
					</p>
				</div>
				<div class="mb-5">
					<select class="form-select" id="">
						<option disabled selected>
							평소사이즈-하의 선택
						</option>
						<option>
							23
						</option>
						<option>
							24
						</option>
						<option>
							25
						</option>
						<option>
							26
						</option>
						<option>
							27
						</option>
						<option>
							28
						</option>
						<option>
							29
						</option>
						<option>
							30
						</option>
						<option>
							31
						</option>
						<option>
							32
						</option>
						<option>
							33
						</option>
						<option>
							34
						</option>
						<option>
							35
						</option>
						<option>
							36
						</option>
						<option>
							37
						</option>
					</select>
				</div>
				<hr />
			</form>
			<div class="d-grid gap-2 sticky-bottom">
				<button type="button" class="btn btn-success" id="btnSave">리뷰 남기고 적립금 받기</button>
			</div>
		</div>
	</section>
</article>

<!-- footer -->
<jsp:include page="../common/footer.jsp" flush="false" />


<script src="${contextPath}/resources/js/upload.js"></script>
<script>
	$("#btnSave").on("click", function(e) {
		e.preventDefault();

		if($("#reviewWrite").val() == "") {
			alert("리뷰 내용은 필수입니다.");
			$("#reviewWrite").focus();
			return false;
		}

		if($("#grade").val() == "") {
			alert("평점은 필수입니다.");
			$("#grade").focus();
			return false;
		}

		let formObj = $("form[role='form']");
		let str = "";

		$("#uploadResult li").each(function(i, obj) {
			let jobj = $(obj);
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

		if ($("#uploadResult li").length >= 5) {
			alert("사진은 최대 4장까지 첨부가능합니다.");
			return false;
		}

		formObj.append(str).submit();
	});

	$("#btnBack").on("click", function(e) {
		e.preventDefault();
		location.href="${contextPath}/product/detail?id=" + ${param.productId};
	});
</script>
</body>
</html>