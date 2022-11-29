<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="result"		 value="${param.result}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="/style.css">
    
</head>
<body>

  <!-- 메뉴바 -->
<jsp:include page="../common/header.jsp" flush="false"/>

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
<!-- 푸터 -->
<jsp:include page="../common/footer.jsp" flush="false"/>


</body>
</html>