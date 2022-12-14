<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result}" />
<% request.setCharacterEncoding("UTF-8"); %>

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

<!------ body----------------------------------------->

<div id="modalChangeDiv">
  <!---------------------------------------------------------------------------------------->
  <div class="container">
    <div class="contents d-flex flex-column mb-2">
      <!---------------------------------------------------------------------------------------->

      <form action="" class="cart-table">
        <div>
          <div>
            <div class="row align-items-center">
              <c:forEach items="${cartList}" var="cartItem">
                <div class="card mb-3" id="card_${cartItem.id}">
                  <div class="row g-0 justify-content-around">
                    <div class="col-1 align-self-center">
                      <input
                        class="form-check-input"
                        type="checkbox"
                        role="cartItemCheckbox"
                        value="${cartItem.id}"
                      />
                    </div>
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
                          ????????? :
                          <span id="size_${cartItem.id}"
                            >${cartItem.productSize}</span
                          >
                        </p>
                        <p class="card-text">
                          ?????? :
                          <span id="resultPrice_${cartItem.id}"
                            >${cartItem.productVO.price} </span
                          >???<br />(
                          <span id="resultQuantity_${cartItem.id}"
                            >${cartItem.productCount}</span
                          >
                          ???)
                        </p>
                      </div>
                    </div>
                    <div class="col-1 align-self-center">
                      <div class="card-body">
                        <div class="d-flex input-group justify-content-center">
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
                            size="2"
                            maxlength="3"
                            value="${cartItem.productCount}"
                            data-price="${cartItem.productVO.price}"
                            data-input-value="quantity"
                            data-result-price-id="resultPrice_${cartItem.id}"
                            data-result-quantity-id="resultQuantity_${cartItem.id}"
                          />
                          <br />
                          <div id="quantity-check" class="btn-group-vertical">
                            <button
                              style="border: 0 solid black"
                              type="button"
                              class="qty-plus qty-btn btn btn-light"
                              data-quantity-id="quantity_${cartItem.id}"
                              data-function-type="plus"
                            >
                              +
                            </button>
                            <button
                              style="border: 0 solid black"
                              type="button"
                              class="qty-minus qty-btn btn btn-light"
                              data-quantity-id="quantity_${cartItem.id}"
                              data-function-type="minus"
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
              >????????? ?????? ??????</span
            >
            <span
              class="col-4"
              style="
                font-size: 25px;
                text-align: center;
                vertical-align: middle;
              "
              >??? ??????</span
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
              id="calculateItemCount"
              class="col-7"
              style="
                font-size: 25px;
                text-align: center;
                vertical-align: middle;
              "
              >0???</span
            >
            <span
              id="calculateResultPrice"
              class="col-4"
              style="
                font-size: 25px;
                text-align: center;
                vertical-align: middle;
              "
              >0???</span
            >
          </div>
        </div>
      </form>
    </div>

    <div class="d-flex justify-content-center" style="margin-top: 5%">
      <button
        type="button"
        class="btn btn-outline-light btn-dark btn-sm ml-2"
        style="width: 120px; height: 50px"
      >
        ?????????
      </button>
      <button
        type="button"
        class="btn btn-outline-light btn-dark btn-sm ml-2"
        onclick="selectAll(this)"
        style="width: 120px; height: 50px"
      >
        ????????????
      </button>
      <button
        type="button"
        class="btn btn-outline-light btn-danger ml-2"
        onclick="checkedItemDelete()"
      >
        ???????????? ?????????
      </button>
      <button
        type="button"
        class="btn btn-warning btn-outline-light btn-sm btn-sm ml-2"
        style="width: 120px; height: 50px"
        onclick="fn_buySelectedItem()"
      >
        ????????????
      </button>
      <button
        type="button"
        class="btn btn-warning btn-outline-light btn-sm ml-2"
        style="width: 120px; height: 50px"
      >
        ????????????
      </button>
    </div>
  </div>
</div>

<!------------------- END body------------------------------------------------------------------------------------------------>
<hr />
<script>
  // ????????? ?????? ================================================================================================
  $("document").ready(function () {
    //cancel ?????? ????????? ????????? ???
    $("a[role='cancelBtn']").click(function (e) {
      let cancelCartItemId = e.target.getAttribute("value");
      let cartItemIdArr = new Array();
      cartItemIdArr.push(cancelCartItemId);
      fn_deleteCartItem(cartItemIdArr);
    });
    //??????????????? ???????????????, ????????? ?????? ???, ????????? ????????? ????????????.
    $("input[role='cartItemCheckbox']").change(function () {
      checkedCalculatePrice();
      fn_checkedItemCount();
    });
  });

  //??????????????? ??????
  //????????? ????????? ??????????????????.
  $("button[data-function-type='plus']").on("click", function (e) {
    fn_quantityIncrease($(this));
    checkedCalculatePrice();
  });
  //???????????? ?????? ??????
  $("button[data-function-type='minus']").on("click", function (e) {
    fn_quantityDecrease($(this));
    checkedCalculatePrice();
  });
  //?????? ???????????? ???????????? ????????? ?????????, ?????? ????????? ???????????? ??? ???????????? ???????????????.
  $("input[data-input-value='quantity']").on(
    "propertychange change keyup paste input",
    function (e) {
      fn_quantityOnChange($(this));
      checkedCalculatePrice();
    }
  );

  // ????????? ??? ================================================================================================

  //?????? ??????????????? ???????????? ??????
  function selectAll() {
    let checkboxes = $("input[role='cartItemCheckbox']");
    checkboxes.prop("checked", true);
    checkedCalculatePrice();
  }

  //????????? ???????????? ???????????? ??????
  function checkedItemDelete() {
    let cartItemIdArr = new Array();
    $("input[role='cartItemCheckbox']:checked").each(function () {
      cartItemIdArr.push($(this).val());
    });
    if (cartItemIdArr.length === 0) {
      alert("????????? ????????? ????????????.");
      return;
    }
    fn_deleteCartItem(cartItemIdArr);
  }
  //????????? ?????? ?????? ?????? ??????
  function checkedCalculatePrice() {
    let resultPrice = 0;
    $("input[role='cartItemCheckbox']:checked").each(function () {
      let cartItemId = $(this).val();
      console.log($("#resultPrice_" + cartItemId).text());
      let itemResultPrice = $("#resultPrice_" + cartItemId).text();
      let itemResultPriceNum = Number(itemResultPrice);
      resultPrice += itemResultPriceNum;
    });
    $("#calculateResultPrice").text(resultPrice + "???");
  }

  function fn_checkedItemCount() {
    let count = 0;
    $("input[role='cartItemCheckbox']:checked").each(function () {
      count++;
    });
    $("#calculateItemCount").text(count + "???");
  }
  //ajax- cartItemId????????? ????????? ajax???????????? ??????????????? ????????? CartController ??????
  function fn_deleteCartItem(cartItemIdArr) {
    $.ajax({
      url: "${contextPath}/cart/delete",
      type: "post",
      //contentType??? ????????? ???????????????, data??? JSON.stringify??? ?????? ??????????????? ?????????????????? List<Long>???????????? ?????? ??? ??????
      contentType: "application/json; charset:UTF-8",
      data: JSON.stringify(cartItemIdArr),
      success: function (result) {
        //????????? ???????????? ???????????? ???????????????
        cartItemIdArr.forEach((cancelCartItemId) => {
          $("#card_" + cancelCartItemId).slideUp(400, function () {
            $("#card_" + cancelCartItemId).remove();
            checkedCalculatePrice();
            fn_checkedItemCount();
          });
        });
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

  //????????? ????????? ????????? ??????(+?????? ?????????)
  function fn_quantityIncrease(e) {
    let quantity = fn_getQuantityId(e);
    let quantityValue = fn_getQuantityValue(quantity);
    let changedValue = quantityValue + 1;
    $("#" + quantity).attr("value", changedValue);
    $("#" + quantity).val(changedValue);
    fn_quantityOnChange($("#" + quantity));
    return;
  }

  //????????? ????????? ????????? ??????(-?????? ?????????)
  function fn_quantityDecrease(e) {
    let quantity = fn_getQuantityId(e);
    let quantityValue = fn_getQuantityValue(quantity);
    let changedValue = quantityValue - 1;
    $("#" + quantity).attr("value", changedValue);
    $("#" + quantity).val(changedValue);
    fn_quantityOnChange($("#" + quantity));
    return;
  }

  //?????? ????????? data-quantity-id ??? ?????? ???????????? ??????(String?????? ?????????)
  function fn_getQuantityId(e) {
    let quantity = $(e).data("quantityId");
    return quantity;
  }

  //????????? data-quantity-id??? ?????????, ??? ?????? ???????????? ?????? ???????????? ????????? ???????????? ???????????? ??????
  function fn_getQuantityValue(quantity) {
    let quantityValue = $("#" + quantity).val();
    quantityValue = Number(quantityValue);
    return quantityValue;
  }
  //????????? ????????? ??? ???????????? ??????
  function fn_quantityOnChange(e) {
    let changedValue = Number($(e).val());

    e.attr("value", changedValue);

    let resultPriceId = $(e).data("resultPriceId");
    let resultQuantityId = $(e).data("resultQuantityId");
    let itemPrice = $(e).data("price");
    let itemPriceNum = Number(itemPrice);

    let resultPriceValue = itemPrice * changedValue;
    $("#" + resultPriceId).text(resultPriceValue);
    $("#" + resultQuantityId).text(changedValue);
    return;
  }

  //????????? ?????? ????????? ???(???????????????, ???????????? ?????? ??????????????? ?????? ?????????) ??? ?????? ????????? ????????? ????????? ???????????? ??????
  function validateNumber(e) {
    let numberValue = $(e).val();
    if (numberValue <= 0) {
      $(e).val(1);
    }
    return;
  }
  //?????? ????????? ???????????? ????????? ??????

  //OrderForm?????? ????????? ???????????????, orderController?????? ?????????
  //????????? ????????? ???????????? ???????????? orderController??? postOrder?????? ???????????? ???
  function fn_buySelectedItem() {
    //post????????? ?????? form ??????
    let newForm = document.createElement("form");
    newForm.setAttribute("method", "Post");
    newForm.setAttribute("action", "${contextPath}/order/newOrder");
    newForm.setAttribute("enctype", "application/x-www-form-urlencoded");

    $("input[role='cartItemCheckbox']:checked").each(function (index) {
      let hiddenInputId = document.createElement("input");
      let hiddenInputSize = document.createElement("input");
      let hiddenInputCount = document.createElement("input");
      //?????????????????? ????????? ????????? ????????? ????????? ?????????
      let cartItemId = $(this).val();
      //????????? ?????? ????????? ???????????? ????????? ???????????? ?????????
      let itemSize = $("#size_" + cartItemId).text();
      let itemCount = $("#resultQuantity_" + cartItemId).text();
      let itemCountNum = Number(itemCount);
      //cartId??? cartItemVOList??? ????????? ?????????
      hiddenInputId.setAttribute("type", "hidden");
      hiddenInputId.setAttribute("name", "cartItemVOList[" + index + "].id");
      hiddenInputId.setAttribute("value", cartItemId);

      newForm.append(hiddenInputId);

      hiddenInputSize.setAttribute("type", "hidden");
      hiddenInputSize.setAttribute(
        "name",
        "cartItemVOList[" + index + "].productSize"
      );
      hiddenInputSize.setAttribute("value", itemSize);

      newForm.append(hiddenInputSize);

      hiddenInputCount.setAttribute("type", "hidden");
      hiddenInputCount.setAttribute(
        "name",
        "cartItemVOList[" + index + "].productCount"
      );
      hiddenInputCount.setAttribute("value", itemCount);

      newForm.append(hiddenInputCount);
    });
    document.body.append(newForm);
    newForm.submit();
  }
</script>
