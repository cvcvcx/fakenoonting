<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined|Material+Icons+Round"
        rel="stylesheet">
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
        rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
        crossorigin="anonymous">
  <!-- JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
          crossorigin="anonymous">
  </script>
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"
          integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
          crossorigin="anonymous">
  </script>
  <style>
    footer {
      background-color: rgb(249, 249, 249);
    }
    a {
      text-decoration: none;
    }
  </style>
  <title>kikerday</title>
</head>
<body>
<!-- header -->
<jsp:include page="../common/header.jsp" flush="false" />
<hr>

<!-- article -->
<article>
  <section>
    <div class="container">
      <div class="row align-items-center justify-content-center">
        <div class="col-12 text-center mt-4 mb-4">
          <h4 class="fw-bold">Q&amp;A</h4>
          <div class="text-secondary mb-3" style="font-size: 14px;">상품 Q&amp;A입니다.</div>
        </div>
      </div>
      <div class="row">
        <div class="col mb-3 text-center">
          <a href="#" class="btn btn-secondary">Q&amp;A전체보기</a>
          <a href="#" class="btn btn-light">상품문의</a>
          <a href="#" class="btn btn-light">배송문의</a>
          <a href="#" class="btn btn-light">교환/반품/취소문의</a>
          <a href="#" class="btn btn-light">기타문의</a>
        </div>
      </div>
      <div class="row">
        <div class="col my-3">
          <div class="btn-group">
            <button class="btn btn-light btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
              배송문의
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">전체</a></li>
              <li><a class="dropdown-item" href="#">상품문의</a></li>
              <li><a class="dropdown-item" href="#">배송문의</a></li>
              <li><a class="dropdown-item" href="#">교환/반품/취소문의</a></li>
              <li><a class="dropdown-item" href="#">기타문의</a></li>
            </ul>
          </div>
          <div class="btn-group">
            <button class="btn btn-light btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
              전체글보기
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">전체글보기</a></li>
              <li><a class="dropdown-item" href="#">답변전 글보기</a></li>
              <li><a class="dropdown-item" href="#">답변완료 글보기</a></li>
            </ul>
          </div>
        </div>
      </div>
      <!--
                        <h2>문의개수 ${allQuestionCount}</h2>
                        <h2>문의조회, 수정, 삭제, 검색기능 추가필요</h2>
                        -->
      <div class="">
        <table class="table table-hover text-center align-middle">
          <thead class="table-light">
          <tr>
            <th scope="col">번호</th>
            <th scope="col">상품정보</th>
            <th scope="col">카테고리</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td scope="row">1</td>
            <td>
              <a href="#"><img src="images/cat11.png" style="width: 46px; height: 46px;"></a>
            </td>
            <td>배송문의</td>
            <td>옷 언제와요</td>
            <td>조**</td>
            <td>2022-12-07</td>
          </tr>
          <tr>
            <td scope="row">2</td>
            <td>
              <a href="#"><img src="images/cat21.jpg" style="width: 46px; height: 46px;"></a>
            </td>
            <td>상품문의</td>
            <td>사이즈 관련 문의 드려요</td>
            <td>이**</td>
            <td>2022-12-08</td>
          </tr>
          </tbody>
        </table>
        <div class="d-flex justify-content-end">
          <a href="#" class="btn btn-secondary m-1 btn-sm">상품문의하기</a>
          <a href="#" class="btn btn-light m-1 btn-sm">모두보기</a>
        </div>
      </div>
      <!-- end tab item -->
      <div class="">
        <nav aria-label="Page navigation">
          <ul class="pagination justify-content-center">
            <li class="page-item">
              <a class="page-link link-dark" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item"><a class="page-link link-dark" href="#">1</a></li>
            <li class="page-item"><a class="page-link link-dark" href="#">2</a></li>
            <li class="page-item"><a class="page-link link-dark" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link link-dark" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </section>
</article>


<!-- footer -->
<hr>
<jsp:include page="../common/footer.jsp" flush="false" />

</body>
</html>