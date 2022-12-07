<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="result"		 value="${param.result}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>

</head>
<body>


<!------ body----------------------------------------->

<jsp:include page="../common/header.jsp" flush="false" />



<div class="path">
  <div >
    <ul>
        <li>
            <a class="text-decoration-none" href="/">HOME</a>
        </li>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
        </svg>
        <li>
            <strong>CART</strong>
        </li>
    </ul>
  </div>
</div>
<br>
<br>
<!---------------------------------------------------------------------------------------->
<div class="container">
  <div class="contents d-flex align-items-start flex-column mb-2">
<!---------------------------------------------------------------------------------------->

    <form action="" class="cart-table">
      <div>
        <div>
          <div class="row align-items-center">
            <div class="col-12">
              <table class="table cart-products margin-60px-bottom md-margin-40px-bottom sm-no-margin-bottom">
                <colgroup>
                  <col style="width: 5%;">
                  <col style="width: 15%;">
                  <col style="width: 15%">
                  <col style="width: 15%;">
                  <col style="width: 15%;">
                  <col style="width: 15%;">
                  <col style="width: 15%;">

              </colgroup>
                <thead class="" style="text-align:center ; vertical-align:middle;">
                  <tr>
                    <th scope="col" class="alt-font"><input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="..." > </th>
                    <th scope="col"></th>
                    <th scope="col" class="alt-font">products</th>
                    <th scope="col" class="alt-font">price</th>
                    <th scope="col" class="alt-font">quantity</th>
                    <th scope="col" class="alt-font">total</th>
                    <th scope="col" class="alt-font">choice</th>
                  </tr>
                </thead>

                <tbody style=" text-align:center;vertical-align: middle;">
                  <tr>
                    <th scope="col" class="text-align:center"> <input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="..." ></th>
                    <th scope="col"><a href=""><img src="" alt=""></a></th>
                    <th scope="col"><a href=""></a><span></span></th>
                    <th scope="col"><span></span></th>
                    <th scope="col"  >
                    <div class=" d-flex justify-content-center align-items-center">
                      <div class="row quantiy" style="font-size:0" id="quantity-checkbox">
                        <input style="border:0 solid black" id="quantity-check" style="font-size:5px" class="col-6  input-text-qty-text" type="text"  name="quantiy" value="1">
                        <div id="quantity-check" class="col-2" style="font-size:10px">
                          <input style="border:0 solid black" type="button" value="+" onClick="javascript:this.form.amount.value++;" class="qty-plus qty-btn" data-quantity="plus" data-field="quantity">
                          <input style="border:0 solid black" type="button" value="-" class="qty-minus qty-btn" data-quantity="minus" data-field="quantity">
                        </div>
                      </div>
                    </div>
                    </th>




                    <th scope="col"><span></span></th>
                    <th scope="col">
                      <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                        <a type="button" class="btn btn-light">order</a>
                        <a type="button" class="btn btn-light">cancel</a>

                      </div>

                    </th>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="bg-secondary p-5" style="--bs-bg-opacity: .2;border-radius: 5px;">
          <div class="row">
            <span class="col-1"style="font-size:25px;text-align:center;vertical-align:middle;">CART</span>
            <span class="col-7" style="font-size:25px;text-align:center;vertical-align:middle;">calculation</span>
            <span class="col-4"style="font-size:25px;text-align:center;vertical-align:middle;">total</span>
          </div>
          <br>
          <div class="row">
            <span class="col-1" >
              <svg  xmlns="http://www.w3.org/2000/svg" width="50px"  viewBox="10 0 576 512"><!--! Font Awesome Pro 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96zM252 160c0 11 9 20 20 20h44v44c0 11 9 20 20 20s20-9 20-20V180h44c11 0 20-9 20-20s-9-20-20-20H356V96c0-11-9-20-20-20s-20 9-20 20v44H272c-11 0-20 9-20 20z"/></svg>
            </span>
            <span class="col-7"style="font-size:25px;text-align:center;vertical-align:middle;">0원</span>
            <span class="col-4"style="font-size:25px;text-align:center;vertical-align:middle;">0원</span>
          </div>

        </div>


      </div>
    </form>
  </div>

  <div class="d-flex justify-content-center" style="margin-top:5%">
    <button type="button" class="btn btn-outline-light btn-dark btn-sm" style="width:120px;height: 50px;">Continue Shopping</button>
    <button type="button" class="btn btn-outline-light btn-dark btn-sm" style="width:120px;height: 50px;">Reset</button>
    <button type="button" class="btn btn-warning btn-sm" style="width:120px">Select Buying</button>
    <button type="button" class="btn btn-warning btn-sm" style="width:120px">all Buying</button>
  </div>

  <div class="d-flex justify-content-center" style="margin-top:5%" >

    <nav  aria-label="Page navigation example" >
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

<jsp:include page="../common/footer.jsp" flush="false" />

  <!------------------- END body------------------------------------------------------------------------------------------------>
<hr>



</body>
</html>