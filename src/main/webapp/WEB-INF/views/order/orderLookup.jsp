<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <jsp:include page="../common/header.jsp" flush="false" />

    <!-- 주문조회 -->
    <!-- article -->
    <article>
      <div class="text-center m-5">
        <h1>ORDER</h1>
      </div>
      <!-- start section -->
      <section class="">
        <div class="container-fluid">
          <div class="row">
            <div class="col-12">
              <ul
                class="nav nav-tabs justify-content-center text-center border-bottom border-color-medium-gray md-margin-50px-bottom sm-margin-35px-bottom"
              >
                <li class="nav-item">
                  <a
                    data-bs-toggle="tab"
                    href="#orderHistory"
                    class="nav-link active"
                    >주문내역조회(0)</a
                  >
                </li>
                <li class="nav-item">
                  <a
                    class="nav-link"
                    data-bs-toggle="tab"
                    href="#cancelReturnExchangeList"
                    >취소/반품/교환 내역(0)</a
                  >
                </li>
                <li class="nav-item">
                  <a
                    class="nav-link"
                    data-bs-toggle="tab"
                    href="#pastOrderHistory"
                    >과거주문내역(0)</a
                  >
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="container">
          <div class="tab-content">
            <!-- start tab item -->
            <div id="orderHistory" class="tab-pane fade in active show">
              <div class="row">
                <div class="">
                  <div class="border border-secondary p-2 m-4">
                    <div class="dropdown d-inline p-2">
                      <button
                        class="btn btn-outline-secondary btn-sm dropdown-toggle"
                        type="button"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                      >
                        전체 주문처리상태
                      </button>
                      <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">입금전</a></li>
                        <li>
                          <a class="dropdown-item" href="#">배송준비중</a>
                        </li>
                        <li><a class="dropdown-item" href="#">배송중</a></li>
                        <li><a class="dropdown-item" href="#">배송완료</a></li>
                        <li><a class="dropdown-item" href="#">취소</a></li>
                        <li><a class="dropdown-item" href="#">교환</a></li>
                        <li><a class="dropdown-item" href="#">반품</a></li>
                      </ul>
                    </div>
                    <div class="d-inline p-2">
                      <div
                        class="btn-group btn-group-sm"
                        role="group"
                        aria-label="Small button group"
                      >
                        <button type="button" class="btn btn-outline-secondary">
                          오늘
                        </button>
                        <button type="button" class="btn btn-outline-secondary">
                          1주일
                        </button>
                        <button type="button" class="btn btn-outline-secondary">
                          1개월
                        </button>
                        <button type="button" class="btn btn-outline-secondary">
                          3개월
                        </button>
                        <button type="button" class="btn btn-outline-secondary">
                          6개월
                        </button>
                      </div>
                      <div class="dropdown d-inline p-2">
                        <input type="date" id="date" />
                      </div>
                      <div class="d-inline p-1">~</div>
                      <div class="dropdown d-inline p-2">
                        <input type="date" id="date" />
                      </div>
                      <button
                        class="btn btn-secondary btn-sm d-inline p-2"
                        type="button"
                      >
                        조회
                      </button>
                    </div>
                  </div>
                  <div>
                    <ul class="" id="orderHistoryUl">
                      <li>
                        기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시
                        주문처리완료 후 15개월 이내의 주문내역을 조회하실 수
                        있습니다.
                      </li>
                      <li>
                        완료 후 15개월 이상 경과한 주문은 과거주문내역에서
                        확인할 수 있습니다.
                      </li>
                      <li>
                        주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인할
                        수 있습니다.
                      </li>
                      <li>
                        취소/교환/반품 신청을 배송완료일 기준 7일까지
                        가능합니다.
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <c:forEach items="${cartList}" var="cartItem">
                <div class="card offset-1 col-9 mb-3" id="card_${cartItem.id}">
                  <div class="row g-0 justify-content-around">
                    <div class="col-3 align-items-center">
                      <a href="" class="align-self-center">
                        <div class="ratio ratio-1x1 align-self-center">
                          <img
                            class="align-self-center"
                            src="${contextPath}/util/upload/display?fileName=${cartItem.productImgPath}"
                            alt=""
                          />
                        </div>
                      </a>
                    </div>
                    <div class="col-4 align-self-center">
                      <div class="card-body">
                        <h5 class="card-title">
                          <a href="">${cartItem.productVO.productName}</a>
                        </h5>
                        <p class="card-text mt-2">
                          사이즈 :
                          <span id="size_${cartItem.id}"
                            >${cartItem.productSize}</span
                          >
                          <br />
                          가격 :
                          <span id="resultPrice_${cartItem.id}"
                            >${cartItem.productVO.price} </span
                          >원<br />(
                          <span id="resultQuantity_${cartItem.id}"
                            >상품개수 : ${cartItem.productCount}</span
                          >
                          개)
                        </p>
                      </div>
                    </div>
                    <div class="col-2 align-self-center">
                      <p class="text-center">
                        <b>주문 일자</b>
                        <br />
                        <span class="text-center">
                          <fmt:formatDate
                            pattern="yyyy년MM월dd일"
                            value="${cartItem.modifyDate}"
                          />
                        </span>
                      </p>
                    </div>
                    <div
                      class="col-3 align-self-center row justify-content-center"
                    >
                      <div class="row">
                        <a
                          type="button"
                          role="completeBtn"
                          value="${cartItem.id}"
                          class="btn btn-warning"
                          >배송완료</a
                        >
                        <a
                          type="button"
                          role="cancelBtn"
                          value="${cartItem.id}"
                          class="btn btn-danger"
                          >cancel</a
                        >
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>

              <div>
                <h5>주문 상품 정보</h5>
                <div class="text-center">
                  <table class="table table-hover">
                    <thead class="table-light">
                      <tr>
                        <th scope="col">주문일자[주문번호]</th>
                        <th scope="col">상품정보</th>
                        <th scope="col">수량</th>
                        <th scope="col">상품구매금액</th>
                        <th scope="col">주문처리상태</th>
                        <th scope="col">취소/교환/반품</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>20221127</td>
                        <td>떼껄룩 프린팅 맨투맨</td>
                        <td>1</td>
                        <td>72000원</td>
                        <td>완료</td>
                        <td>-</td>
                      </tr>
                      <tr>
                        <td>20221201</td>
                        <td>야옹이 자수 후드티</td>
                        <td>3</td>
                        <td>197000원</td>
                        <td>완료</td>
                        <td>-</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <nav aria-label="Pagenavigation">
                <ul
                  class="pagination pagination-sm justify-content-center text-secondary"
                >
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>
            </div>
            <!-- end tab item -->
            <!-- start tab item -->
            <div id="cancelReturnExchangeList" class="tab-pane fade">
              <div class="row">
                <div class="">
                  <div class="border border-secondary p-2 m-4">
                    <div class="d-inline p-2">
                      <div
                        class="btn-group btn-group-sm"
                        role="group"
                        aria-label="Small button group"
                      >
                        <button type="button" class="btn btn-outline-secondary">
                          오늘
                        </button>
                        <button type="button" class="btn btn-outline-secondary">
                          1주일
                        </button>
                        <button type="button" class="btn btn-outline-secondary">
                          1개월
                        </button>
                        <button type="button" class="btn btn-outline-secondary">
                          3개월
                        </button>
                        <button type="button" class="btn btn-outline-secondary">
                          6개월
                        </button>
                      </div>
                      <div class="dropdown d-inline p-2">
                        <input type="date" id="date" />
                      </div>
                      <div class="d-inline p-1">~</div>
                      <div class="dropdown d-inline p-2">
                        <input type="date" id="date" />
                      </div>
                      <button
                        class="btn btn-secondary btn-sm d-inline p-2"
                        type="button"
                      >
                        조회
                      </button>
                    </div>
                  </div>
                  <div>
                    <ul class="" id="orderHistoryUl">
                      <li>
                        기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시
                        주문처리완료 후 15개월 이내의 주문내역을 조회하실 수
                        있습니다.
                      </li>
                      <li>
                        완료 후 15개월 이상 경과한 주문은 과거주문내역에서
                        확인할 수 있습니다.
                      </li>
                      <li>
                        주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인할
                        수 있습니다.
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <div>
                <h5>주문 상품 정보</h5>
                <div class="text-center">
                  <table class="table table-hover">
                    <thead class="table-light">
                      <tr>
                        <th scope="col">주문일자[주문번호]</th>
                        <th scope="col">상품정보</th>
                        <th scope="col">수량</th>
                        <th scope="col">상품구매금액</th>
                        <th scope="col">주문처리상태</th>
                        <th scope="col">취소/교환/반품</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td colspan="6">주문 내역이 없습니다.</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <nav aria-label="Pagenavigation">
                <ul
                  class="pagination pagination-sm justify-content-center text-secondary"
                >
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>
            </div>
            <!-- end tab item -->
            <!-- start tab item -->
            <div id="pastOrderHistory" class="tab-pane fade">
              <div class="row">
                <div class="">
                  <div class="border border-secondary p-2 m-4">
                    <div class="dropdown d-inline p-2">
                      <input type="month" id="month" />
                    </div>
                    <button
                      class="btn btn-secondary btn-sm d-inline p-2"
                      type="button"
                    >
                      조회
                    </button>
                  </div>
                  <div>
                    <ul class="" id="orderHistoryUl">
                      <li>
                        주문처리완료 후 15개월 이내의 최근 주문건은 주문내역조회
                        탭에서 확인할 수 있습니다.
                      </li>
                      <li>
                        상품구매금액은 주문 당시의 판매가와 옵션추가금액의
                        합(부가세 포함)에 수량이 반영된 값입니다.
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <div>
                <h5>주문 상품 정보</h5>
                <div class="text-center">
                  <table class="table table-hover">
                    <thead class="table-light">
                      <tr>
                        <th scope="col">주문일자[주문번호]</th>
                        <th scope="col">상품정보</th>
                        <th scope="col">수량</th>
                        <th scope="col">상품구매금액</th>
                        <th scope="col">주문처리상태</th>
                        <th scope="col">최종 실결제금액</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>20210902</td>
                        <td>고양이 캐릭터 반팔티</td>
                        <td>1</td>
                        <td>34000원</td>
                        <td>완료</td>
                        <td>32000원</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              <nav aria-label="Pagenavigation">
                <ul
                  class="pagination pagination-sm justify-content-center text-secondary"
                >
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>
            </div>
            <!-- end tab item -->
          </div>
        </div>
      </section>
      <!-- end section -->
    </article>

    <!-- footer -->
    <hr />
    <script>
      //삭제버튼 눌렀을 때
      $("a[role='cancelBtn']").on("click", function (e) {
        let targetItemId = e.target.getAttribute("value");
        let url = "${contextPath}/cart/delete";
        let cartItemIdArr = new Array();
        cartItemIdArr.push(targetItemId);
        $.ajax({
          url: url,
          type: "post",
          contentType: "application/json; charset:UTF-8",
          data: JSON.stringify(cartItemIdArr),
          success: function () {
            $("#card_" + targetItemId).slideUp(300, function () {
              $("#card_" + targetItemId).remove();
            });
          },
        });
      });
      //배송완료 버튼을 눌렀을 때
      $("a[role='completeBtn']").on("click", function (e) {
        let targetItemId = e.target.getAttribute("value");
        let completeState = "G";
        let url = "${contextPath}/cart/updateState";

        $.ajax({
          url: url,
          type: "post",
          contentType: "application/json; charset:UTF-8",
          data: JSON.stringify({ id: targetItemId, status: completeState }),
          success: function () {
            $("#card_" + targetItemId).slideUp(300, function () {
              $("#card_" + targetItemId).remove();
            });
          },
        });
      });
    </script>
    <jsp:include page="../common/footer.jsp" flush="false" />
  </body>
</html>
