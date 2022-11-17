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


<!------ body----------------------------------------->  

<div class="container">
    <div class="contents">
        <form action="">
      <!--------------------------------------------------------------------------->  
      <div>
        <span>현재 위치</span>
    <ol>
        <li>
            <a href="/">HOME</a>
        </li>
        <li>
            <strong>LOGIN</strong>
        </li>
    </ol>
    </div>

     <!--------------------------------------------------------------------------->  
    <div>
        <div>
            <h3>LOGIN</h3>
            <p>가입하신 아이디와 비밀번호를 입력해주세요.</p>
            <fieldset>
                <legend>회원로그인</legend>

                <label for="">
                    <input type="text" placeholder="E-MAIL(ID)">
                </label>

                <label for="">
                    <input type="password" placeholder="비밀번호">
                </label>

                <p>
                    <img src="" alt="">"보안접속"
                    <input type="checkbox">
                    <label for="">E-MAIL(ID) 저장</label>
                </p>

                <a href="">로그인</a>

                <ul>
                   
                  
                    <li>
                        <a href="">비밀번호찾기</a>
                    </li>
                </ul>


                <h3>MEMBERSHIP</h3>
                <p>회원가입을 하시면 다양하고 특별한 혜택이 준비되어 있습니다.</p>
                <a href="">회원가입</a>
                <ul>
                    <li><a href="">네이버로그인</a></li>
                    <li><a href="">카카오계졍로그인</a></li>
                </ul>
            </fieldset>

        </div>
    </div>
    </form>
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



</body>
</html>