<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- header -->
<header>
    <div class="container">
        <!-- 상위네브바 -->
        <div class="row d-flex justify-content-start p-2">
            <nav class="navbar navbar-white bg-white fuxid-top">
                <div class="row container-fluid">
                    <div class="col-lg-3 col-sm-1">
                        <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                            <a href="#"><button type="button" class="btn btn-default">LOGIN</button></a>
                            <a href="#"><button type="button" class="btn btn-default">JOIN US</button></a>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    MY PAGE
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">마이 페이지</a></li>
                                    <li><a class="dropdown-item" href="#">주문조회</a></li>
                                    <li><a class="dropdown-item" href="#">회원정보수정</a></li>
                                    <li><a class="dropdown-item" href="#">최근본상품</a></li>
                                    <li><a class="dropdown-item" href="#">관심상품</a></li>
                                    <li><a class="dropdown-item" href="#">나의리뷰</a></li>
                                    <li><a class="dropdown-item" href="#">나의문의</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-2 text-center">
                        <a href="${contextPath}"><button class="btn btn-black" type="button"><img src="${contextPath}/resources/images/logo.png"></button></a>
                    </div>
                    <div class="col-lg-3 col-sm-1">
                        <div class="col-lg-2 input-group"><!-- mb-2 pt-2 -->
                            <form class="d-flex" role="button">
                                <input type="text" class="form-control rounede-start" id="keyword" name="keyword" placeholder="검색">
                                <button class="btn btn-outline-secondary" type="submit">
                                    <span class="material-icons-outlined">
                                        search
                                    </span>
                                </button>
                                <div class=""><a href="#" class="wish_icon">
                                    <span class="material-icons-outlined">
                                        favorite_border
                                    </span></a>
                                </div>
                                <div class=""><a href="#" class="cart_icon">
                                    <span class="material-icons-outlined">
                                        shopping_cart
                                    </span></a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- 햄버거 버튼 부분 -->
                <div class="offcanvas offcanvas-end text-bgdark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
                    <div class="offcanvas-header">
                        <div class="offcanvas-title" id="offcanvasDarkNavbarLabel">
                            <a href="${contextPath}"><button class="btn btn-black" type="button"><img src="${contextPath}/resources/images/logo.png"></button></a>
                        </div>
                    </div>
                    <div class="offcanvas-body">
                        <div class="item">
                            <fieldset>
                                <ul class="navbar-nav justify-content-end flex-grow-1 pe-1">
                                    <li class="nav-item">
                                        <b>MEMBER LOGIN</b>
                                    </li>
                                    <li class="nav-item">
                                        <input class="form-control " type="text" placeholder="E-MAIL">
                                    </li>
                                    <li class="nav-item">
                                        <input class="form-control " type="password" placeholder="PW">
                                    </li>
                                    <div class="btn-group" role="group" aria-label="Default button group">
                                        <button type="button" class="btn btn-black">Login</button>
                                        <button type="button" class="btn btn-black">Join Us</button>
                                        <!-- <button type="button" class="btn btn-outline-light">Join Us</button> -->
                                    </div>
                                </ul>
                            </fieldset>
                        </div>
                        <div class="right_board">
                            <a href="#">Q&A</a>
                            <a href="#">REVIEW</a>
                        </div>
                        <hr>
                        <div class="item">
                            <div>
                                <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                                    <li class="nav-item">
                                        <b>CUSTOMER CENTER</b>
                                    </li>
                                    <li class="nav-item">
                                        T.1555-8272
                                    </li>
                                    <li class="nav-item">
                                        MON-FRI AM 11:00-PM 07:00
                                    </li> 
                                    <li class="nav-item">
                                        점심시간 PM 12:00-PM 01:00
                                    </li>
                                    <li class="nav-item">
                                        SAT.SUN.HOLIDAY...closed
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div>
                            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                                <li class="nav-item">
                                    TODAY VIEW
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">+more view</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div> 
            </nav>
        </div>
    </div>
    <hr>
    <div class="row container-fluid" style="float: none; margin:100 auto;" id="main_list">
        <div class="col-lg-2 align-self-center" style="float: none; margin:100 auto;">
            <button class="navbar-toggler btn pull-left" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
                <span class="material-icons-outlined">menu</span>
            </button>
        </div>
        <div class="nav-scroller py-1 mb-2 col-lg-8 align-self-center" id="top_menu_list">
            <nav class="nav d-flex justify-content-between" id="top_menu_bar">
                <a class="p-2 link-secondary" href="#">TOP</a>
                <a class="p-2 link-secondary" href="#">PANTS</a>
                <a class="p-2 link-secondary" href="#">OUTER</a>
                <a class="p-2 link-secondary" href="#">SHOES</a>
                <a class="p-2 link-secondary" href="#">BAG</a>
                <a class="p-2 link-secondary" href="#">ACC</a>
                <a class="p-2 link-secondary" href="#"><b style="color: red;">SALE</b></a>
            </nav>
        </div>
        <!-- 커뮤니티 버튼 -->
        <div class="col-md-2 align-self-center" style="float: none; margin:100 auto;">
            <div class="dropdown d-grid gap-2 d-md-flex justify-content-md-end">
                <a class="btn btn-success btn-sm dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    COMMUNITY
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">QandA</a></li>
                    <li><a class="dropdown-item" href="#">REVIEW</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<hr>
<!------ body----------------------------------------->  