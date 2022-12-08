<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>장바구니</title>
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <!--  <script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>-->

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
      rel="stylesheet"
    />
    <link
      href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
      rel="stylesheet"
    />

    <!-- 부가적인 테마 -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"
    />

    <style>
      ul {
        list-style: none;
      }

      #quantity-check {
        margin: 0%;
        padding: 0%;

        height: 50px;
        font-size: 15px;
        text-align: center;
        vertical-align: middle;
      }

      #quantity-check input {
        border-radius: 8%;
        width: 100%;
        height: 50%;
      }
    </style>
  </head>
  <body>
    <!------ body----------------------------------------->

    <div id="modalChangeDiv">
      <br />
      <br />
      <!---------------------------------------------------------------------------------------->
      <div class="container">
        <div class="contents d-flex flex-column mb-2">
          <!---------------------------------------------------------------------------------------->

          <form action="" class="cart-table">
            <div>
              <div>
                <div class="row align-items-center">
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th class="alt-font">
                            <input
                              class="form-check-input"
                              type="checkbox"
                              id="checkboxSelectAll"
                              name=""
                              onclick="selectAll(this)"
                              value=""
                              aria-label="..."
                            />
                          </th>
                          <th class="alt-font">이미지</th>
                          <th class="alt-font">products</th>
                          <th class="alt-font">price</th>
                          <th class="alt-font">quantity</th>
                          <th class="alt-font">total</th>
                          <th class="alt-font">choice</th>
                        </tr>
                      </thead>

                      <tbody>
                        <c:forEach items="${cartList}" var="cartItem">
                          <tr>
                            <th class="text-align:center">
                              <input
                                class="form-check-input"
                                type="checkbox"
                                role="cartItemCheckbox"
                                value="${cartItem.id}"
                              />
                            </th>
                            <th>
                              <a href="">
                                <div class="ratio ratio-1x1">
                                  <img
                                    src="${contextPath}/util/upload/display?fileName=${cartItem.productImgPath}"
                                    alt=""
                                  />
                                </div>
                              </a>
                            </th>
                            <th>
                              <a href="">${cartItem.productVO.productName}</a
                              ><span></span>
                            </th>
                            <th>
                              <span>${cartItem.productVO.price}</span>
                            </th>
                            <th>
                              <div
                                class="d-flex input-group justify-content-center"
                              >
                                <input
                                  style="border: 0 solid black"
                                  type="text"
                                  class="form-control align-content-end"
                                  size="3"
                                  value="${cartItem.productCount}"
                                />
                                <div id="quantity-check">
                                  <input
                                    style="border: 0 solid black"
                                    type="button"
                                    value="+"
                                    onClick="javascript:this.form.amount.value++;"
                                    class="qty-plus qty-btn"
                                    data-quantity="plus"
                                    data-field="quantity"
                                  />
                                  <input
                                    style="border: 0 solid black"
                                    type="button"
                                    value="-"
                                    class="qty-minus qty-btn"
                                    data-quantity="minus"
                                    data-field="quantity"
                                  />
                                </div>
                              </div>
                            </th>

                            <th>
                              <span
                                >${cartItem.productVO.price *
                                cartItem.productCount}</span
                              >
                            </th>
                            <th>
                              <div
                                class="btn-group-vertical"
                                role="group"
                                aria-label="Vertical button group"
                              >
                                <a type="button" class="btn btn-light">order</a>

                                <a
                                  type="button"
                                  role="cancelBtn"
                                  value="${cartItem.id}"
                                  class="btn btn-light"
                                  >cancel</a
                                >
                              </div>
                            </th>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>

              <div
                class="bg-secondary p-5"
                style="--bs-bg-opacity: 0.2; border-radius: 5px"
              >
                <div class="row">
                  <span
                    class="col-1"
                    style="
                      font-size: 25px;
                      text-align: center;
                      vertical-align: middle;
                    "
                    >CART</span
                  >
                  <span
                    class="col-7"
                    style="
                      font-size: 25px;
                      text-align: center;
                      vertical-align: middle;
                    "
                    >calculation</span
                  >
                  <span
                    class="col-4"
                    style="
                      font-size: 25px;
                      text-align: center;
                      vertical-align: middle;
                    "
                    >total</span
                  >
                </div>
                <br />
                <div class="row">
                  <span class="col-1">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="50px"
                      viewBox="10 0 576 512"
                    >
                      <!--! Font Awesome Pro 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                      <path
                        d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96zM252 160c0 11 9 20 20 20h44v44c0 11 9 20 20 20s20-9 20-20V180h44c11 0 20-9 20-20s-9-20-20-20H356V96c0-11-9-20-20-20s-20 9-20 20v44H272c-11 0-20 9-20 20z"
                      />
                    </svg>
                  </span>
                  <span
                    class="col-7"
                    style="
                      font-size: 25px;
                      text-align: center;
                      vertical-align: middle;
                    "
                    >0원</span
                  >
                  <span
                    class="col-4"
                    style="
                      font-size: 25px;
                      text-align: center;
                      vertical-align: middle;
                    "
                    >0원</span
                  >
                </div>
              </div>
            </div>
          </form>
        </div>

        <div class="d-flex justify-content-center" style="margin-top: 5%">
          <button
            type="button"
            class="btn btn-outline-light btn-dark btn-sm"
            style="width: 120px; height: 50px"
          >
            홈으로
          </button>
          <button
            type="button"
            class="btn btn-outline-light btn-dark btn-sm"
            onclick="checkedItemDelete()"
            style="width: 120px; height: 50px"
          >
            비우기
          </button>
          <button
            type="button"
            class="btn btn-warning btn-sm"
            style="width: 120px; height: 50px"
          >
            선택구매
          </button>
          <button
            type="button"
            class="btn btn-warning btn-sm"
            style="width: 120px; height: 50px"
          >
            전체구매
          </button>
        </div>

        <div class="d-flex justify-content-center" style="margin-top: 5%">
          <nav aria-label="Page navigation example">
            <ul class="pagination">
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
      </div>
    </div>
    <!------------------- END body------------------------------------------------------------------------------------------------>
    <hr />
    <script>
      $("document").ready(function () {
        $("a[role='cancelBtn']").click(function (e) {
          let cancelCartItemId = e.target.getAttribute("value");
          let cartItemIdArr = new Array();
          cartItemIdArr.push(cancelCartItemId);
          fn_deleteCartItem(cartItemIdArr);
        });
      });

      function selectAll() {
        let checkboxes = $("input[role='cartItemCheckbox']");
        if ($("#checkboxSelectAll").is(":checked")) {
          checkboxes.prop("checked", true);
          return;
        }
        checkboxes.prop("checked", false);
      }

      function checkedItemDelete() {
        let cartItemIdArr = new Array();
        $("input[role='cartItemCheckbox']:checked").each(function () {
          cartItemIdArr.push($(this).val());
        });
        if (cartItemIdArr.length === 0) {
          alert("선택된 상품이 없습니다.");
          return;
        }
        fn_deleteCartItem(cartItemIdArr);
      }
      //ajax- cartItemId배열을 받아서 ajax요청으로 컨트롤러로 뿌려줌 CartController 참조
      function fn_deleteCartItem(cartItemIdArr) {
        $.ajax({
          url: "${contextPath}/cart/delete",
          type: "post",
          //contentType에 형식을 지정해주고, data를 JSON.stringify를 통해 변환해줘야 컨트롤러에서 List<Long>타입으로 받을 수 있음
          contentType: "application/json; charset:UTF-8",
          data: JSON.stringify(cartItemIdArr),
          success: function (result) {
            $("#modalChangeDiv").html(result);
          },
          error: function (request, status, error) {
            alert(
              "code:" +
                request.status +
                "\n" +
                "message:" +
                request.responseText +
                "\n" +
                "error:" +
                error
            );
          },
        });
      }
    </script>
  </body>
</html>
