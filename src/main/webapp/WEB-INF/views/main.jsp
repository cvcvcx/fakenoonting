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
                            <img src="${contextPath}/resources/images/cat7.png" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>First slide label</h5>
                                <p>Some representative placeholder content for the first slide.</p>
                            </div>
                        </div>
                        <div class="carousel-item" data-bs-interval="5000">
                            <img src="${contextPath}/resources/images/cat4.jpg" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>First slide label</h5>
                                <p>Some representative placeholder content for the first slide.</p>
                            </div>
                        </div>
                        <div class="carousel-item" data-bs-interval="5000">
                            <img src="${contextPath}/resources/images/cat5.png" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>First slide label</h5>
                                <p>Some representative placeholder content for the first slide.</p>
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
                <a href="#"><img src="${contextPath}/resources/images/cat1.jpg" alt="사진"></a>
                <a href="#"><img src="${contextPath}/resources/images/cat2.png" alt="사진"></a>
                <a href="#"><img src="${contextPath}/resources/images/cat3.jpg" alt="사진"></a>
                <a href="#"><img src="${contextPath}/resources/images/cat4.jpg" alt="사진"></a>
                <a href="#"><img src="${contextPath}/resources/images/cat5.png" alt="사진"></a>
                <a href="#"><img src="${contextPath}/resources/images/cat6.jpg" alt="사진"></a>
                <a href="#"><img src="${contextPath}/resources/images/cat7.png" alt="사진"></a>
                <a href="#"><img src="${contextPath}/resources/images/cat8.jpg" alt="사진"></a>
                <a href="#"><img src="${contextPath}/resources/images/cat9.png" alt="사진"></a>
                <a href="#"><img src="${contextPath}/resources/images/cat10.jpg" alt="사진"></a>
                <a href="#"><img src="${contextPath}/resources/images/cat11.jpg" alt="사진"></a>
            </section>
        </article>

        <!-- footer -->
        <hr>
		<jsp:include page="./common/footer.jsp" flush="false"/>
    </body>
</html>