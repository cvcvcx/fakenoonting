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
    <jsp:include page="../common/header.jsp" flush="false" />

    <!-- article -->
    <article>
      <!-- start section -->
      <section>
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div
                id="carouselExampleIndicators"
                class="carousel slide"
                data-bs-ride="carousel"
              >
                <div class="carousel-indicators">
                    <c:forEach
                    items="${product.productImgItems}"
                    varStatus="status"
                  >
                  <button
                    type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide-to="${status.index}"
                    class="<c:out value="${status.index == 0 ? 'active':''}"/>"
                    aria-current="<c:out value = "${status.index == 0 ? 'true' : ''}" />"
                    >
                    </c:forEach>
                </div>
                <div class="carousel-inner">
                  <c:forEach
                    items="${product.productImgItems}"
                    var="imgItem"
                    varStatus="status"
                  >
                    <div
                      class="carousel-item ratio ratio-1x1 <c:out value="${status.index == 0 ? 'active' : ''}"/> ">
                      <img
                        src="${contextPath}/util/upload/display?fileName=${imgItem.uploadPath}/${imgItem.imgUUID}_${imgItem.orgImgName}"
                        class="w-100"
                        alt="..."
                      />
                    </div>
                  </c:forEach>
                </div>
                <button
                  class="carousel-control-prev"
                  type="button"
                  data-bs-target="#carouselExampleIndicators"
                  data-bs-slide="prev"
                >
                  <span
                    class="carousel-control-prev-icon"
                    aria-hidden="true"
                  ></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button
                  class="carousel-control-next"
                  type="button"
                  data-bs-target="#carouselExampleIndicators"
                  data-bs-slide="next"
                >
                  <span
                    class="carousel-control-next-icon"
                    aria-hidden="true"
                  ></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
            </div>
            <div class="col-md-6 text-left">
              <div class="row">
                <div class="col-12 col-md-12">
                  <h2>${product.productName}</h2>
                </div>
              </div>
              <hr />
              <div class="row mb-3">
                <div class="col-6 col-md-5">판매가</div>
                <div class="col-6 col-md-7">${product.price} 원</div>
              </div>
              <div class="row mb-3">
                <div class="col-8 col-md-5">색상</div>
                <div class="col-4 col-md-7">
                  <select class="form-select" aria-label="select color">
                    <option selected>색상을 선택해 주세요.</option>
                  </select>
                </div>
              </div>
              <div class="row">
                <div class="col-8 col-md-5">
                  사이즈
                </div>
                <div class="col-4 col-md-7">
                  <select class="form-select" id="size" aria-label="select size">
                    <option selected id="notSelected">사이즈를 선택해 주세요.</option>
                    <c:forEach
                      items="${product.productSizeList}"
                      var="sizeList"
                    >
                      <option value="${sizeList.size}">
                        ${sizeList.size} 남은수량 : ${sizeList.productCount} 개
                      </option>
                    </c:forEach>
                  </select>
                </div>
              </div>
              <hr />
              <div class="row">
                <div class="col-8 col-md-5">
                  <label class="screen-reader-text">
                    ${product.productName}<br />-<span id ="sizeSpan"></span>
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
                    aria-label="Close"
                  ></button>
                </div>
              </div>
              <hr />
              <div class="row mb-3">
                <div class="col-8 col-md-5">총 상품금액(수량)</div>
                <div class="col-4 col-md-7"><b id = "resultPrice">${product.price}</b><span id ="resultCount">  (1개)</span></div>
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
                      id="selectRequiredOptionModal"
                      data-bs-backdrop="static"
                      data-bs-keyboard="false"
                      tabindex="-1"
                      aria-labelledby="buyNowLabel"
                      aria-hidden="true"
                    >
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
                              aria-label="Close"
                            ></button>
                          </div>
                          <div class="modal-body">
                            필수 옵션을 선택해주세요.
                          </div>
                          <div class="modal-footer">
                            <button
                              type="button"
                              class="btn btn-primary"
                              data-bs-dismiss="modal"
                            >
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
                      data-bs-target="#wishButton"
                    >
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
                      aria-hidden="true"
                    >
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
                              aria-label="Close"
                            ></button>
                          </div>
                          <div class="modal-body">
                            관심상품으로 등록되었습니다.
                          </div>
                          <div class="modal-footer">
                            <button
                              type="button"
                              class="btn btn-primary"
                              data-bs-dismiss="modal"
                            >
                              확인
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- Button trigger modal -->
                    <button type="button" role="cartButton" class="btn btn-light">
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
                      aria-hidden="true"
                    >
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
                              aria-label="Close"
                            ></button>
                          </div>
                          <div class="modal-body">
                            장바구니에 상품이 정상적으로 담겼습니다.
                          </div>
                          <div class="modal-footer">
                            <button
                              type="button"
                              class="btn btn-light"
                              data-bs-dismiss="modal"
                            >
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
      <section class="mt-5">
        <div class="container">
          <div class="text-center">
            <c:forEach
                items="${product.productContentImgItems}"
                var="imgItem"
                varStatus="status">
                <img
                src="${contextPath}/util/upload/display?fileName=${imgItem.uploadPath}/${imgItem.imgUUID}_${imgItem.orgImgName}"
                class="w-100"
                alt="..."
                />
            </c:forEach>
          </div>
        </div>
      </section>
      <!-- end 제품 상세 이미지, 텍스트 -->

      <!-- start section -->
        <%-- 리뷰관련 --%>
        <section class="border-top border-width-1px border-color-medium-gray pt-0">
          <div class="container-fluid">
            <div class="row">
              <div class="col-12">
                <div class="justify-content-center text-center">
                  <a class="btn btn-dark btn-sm" href="#reviews" id="reviews">구매후기 (5)</a>
                  <a class="btn btn-light btn-sm" href="#qanda">상품문의 (2)</a>
                </div>
              </div>
              <hr />
            </div>
          </div>
          <div class="container">
            <div class="tab-content" id="reviewList">
              <jsp:include page="../review/reviewList.jsp" flush="false" />
            </div>
          </div>

        <%-- 문의관련 --%>
          <div class="container-fluid"></div>
          <div class="row">
            <div class="col-12">
              <div class="justify-content-center text-center">
                <a class="btn btn-light btn-sm" href="#reviews">구매후기 (5)</a>
                <a class="btn btn-dark btn-sm" href="#qanda" id="qanda">상품문의 (2)</a>
              </div>
            </div>
            <hr />
          </div>
          </div>
          <div>
            <div class="container">
              <div class="tab-content" id="questionList">
                <jsp:include page="../question/questionList.jsp" />
              </div>
            </div>
          </div>
      </section>
      <!-- end section -->
    </article>

    <script>

        //총 상품금액을 구하는 함수
      $("#productCount").on("change",function (e){
        let productCount = $("#productCount").val();
        productCount =  Number(productCount);
        let productPrice = "${product.price}";
        productPrice = Number(productPrice);
        let resultPrice = (productCount*productPrice);

        $("#resultPrice").text(resultPrice+"  ");
        $("#resultCount").text("  "+productCount+"개");
      })
      //사이즈 옵션이 바뀔때, 아래에 있는 상품 옵션을 바꾸는 함수
      $("#size").on("change",function(){
        let productSize = $("select[id=size]").val();
        $("#sizeSpan").text(productSize);
      })

      //구매 버튼을 눌렀을 때
      $("button[role='buyButton']").on("click", function (e) {
        e.preventDefault();

        //로그인이 되었는지 체크
        let member = "${member}";
        if(member == null||member == ''){
            alert("로그인이 필요합니다.")
            return;
        }
        //사이즈 옵션이 만약 선택되지 않았을 때라면 필수옵션을 선택해 달라는 모달을 띄우고 리턴
        let productSize = $("select[id=size]").val();
        if(productSize==$("option[id=notSelected]").val()){
            $("#selectRequiredOptionModal").modal('show');
            return;
        }   
        //주문 정보가 들어간 폼을 만드는 함수
        let newForm = fn_makeNewForm(productSize);
        
        //.submit(); -- 주문페이지가 만들어지지 않았기 때문에 submit을 시키지 않음 
      });
      $("button[role='cartButton']").on("click", function (e) {
        console.log("cartButton clicked!");
        e.preventDefault();
        //꼭 member를 "" 로 감싸야 오류가 발생하지 않음(만약 감싸지 않으면 공백이 들어가기 때문)
        //로그인 상태 체크
        let member = "${member}";
        if(member == null||member == ''){
            alert("로그인이 필요합니다.")
            return;
        }
        //필수옵션 선택 체크
        let productSize = $("select[id=size]").val();
        if(productSize==$("option[id=notSelected]").val()){
            $("#selectRequiredOptionModal").modal('show');
            return;
        }   
        //주문 정보가 들어간 폼을 새로 만들어서 newForm이라는 지역변수에 저장
        let newForm = fn_makeNewForm(productSize);

        //폼에 담긴 정보를 json형태로 보낼 수 있게 바꿔주는 함수 (serialize)
        let formData = newForm.serialize();
        $.ajax({
            type : 'post',
            url : '${contextPath}/cart/addCart',
            data : formData,
            success: function(){
                $("#cartModal").modal('show');
            },
            error:function(request, status, error){
        		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	}
        })
               
      });
      //주문 정보가 담긴 폼을 만드는 함수
      function fn_makeNewForm(productSize){
        let newForm = $("<form></form>");
            newForm.attr("action", "${contextPath}/cart/addCart");
            newForm.attr("method", "post");
            newForm.append(
            $("<input />", {
                type: "text",
                name: "productId",
                value: "${product.id}",
            })
            );
            let productCount = $("#productCount").val();
            newForm.append(
            $("<input />", {
                type: "text",
                name: "productCount",
                value: productCount,
            })
            );
              
            newForm.append(
            $("<input />", {
                type: "text",
                name: "productSize",
                value: productSize,
            })
        );
        
       return newForm;
      }

      $(document).ready(function(){
        $.ajax({
          type: "get",
          url: "${contextPath}/reviewList",
          data: {productId: ${product.id}},
          success: function(result) {
            $("#reviewList").html(result);
          },
          error: function(request, error) {
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
          }
        });
      });

        $(document).ready(function(){
          $.ajax({
            type: "get",
            url: "${contextPath}/questionList",
            data: {productId: ${product.id}},
            success: function(result) {
              $("#questionList").html(result);
            },
            error: function(request, error) {
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
            }
          });
        });

    </script>
    <!-- footer -->
    <hr />
    <jsp:include page="../common/footer.jsp" flush="false" />
  </body>
</html>
