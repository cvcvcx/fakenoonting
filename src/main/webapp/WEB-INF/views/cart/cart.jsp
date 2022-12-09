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

      .modal-dialog {
        overflow-y: initial;
      }

      .modal-body {
        height: 66vh;
        overflow-y: auto;
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
                  <c:forEach items="${cartList}" var="cartItem">
                    <div class="card mb-3">
                      <div class="row g-0 justify-content-around">
                        <div class="col-1 align-self-center">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            role="cartItemCheckbox"
                            value="${cartItem.id}"
                          />
                        </div>
                        <div class="col-3">
                          <a href="">
                            <div class="ratio ratio-1x1 align-self-center">
                              <img
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
                            <p class="card-text">
                              가격 : ${cartItem.productVO.price} 원
                            </p>
                          </div>
                        </div>
                        <div class="col-1 align-self-center">
                          <div class="card-body">
                            <div
                              class="d-flex input-group justify-content-center"
                            >
                              <input
                                style="
                                  border: 0 solid black;
                                  width: 100%;
                                  min-width: max-content;
                                  text-align: center;
                                "
                                type="text"
                                id="quantity_${cartItem.id}"
                                class="form-control align-content-center"
                                onchange="validateNumber(this)"
                                size="2"
                                maxlength="3"
                                value="${cartItem.productCount}"
                              />
                              <br />
                              <div
                                id="quantity-check"
                                class="btn-group-vertical"
                              >
                                <button
                                  style="border: 0 solid black"
                                  type="button"
                                  onclick="fn_quantityIncrease(this)"
                                  class="qty-plus qty-btn btn btn-light"
                                  data-quantity-id="quantity_${cartItem.id}"
                                  data-field="quantity"
                                >
                                  +
                                </button>
                                <button
                                  style="border: 0 solid black"
                                  type="button"
                                  onclick="fn_quantityDecrease(this)"
                                  class="qty-minus qty-btn btn btn-light"
                                  data-quantity-id="quantity_${cartItem.id}"
                                  data-field="quantity"
                                >
                                  -
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div class="col-2 align-self-center">
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
                        </div>
                      </div>
                    </div>
                  </c:forEach>
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
            onclick="selectAll(this)"
            style="width: 120px; height: 50px"
          >
            전체선택
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
        checkboxes.prop("checked", true);
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
      //상품의 개수를 늘리는 함수
      function fn_quantityIncrease(e) {
        let quantity = fn_getQuantityId(e);
        let quantityValue = fn_getQuantityValue(quantity);
        $("#" + quantity).attr("value", ++quantityValue);
      }
      //상품의 개수를 줄이는 함수
      function fn_quantityDecrease(e) {
        let quantity = fn_getQuantityId(e);
        let quantityValue = fn_getQuantityValue(quantity);
        $("#" + quantity).attr("value", --quantityValue);
      }
      //누른 버튼의 data-quantity-id 의 값을 가져오는 함수(String으로 반환됨)
      function fn_getQuantityId(e) {
        let quantity = $(e).data("quantityId");
        return quantity;
      }
      //버튼의 data-quantity-id를 가지고, 그 값의 아이디를 가진 인풋창의 밸류를 가져와서 반환하는 함수
      function fn_getQuantityValue(quantity) {
        let quantityValue = $("#" + quantity).val();
        quantityValue = Number(quantityValue);
        return quantityValue;
      }
      //인풋의 값이 변화할 때(입력되거나, 증가버튼 또는 감소버튼을 통해 바뀔때) 그 값이 음수가 되지는 않는지 검증하는 함수
      function validateNumber(e) {
        let numberValue = $(e).val();
        if (numberValue <= 0) {
          $(e).val(1);
        }
      }
    </script>
  </body>
</html>
