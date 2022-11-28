<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>kikerday</title>
  </head>
  <body>
    <!-- 메뉴바 -->
<jsp:include page="../common/header.jsp" />
    <!-- article -->
    <article>
      <!-- start section -->
      <section class="big-section wow animate__fadeIn">
        <div class="container">
          <div class="row">
            <div
              class="col-12 d-flex flex-column flex-lg-row align-items-md-center"
            >
              <img
                src="${contextPath}/resources/images/product.jpg"
                class="w-50"
              />
              <div class="margin-20px-bottom">
                <label
                  class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px"
                  >color</label
                >
                <ul class="alt-font shop-color">
                  <li>
                    <input
                      class="d-none"
                      type="radio"
                      id="color-1"
                      name="color"
                      checked
                    />
                    <label for="color-1"
                      ><span style="background-color: #363636"></span
                    ></label>
                  </li>
                  <li>
                    <input
                      class="d-none"
                      type="radio"
                      id="color-2"
                      name="color"
                    />
                    <label for="color-2"
                      ><span style="background-color: #657fa8"></span
                    ></label>
                  </li>
                  <li>
                    <input
                      class="d-none"
                      type="radio"
                      id="color-3"
                      name="color"
                    />
                    <label for="color-3"
                      ><span style="background-color: #936f5e"></span
                    ></label>
                  </li>
                  <li>
                    <input
                      class="d-none"
                      type="radio"
                      id="color-4"
                      name="color"
                    />
                    <label for="color-4"
                      ><span style="background-color: #97a27f"></span
                    ></label>
                  </li>
                </ul>
              </div>
              <div class="margin-4-rem-bottom">
                <label
                  class="text-extra-dark-gray text-extra-small font-weight-500 alt-font text-uppercase w-60px"
                  >Size</label
                >
                <ul class="text-extra-small shop-size">
                  <li>
                    <input
                      class="d-none"
                      type="radio"
                      id="size-1"
                      name="size"
                      checked
                    />
                    <label for="size-1" class="width-80"><span>S</span></label>
                  </li>
                  <li>
                    <input
                      class="d-none"
                      type="radio"
                      id="size-2"
                      name="size"
                    />
                    <label for="size-2" class="width-80"><span>M</span></label>
                  </li>
                  <li>
                    <input
                      class="d-none"
                      type="radio"
                      id="size-3"
                      name="size"
                    />
                    <label for="size-3" class="width-80"><span>L</span></label>
                  </li>
                </ul>
                <label
                  class="size-chart text-uppercase w-60px margin-10px-left"
                >
                  <a
                    class="modal-popup alt-font text-extra-small text-decoration-line-bottom"
                    href="#modal-popup"
                    >사이즈 가이드</a
                  >
                </label>
                <div
                  id="modal-popup"
                  class="white-popup-block mfp-hide w-55 mx-auto position-relative bg-white modal-popup-main padding-5-rem-all xl-w-70 md-w-80 md-padding-4-rem-all xs-w-95 xs-padding-3-rem-all"
                >
                  <div class="table-style-01">
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
                          <td>어깨</td>
                          <td>16</td>
                          <td>17</td>
                          <td>18</td>
                          <td>19</td>
                          <td>20</td>
                          <td>21</td>
                          <td>22</td>
                        </tr>
                        <tr>
                          <td>가슴단</td>
                          <td>28-29</td>
                          <td>30-31</td>
                          <td>32-33</td>
                          <td>34-35</td>
                          <td>36-37</td>
                          <td>38-39</td>
                          <td>40-41</td>
                        </tr>
                        <tr>
                          <td>소매단</td>
                          <td>9</td>
                          <td>9.5</td>
                          <td>10</td>
                          <td>10.5</td>
                          <td>11</td>
                          <td>11.5</td>
                          <td>12</td>
                        </tr>
                        <tr>
                          <td>총길이</td>
                          <td>63</td>
                          <td>66</td>
                          <td>69</td>
                          <td>72</td>
                          <td>75</td>
                          <td>78</td>
                          <td>81</td>
                        </tr>
                        <tr>
                          <td>밑단</td>
                          <td>33</td>
                          <td>33.5</td>
                          <td>34</td>
                          <td>34.5</td>
                          <td>35</td>
                          <td>35.5</td>
                          <td>36</td>
                        </tr>
                        <tr>
                          <td>암홀</td>
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
              </div>
            </div>
            <div>
              <div class="quantity margin-15px-right">
                <label class="screen-reader-text">수량</label>
                <input
                  type="button"
                  value="-"
                  class="qty-minus qty-btn"
                  data-quantity="minus"
                  data-field="quantity"
                />
                <input
                  class="input-text qty-text"
                  type="number"
                  name="quantity"
                  value="1"
                />
                <input
                  type="button"
                  value="+"
                  class="qty-plus qty-btn"
                  data-quantity="plus"
                  data-field="quantity"
                />
              </div>
              <a href="#" class="btn btn-medium btn-primary">BUY IT NOW</a>
              <div class="margin-25px-top">
                <a
                  href="#"
                  class="text-uppercase text-extra-small alt-font margin-20px-right font-weight-500"
                  ><i class="margin-5px-right"></i>WISH</a
                >
                <!-- 아이콘 추가 해야함 -->
                <a
                  href="#"
                  class="text-uppercase text-extra-small alt-font margin-20px-right font-weight-500"
                  ><i class="margin-5px-right"></i>CART</a
                >
                <!-- 아이콘 추가 해야함 -->
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- end section -->
      <!-- start section -->
      <section
        class="border-top border-width-1px border-color-medium-gray pt-0 wow animate__fadeIn"
      >
        <div class="container-fluid">
          <div class="row">
            <div class="col-12 p-0 tab-style-07">
              <ul
                class="nav nav-tabs justify-content-center text-center alt-font font-weight-500 text-uppercase margin-9-rem-bottom border-bottom border-color-medium-gray md-margin-50px-bottom sm-margin-35px-bottom"
              >
                <li class="nav-item">
                  <a
                    data-bs-toggle="tab"
                    href="#description"
                    class="nav-link active"
                    >제품설명</a
                  >
                </li>
                <li class="nav-item">
                  <a
                    class="nav-link"
                    data-bs-toggle="tab"
                    href="#additionalinformation"
                    >추가정보</a
                  >
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-bs-toggle="tab" href="#reviews"
                    >구매후기 (2)</a
                  >
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
                    src="${contextPath}/resources/images/product.jpg"
                    alt="제품"
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
            <!-- start tab item -->
            <div id="reviews" class="tab-pane fade">
              <div class="row align-items-center justify-content-center">
                <div class="col-12 col-lg-10">
                  <ul class="blog-comment margin-5-half-rem-bottom">
                    <li>
                      <div
                        class="d-block d-md-flex w-100 align-items-center align-items-md-start"
                      >
                        <div class="w-75px sm-w-50px sm-margin-10px-bottom">
                          <img
                            src="https://via.placeholder.com/125x125"
                            class="rounded-circle w-95 sm-w-100"
                            alt=""
                          />
                        </div>
                        <div
                          class="w-100 padding-25px-left last-paragraph-no-margin sm-no-padding-left"
                        >
                          <a
                            href="#"
                            class="text-extra-dark-gray text-fast-blue-hover alt-font font-weight-500 text-medium"
                            >조아라님</a
                          >
                          <span
                            class="text-orange text-extra-small float-end letter-spacing-2px"
                            ><i class="fas fa-star"></i
                            ><i class="fas fa-star"></i
                            ><i class="fas fa-star"></i
                            ><i class="fas fa-star"></i
                            ><i class="fas fa-star"></i
                          ></span>
                          <div
                            class="text-medium text-medium-gray margin-15px-bottom"
                          >
                            2022.11.11, 6:05 PM
                          </div>
                          <p class="w-85">
                            옷이 오버핏이라 날다람쥐가 될 수 있어요. 기모가
                            두툼해서 담요대용으로도 좋아요. 다른색으로 한개 더
                            사려고 색깔 고르고 있어요.
                          </p>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="row justify-content-center">
                <div class="col-12 col-lg-10 margin-4-rem-bottom">
                  <h6
                    class="alt-font text-extra-dark-gray font-weight-500 margin-5px-bottom"
                  >
                    리뷰 쓰기
                  </h6>
                  <div class="margin-5px-bottom">
                    이름과 이메일을 입력해주세요.<span class="text-radical-red"
                      >*</span
                    >
                  </div>
                </div>
              </div>
              <div class="row justify-content-center">
                <div class="col-12 col-lg-10">
                  <form action="#" method="post">
                    <div class="row align-items-center">
                      <div class="col-md-6 col-sm-12 col-xs-12">
                        <label class="margin-15px-bottom" for="basic-name"
                          >이름 <span class="text-radical-red">*</span></label
                        >
                        <input
                          id="basic-name"
                          class="medium-input border-radius-4px bg-white margin-30px-bottom"
                          type="text"
                          name="name"
                          placeholder="Enter your name"
                        />
                      </div>
                      <div class="col-md-6 col-sm-12 col-xs-12">
                        <label class="margin-15px-bottom"
                          >이메일 <span class="text-radical-red">*</span></label
                        >
                        <input
                          class="medium-input border-radius-4px bg-white margin-30px-bottom"
                          type="text"
                          name="email"
                          placeholder="Enter your email"
                        />
                      </div>
                      <div
                        class="col-md-12 col-sm-12 col-xs-12 margin-30px-bottom"
                      >
                        <label class="margin-15px-bottom"
                          >별점<span class="text-radical-red">*</span></label
                        >
                        <span class="text-orange text-extra-small d-block"
                          ><i class="far fa-star"></i><i class="far fa-star"></i
                          ><i class="far fa-star"></i><i class="far fa-star"></i
                          ><i class="far fa-star"></i
                        ></span>
                      </div>
                      <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="margin-15px-bottom">내용</div>
                        <textarea
                          class="medium-textarea border-radius-4px bg-white h-120px margin-2-half-rem-bottom"
                          rows="6"
                          name="comment"
                          placeholder="내용을 입력해주세요."
                        ></textarea>
                      </div>
                      <div class="col-12 sm-margin-20px-bottom">
                        <input
                          class="btn btn-medium btn-dark-gray mb-0 btn-round-edge-small"
                          type="button"
                          name="submit"
                          value="확인"
                        />
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
    <hr />
     <jsp:include page="../common/footer.jsp" flush="false"/>
  </body>
</html>
