<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
	rel="stylesheet" />
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous" />
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>

<!-- header -->
<header>
	<div class="container">
		<!-- 상위네브바 -->
		<div class="row d-flex justify-content-start p-2">
			<nav class="navbar navbar-white bg-white fuxid-top">
				<div class="row container-fluid">
					<div class="col-lg-3 col-sm-1">
						<div class="btn-group" role="group"
							aria-label="Button group with nested dropdown">

							<c:choose>
								<c:when test="${isLogOn == true && member != null}">
									<a href="${contextPath}/member/logout.do">
										<button type="button" class="btn btn-default">LOGOUT</button>
									</a>
								</c:when>
								<c:otherwise>
									<a href="${contextPath}/member/loginForm.do">
										<button type="button" class="btn btn-default">LOGIN</button>
									</a>
								</c:otherwise>
							</c:choose>

							<a href="${contextPath}/member/regiMemberForm.do"><button
									type="button" class="btn btn-default">JOIN US</button></a>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default dropdown-toggle"
									data-bs-toggle="dropdown" aria-expanded="false">MY
									PAGE</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item"
										href="${contextPath}/member/myPage.do">마이 페이지</a></li>
									<li><a class="dropdown-item"
										href="${contextPath}/order/orderLookup">주문조회</a></li>
									<li><a class="dropdown-item"
										href="${contextPath}/member/updateMemberForm.do">회원정보수정</a></li>
									<li><a class="dropdown-item" href="#">최근본상품</a></li>
									<li><a class="dropdown-item" href="#">관심상품</a></li>
									<li><a class="dropdown-item" href="#">나의리뷰</a></li>
									<li><a class="dropdown-item" href="#">나의문의</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-sm-2 text-center">
						<a href="${contextPath}/"><button class="btn btn-black"
								type="button">
								<img src="${contextPath}/resources/images/logo.png">
							</button></a>
					</div>
					<div class="col-lg-3 col-sm-1">
						<div class="col-lg-2 input-group">
							<!-- mb-2 pt-2 -->
							<form class="d-flex" role="button">
								<input type="text" class="form-control rounede-start"
									id="keyword" name="keyword" placeholder="검색">
								<button class="btn btn-outline-secondary" type="submit">
									<span class="material-icons-outlined"> search </span>
								</button>
								<div class="">
									<a href="#" class="wish_icon"> <span
										class="material-icons-outlined"> favorite_border </span></a>
								</div>
								<div class="">
									<a href=" ${contextPath}/cart/list" class="cart_icon"> <span
										class="material-icons-outlined"> shopping_cart </span></a>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- 햄버거 버튼 부분 -->
				<div class="offcanvas offcanvas-end text-bgdark" tabindex="-1"
					id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
					<div class="offcanvas-header">
						<div class="offcanvas-title" id="offcanvasDarkNavbarLabel">
							<a href="#"><button class="btn btn-black" type="button">
									<img src="${contextPath}/resources/images/logo.png">
								</button></a>
						</div>
					</div>
					<div class="offcanvas-body">
						<form class="form-horizontal" method="post" name="hamLoginForm"
							action="${contextPath}/member/login.do">
							<div class="item">
								<fieldset>

									<c:choose>
										<c:when test="${isLogOn == true && member != null}">
											<a href="${contextPath}/member/logout.do">
												<button type="button" class="btn btn-default">LOGOUT</button>
											</a>
										</c:when>
										<c:otherwise>
											<ul class="navbar-nav justify-content-end flex-grow-1 pe-1">
												<li class="nav-item"><b>MEMBER LOGIN</b></li>
												<li class="nav-item"><input class="form-control "
													type="text" id="email" name="email" placeholder="E-MAIL"></li>
												<li class="nav-item"><input class="form-control "
													type="password" id="pwd" name="pwd" placeholder="Password"></li>
												<div class="" 	>
													<button type="submit" class="btn btn-black">Login</button>
													<a  href="${contextPath}/member/regiMemberForm.do">
														<button type="button" class="btn btn-black">Join Us	</button>
													</a>
												</div>
											</ul>
										</c:otherwise>
									</c:choose>

								</fieldset>
							</div>
							<div class="right_board">
								<a href="#">Q&A</a> <a href="#">REVIEW</a>
							</div>
						</form>
						<hr>
						<div class="item">
							<div>
								<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
									<li class="nav-item"><b>CUSTOMER CENTER</b></li>
									<li class="nav-item">T.1555-8272</li>
									<li class="nav-item">MON-FRI AM 11:00-PM 07:00</li>
									<li class="nav-item">점심시간 PM 12:00-PM 01:00</li>
									<li class="nav-item">SAT.SUN.HOLIDAY...closed</li>
								</ul>
							</div>
						</div>
						<div>
							<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
								<li class="nav-item">TODAY VIEW</li>
								<li class="nav-item"><a class="nav-link" href="#">+more
										view</a></li>
							</ul>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<hr>
	<div class="row container-fluid" style="float: none; margin: auto;"
		id="main_list">
		<div class="col-lg-2 align-self-center"
			style="float: none; margin: auto;">
			<button class="navbar-toggler btn pull-left" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar"
				aria-controls="offcanvasDarkNavbar">
				<span class="material-icons-outlined">menu</span>
			</button>
		</div>
		<div class="nav-scroller py-1 mb-2 col-lg-8 align-self-center"
			id="top_menu_list">
			<nav class="nav d-flex justify-content-between" id="top_menu_bar">
				<a class="p-2 link-secondary" href="${contextPath}/product/list">TOP</a>
				<a class="p-2 link-secondary" href="#">PANTS</a> <a
					class="p-2 link-secondary" href="#">OUTER</a> <a
					class="p-2 link-secondary" href="#">SHOES</a> <a
					class="p-2 link-secondary" href="#">BAG</a> <a
					class="p-2 link-secondary" href="#">ACC</a> <a
					class="p-2 link-secondary" href="#"><b style="color: red;">SALE</b></a>
			</nav>
		</div>
		<!-- 커뮤니티 버튼 -->
		<div class="col-md-2 align-self-center"
			style="float: none; margin: auto;">
			<div class="dropdown d-grid gap-2 d-md-flex justify-content-md-end">
				<a class="btn btn-success btn-sm dropdown-toggle" href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
					COMMUNITY </a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#">QandA</a></li>
					<li><a class="dropdown-item" href="#">REVIEW</a></li>

					<c:choose>
						<c:when test="${isLogOn == true && member != null}">
							<li><a class="dropdown-item"
								href="${contextPath}/product/adminList">admin 물품 리스트</a></li>
							<li><a class="dropdown-item"
								href="${contextPath}/product/upload">admin 물품 등록</a></li>
						</c:when>
					</c:choose>

				</ul>
			</div>
		</div>
	</div>
</header>
<hr>
<!------ body----------------------------------------->