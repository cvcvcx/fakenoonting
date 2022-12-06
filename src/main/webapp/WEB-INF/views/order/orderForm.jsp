<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="contextPath" value="${pageContext.request.contextPath}" />
        <c:set var="result" value="${param.result}" />
        <% request.setCharacterEncoding("UTF-8"); %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-chevron-compact-right" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
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
                                            <table
                                                class="table cart-products margin-60px-bottom md-margin-40px-bottom sm-no-margin-bottom">
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
                                                        <th scope="col" class="alt-font"><input class="form-check-input"
                                                                type="checkbox" value="selectall" name="selectall"
                                                                onclick='selectAll(this)' aria-label="..."> </th>
                                                        <th scope="col">상품 이미지</th>
                                                        <th scope="col" class="alt-font">products</th>
                                                        <th scope="col" class="alt-font">price</th>
                                                        <th scope="col" class="alt-font">quantity</th>
                                                        <th scope="col" class="alt-font">total</th>
                                                        <th scope="col" class="alt-font">choice</th>
                                                    </tr>
                                                </thead>

                                                <tbody style=" text-align:center;vertical-align: middle;">
                                                    <tr>
                                                        <th scope="col" class="text-align:center"> <input
                                                                class="form-check-input" type="checkbox" id="list"
                                                                name="list" value="" onclick='checkSelectAll()'
                                                                aria-label="..."></th>
                                                        <th scope="col"><a href=""><img src="" alt=""></a></th>
                                                        <th scope="col"><a href=""></a><span></span></th>
                                                        <th scope="col"><span></span></th>
                                                        <th scope="col">
                                                            <div
                                                                class=" d-flex justify-content-center align-items-center">
                                                                <div class="row d-flex justify-content-center"
                                                                    id="quantity-checkbox">
                                                                    <input type="text" id="quantiy_result"
                                                                        name="quantiy_result" value="1"
                                                                        style="border:0 solid black"
                                                                        class="col-6  input-text-qty-text">

                                                                    <div id="quantity-check" class="col-2"
                                                                        style="font-size:10px">
                                                                        <input style="border:0 solid black"
                                                                            type="button" value="+"
                                                                            onclick='count("plus")'>
                                                                        <input style="border:0 solid black"
                                                                            type="button" value="-"
                                                                            onclick='count("minus")'>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </th>




                                                        <th scope="col"><span></span></th>
                                                        <th scope="col">
                                                            <div class="btn-group-vertical" role="group"
                                                                aria-label="Vertical button group">
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
                                        <span class="col-1"
                                            style="font-size:20px;text-align:center;vertical-align:middle;">CART</span>
                                        <span class="col-7"
                                            style="font-size:20px;text-align:right;vertical-align:middle;">calculation</span>
                                        <span class="col-4"
                                            style="font-size:20px;text-align:center;vertical-align:middle;">total</span>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <span class="col-1">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="50px" viewBox="10 0 576 512">
                                                <!--! Font Awesome Pro 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                                <path
                                                    d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96zM252 160c0 11 9 20 20 20h44v44c0 11 9 20 20 20s20-9 20-20V180h44c11 0 20-9 20-20s-9-20-20-20H356V96c0-11-9-20-20-20s-20 9-20 20v44H272c-11 0-20 9-20 20z" />
                                            </svg>
                                        </span>
                                        <span class="col-7"
                                            style="font-size:20px;text-align:right;vertical-align:middle;">0원</span>
                                        <span class="col-4"
                                            style="font-size:20px;text-align:center;vertical-align:middle;">0원</span>
                                    </div>

                                </div>


                            </div>


                            <div class="d-flex justify-content-center" style="margin-top:5%">
                                <button type="button" class="btn btn-outline-light btn-dark btn-sm"
                                    style="width:120px;height: 50px;">Continue Shopping</button>
                                <button type="button" class="btn btn-outline-light btn-dark btn-sm"
                                    style="width:120px;height: 50px;">Reset</button>
                                <button type="button" class="btn btn-warning btn-sm" style="width:120px">Select
                                    Buying</button>
                                <button type="button" class="btn btn-warning btn-sm" style="width:120px">all
                                    Buying</button>
                            </div>
                        </form>
                    </div>

                    <div class="d-flex justify-content-center" style="margin-top:5%">

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

                    <hr>

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
                                    let fullAddr = '';	// 최종 주소를 담을 변수
                                    let subAddr = '';	// 조합형 주소를 담을 변수

                                    // 사용자가 선택한 주소의 타입에 따라서 해당 주소값을 가져온다.
                                    if (data.userSelectedType == 'R') {	// 도로명 주소를 선택한 경우
                                        fullAddr = data.roadAddress;
                                    } else {	// 지번 주소를 선택한 경우
                                        fullAddr = data.jibunAddress;
                                    }

                                    // 사용자가 선택한 주소가 도로명 타입일 때 조합
                                    if (data.userSelectedType == 'R') {
                                        // 법정동명이 있을 경우에 추가한다.
                                        if (data.bname != '') {
                                            subAddr += data.bname;
                                        }
                                        // 건물명이 있을 경우에 추가한다.
                                        if (data.buildingName != '') {
                                            subAddr += (subAddr != '' ? ', ' + data.buildingName : data.buildingName);
                                        }
                                        // 조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                                        fullAddr += (subAddr != '' ? '(' + subAddr + ')' : '');
                                    }

                                    // 우편번호와 주소정보를 화면의 해당 필드에 출력시킨다.
                                    // 5자리의 새 우편번호
                                    document.getElementById('zipcode').value = data.zonecode;
                                    document.getElementById('address1').value = fullAddr;

                                    // 커서를 상세주소 입력란으로 이동시킨다.
                                    document.getElementById('address2').focus();



                                }	// End - oncomplete: function(data)

                            }).open({
                                // 우편번호 팝업 창이 여러개 뜨는것을 방지하기 위해 popupName을 사용한다.
                                // 이거 안쓰면 버튼 누를때마다 주소입력 팝업 창 계속 뜸
                                popupName: 'postcodePopup'
                            });
                        }	// End - function daumZipCode()

                    </script>
                    <!------------END---우편번호 API------------->


                    <!--체크박스 전체선택------------------->
                    <script>

                        function checkSelectAll() {
                            // 전체 체크박스
                            const checkboxes
                                = document.querySelectorAll('input[name="list"]');
                            // 선택된 체크박스
                            const checked
                                = document.querySelectorAll('input[name="list"]:checked');
                            // select all 체크박스
                            const selectAll
                                = document.querySelector('input[name="selectall"]');

                            if (checkboxes.length === checked.length) {
                                selectAll.checked = true;
                            } else {
                                selectAll.checked = false;
                            }

                        }

                        function selectAll(selectAll) {
                            const checkboxes
                                = document.getElementsByName('list');

                            checkboxes.forEach((checkbox) => {
                                checkbox.checked = selectAll.checked
                            })
                        }


                    </script>
                    <!-------End-체크박스 전체선택------------------->

                    <!-----수량증감--------->
                    <script>

                        function count(type) {
                            // 결과를 표시할 element
                            const resultElement = document.getElementById('quantiy_result');

                            // 현재 화면에 표시된 값
                            let number = resultElement.innerText;

                            // 더하기/빼기
                            if (type === 'plus') {
                                number = parseInt(number) + 1;
                            } else if (type === 'minus') {
                                number = parseInt(number) - 1;
                            }

                            // 결과 출력
                            resultElement.innerText = number;
                        }

                    </script>
                    <!-----END-수량증감----->


            </body>
            <!------------------- END body------------------------------------------------------------------------------------------------>

            </html>