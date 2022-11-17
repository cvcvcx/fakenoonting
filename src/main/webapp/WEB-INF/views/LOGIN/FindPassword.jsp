<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FindPassword</title>
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
</head>
<body>

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
<div class="container">
    <div class="contents">
       
      <!--------------------------------------------------------------------------->  
      <div>
        <span>현재 위치</span>
    <ol>
        <li>
            <a href="/">HOME</a>
        </li>
        <li>
            <strong>FIND PASSWORD</strong>
        </li>
    </ol>
    </div>

     <!--------------------------------------------------------------------------->  
  

    <div>
        <h2> FIND PASSWORD</h2>
       
    </div>


    <!--------------------------------------------------------------------------->  


    <form action="">
        <input type="hidden">

        <div>
            <h3>비밀번호 찾기</h3>
            <fieldset>
                <legend>비밀번호 찾기</legend>

                 <p>
                    <strong>회원유형</strong>
                     <select name="" id="">
                        <option value="">개인회원</option>
                        <option value="">개인사업자회원</option>
                        <option value="">법인사업자회원</option>
                        <option value="">외국인회원</option>
                     </select>                
                 </p>

                 <p>
                    <label style="display:none"></label>
                    <input type="radio" checked="checked">
                    <label for="">이메일</label>
                    <input type="radio">
                    <label for="">
                        <span style="display:inline;">휴대폰번호</span> 
                    </label>                  
                 </p>

                <p>
                    <strong>아이디</strong>
                    <input type="text">
                </p>

                 <p>
                    <strong>이름</strong>
                    <input type="text">
                 </p>

                 <p>
                    <strong>이메일로 찾기</strong>
                    <input type="text">
                 </p>

                 <div>
                    <a href="">확인</a>

                 </div>

            </fieldset>
        </div>










    </form>
















            <!------------------------------------- -->
            <div>
                <a href=""><img src="" alt=""></a>
                <a href=""><img src="" alt=""></a>
             </div>


            <!------------------------------------- -->




            <!------------------------------------- -->
           
            <div>
                <div>
                   <a href=""><i>ㅇ</i></a> 
                   <a href=""><i><span>즐겨찾기</span></i></a> 
                   <a href=""><i><span>최근본상품</span></i></a> 
                   <a href=""><i><span>장바구니</span></i></a> 
                   <a href=""><i><span>위로</span></i></a> 
                   <a href=""><i><span>아래로</span></i></a> 
        
        
        
                </div>
            </div>
        
        

            <!------------------------------------- -->



        </div>
    </div>
    
 </div>
</div>


<!------------------- END body------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------>
<!------------------------------------------------------------------------------------------------>

<hr>
<footer >
  <div  id="footer_inner" >
    <div id="footer_menu">
      <span>
        <a href="">홈</a>
        <a href="">회사소개</a>
        <a href="">이용약관</a>
        <a href="">개인정보취급방침</a>
        <a href="">이용안내</a>
      </span>
    </div>
<!----------------------------------------------------------------------------->
<div class="row justify-content-between">
  <div class="col-lg-3 " id="footer_box">
        <div>
            <h2>CUSTOMER CENTER</h2>
            <b>T.1555-8272</b>
            MON-FRI AM 11:00 - PM 07:00
            <br>
            점심시간 PM 12:00 - PM 01:00
            <br>
            SAT.SUN.HOLIDAY 
            <span>closed</span>
            <br><br>

            <span>
                농협 302-1254-4624-41
                <br>
                예금주: 주식회사 창훈
            </span>
        </div>
      </div>  
<!------------------------------->
        <div class="col-lg-5 ">
            <h2>RETURN/EXCHANGE</h2>

            <span>
                교환/반품주소 : (우 06336) 서울 강남구 개포로 619 서울강남우체국 소포실
                <br>
                우체국택배 1588-1300
                <a href=""><b>[배송조회]</b></a>
                <br><br>
                ※ 고객센터 통하여 먼저 접수 후 상품을 보내주셔야하며,
                <br>
                지정택배사를 이용해주시기 바랍니다.
            </span>
        </div>
<!------------------------------->
        <div class="col-lg-2 " id="foot_link">
            <h2>MEMBER</h2>

            <a class="a" href="">장바구니</a><br>
            <a class="a" href="">마이페이지</a><br>
            <a class="a" href="">주문조회</a><br>
            <a class="a" href="">회원정보수정</a><br>
            <a class="a" href="">관심상품</a><br>
            <a class="a" href="">적립금</a><br>
            <a class="a" href="">최근본상품</a><br>

        </div>
<!------------------------------->
          <div class="col-lg-1 " id="foot_link">
            <h2>COMMUNITY</h2>

            <a class="a" href="">NOTICE</a> <br>
            <a class="a" href="">Q&A</a> <br>
            <a class="a" href="">REVIEW</a> <br>
            <a class="a" href="">EVENT</a><br>
            <a class="a" href="">입고지연</a>

            <br>
            <h2>SNS</h2>
            <a class="a" href="">
                <i></i>
                이젠인스타
            </a>
        </div>
  

</div>
<!-------------------------------------------------------------------------------->
    <div id="footer_add">
     COMPANY:<span>주식회사 창훈</span>
     OWNER: <span>조창훈</span>
       TEL: <span>1555-8272</span>
      ADDRESS: <span>서울 종로구 종로2길 이젠빌딩 3F</span>
      <br>
        BUSINESS LICENSE: <span>111-11-11111</span>
        ONLINE ORDER LICENSE: <span>2022-서울종로-1233</span>
        <a href="">[사업자정보확인]</a>
        CHIEF PRIVACY OFFICER: <span>조창훈</span> <br>
        E-MAIL: <span><a href="">tiffha3137@naver.com</a></span>
        <span>HOSTING BY 이젠(주)</span>  
        
    </div>

    <div id=" ">
        <span>COPYRIGHT(c)주식회사 창훈 ALL RIGHTS RESERVED. DESIGN BY SOBYEONGYEON</span>
    </div>

  </div>
</footer>

<!------오른쪽 고정바----------------------------------------------------------------------------------------->

<div class="fixed_leftbar">
  <div class="left_bt">
    <div>
      <a href=""><i></i>a</a>
      <a href=""><i></i></a>
      <a href=""><i></i></a>
      <a href=""><i></i></a>
      <a href=""><i></i></a>
      <a href=""><i></i></a>
      <a href=""><i></i></a>
      <a href=""><i></i></a>
    </div>
  </div>
</div>



<!--------- END 오른쪽 고정바-------------------------------------------------------------------------------------->




<!-- PC TOP 버튼 HTML -->
<div onclick="topFunction()" id="scrollTopPc" class="hidden-md hidden-sm hidden-xs">
  <a href="">
  <img src="/IMAGE/Basic_Up_Down_Button_ver_2.0/Basic_Up_Down_Button ver 2.0/PNG/btn_up_light.png" width="40px" height="40px">
</a>
</div> 
<!-- 모바일 TOP 버튼 HTML -->
<div onclick="topFunctionMob()" id="scrollTopMob" class="hidden-lg">
  <a href="">
  <img src="/IMAGE/Basic_Up_Down_Button_ver_2.0/Basic_Up_Down_Button ver 2.0/PNG/btn_up_dark.png" width="40px" height="40px">
</a>
</div>
<!-- PC DOWN 버튼 HTML -->
<div onclick="downFunction()" id="scrollDownPc" class="hidden-md hidden-sm hidden-xs">
  <a href="">
  <img src="/IMAGE/Basic_Up_Down_Button_ver_2.0/Basic_Up_Down_Button ver 2.0/PNG/btn_down_light.png" width="40px" height="40px">
</a>
</div> 
<!-- 모바일 DOWN 버튼 HTML -->
<div onclick="downFunctionMob()" id="scrollDownMob" class="hidden-lg">
  <a href="">
  <img src="/IMAGE/Basic_Up_Down_Button_ver_2.0/Basic_Up_Down_Button ver 2.0/PNG/btn_down_dark.png" width="40px" height="40px">
</a>
</div>

<!-- 상단/하단 이동 스크롤 스크립트 -->
<script>
window.onscroll = function() { scrollFunction() };

function scrollFunction() {
  if (document.body.scrollTop > 100 || document.documentElement.scrollTop < 10) {
      document.getElementById("scrollTopPc").style.display = "block";
      document.getElementById("scrollTopMob").style.display = "block";
      document.getElementById("scrollDownPc").style.display = "block";
      document.getElementById("scrollDownMob").style.display = "block";
  } else {
      document.getElementById("scrollTopPc").style.display = "none";
      document.getElementById("scrollTopMob").style.display = "none";
      document.getElementById("scrollDownPc").style.display = "none";
      document.getElementById("scrollDownMob").style.display = "none";
  }
}

// PC TOP 버튼 동작
function topFunction() {
  $('html,body').animate({ scrollTop: 0 }, 500);
}
// 모바일 TOP 버튼 동작
function topFunctionMob() {
  $('html,body').animate({ scrollTop: 0 }, 500);
}
// PC DOWN 버튼 동작
function downFunction() {
  $('html, body').animate({ scrollTop: $('#doz_footer').offset().top }, 500);
}
// 모바일 DOWN 버튼 동작
function downFunctionMob() {
  $('html, body').animate({ scrollTop: $('#doz_footer').offset().top }, 500);
}
</script>





</body>
</html>