<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%  request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>kikerday</title>
    </head>
    <body>
	    <!-- header -->
		<jsp:include page="../common/header.jsp" flush="false"/>
        
        <!-- 마이 페이지 -->
        <!-- article -->
        <article>
            <div class="text-center m-5">
                <h1>MY PAGE</h1>
            </div>
            <div class="container text-center m-5">
                <div class="row row-cols-2">
                    <div class="col">가용적립금 2,000원<button class="btn btn-secondary btn-sm mx-2">조회</button></div>
                    <div class="col">총적립금 2,000원</div>
                    <div class="col">사용적립금 0원</div>
                    <div class="col">총 주문 0원(0회)</div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-12 m-2">
                        <h3>나의 주문처리 현황 (최근 3개월 기준)</h3>
                    </div>
                    <div class="row text-center m-2">
                        <div class="col-2">
                            입금전<br><a href="#">0</a>
                        </div>
                        <div class="col-2">
                            배송준비중<br><a href="#">0</a>
                        </div>
                        <div class="col-2">
                            배송중<br><a href="#">0</a>
                        </div>
                        <div class="col-2">
                            배송완료<br><a href="#">0</a>
                        </div>
                        <div class="col-2">
                            입금전<br><a href="#">0</a>
                        </div>
                        <div class="col-2">
                            <ul>
                                <li>취소 : <a href="#">0</a></li>
                                <li>교환 : <a href="#">0</a></li>
                                <li>반품 : <a href="#">0</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-4 text-center">
                        <div class="list-group" id="list-tab" role="tablist">
                            <a class="list-group-item list-group-item-action active" id="find-order-find" data-bs-toggle="list" href="#find-order" role="tab" aria-controls="find-order">주문내역 조회</a>
                            <a class="list-group-item list-group-item-action" id="my-profile-my" data-bs-toggle="list" href="#my-profile" role="tab" aria-controls="my-profile">회원 정보</a>
                            <a class="list-group-item list-group-item-action" id="favorite-pro-favorite" data-bs-toggle="list" href="#favorite-pro" role="tab" aria-controls="favorite-pro">관심 상품</a>
                            <a class="list-group-item list-group-item-action" id="bonus-money-bonus" data-bs-toggle="list" href="#bonus-money" role="tab" aria-controls="bonus-money">적립금</a>
                            <a class="list-group-item list-group-item-action" id="board-management-board" data-bs-toggle="list" href="#board-management" role="tab" aria-controls="board-management">게시물 관리</a>
                        </div>
                    </div>
                    <div class="col-8">
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="find-order" role="tabpanel" aria-labelledby="find-order-find">고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.
                                <a href="#"><button class="btn btn-outline-secondary">주문내역 조회 페이지로 이동하기</button></a>
                            </div>
                            <div class="tab-pane fade" id="my-profile" role="tabpanel" aria-labelledby="my-profile-my">회원이신 고객님의 개인정보를 관리하는 공간입니다.
                                <a href="#"><button class="btn btn-outline-secondary">회원 정보 페이지로 이동하기</button></a>
                            </div>
                            <div class="tab-pane fade" id="favorite-pro" role="tabpanel" aria-labelledby="favorite-pro-favorite">관심상품으로 등록하신 상품의 목록을 보여드립니다.
                                <a href="#"><button class="btn btn-outline-secondary">관심 상품 페이지로 이동하기</button></a>
                            </div>
                            <div class="tab-pane fade" id="bonus-money" role="tabpanel" aria-labelledby="bonus-money-bonus">적립금은 상품 구매 시 사용하실 수 있습니다.
                                <a href="#"><button class="btn btn-outline-secondary">적립금 페이지로 이동하기</button></a>
                            </div>
                            <div class="tab-pane fade" id="board-management" role="tabpanel" aria-labelledby="board-management-board">고객님께서 작성하신 게시물을 관리하는 공간입니다.
                                <a href="#"><button class="btn btn-outline-secondary">게시물 관리 페이지로 이동하기</button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>


        <!-- footer -->
        <hr>
		<jsp:include page="../common/footer.jsp" flush="false"/>
    </body>
</html>