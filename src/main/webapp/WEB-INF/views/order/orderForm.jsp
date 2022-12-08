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
              <div class="input-group" style="margin-bottom: 0%">
                <input type="checkbox" /><label
                  for=""
                  style="margin: 10px; color: #ededed"
                  >회원정보와 동일</label
                >
                <input type="checkbox" /><label
                  for=""
                  style="margin: 10px; color: #ededed"
                  >새로운 배송정보</label
                >
              </div>

              <div class="input-group col-mb-3">
                <input
                  type="text"
                  class="form-control"
                  width="30px"
                  id="email"
                  name="email"
                  placeholder="이메일"
                  aria-label="Username"
                />
              </div>

              <div class="col-m-3">
                <input
                  type="password"
                  class="form-control"
                  width="50px"
                  height="30"
                  id="pwd"
                  name="pwd"
                  maxlength=""
                  placeholder="비밀번호"
                />
              </div>

              <div class="input-group col-mb-3" name="name">
                <input
                  type="tel"
                  class="form-control"
                  id="name"
                  name="name"
                  aria-label=""
                  placeholder="이름"
                />

                <select
                  class="form-select"
                  id="gender"
                  name="gender"
                  aria-label="Default select example"
                >
                  <option selected>성별</option>
                  <option value="">남성</option>
                  <option value="">여성</option>
                </select>
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
                  <option selected>010</option>

                  <option value="2">011</option>
                  <option value="3">017</option>
                  <option value="3">019</option>
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
                          <div class="row align-items-center">
                            <div class="col-12">
                              <table
                                class="table cart-products margin-60px-bottom md-margin-40px-bottom sm-no-margin-bottom"
                              >
                                <colgroup>
                                  <col style="width: 5%" />
                                  <col style="width: 15%" />
                                  <col style="width: 15%" />
                                  <col style="width: 15%" />
                                  <col style="width: 15%" />
                                  <col style="width: 15%" />
                                  <col style="width: 15%" />
                                </colgroup>
                                <thead
                                  class=""
                                  style="
                                    text-align: center;
                                    vertical-align: middle;
                                  "
                                >
                                  <tr>
                                    <th scope="col" class="alt-font">
                                      <input
                                        class="form-check-input"
                                        type="checkbox"
                                        value="selectall"
                                        name="selectall"
                                        onclick="selectAll(this)"
                                        aria-label="..."
                                      />
                                    </th>
                                    <th scope="col"></th>
                                    <th scope="col" class="alt-font">
                                      products
                                    </th>
                                    <th scope="col" class="alt-font">price</th>
                                    <th scope="col" class="alt-font">
                                      quantity
                                    </th>
                                    <th scope="col" class="alt-font">total</th>
                                    <th scope="col" class="alt-font">choice</th>
                                  </tr>
                                </thead>

                                <tbody
                                  style="
                                    text-align: center;
                                    vertical-align: middle;
                                  "
                                >
                                  <tr>
                                    <td scope="col" class="text-align:center">
                                      <input
                                        class="form-check-input"
                                        type="checkbox"
                                        id="list"
                                        name="list"
                                        value=""
                                        onclick="checkSelectAll()"
                                        aria-label="..."
                                      />
                                    </td>
                                    <td scope="col">
                                      <a href="#"
                                        ><img
                                          src=""
                                          alt=""
                                          width="150"
                                          height="100"
                                      /></a>
                                    </td>
                                    <td scope="col">
                                      <a href="">상품명</a> <br />
                                      상세설명
                                    </td>
                                    <td scope="col" class="basketprice">
                                      <input
                                        type="hidden"
                                        name="p_price"
                                        id="p_price1"
                                        class="p_price"
                                        value=""
                                      />
                                    </td>

                                    <td scope="col">
                                      <div
                                        class="d-flex justify-content-center align-items-center"
                                      >
                                        <div
                                          class="row d-flex justify-content-center"
                                          id="quantity-checkbox"
                                        >
                                          <input
                                            type="number"
                                            id="p_num1"
                                            name="p_num1"
                                            value="1"
                                            min="1"
                                            max="100"
                                            style="
                                              border: 5 solid black;
                                              width: 80%;
                                              height: 50px;
                                              border-radius: 15%;
                                            "
                                            class="col-6 input-text-qty-text productCost"
                                          />
                                        </div>
                                      </div>
                                    </td>

                                    <td scope="col">
                                      <label class="" for=""></label>
                                    </td>

                                    <td scope="col">
                                      <div
                                        class="btn-group-vertical"
                                        role="group"
                                        aria-label="Vertical button group"
                                      >
                                        <a
                                          type="button"
                                          class="btn btn-light"
                                          href="#"
                                          >order</a
                                        >
                                        <a
                                          type="button"
                                          class="btn btn-light doCancel"
                                          href="javascript:void(0)"
                                          onclick=""
                                          >cancel</a
                                        >
                                      </div>
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2
                        class="accordion-header"
                        id="panelsStayOpen-headingTwo"
                      >
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
                                >calculation</span
                              >
                              <span
                                class="col-4"
                                style="
                                  font-size: 20px;
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
                                  <path
                                    d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96zM252 160c0 11 9 20 20 20h44v44c0 11 9 20 20 20s20-9 20-20V180h44c11 0 20-9 20-20s-9-20-20-20H356V96c0-11-9-20-20-20s-20 9-20 20v44H272c-11 0-20 9-20 20z"
                                  />
                                </svg>
                              </span>
                              <span
                                class="col-7"
                                style="
                                  font-size: 20px;
                                  text-align: right;
                                  vertical-align: middle;
                                "
                                >0원</span
                              >
                              <span
                                class="col-4"
                                style="
                                  font-size: 20px;
                                  text-align: center;
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

    <!--체크박스 전체선택------------------->
    <script>
      function checkSelectAll() {
        // 전체 체크박스
        const checkboxes = document.querySelectorAll('input[name="list"]');
        // 선택된 체크박스
        const checked = document.querySelectorAll('input[name="list"]:checked');
        // select all 체크박스
        const selectAll = document.querySelector('input[name="selectall"]');

        if (checkboxes.length === checked.length) {
          selectAll.checked = true;
        } else {
          selectAll.checked = false;
        }
      }

      function selectAll(selectAll) {
        const checkboxes = document.getElementsByName("list");

        checkboxes.forEach((checkbox) => {
          checkbox.checked = selectAll.checked;
        });
      }
    </script>
    <!-------End-체크박스 전체선택------------------->
  </body>
  <!------------------- END body------------------------------------------------------------------------------------------------>
</html>
