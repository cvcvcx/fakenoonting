<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


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





