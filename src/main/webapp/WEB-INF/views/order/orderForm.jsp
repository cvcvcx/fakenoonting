<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
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
    <title>주문하기</title>

    <style>
      ul {
        list-style: none;
      }

      .path {
        margin-left: 80em;
      }

      .path li {
        display: inline-block;
        padding: 0 0 0 4px;
        margin: 0 0 0 4px;
        color: #757575;
      }

      .cart-table {
        width: 80%;
        margin: auto;
        display: block;
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

      .order-box {
        background: #101318;
        width: 700px;
        margin: auto;
        height: 95%;
        padding: 30px;
        border-radius: 10px;
        -webkit-box-shadow: 0px 0px 3px 1px rgb(30, 29, 39);

        box-shadow: 0px 0px 3px 1px rgba(38, 35, 128, 1);
      }

      .order-box .logo {
        color: white;
        font-family: sans-serif;
        font-size: 50px;
        font-weight: 600;
        text-align: center;
      }

      .order-icon {
        position: relative;
        width: 20%;

        display: inline-flex;
        margin: auto;
        margin-top: 2%;
        margin-bottom: 3%;
        color: #ededed;
      }

      #order-margin {
        align-items: center;
        justify-content: center;
      }
    </style>
  </head>

  <!------ body----------------------------------------->

  <body>
    <!-- 메뉴바 -->
    <jsp:include page="../common/header.jsp" flush="false" />

    <div class="path">
      <div>
        <ul>
          <li>
            <a class="text-decoration-none" href="/">HOME</a>
          </li>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-chevron-compact-right"
            viewBox="0 0 16 16"
          >
            <path
              fill-rule="evenodd"
              d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"
            />
          </svg>
          <li>
            <strong>cart</strong>
          </li>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-chevron-compact-right"
            viewBox="0 0 16 16"
          >
            <path
              fill-rule="evenodd"
              d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"
            />
          </svg>
          <li>
            <strong>order</strong>
          </li>
        </ul>
      </div>
    </div>
    <br />
    <br />
    <!---------------------------------------------------------------------------------------->
    <div class="container">
      <div class="contents d-flex align-items-start flex-column mb-2">
        <!---------------------------------------------------------------------------------------->
        <div class="order-box">
          <form
            class="form-horizontal"
            method="post"
            name=""
            action="${contextPath}"
          >
            <div class="form-group" id="order-margin">
              <div class="logo">ORDER</div>
              <div class="order-icon d-flex justify-content-center">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="100"
                  height="100"
                  fill="currentColor"
                  class="bi bi-receipt-cutoff"
                  viewBox="0 0 16 16"
                >
                  <path
                    d="M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zM11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z"
                  />
                  <path
                    d="M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293 2.354.646zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118l.137-.274z"
                  />
                </svg>
              </div>
            </div>
            <div class="form-group" id="login-margin">
              <div
                class="form-check form-check-inline"
                style="margin-bottom: 0%"
              >
                <input
                  class="form-check-input"
                  type="radio"
                  name="addressInfo"
                  id="memberAddress"
                  checked
                />
                <label
                  for="memberAddress"
                  class="form-check-label"
                  style="color: #ededed"
                  >회원정보와 동일</label
                >
              </div>
              <div
                class="form-check form-check-inline"
                style="margin-bottom: 0%"
              >
                <input
                  type="radio"
                  name="addressInfo"
                  id="newAddress"
                  class="form-check-input"
                /><label
                  for="newAddress"
                  class="form-check-label"
                  style="color: #ededed"
                  >새로운 배송정보</label
                >
              </div>
            </div>

            <div class="input-group col-mb-3" name="name">
              <input
                type="tel"
                class="form-control"
                id="name"
                name="name"
                aria-label=""
                placeholder="받는 사람 이름"
              />
            </div>

            <div class="col-m-3">
              <input
                type="text"
                class="form-control"
                width="50px"
                height="30"
                id="nick"
                name="nick"
                maxlength=""
                placeholder="닉네임"
              />
            </div>

            <div class="input-group col-mb-3" name="phone">
              <select
                class="form-select"
                id="phone1"
                aria-label="Default select example"
              >
                <option value="1" selected>010</option>

                <option value="2">011</option>
                <option value="3">017</option>
                <option value="4">019</option>
              </select>

              <span class="input-group-text">-</span>
              <input
                type="tel"
                class="form-control"
                id="phone2"
                placeholder=""
                aria-label=""
              />
              <span class="input-group-text">-</span>
              <input
                type="tel"
                class="form-control"
                id="phone3"
                placeholder=""
                aria-label=""
              />
            </div>

            <div class="input-group mb-3">
              <input
                type="text"
                class="form-control"
                id="zipcode"
                name="zipcode"
                placeholder="우편번호"
              />

              <div class="form-group d-grid" id="loginbtn">
                <button
                  class="btn btn btn-outline-warning"
                  style="color: rgb(255, 255, 253)"
                  type="button"
                  onclick=" daumZipCode()"
                  data-bs-toggle="modal"
                  data-bs-target="#staticBackdrop"
                >
                  우편번호찾기
                </button>
              </div>

              <div class="input-group">
                <input
                  type="text"
                  class="form-control"
                  placeholder="주소"
                  id="address1"
                  name="address1"
                />
              </div>

              <div class="input-group col-mb-3">
                <div class="form-floating">
                  <textarea
                    class="form-control"
                    style="width: 100%"
                    placeholder="Leave a comment here"
                    id="address2"
                    name="address2"
                  ></textarea>
                  <label for="floatingTextarea">상세주소</label>
                </div>
              </div>

              <div class="input-group col-mb-3">
                <div class="form-floating">
                  <textarea
                    class="form-control"
                    style="width: 100%"
                    placeholder="Leave a comment here"
                    id="deliveryReq"
                    name="deliveryReq"
                  ></textarea>
                  <label for="floatingTextarea">배송요청사항</label>
                </div>
              </div>

              <div class="input-group" style="margin-bottom: 0%">
                <input type="checkbox" style="margin-right: 5px" /><label
                  for=""
                  style="margin: 10px; color: #ededed"
                  >기본배송지로 저장</label
                >
                <button
                  type="reset"
                  style="margin-left: 59%; border-radius: 5px; color: #ededed"
                  class="btn"
                >
                  다시작성
                </button>
              </div>
            </div>

            <!-------------------------------------------------------------------------------->
            <div style="width: 100%; border-radius: 5%">
              <div
                class="accordion input-group d-grid"
                id="accordionPanelsStayOpenExample"
              >
                <div class="accordion-item">
                  <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                    <button
                      class="accordion-button"
                      type="button"
                      data-bs-toggle="collapse"
                      data-bs-target="#panelsStayOpen-collapseOne"
                      aria-expanded="true"
                      aria-controls="panelsStayOpen-collapseOne"
                    >
                      주문상품
                    </button>
                  </h2>
                  <div
                    id="panelsStayOpen-collapseOne"
                    class="accordion-collapse collapse show"
                    aria-labelledby="panelsStayOpen-headingOne"
                  >
                    <div class="accordion-body">
                      <div>
                        <c:forEach items="${orderItemList}" var="cartItem">
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
                                  <div
                                    class="ratio ratio-1x1 align-self-center"
                                  >
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
                                    <a href=""
                                      >${cartItem.productVO.productName}</a
                                    >
                                  </h5>
                                  <p class="card-text mt-2">
                                    사이즈 :
                                    <span id="size_${cartItem.id}"
                                      >${cartItem.productSize}</span
                                    >
                                  </p>
                                  <p class="card-text">
                                    가격 :
                                    <span id="resultPrice_${cartItem.id}"
                                      >${cartItem.productVO.price} </span
                                    >원<br />(
                                    <span id="resultQuantity_${cartItem.id}"
                                      >${cartItem.productCount}</span
                                    >
                                    개)
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
                                      size="2"
                                      maxlength="3"
                                      value="${cartItem.productCount}"
                                      data-price="${cartItem.productVO.price}"
                                      data-input-value="quantity"
                                      data-result-price-id="resultPrice_${cartItem.id}"
                                      data-result-quantity-id="resultQuantity_${cartItem.id}"
                                    />
                                    <br />
                                    <div
                                      id="quantity-check"
                                      class="btn-group-vertical"
                                    >
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
                  <div class="accordion-item">
                    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                      <button
                        class="accordion-button collapsed"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#panelsStayOpen-collapseTwo"
                        aria-expanded="false"
                        aria-controls="panelsStayOpen-collapseTwo"
                      >
                        결제금액
                      </button>
                    </h2>
                    <div
                      id="panelsStayOpen-collapseTwo"
                      class="accordion-collapse collapse"
                      aria-labelledby="panelsStayOpen-headingTwo"
                    >
                      <div class="accordion-body">
                        <div
                          class="bg-secondary p-5"
                          style="--bs-bg-opacity: 0.2; border-radius: 5px"
                        >
                          <div class="row">
                            <span
                              class="col-1"
                              style="
                                font-size: 20px;
                                text-align: center;
                                vertical-align: middle;
                              "
                              >CART</span
                            >
                            <span
                              class="col-7"
                              style="
                                font-size: 20px;
                                text-align: right;
                                vertical-align: middle;
                              "
                              >선택된 상품의 개수</span
                            >
                            <span
                              class="col-4"
                              style="
                                font-size: 20px;
                                text-align: center;
                                vertical-align: middle;
                              "
                              >총 가격</span
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
                                <path
                                  d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96zM252 160c0 11 9 20 20 20h44v44c0 11 9 20 20 20s20-9 20-20V180h44c11 0 20-9 20-20s-9-20-20-20H356V96c0-11-9-20-20-20s-20 9-20 20v44H272c-11 0-20 9-20 20z"
                                />
                              </svg>
                            </span>
                            <span
                              id="calculateItemCount"
                              class="col-6"
                              style="
                                font-size: 25px;
                                text-align: right;
                                vertical-align: middle;
                              "
                              >0개</span
                            >
                            <span
                              id="calculateResultPrice"
                              class="col-4"
                              style="
                                font-size: 25px;
                                text-align: right;
                                vertical-align: middle;
                              "
                              >0원</span
                            >
                          </div>

                          <hr />
                          <br />
                          <div
                            class="bg-secondary p-5"
                            style="--bs-bg-opacity: 0.2; border-radius: 5px"
                          >
                            <div class="row">
                              <span
                                class="col-4"
                                style="
                                  font-size: 15px;
                                  text-align: center;
                                  vertical-align: middle;
                                "
                                >마이 포인트</span
                              >
                              <span
                                class="col-4"
                                style="
                                  font-size: 15px;
                                  text-align: center;
                                  vertical-align: middle;
                                "
                                >사용 포인트</span
                              >
                              <span
                                class="col-4"
                                style="
                                  font-size: 15px;
                                  text-align: center;
                                  vertical-align: middle;
                                "
                                >남은 포인트</span
                              >
                            </div>

                            <br />
                            <div class="row">
                              <span
                                class="col-4"
                                style="
                                  font-size: 25px;
                                  text-align: center;
                                  vertical-align: middle;
                                "
                                >0</span
                              >
                              <span
                                class="col-4"
                                style="
                                  font-size: 25px;
                                  text-align: center;
                                  vertical-align: middle;
                                "
                                >0</span
                              >
                              <span
                                class="col-4"
                                style="
                                  font-size: 25px;
                                  text-align: center;
                                  vertical-align: middle;
                                "
                                >0</span
                              >
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="input-group d-grid" id="loginbtn">
                  <a
                    class="btn btn-outline-warning btn-dark btn-lg"
                    type="button"
                    >ORDER</a
                  >
                </div>

                <br />
                <div class="form-group d-grid" id="loginbtn">
                  <a
                    class="btn"
                    style="color: aliceblue"
                    type="button"
                    data-bs-toggle="modal"
                    data-bs-target="#staticBackdrop"
                  >
                    back to the cart</a
                  >
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp" flush="false" />

    <!-------------우편번호 API------------->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
      function daumZipCode() {
        new daum.Postcode({
          oncomplete: function (data) {
            // 팝업창에서 검색한 결과 중 항목을 클릭하였을 경우에 실행할 코드를 이곳에 작성한다.

            // 각 주소의 노출 규칙에 따라서 주소를 조합해야 한다.
            // 내려오는 변수가 값이 없는 경우에는 공백('') 값을 가지므로 이름을 참고하여 분기한다.
            let fullAddr = ""; // 최종 주소를 담을 변수
            let subAddr = ""; // 조합형 주소를 담을 변수

            // 사용자가 선택한 주소의 타입에 따라서 해당 주소값을 가져온다.
            if (data.userSelectedType == "R") {
              // 도로명 주소를 선택한 경우
              fullAddr = data.roadAddress;
            } else {
              // 지번 주소를 선택한 경우
              fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일 때 조합
            if (data.userSelectedType == "R") {
              // 법정동명이 있을 경우에 추가한다.
              if (data.bname != "") {
                subAddr += data.bname;
              }
              // 건물명이 있을 경우에 추가한다.
              if (data.buildingName != "") {
                subAddr +=
                  subAddr != "" ? ", " + data.buildingName : data.buildingName;
              }
              // 조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
              fullAddr += subAddr != "" ? "(" + subAddr + ")" : "";
            }

            // 우편번호와 주소정보를 화면의 해당 필드에 출력시킨다.
            // 5자리의 새 우편번호
            document.getElementById("zipcode").value = data.zonecode;
            document.getElementById("address1").value = fullAddr;

            // 커서를 상세주소 입력란으로 이동시킨다.
            document.getElementById("address2").focus();
          }, // End - oncomplete: function(data)
        }).open({
          // 우편번호 팝업 창이 여러개 뜨는것을 방지하기 위해 popupName을 사용한다.
          // 이거 안쓰면 버튼 누를때마다 주소입력 팝업 창 계속 뜸
          popupName: "postcodePopup",
        });
      } // End - function daumZipCode()
    </script>
    <!------------END---우편번호 API------------->

    <script>
      // cart 쪽의 script를 긁어와서 수정시작
      // 이벤트 시작 ================================================================================================
      $("document").ready(function () {
        //cancel 취소 버튼이 눌렸을 때
        $("a[role='cancelBtn']").click(function (e) {
          let cancelCartItemId = e.target.getAttribute("value");
          let cartItemIdArr = new Array();
          cartItemIdArr.push(cancelCartItemId);
          fn_deleteCartItem(cartItemIdArr);
          $("#card_" + cancelCartItemId).remove();
        });
        //체크박스가 체크되거나, 체크가 풀릴 때, 계산된 가격을 수정한다.
        $("input[role='cartItemCheckbox']").change(function () {
          checkedCalculatePrice();
          fn_checkedItemCount();
        });
      });

      //플러스버튼 클릭
      //계산된 가격을 수정해야한다.
      $("button[data-function-type='plus']").on("click", function (e) {
        fn_quantityIncrease($(this));
        checkedCalculatePrice();
      });
      //마이너스 버튼 클릭
      $("button[data-function-type='minus']").on("click", function (e) {
        fn_quantityDecrease($(this));
        checkedCalculatePrice();
      });
      //개수 변경시에 발생하는 이벤트 복사나, 값을 임의로 변경해도 다 일어나는 이벤트이다.
      $("input[data-input-value='quantity']").on(
        "propertychange change keyup paste input",
        function (e) {
          fn_quantityOnChange($(this));
          checkedCalculatePrice();
        }
      );

      // 이벤트 끝 ================================================================================================

      //모든 체크박스를 체크하는 함수
      function selectAll() {
        let checkboxes = $("input[role='cartItemCheckbox']");
        checkboxes.prop("checked", true);
        checkedCalculatePrice();
      }

      //선택된 아이템을 삭제하는 함수
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
      //체크된 상품 최종 가격 계산
      function checkedCalculatePrice() {
        let resultPrice = 0;
        $("input[role='cartItemCheckbox']:checked").each(function () {
          let cartItemId = $(this).val();
          console.log($("#resultPrice_" + cartItemId).text());
          let itemResultPrice = $("#resultPrice_" + cartItemId).text();
          let itemResultPriceNum = Number(itemResultPrice);
          resultPrice += itemResultPriceNum;
        });
        $("#calculateResultPrice").text(resultPrice + "원");
      }

      function fn_checkedItemCount() {
        let count = 0;
        $("input[role='cartItemCheckbox']:checked").each(function () {
          count++;
        });
        $("#calculateItemCount").text(count + "개");
      }

      //ajax- cartItemId배열을 받아서 ajax요청으로 컨트롤러로 뿌려줌 CartController 참조
      function fn_deleteCartItem(cartItemIdArr) {
        $.ajax({
          url: "${contextPath}/cart/delete",
          type: "post",
          //contentType에 형식을 지정해주고, data를 JSON.stringify를 통해 변환해줘야 컨트롤러에서 List<Long>타입으로 받을 수 있음
          contentType: "application/json; charset:UTF-8",
          data: JSON.stringify(cartItemIdArr),
          success: function () {
            //cart와는 달리 아이템을 삭제한 뒤에 그 결과를 다시 뿌려줄 이유가 없다. -- 모달이 아니기 때문 ? 아니면 카트도 다시 안뿌려줘도되나?
            //이 아이템이 속한 card를 삭제하는 것으로 리스트에서 이 항목을 제외한다.
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

      //상품의 개수를 늘리는 함수(+버튼 클릭시)
      function fn_quantityIncrease(e) {
        let quantity = fn_getQuantityId(e);
        let quantityValue = fn_getQuantityValue(quantity);
        let changedValue = quantityValue + 1;
        $("#" + quantity).attr("value", changedValue);
        $("#" + quantity).val(changedValue);
        fn_quantityOnChange($("#" + quantity));
        return;
      }

      //상품의 개수를 줄이는 함수(-버튼 클릭시)
      function fn_quantityDecrease(e) {
        let quantity = fn_getQuantityId(e);
        let quantityValue = fn_getQuantityValue(quantity);
        let changedValue = quantityValue - 1;
        $("#" + quantity).attr("value", changedValue);
        $("#" + quantity).val(changedValue);
        fn_quantityOnChange($("#" + quantity));
        return;
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
      //개수가 변경될 때 실행되는 함수
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

      //인풋의 값이 변화할 때(입력되거나, 증가버튼 또는 감소버튼을 통해 바뀔때) 그 값이 음수가 되지는 않는지 검증하는 함수
      function validateNumber(e) {
        let numberValue = $(e).val();
        if (numberValue <= 0) {
          $(e).val(1);
        }
        return;
      }
      //상품 단일로 버튼으로 구매할 경우

      //OrderForm으로 보내야 하기때문에, orderController에서 처리함
      //선택된 상품을 리스트로 만들어서 orderController의 postOrder에서 처리하게 됨
      function fn_buySelectedItem() {
        //post요청을 보낼 form 생성
        let newForm = document.createElement("form");
        newForm.setAttribute("method", "Post");
        newForm.setAttribute("action", "${contextPath}/order/newOrder");
        newForm.setAttribute("enctype", "application/x-www-form-urlencoded");

        $("input[role='cartItemCheckbox']:checked").each(function (index) {
          let hiddenInputId = document.createElement("input");
          let hiddenInputSize = document.createElement("input");
          let hiddenInputCount = document.createElement("input");
          //카트아이템을 인풋에 저장된 밸류를 통해서 가져옴
          let cartItemId = $(this).val();
          //가져온 카트 아이템 아이디로 개수와 사이즈를 가져옴
          let itemSize = $("#size_" + cartItemId).text();
          let itemCount = $("#resultQuantity_" + cartItemId).text();
          let itemCountNum = Number(itemCount);
          //cartId를 cartItemVOList의 변수로 넘겨줌
          hiddenInputId.setAttribute("type", "hidden");
          hiddenInputId.setAttribute(
            "name",
            "cartItemVOList[" + index + "].id"
          );
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
  </body>
  <!------------------- END body------------------------------------------------------------------------------------------------>
</html>
