<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입 폼</title>
</head>
<body>


<!-- 메뉴바 -->
<jsp:include page="../common/topMenu.jsp" flush="false"/>
	
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
          <strong>JOIN</strong>
      </li>
  </ol>
  </div>

   <!--------------------------------------------------------------------------->  
   <div>
      <h2>JOIN</h2>
     
  </div>
  


  <!--------------------------------------------------------------------------->  
  <form action="">
  <div>
      <div>
          <table>
              <caption>회원정보입력</caption>
              <colgroup>
                  <col style="">
                  <col style="">
              </colgroup>

              <tbody>
                  <tr>
                      <th scope="col">E-MAIL</th>
                      <td><input type="text">(영문소문자/숫자, 4~16자)</td>
                  </tr>


                  <tr>
                      <th scope="col">비밀번호</th>
                      <td><input type="password">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합,10자~16자)</td>
                  </tr>

                  <tr>
                      <th scope="col">비밀번호 확인</th>
                      <td><input type="password"></td>
                  </tr>

                  <tr>
                      <th scope="col">이름</th>
                      <td><input type="text"></td>
                  </tr>

                  <tr>
                    <th scope="col">닉네임</th>
                    <td><input type="text"></td>
                  </tr>

                  <tr>
                      <th scope="col">주소</th>
                      <td>
                          <ul>
                              <li>
                                  <input type="text" placeholder="우편번호">
                                  <button type="button">주소검색</button>
                              </li>
                              <li>
                                  <input type="text" placeholder="기본주소">
                              </li>
                              <li>
                                  <input type="text" placeholder="나머지 주소(선택입력가능)">
                              </li>
                          </ul>
                      </td>
                  </tr>
                  
                  <tr>
                      <th scope="col">휴대전화</th>
                      <td>
                          <select name="" id="">
                              <option value="010">010</option>
                              <option value="011">011</option>
                              <option value="017">017</option>
                              <option value="019">019</option>
                          </select>
                          - <input type="text">- <input type="text">
                      </td>
                  </tr>

              </tbody>


          </table>
          

          <h3>전체동의</h3>
          <div>
              <input type="checkbox">
              <label for="">이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</label>
          </div>

          <div>
              <h3>[필수]이용약관 동의</h3>

              <div>
                  <p>제1조<br>이 약관은 빈스회사(전자상거래 사업자)가 운영하는 빈스데이 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.</p>
                
              </div>

              <span>이용약관에 동의하십니까?</span>
              <input type="checkbox"><label for="">동의함</label>
          </div>


          <div>
              <h3>[필수]개인정보 수집 및 이용 동의</h3>

              <div>
                  <p>제1조<br>이 약관은 빈스회사(전자상거래 사업자)가 운영하는 빈스데이 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.</p>
                
              </div>

              <span>개인정보 수집 및 이용에 동의하십니까?</span>
                  <input type="checkbox"><label for="">동의함</label>
              
          </div>

          <div>
              <h3>[선택]쇼핑정보 수신 동의</h3>

              <div>
                  <p>제1조<br>이 약관은 빈스회사(전자상거래 사업자)가 운영하는 빈스데이 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.</p>
                
              </div>

              <span>SMS 수신을 동의하십니까?</span>
                  <input type="checkbox"><label for="">동의함</label>
              <span>이메일 수신을 동의하십니까?</span>
              <input type="checkbox"><label for="">동의함</label>
          </div>

          






          <div>
              <a href="">회원가입</a>
          </div>

          <!------------------------------------- -->
   
          <!------------------------------------- -->
           
   

          <!------------------------------------- -->


      
      </div>
  </div>
</form>
</div>
</div>

	
<!-- 푸터 -->
<jsp:include page="../common/footer.jsp" flush="false"/>

	
</body>
</html>



















