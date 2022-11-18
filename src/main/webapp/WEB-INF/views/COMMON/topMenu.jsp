<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	

<%	/*
	sticky-top은 상단 공간을 차지하면서 위에 고정하고,
	fixed-top은 상단 공간을 차지하지 않고 위에 고정된다.
	일부 내용이 상단 메뉴바에 가려져서 보이지 않을 수 있다.
	*/
%>


    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
   
   <!-- 부가적인 테마 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
   
   <!-- jQuery -->
   <script src="../js/jquery-3.6.1.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
  <!--  <script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>-->

<header>  
<div class="container" >
<!------상위네브바---------->  


  <div  class="row d-flex justify-content-start p-4" id="">
    <nav class="navbar navbar-dark bg-dark fixed-top">
      <div class="row container-fluid">

        <div class="col-lg-2">
        <button class="navbar-toggler btn pull-left" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="btn-group" style="width:30px" role="group" aria-label="Button group with nested dropdown">
          <button type="button" class="btn btn-danger">Login</button>
          <button type="button" class="btn btn-warning">JoinUs</button>
        
          <div class="btn-group" role="group">
            <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              MY PAGE
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">주문조회</a></li>
              <li><a class="dropdown-item" href="#">회원정보수정</a></li>
              <li><a class="dropdown-item" href="#">관심상품</a></li>
              <li><a class="dropdown-item" href="#">적립금</a></li>
              <li><a class="dropdown-item" href="#">나의게시물</a></li>
              <li><a class="dropdown-item" href="#">최근본상품</a></li>
            </ul>
          </div>
        </div>
       <!--- <a href="">LOGIN</a>
        <a href="">JOIN US</a>-->
      </div>

      <div class="col-lg-8 text-center">
        <a class="btn btn-dark btn-block " type="button" >EZEN:DAY</a>
      </div>  

        <div class="col-lg-2">
        <div class="col-lg-2 input-group mb-2 pt-2 ">
          <form class="d-flex" role="search"></form>
            <input type="text" class="form-control rounded-start " placeholder="검색">
            <button class="btn btn-outline-secondary" type="button" >검색</button>
          </form>
        </div>
      </div>

    </div>


        <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
          <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">EZEN:DAY</h5> 
            
           
            <input type="text" style="width:170px;" class="pull-right form-control" placeholder="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
          </div>

          <div class="offcanvas-body" >
            <div class="item">
              <fieldset>
               <ul class="navbar-nav justify-content-end flex-grow-1 pe-1">
                 <li class="nav-item">
                   MEMBER LOGIN
                 </li>
                 <li class="nav-item">
                   <input class="form-control " type="text" placeholder="E-MAIL">
                 </li>
                 <li class="nav-item">
                   <input class="form-control " type="password" placeholder="PW">
                 </li>
                 <div class="btn-group" role="group" aria-label="Default button group">
                  <button type="button" class="btn btn-outline-light">Login</button>
                  <button type="button" class="btn btn-outline-light">Join Us</button>
                  
                </div>
                 <!--<li class="nav-item ">
                   <button type="submit " style="width:49%" class="btn btn-light btn-md ">Login</button>
                   <button type="submit" style="width:49%"  class="btn btn-light btn-md ">JoinUs</button>
                 </li>-->             
              
               </ul>
              </fieldset>
           </div>
           
           <div class="right_board">
            <a href="">공지사항</a>
            <a href="">상품문의</a>
            <a href="">상품후기</a>
            <a href="">이벤트</a>
            <a href="">마이쇼핑</a>
            <a href="">주문조회</a>
            <a href="">배송조회</a>
            <a href="">장바구니</a>
            <a href="">관심상품</a>
            <a href="">최근본상품</a>
          

           </div>


          
           
           <hr>
           <div class="item">
             <div>
            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                 <li class="nav-item">
                   CUSTOMER CENTER
                 </li>
                 <li class="nav-item">
                   <b>T.1555-8272</b>
                 </li>
                 <li class="nav-item">
                   MON-FRI AM 11:00-PM 07:00
                 </li>
     
                 <li class="nav-item">
                   점심시간 PM 12:00-PM 01:00
                 </li>
                 <li class="nav-item">
                   SAT.SUN.HOLIDAY 
                    <b>closed</b>
                 </li>
               </ul>  
             </div>
     
             <hr>
             <div>
              <span>BANK ACCOUNT</span><br>
              농협 3021254462441 <br>
              국민 08950204225891 <br>
              예금주: 주식회사 이젠 (소병연)
             </div>



           </div>
     
           <div class="item">
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
      </div>
    </nav>
  </div>
 
  <hr>

  <!------End 상위네브바---------->  
  <!--------------------------------------------------------------------------------------------------->
     
<div class=" row container-fluid" style="float: none; margin:100 auto;" id="main_list">

  <!------로그인 회원가입 마이페이지-->    
  <div class="col-lg-2 align-self-center">
   <!-- <div >
        <a href="">LOGIN</a>
        <a href="">JOIN US</a>
                      
    </div> -->

    <div>
      <a class="btn btn-success btn-sm dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        MY PAGE
      </a>
    
      <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="#">주문조회</a></li>
        <li><a class="dropdown-item" href="#">회원정보수정</a></li>
        <li><a class="dropdown-item" href="#">관심상품</a></li>
        <li><a class="dropdown-item" href="#">적립금</a></li>
        <li><a class="dropdown-item" href="#">나의게시물</a></li>
        <li><a class="dropdown-item" href="#">최근본상품</a></li>
      </ul>
    </div> 
  </div>
  


    
    
       
    
<!------ End 로그인 회원가입 마이페이지-->  



  <div class="nav-scroller py-1 mb-2 col-lg-8 align-self-center" id="top_menu_list">
    <nav class="nav d-flex justify-content-between" id="top_menu_bar">
      <a class="p-2 link-secondary" href="">BEST</a>
      <a class="p-2 link-secondary" href="">NEW</a>
      <a class="p-2 link-secondary" href="">MADE</a>
      <a class="p-2 link-secondary" href="">남녀공용</a>
      <a class="p-2 link-secondary" href="">멘즈데이</a>
      <a class="p-2 link-secondary" href="">OUTER</a>
      <a class="p-2 link-secondary" href="">TOP</a>
      <a class="p-2 link-secondary" href="">DRESS&SET</a>
      <a class="p-2 link-secondary" href="">SKIRT</a>
      <a class="p-2 link-secondary" href="">PANTS</a>
      <a class="p-2 link-secondary" href="">SHOES&BAG</a>
      <a class="p-2 link-secondary" href="">ACC</a>
      <a class="p-2 link-secondary" href="">빅스데이</a>
      <a class="p-2 link-secondary" href="">SALE</a>
    </nav>
  </div>
  
  <!-------------------커뮤니티 버튼------------------------------------------------------------------------------------------------>
<div class="col-lg-2 align-self-center" style="float: none; margin:100 auto;">
  <div class="dropdown d-grid gap-2 d-md-flex justify-content-md-end"> 
    <a class="btn btn-success btn-sm dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
      COMMUNITY
    </a>
  
    <ul class="dropdown-menu">
      <li><a class="dropdown-item" href="#">NOTICE</a></li>
      <li><a class="dropdown-item" href="#">Q&A</a></li>
      <li><a class="dropdown-item" href="#">REVIEW</a></li>
      <li><a class="dropdown-item" href="#">EVENT</a></li>
      <li><a class="dropdown-item" href="#">입고지연</a></li>
    </ul>
  </div>
  </div>

 </div>
</header>  
<hr>
<!------ body----------------------------------------->  



