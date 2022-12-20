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

		<!-- article -->
        <article>
            <section>
                <div class="container">
                    <div class="row">
                        <div class="col-6">
                            TOTAL 0 PRODUCT
                        </div>
                        <div class="col-6 text-end">
                            <div class="row">
                                <div class="col-3">
                                    <a href="#" class="link-secondary" style="text-decoration: none;">
                                        신상품
                                    </a>
                                </div>
                                <div class="col-3">
                                    <a href="#" class="link-secondary" style="text-decoration: none;">
                                        낮은가격
                                    </a>
                                </div>
                                <div class="col-3">
                                    <a href="#" class="link-secondary" style="text-decoration: none;">
                                        높은가격
                                    </a>
                                </div>
                                <div class="col-3">
                                    <a href="#" class="link-secondary" style="text-decoration: none;">
                                        인기상품
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- 상품 -->
            <section>
                <div class="container">
                    <div class="row row-cols-1 row-cols-md-4 g-4 mt-5">
                    <c:forEach items="${list}" var="list">
                        <c:set var="imgItem" value="${list.productImgItems[0]}" />
                            <div class="col">
                                <div class="card h-100">
                                    <a href="${contextPath}/product/detail?id=${list.id}">
                                        <img src="${contextPath}/util/upload/display?fileName=${imgItem.uploadPath}/s_${imgItem.imgUUID}_${imgItem.orgImgName}"
                                        class="card-img-top w-100" alt="상품">
                                    </a>
                                    <div class="card-body">
                                        <p class="card-title">${list.productName}</p>
                                            <hr/>
                                        <p class="card-text">${list.price}</p>
                                    </div>
                                </div>
                            </div>
                    </c:forEach>
                    </div>
                </div>
            </section>
            <section>
                <nav aria-label="Page navigation" class="text-center">
                    <ul class="pagination justify-content-center mt-3">
                        <li class="page-item">
                            <a class="page-link link-secondary" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link link-secondary" href="#">1</a></li>
                        <li class="page-item"><a class="page-link link-secondary" href="#">2</a></li>
                        <li class="page-item"><a class="page-link link-secondary" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link link-secondary" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </section>
        </article>



    	<!-- footer -->
        <hr>
		<jsp:include page="../common/footer.jsp" flush="false"/>
    </body>
</html>
