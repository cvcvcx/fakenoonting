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
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
            rel="stylesheet">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
            rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
            crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous">
        </script>
        <style>
            img[alt] {
                padding: 0%;
                margin: 0.1%;
                width: 32%;
            }
            .carousel-fade .carousel-item, .carousel-item img  {
                max-height: 80vh;
            }
        </style>
        <title>kikerday</title>
    </head>
    <body>
	    <!-- 메뉴바 -->
		<jsp:include page="./common/header.jsp" flush="false"/>
        
        <!-- article -->
        <article>
            <section>
                <div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="carousel"><!-- data-bs-ride="carousel"을 지우고 data-bs-touch="false" data-bs-interval="false"를 넣으면 자동재생이 되지않는다.(자동 재생 비활성화)-->
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active" data-bs-interval="5000">
                            <img src="${contextPath}/resources/images/cat7.jpg" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>냥냥이 프린팅 후드티</h5>
                                <p>귀여운 냥냥이가 꽃을 만지는 모습이 프린팅 되어있는 후드티! 편안하고 귀여워 고민 없이 손이 가는 사랑스러운 후드티!</p>
                            </div>
                        </div>
                        <div class="carousel-item" data-bs-interval="5000">
                            <img src="${contextPath}/resources/images/cat4.png" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>야옹이 프린팅 맨투맨</h5>
                                <p>컴퓨터를 구경하는 귀여운 야옹이 모습이 프린팅 되어있는 맨투맨.</p>
                            </div>
                        </div>
                        <div class="carousel-item" data-bs-interval="5000">
                            <img src="${contextPath}/resources/images/cat5.jpg" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>떼껄룩 자수 자켓</h5>
                                <p>다크 시크 떼껄룩이 자수로 박혀있는 자켓! 늦가을부터 초봄까지 꾸준히 착용 가능한 자켓!</p>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </section>
            <section>
                <a href="${contextPath}/productDetails"><img src="${contextPath}/resources/images/cat1.jpg" alt="사진"></a>
                <a href="${contextPath}/productDetails"><img src="${contextPath}/resources/images/cat2.png" alt="사진"></a>
                <a href="${contextPath}/productDetails"><img src="${contextPath}/resources/images/cat3.jpg" alt="사진"></a>
                <a href="${contextPath}/productDetails"><img src="${contextPath}/resources/images/cat4.png" alt="사진"></a>
                <a href="${contextPath}/productDetails"><img src="${contextPath}/resources/images/cat5.jpg" alt="사진"></a>
                <a href="${contextPath}/productDetails"><img src="${contextPath}/resources/images/cat6.png" alt="사진"></a>
                <a href="${contextPath}/productDetails"><img src="${contextPath}/resources/images/cat7.jpg" alt="사진"></a>
                <a href="${contextPath}/productDetails"><img src="${contextPath}/resources/images/cat8.png" alt="사진"></a>
                <a href="${contextPath}/productDetails"><img src="${contextPath}/resources/images/cat9.jpg" alt="사진"></a>
                <a href="${contextPath}/productDetails"><img src="${contextPath}/resources/images/cat10.jpg" alt="사진"></a>
                <a href="${contextPath}/productDetails"><img src="${contextPath}/resources/images/cat11.png" alt="사진"></a>
            </section>
        </article>

        <!-- footer -->
        <hr>
		<jsp:include page="./common/footer.jsp" flush="false"/>
    </body>
</html>