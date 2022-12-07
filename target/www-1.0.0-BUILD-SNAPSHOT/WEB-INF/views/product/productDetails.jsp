<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" /><meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>kikerday</title>
    </head>
    <body>
        <!-- 메뉴바 -->
        <jsp:include page="../common/header.jsp" flush="false" />

        <!-- article -->
        <article>
            <!-- start section -->
            <section>
                <div class="container">
                <h2>${product.id}</h2>
                    <div class="row">
                        <div class="col-md-6">
                            <img
                                src="${contextPath}/resources/images/cat1.jpg"
                                alt="사진"
                                class="w-100"
                            />
                        </div>
                        <div class="col-md-6 text-left">
                            <div class="row">
                                <div class="col-12 col-md-12">
                                    냥냥펀치 프린팅 기모 셔츠 7color
                                </div>
                            </div>
                            <hr />
                            <div class="row mb-3">
                                <div class="col-6 col-md-5">
                                    판매가
                                </div>
                                <div class="col-6 col-md-7">
                                    115,000원
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-8 col-md-5">
                                    색상
                                </div>
                                <div class="col-4 col-md-7">
                                    <select class="form-select" aria-label="select color">
                                        <option selected>색상을 선택해 주세요.</option>
                                        <option value="1">블랙</option>
                                        <option value="2">그레이</option>
                                        <option value="3">네이비</option>
                                        <option value="4">다크베이지</option>
                                        <option value="5">아이보리</option>
                                        <option value="6">라이트베이지</option>
                                        <option value="7">인디블루</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-8 col-md-5">
                                    Size
                                    <button class="btn btn-light">
                                        <a href="#modal-popup">사이즈 가이드</a>
                                    </button>
                                </div>
                                <div class="col-4 col-md-7">
                                    <select class="form-select" aria-label="select size">
                                        <option selected>사이즈를 선택해 주세요.</option>
                                        <option value="1">S</option>
                                        <option value="2">M</option>
                                        <option value="3">L</option>
                                        <option value="4">XL</option>
                                        <option value="5">2XL</option>
                                        <option value="6">3XL</option>
                                        <option value="7">4XL</option>
                                    </select>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-8 col-md-5">
                                    <label class="screen-reader-text">
                                        냥냥펀치 프린팅 기모 셔츠 7color<br />-블랙/S
                                    </label>
                                </div>
                                <div class="col-4 col-md-7">
                                    <input
                                        class="input-text qty-text"
                                        type="number"
                                        id="productCount"
                                        value="1"
                                    />
                                    <button
                                        type="button"
                                        class="btn-close"
                                        aria-label="Close">
                                    </button>
                                </div>
                            </div>
                            <hr />
                            <div class="row mb-3">
                                <div class="col-8 col-md-5">
                                    총 상품금액(수량)
                                </div>
                                <div class="col-4 col-md-7">
                                    <b>115,000원</b>(1개)
                                </div>
                            </div>

                            <!-- Button trigger modal -->
                            <div class="row text-center">
                                <div class="col-12 col-md-12">
                                    <div class="d-grid gap-2 mx-auto">
                                        <button type="button" role="buyButton" class="btn btn-dark">
                                            BUY IT NOW
                                        </button>

                                        <!-- Modal -->
                                        <div
                                            class="modal fade"
                                            id="buyNow"
                                            data-bs-backdrop="static"
                                            data-bs-keyboard="false"
                                            tabindex="-1"
                                            aria-labelledby="buyNowLabel"
                                            aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="buyNowLabel">
                                                            kikerday.com 내용
                                                        </h1>
                                                        <button
                                                            type="button"
                                                            class="btn-close"
                                                            data-bs-dismiss="modal"
                                                            aria-label="Close">
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        필수 옵션을 선택해주세요.
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button
                                                            type="button"
                                                            class="btn btn-primary"
                                                            data-bs-dismiss="modal">
                                                                확인
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Button trigger modal -->
                                        <button
                                            type="button"
                                            class="btn btn-light"
                                            data-bs-toggle="modal"
                                            data-bs-target="#wishButton">
                                                WISH
                                        </button>
                                        <!-- Modal -->
                                        <div
                                            class="modal fade"
                                            id="wishButton"
                                            data-bs-backdrop="static"
                                            data-bs-keyboard="false"
                                            tabindex="-1"
                                            aria-labelledby="wishButtonLabel"
                                            aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="wishButtonLabel">
                                                            kikerday.com 내용
                                                        </h1>
                                                        <button
                                                            type="button"
                                                            class="btn-close"
                                                            data-bs-dismiss="modal"
                                                            aria-label="Close">
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        관심상품으로 등록되었습니다.
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button
                                                            type="button"
                                                            class="btn btn-primary"
                                                            data-bs-dismiss="modal">
                                                                확인
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Button trigger modal -->
                                        <button
                                            type="button"
                                            id="cartButton"
                                            class="btn btn-light">
                                                CART
                                        </button>
                                        <!-- Modal -->
                                        <div
                                            class="modal fade"
                                            id="cartModal"
                                            data-bs-backdrop="static"
                                            data-bs-keyboard="false"
                                            tabindex="-1"
                                            aria-labelledby="cartbuttonLabel"
                                            aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="cartbuttonLabel">
                                                            장바구니 담기
                                                        </h1>
                                                        <button
                                                            type="button"
                                                            class="btn-close"
                                                            data-bs-dismiss="modal"
                                                            aria-label="Close">
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        장바구니에 상품이 정상적으로 담겼습니다.
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button
                                                            type="button"
                                                            class="btn btn-light"
                                                            data-bs-dismiss="modal">
                                                                쇼핑계속하기
                                                        </button>
                                                        <button type="button" class="btn btn-dark">
                                                            <a href="#">장바구니 이동</a>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- end section -->

            <!-- start 제품 상세 이미지, 텍스트 -->
            <section>
                <div class="container">
                    <div class="text-center">
                        <img
                            src="${contextPath}/resources/images/cat2.png"
                            alt="사진"
                            class="w-50"
                        />
                        <img
                            src="${contextPath}/resources/images/cat3.jpg"
                            alt="사진"
                            class="w-50"
                        />
                        <img
                            src="${contextPath}/resources/images/cat4.png"
                            alt="사진"
                            class="w-50"
                        />
                        <img
                            src="${contextPath}/resources/images/cat5.jpg"
                            alt="사진"
                            class="w-50"
                        />
                        <img
                            src="${contextPath}/resources/images/cat6.png"
                            alt="사진"
                            class="w-50"
                        />
                    </div>
                </div>
                <div id="modal-popup">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">사이즈</th>
                                <th scope="col">S</th>
                                <th scope="col">M</th>
                                <th scope="col">L</th>
                                <th scope="col">XL</th>
                                <th scope="col">2XL</th>
                                <th scope="col">3XL</th>
                                <th scope="col">4XL</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">어깨</th>
                                <td>16</td>
                                <td>17</td>
                                <td>18</td>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td>22</td>
                            </tr>
                            <tr>
                                <th scope="row">가슴단</th>
                                <td>28-29</td>
                                <td>30-31</td>
                                <td>32-33</td>
                                <td>34-35</td>
                                <td>36-37</td>
                                <td>38-39</td>
                                <td>40-41</td>
                            </tr>
                            <tr>
                                <th scope="row">소매단</th>
                                <td>9</td>
                                <td>9.5</td>
                                <td>10</td>
                                <td>10.5</td>
                                <td>11</td>
                                <td>11.5</td>
                                <td>12</td>
                            </tr>
                            <tr>
                                <th scope="row">총길이</th>
                                <td>63</td>
                                <td>66</td>
                                <td>69</td>
                                <td>72</td>
                                <td>75</td>
                                <td>78</td>
                                <td>81</td>
                            </tr>
                            <tr>
                                <th scope="row">밑단</th>
                                <td>33</td>
                                <td>33.5</td>
                                <td>34</td>
                                <td>34.5</td>
                                <td>35</td>
                                <td>35.5</td>
                                <td>36</td>
                            </tr>
                            <tr>
                                <th scope="row">암홀</th>
                                <td>22</td>
                                <td>22.5</td>
                                <td>32</td>
                                <td>23.5</td>
                                <td>24</td>
                                <td>24.5</td>
                                <td>25</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- end 제품 상세 이미지, 텍스트 -->

            <!-- start section -->
            <section class="border-top border-width-1px border-color-medium-gray pt-0 wow animate__fadeIn">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 p-0 tab-style-07">
                            <ul class="nav nav-tabs justify-content-center text-center alt-font font-weight-500 text-uppercase margin-9-rem-bottom border-bottom border-color-medium-gray md-margin-50px-bottom sm-margin-35px-bottom">
                                <li class="nav-item">
                                    <a
                                        data-bs-toggle="tab"
                                        href="#description"
                                        class="nav-link active">
                                            제품설명
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a
                                        class="nav-link"
                                        data-bs-toggle="tab"
                                        href="#additionalinformation">
                                            추가정보
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="tab-content">
                        <!-- start tab item -->
                        <div id="description" class="tab-pane fade in active show">
                            <div class="row align-items-center">
                                <div class="col-12 col-xl-5 col-lg-6 md-margin-50px-bottom">
                                    <p>
                                        이너로도 아우터로도 또 단독으로까지! 활용성이 좋은 하나쯤은
                                        가지고 있는 기본템 셔츠!
                                    </p>
                                    <ul class="list-style-03">
                                        <li>다채로운 컬러감으로 분위기에 따라 골라입어도 좋다!</li>
                                        <li>
                                            사이즈는 총 4가지로 S, M, L, XL가 나오며 오버사이즈 핏이라
                                            110사이즈까지 착용가능!
                                        </li>
                                        <li>다양한 7가지 컬러!</li>
                                        <li>
                                            맨투맨, 후드와 같은 상의 안에 레이어드하여 코디하면 시티
                                            보이 느낌으로 좋으며 얇은 긴팔 위에 걸쳐입기에도
                                            기모원단이라 춥지 않고 세련되게 착용 가능!
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-12 col-lg-6 offset-xl-1">
                                    <img
                                        src="${contextPath}/resources/images/cat1.jpg"
                                        alt="제품"
                                        class="w-50"
                                    />
                                </div>
                            </div>
                        </div>
                        <!-- end tab item -->
                        <!-- start tab item -->
                        <div id="additionalinformation" class="tab-pane fade">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <table class="table-style-02">
                                        <tbody>
                                            <tr>
                                                <th class="text-extra-dark-gray font-weight-500">
                                                색상
                                                </th>
                                                <td>
                                                    블랙, 그레이, 네이비, 다크베이지, 아이보리,
                                                    라이트베이지, 인디블루
                                                </td>
                                            </tr>
                                            <tr class="bg-light-gray">
                                                <th class="text-extra-dark-gray font-weight-500">
                                                    사이즈
                                                </th>
                                                <td>S, M, L, XL</td>
                                            </tr>
                                            <tr>
                                                <th class="text-extra-dark-gray font-weight-500">
                                                    소재
                                                </th>
                                                <td>면 100%</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- end tab item -->
                    </div>
                </div>

                <%-- 리뷰관련 --%>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 p-0 tab-style-07">
                            <ul
                            class="nav nav-tabs justify-content-center text-center alt-font font-weight-500 text-uppercase margin-9-rem-bottom border-bottom border-color-medium-gray md-margin-50px-bottom sm-margin-35px-bottom">
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" href="#reviews">
                                        구매후기 (<%-- ${allReviewCount} --%>)
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="tab-content">
                    <%-- 아작스 추가전까지 봉인--%>

                    <jsp:include page="../review/reviewList.jsp" flush="false" />
                    <a href="${contextPath}/reviewTest">
                        <button>리뷰확인하러가기</button>
                    </a>
                    </div>
                </div>

                <%-- 문의관련 --%>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 p-0 tab-style-07">
                            <ul class="nav nav-tabs justify-content-center text-center alt-font font-weight-500 text-uppercase margin-9-rem-bottom border-bottom border-color-medium-gray md-margin-50px-bottom sm-margin-35px-bottom">
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" href="#reviews">
                                        Q&A
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="tab-content">
                    <%-- 아작스 추가전까지 봉인--%> <%--
                    <jsp:include page="../question/questionList.jsp" />--%>
                        <a href="${contextPath}/questionTest">
                            <button>문의확인하러가기</button>
                        </a>
                    </div>
                </div>
            </section>
            <!-- end section -->
            </article>

            <script>
            $("button[role='buyButton']").on("click", function (e) {
            e.preventDefault();

            let newForm = $("<form></form>");
            newForm.attr("action", "${contextPath}/order/newOrder");
            newForm.attr("method","post")
            newForm.append(
            $("<input />", {
            type: "text",
            name: "productId",
            value: "${product.id}",
            })
            );
            newForm.append(
            $("<input />",{
            type: "text",
            name: "productCount",
            value: $("#prductCount").val()
            })
            )
            newForm.appendTo("body");
            //.submit();
            // $("#buyNow").modal('show');
            });
            $("button[role='cartButton']").on("click", function (e) {
            console.log("cartButton clicked!")
            e.preventDefault();

            let newForm = $("<form></form>");
            newForm.attr("action", "${contextPath}/cart/addCart");
            newForm.attr("method","post")
            newForm.append(
            $("<input />", {
            type: "text",
            name: "productId",
            value: "${product.id}",
            })
            );
            newForm.appendTo("body").submit();
            // $("#buyNow").modal('show');
            });
            </script>
            <!-- footer -->
        <hr />
        <jsp:include page="../common/footer.jsp" flush="false" />
    </body>
</html>
