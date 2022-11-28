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
        <title>kikerday</title>
    </head>
    <body>
	    <!-- 메뉴바 -->
		<jsp:include page="./common/header.jsp" flush="false"/>
        
        <!-- article -->
        <article>
            <!-- start section -->
            <section>
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <img src="${contextPath}/resources/images/cat1.jpg" alt="사진" class="w-100">
                        </div>
                        <div class="col-md-6 text-left">
                            <div class="row">
                                <div class="col-12 col-md-12">
                                    냥냥펀치 프린팅 기모 셔츠 7color
                                </div>
                            </div>
                            <hr>
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
                                    <button class="btn btn-light">블랙</button>
                                    <button class="btn btn-light">그레이</button>
                                    <button class="btn btn-light">네이비</button>
                                    <button class="btn btn-light">다크베이지</button>
                                    <button class="btn btn-light">아이보리</button>
                                    <button class="btn btn-light">라이트베이지</button>
                                    <button class="btn btn-light">인디블루</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-8 col-md-5">
                                    Size
                                </div>
                                <div class="col-4 col-md-7">
                                    <input type="radio" class="btn-check" name="options-outlined" id="S-outlined" autocomplete="off">
                                    <label class="btn btn-outline-secondary" for="S-outlined">S</label>
                                    <input type="radio" class="btn-check" name="options-outlined" id="M-outlined" autocomplete="off" checked>
                                    <label class="btn btn-outline-secondary" for="M-outlined">M</label>
                                    <input type="radio" class="btn-check" name="options-outlined" id="L-outlined" autocomplete="off">
                                    <label class="btn btn-outline-secondary" for="L-outlined">L</label>
                                    <button class="btn btn-light">
                                        <a href="#modal-popup">사이즈 가이드</a>
                                    </button>
                                </div>  
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-8 col-md-5">
                                    <label class="screen-reader-text">냥냥펀치 프린팅 기모 셔츠 7color<br>-블랙/S</label>
                                </div>
                                <div class="col-4 col-md-7">
                                    <input class="input-text qty-text" type="number" name="quantity" value="1">
                                    <button type="button" class="btn-close" aria-label="Close"></button>
                                </div>
                            </div>
                            <hr>
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
                                        <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#buyNow">
                                            BUY IT NOW
                                        </button>
                                        <!-- Modal -->
                                        <div class="modal fade" id="buyNow" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="buyNowLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="buyNowLabel">kikerday.com 내용</h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        필수 옵션을 선택해주세요.
                                                    </div>
                                                        <div class="modal-footer">
                                                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Button trigger modal -->
                                        <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#wishButton">
                                            WISH
                                        </button>
                                        <!-- Modal -->
                                        <div class="modal fade" id="wishButton" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="wishButtonLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="wishButtonLabel">kikerday.com 내용</h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        관심상품으로 등록되었습니다.
                                                    </div>
                                                        <div class="modal-footer">
                                                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Button trigger modal -->
                                        <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#cartbutton">
                                            CART
                                        </button>
                                        <!-- Modal -->
                                        <div class="modal fade" id="cartbutton" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="cartbuttonLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="cartbuttonLabel">장바구니 담기</h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        장바구니에 상품이 정상적으로 담겼습니다.
                                                    </div>
                                                        <div class="modal-footer">
                                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">쇼핑계속하기</button>
                                                        <button type="button" class="btn btn-dark"><a href="#">장바구니 이동</a></button>
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
                        <img src="${contextPath}/resources/images/cat2.png" alt="사진" class="w-50">
                        <img src="${contextPath}/resources/images/cat3.jpg" alt="사진" class="w-50">
                        <img src="${contextPath}/resources/images/cat4.png" alt="사진" class="w-50">
                        <img src="${contextPath}/resources/images/cat5.jpg" alt="사진" class="w-50">
                        <img src="${contextPath}/resources/images/cat6.png" alt="사진" class="w-50">
                    </div>
                </div>
                <div id="modal-popup">
                    <div class="d-flex justify-content-center">
                        <table>
                            <tbody>
                                <tr>
                                    <th>사이즈</th>
                                    <th>S</th>
                                    <th>M</th>
                                    <th>L</th>
                                    <th>XL</th>
                                    <th>XXL</th>
                                    <th>2XL</th>
                                    <th>3XL</th>
                                </tr>
                                <tr>
                                    <th>어깨</th>
                                    <td>16</td>
                                    <td>17</td>
                                    <td>18</td>
                                    <td>19</td>
                                    <td>20</td>
                                    <td>21</td>
                                    <td>22</td>
                                </tr>
                                <tr>
                                    <th>가슴단</th>
                                    <td>28-29</td>
                                    <td>30-31</td>
                                    <td>32-33</td>
                                    <td>34-35</td>
                                    <td>36-37</td>
                                    <td>38-39</td>
                                    <td>40-41</td>
                                </tr>
                                <tr>
                                    <th>소매단</th>
                                    <td>9</td>
                                    <td>9.5</td>
                                    <td>10</td>
                                    <td>10.5</td>
                                    <td>11</td>
                                    <td>11.5</td>
                                    <td>12</td>
                                </tr>
                                <tr>
                                    <th>총길이</th>
                                    <td>63</td>
                                    <td>66</td>
                                    <td>69</td>
                                    <td>72</td>
                                    <td>75</td>
                                    <td>78</td>
                                    <td>81</td>
                                </tr>
                                <tr>
                                    <th>밑단</th>
                                    <td>33</td>
                                    <td>33.5</td>
                                    <td>34</td>
                                    <td>34.5</td>
                                    <td>35</td>
                                    <td>35.5</td>
                                    <td>36</td>
                                </tr>
                                <tr>
                                    <th>암홀</th>
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
                </div>
            </section>
            <!-- end 제품 상세 이미지, 텍스트 -->
                       
            <!-- start section -->
            <section class="border-top border-width-1px border-color-medium-gray pt-0 wow animate__fadeIn">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 p-0 tab-style-07">
                            <ul class="nav nav-tabs justify-content-center text-center alt-font font-weight-500 text-uppercase margin-9-rem-bottom border-bottom border-color-medium-gray md-margin-50px-bottom sm-margin-35px-bottom">
                                <li class="nav-item"><a data-bs-toggle="tab" href="#description" class="nav-link active">제품설명</a></li>
                                <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#additionalinformation">추가정보</a></li>
                                <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#reviews">구매후기 (2)</a></li>
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
                                    <p>이너로도 아우터로도 또 단독으로까지! 활용성이 좋은 하나쯤은 가지고 있는 기본템 셔츠!</p>
                                    <ul class="list-style-03">
                                        <li>다채로운 컬러감으로 분위기에 따라 골라입어도 좋다!</li>
                                        <li>사이즈는 총 4가지로 S, M, L, XL가 나오며 오버사이즈 핏이라 110사이즈까지 착용가능!</li>
                                        <li>다양한 7가지 컬러!</li>
                                        <li>맨투맨, 후드와 같은 상의 안에 레이어드하여 코디하면 시티 보이 느낌으로 좋으며 얇은 긴팔 위에 걸쳐입기에도 기모원단이라 춥지 않고 세련되게 착용 가능!</li>
                                    </ul>
                                </div>
                                <div class="col-12 col-lg-6 offset-xl-1">
                                    <img src="${contextPath}/resources/images/cat1.jpg" alt="제품" class="w-50">
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
                                                <th class="text-extra-dark-gray font-weight-500">색상</th>
                                                <td>블랙, 그레이, 네이비, 다크베이지, 아이보리, 라이트베이지, 인디블루</td>
                                            </tr>
                                            <tr class="bg-light-gray">
                                                <th class="text-extra-dark-gray font-weight-500">사이즈</th>
                                                <td>S, M, L, XL</td>
                                            </tr>
                                            <tr>
                                                <th class="text-extra-dark-gray font-weight-500">소재</th>
                                                <td>면 100%</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>                                
                            </div>
                        </div>
                        <!-- end tab item -->
                        <!-- start tab item -->
                        <div id="reviews" class="tab-pane fade">
                            <div class="row align-items-center justify-content-center">
                                <div class="col-12 col-lg-10">
                                    <ul class="blog-comment margin-5-half-rem-bottom">
                                        <li>
                                            <div class="d-block d-md-flex w-100 align-items-center align-items-md-start">
                                                <div class="w-75px sm-w-50px sm-margin-10px-bottom">
                                                    <img src="https://via.placeholder.com/125x125" class="rounded-circle w-95 sm-w-100" alt=""/>
                                                </div>
                                                <div class="w-100 padding-25px-left last-paragraph-no-margin sm-no-padding-left">
                                                    <a href="#" class="text-extra-dark-gray text-fast-blue-hover alt-font font-weight-500 text-medium">조아라님</a>
                                                    <span class="text-orange text-extra-small float-end letter-spacing-2px"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></span>
                                                    <div class="text-medium text-medium-gray margin-15px-bottom">2022.11.11, 6:05 PM</div>
                                                    <p class="w-85">옷이 오버핏이라 날다람쥐가 될 수 있어요. 기모가 두툼해서 담요대용으로도 좋아요. 다른색으로 한개 더 사려고 색깔 고르고 있어요.</p>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>                            
                            </div>
                            <div class="row justify-content-center">
                                <div class="col-12 col-lg-10 margin-4-rem-bottom ">
                                    <h6 class="alt-font text-extra-dark-gray font-weight-500 margin-5px-bottom">리뷰 쓰기</h6>
                                    <div class="margin-5px-bottom">이름과 이메일을 입력해주세요.<span class="text-radical-red">*</span></div>
                                </div>
                            </div>
                            <div class="row justify-content-center">
                                <div class="col-12 col-lg-10">
                                    <form action="#" method="post">
                                        <div class="row align-items-center">
                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                <label class="margin-15px-bottom" for="basic-name">이름 <span class="text-radical-red">*</span></label>
                                                <input id="basic-name" class="medium-input border-radius-4px bg-white margin-30px-bottom" type="text" name="name" placeholder="Enter your name">
                                            </div>
                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                <label class="margin-15px-bottom">이메일 <span class="text-radical-red">*</span></label>                                    
                                                <input class="medium-input border-radius-4px bg-white margin-30px-bottom" type="text" name="email" placeholder="Enter your email">
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12 margin-30px-bottom">
                                                <label class="margin-15px-bottom">별점<span class="text-radical-red">*</span></label>                                    
                                                <span class="text-orange text-extra-small d-block"><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></span>
                                            </div>
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="margin-15px-bottom">내용</div>
                                                <textarea class="medium-textarea border-radius-4px bg-white h-120px margin-2-half-rem-bottom" rows="6" name="comment" placeholder="내용을 입력해주세요."></textarea>
                                            </div>
                                            <div class="col-12 sm-margin-20px-bottom">
                                                <input class="btn btn-medium btn-dark-gray mb-0 btn-round-edge-small" type="button" name="submit" value="확인">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- end tab item -->
                    </div>
                </div>
            </section>
            <!-- end section -->
        </article>
        
        <!-- footer -->
        <hr>
		<jsp:include page="./common/footer.jsp" flush="false"/>
    </body>
</html>