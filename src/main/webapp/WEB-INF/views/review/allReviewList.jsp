<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%  request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined|Material+Icons+Round"
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
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
            crossorigin="anonymous">
    </script>
    <style>
        footer {
            background-color: rgb(249, 249, 249);
        }
        a {
            text-decoration: none;
        }
    </style>
    <title>kikerday</title>
</head>
<body>
<!-- header -->
<jsp:include page="../common/header.jsp" flush="false" />
<hr>

<article>
    <section>
        <div class="container">
            <div class="row mt-4">
                <div class="col-9 mb-3">
                    <h5 class="fw-bold">REVIEW<div class="vr mx-1"></div>전체 리뷰 보기</h5>
                </div>
                <div class="col-3">
                    <div class="modal fade" id="textModal" aria-hidden="true" aria-labelledby="textModalLabel" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5 text-secondary" id="textModalLabel">공지사항 1</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <button class="btn btn-light" data-bs-target="#textModal2" data-bs-toggle="modal"><b>리뷰 적립금 안내</b><br>[리뷰 포인트 적립 기준]<br>2022.12.09</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="textModal2" aria-hidden="true" aria-labelledby="textModalLabel2" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5 text-secondary" id="textModalLabel2">공지사항 자세히 보기</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <h3>리뷰 적립금 안내</h3>
                                    <div class="text-secondary mb-3">2022.12.09</div><hr />
                                    [리뷰 포인트 적립 기준]<br />
                                    <b>포토리뷰 1000원 / 텍스트 리뷰 500원</b><br />
                                    1만원 미만 상품은 적립금이 지급 되지 않습니다.<br />
                                    비회원으로 구매시 적립금이 지급 되지 않습니다.<br />
                                    후기 작성 후 교환/반품 할 경우 적립된 포인트는 자동으로 차감됩니다.<br />
                                    품절된 지 10일 지난 상품일 경우 적립금이 지급 되지 않습니다.<br />
                                    상품 배송 완료 후 30일이 지난 경우 적립금이 지급되지 않습니다.<br />
                                    적립금으로만 구매한 상품일 경우 적립금이 지급되지 않습니다.
                                    <p class="text-decoration-underline">*문의글 혹은 악의 적인 비방글은 무통보 삭제된다는 점 유의해주세요!*</p>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-secondary" data-bs-target="#textModal" data-bs-toggle="modal">뒤로 가기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="link-secondary" data-bs-toggle="modal" href="#textModal" role="button">공지사항 1</a>
                </div>
            </div>
            <hr class="m-0"/>
            <div class="row">
                <div class="col my-auto" style="font-size:20px;">
                    <a href="#" class="link-secondary">추천순</a>
                    <a href="#" class="link-secondary">최신순</a>
                    <a href="#" class="link-secondary">평점순</a>
                </div>
                <div class="col">
                    <div class="input-group">
                        <div class="form-floating">
                            <input type="search" class="form-control" id="ReviewSearch" placeholder="search">
                            <label for="ReviewSearch">리뷰 키워드 검색</label>
                        </div>
                        <button type="button" class="btn btn-secondary">
                                    <span class="material-icons-round">
                                        search
                                    </span>
                        </button>
                    </div>
                </div>
            </div>
            <hr class="mt-0 mb-2"/>
            <div class="row">
                <div class="col">
                    <div class="btn-group">
                        <button class="btn btn-outline-dark btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
                            전체 카테고리
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><button class="dropdown-item btn btn-black">확인</button></li>
                        </ul>
                    </div>
                    <div class="btn-group">
                        <button class="btn btn-outline-dark btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
                            별점
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item" href="#">Menu item</a></li>
                            <li><a class="dropdown-item btn" href="#">확인</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <hr class="mt-2" />
            <div class="row">
                <div class="col-8">
                    <div class="col-12">
                                <span class="material-icons-round" style="color: yellow; font-size: 2em;">
                                    star
                                </span>
                        <span class="material-icons-round" style="color: yellow; font-size: 2em;">
                                    star
                                </span>
                        <span class="material-icons-round" style="color: yellow; font-size: 2em;">
                                    star
                                </span>
                        <span class="material-icons-round" style="color: yellow; font-size: 2em;">
                                    star
                                </span>
                        <span class="material-icons-round" style="color: yellow; font-size: 2em;">
                                    star
                                </span>
                        <span>아주 좋아요</span>
                        <div class="text-secondary">2022.11.11</div>
                    </div>
                    <div class="col-12 my-2">
                        <a href="#" class="link-dark fw-bold"><img src="images/cat16.png" width="48" height="48"> 떼껄룩 기모 맨투맨 6color</a>
                    </div>
                    <div class="col-12 mt-2">
                        <p>소재가 너무 좋아요 두께감도 적당합니당.</p>
                        <div class="col-12 mt-3">
                            <a href="#"><img src="images/cat22.jpg" width="142" height="157"></a>
                            <a href="#"><img src="images/cat21.jpg" width="142" height="157"></a>
                            <a href="#"><img src="images/cat20.jpg" width="142" height="157"></a>
                        </div>
                    </div>
                    <div class="col-12 mt-2">
                        <a href="#" class="link-secondary">
                                    <span class="material-icons-outlined">
                                        thumb_up
                                    </span>도움돼요 3
                        </a>
                        <a href="#" class="link-secondary mx-2">
                                    <span class="material-icons-outlined">
                                        thumb_down
                                    </span>
                            도움안돼요 1
                        </a>
                        <div class="vr"></div>
                        <a href="#" class="link-secondary mx-2">댓글 0</a>
                    </div>
                </div>
                <div class="col-4">
                    <div class="col-12 mb-1">
                        <div><span class="fw-bold">조**</span>님의 리뷰입니다.</div>
                    </div>
                    <div class="row text-secondary">
                        <div>키 : <span class="mx-1">160cm</span></div>
                        <div>몸무게 : <span class="mx-1">40kg</span></div>
                        <div>평소사이즈-상의 : <span class="mx-1">S</span></div>
                        <div>평소사이즈-하의 : <span class="mx-1">25</span></div>
                        <div>색상 : <span class="mx-1">블랙</span></div>
                        <div>사이즈 : <span class="mx-1">S</span></div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-8">
                    <div class="col-12">
                                <span class="material-icons-round" style="color: yellow; font-size: 2em;">
                                    star
                                </span>
                        <span class="material-icons-round" style="color: yellow; font-size: 2em;">
                                    star
                                </span>
                        <span class="material-icons-round" style="color: yellow; font-size: 2em;">
                                    star
                                </span>
                        <span class="material-icons-round" style="color: yellow; font-size: 2em;">
                                    star
                                </span>
                        <span class="material-icons-round" style="color: lightgray; font-size: 2em;">
                                    star
                                </span>
                        <span>맘에 들어요</span>
                        <div class="text-secondary">2022.11.10</div>
                    </div>
                    <div class="col-12 my-2">
                        <a href="#" class="link-dark fw-bold"><img src="images/cat11.png" width="48" height="48"> 냥냥펀치 기모 맨투맨 6color</a>
                    </div>
                    <div class="col-12 mt-2">
                        <p>보들보들 좋아요</p>
                        <div class="col-12 mt-3">
                            <a href="#"><img src="images/cat12.png" width="142" height="157"></a>
                            <a href="#"><img src="images/cat13.png" width="142" height="157"></a>
                            <a href="#"><img src="images/cat14.jpg" width="142" height="157"></a>
                        </div>
                    </div>
                    <div class="col-12 mt-2">
                        <a href="#" class="link-secondary">
                                    <span class="material-icons-outlined">
                                        thumb_up
                                    </span>도움돼요 1
                        </a>
                        <a href="#" class="link-secondary mx-2">
                                    <span class="material-icons-outlined">
                                        thumb_down
                                    </span>
                            도움안돼요 0
                        </a>
                        <div class="vr"></div>
                        <a href="#" class="link-secondary mx-2">댓글 0</a>
                    </div>
                </div>
                <div class="col-4">
                    <div class="col-12 mb-1">
                        <div><span class="fw-bold">박**</span>님의 리뷰입니다.</div>
                    </div>
                    <div class="row text-secondary">
                        <div>키 : <span class="mx-1">170cm</span></div>
                        <div>몸무게 : <span class="mx-1">60kg</span></div>
                        <div>평소사이즈-상의 : <span class="mx-1">M</span></div>
                        <div>평소사이즈-하의 : <span class="mx-1">30</span></div>
                        <div>색상 : <span class="mx-1">블랙</span></div>
                        <div>사이즈 : <span class="mx-1">M</span></div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-8">
                    <div class="col-12">
                                <span class="material-icons-round" style="color: yellow; font-size: 2em;">
                                    star
                                </span>
                        <span class="material-icons-round" style="color: yellow; font-size: 2em;">
                                    star
                                </span>
                        <span class="material-icons-round" style="color: yellow; font-size: 2em;">
                                    star
                                </span>
                        <span class="material-icons-round" style="color: lightgray; font-size: 2em;">
                                    star
                                </span>
                        <span class="material-icons-round" style="color: lightgray; font-size: 2em;">
                                    star
                                </span>
                        <span>보통이에요</span>
                        <div class="text-secondary">2022.11.09</div>
                    </div>
                    <div class="col-12 my-2">
                        <a href="#" class="link-dark fw-bold"><img src="images/cat11.png" width="48" height="48"> 야옹이 맨투맨 3color</a>
                    </div>
                    <div class="col-12 mt-2">
                        <p>배송이 너무 늦어요 ㅠㅠ</p>
                        <div class="col-12 mt-3">
                            <a href="#"><img src="images/cat3.jpg" width="142" height="157"></a>
                            <a href="#"><img src="images/cat5.jpg" width="142" height="157"></a>
                            <a href="#"><img src="images/cat7.jpg" width="142" height="157"></a>
                        </div>
                    </div>
                    <div class="col-12 mt-2">
                        <a href="#" class="link-secondary">
                                    <span class="material-icons-outlined">
                                        thumb_up
                                    </span>도움돼요 2
                        </a>
                        <a href="#" class="link-secondary mx-2">
                                    <span class="material-icons-outlined">
                                        thumb_down
                                    </span>
                            도움안돼요 0
                        </a>
                        <div class="vr"></div>
                        <a href="#" class="link-secondary mx-2">댓글 0</a>
                    </div>
                </div>
                <div class="col-4">
                    <div class="col-12 mb-1">
                        <div><span class="fw-bold">이**</span>님의 리뷰입니다.</div>
                    </div>
                    <div class="row text-secondary">
                        <div>키 : <span class="mx-1">170cm</span></div>
                        <div>몸무게 : <span class="mx-1">65kg</span></div>
                        <div>평소사이즈-상의 : <span class="mx-1">L</span></div>
                        <div>평소사이즈-하의 : <span class="mx-1">31</span></div>
                        <div>색상 : <span class="mx-1">그레이</span></div>
                        <div>사이즈 : <span class="mx-1">L</span></div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="m-3">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="page-link link-dark" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link link-dark" href="#">1</a></li>
                        <li class="page-item"><a class="page-link link-dark" href="#">2</a></li>
                        <li class="page-item"><a class="page-link link-dark" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link link-dark" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </section>
</article>

<!-- footer -->
<hr />
<jsp:include page="../common/footer.jsp" flush="false" />
</body>
</html>