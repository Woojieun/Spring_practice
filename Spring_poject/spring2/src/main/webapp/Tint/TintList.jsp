<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전체상품</title>

      <!-- 부트 스트랩 연결 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 CSS만 붙여왔을 때는 드롭다운이 작동을 안함, 그래서 부트스르탭 번들 코드를 붙여넣으니까 작동함 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body style="background-color: rgb(255, 255, 255);">

  <!-- 네비게이션 바 -->
  <nav class="navbar navbar-expand-lg navbar-light bg-danger bg-opacity-25 navbar-fixed-top">
    <div class="container-fluid">

      <!-- 로고 사진 누르면 홈으로 돌아오기 -->
      <a class="navbar-brand" href="main_home.jsp">
        <img src="img/로고.png" width="200" height="70">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Home 버튼 -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="Main_Home.jsp">Home</a>
          </li>

          <!-- 화장품 드롭다운 -->
          <li class="nav-item dropdown">

            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">
              화장품
            </a>

            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="newPro.html">신제품</a></li>
              <hr class="dropdown-divider">

              <li><a class="dropdown-item" href="bestPro.html">인기상품</a></li>
              <hr class="dropdown-divider">

              <!-- <li><a class="dropdown-item" href="#">카테고리</a></li>
              <hr class="dropdown-divider"> -->

              <li><a class="dropdown-item" href="/cosmetic.nhn">전체보기</a></li>
            </ul>

          </li>

          <!-- 고객 서비스 드롭다운 -->
          <li class="nav-item dropdown">

            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">
              고객 서비스
            </a>

            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="/FAQ.nhn">FAQ</a></li>
                <hr class="dropdown-divider">

              <li><a class="dropdown-item" href="/announce.nhn">공지사항</a></li>
              <hr class="dropdown-divider">

              <li><a class="dropdown-item" href="ask.html">문의사항</a></li>
            </ul>

          </li>

        <!-- <a id="main_name" style="text-decoration-line: none; color:black" class="mx-4"></a>

        <a href="admin_login.html" style="color: white ;">
          <form class="d-flex" role="logout">
            <button id="logoutmenu" type="button" class="btn btn-light">로그아웃</button>
          </form>
        </a> -->

      </div>

      <!-- 오른쪽 상단에 내 정보 확인할 수 있는 오프캔버스 버튼 -->
      <button class="btn btn-primary btn-danger" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">=</button>

    </div>
  </nav>

  <!-- 오프 캔버스 버튼 누르면 나오는 작은 페이지 구성 -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasRightLabel">Offcanvas right</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    ...
  </div>
</div>
 <!-- ==================================== 여기까지 상단 네비게이션 바 내용이였음 ======================================== -->

 <nav class="navbar navbar-expand-lg bg-danger bg-opacity-50 justify-content-center" >
  <ul class="nav justify-content-center">

    <li class="nav-item">
      <a class="nav-link link-dark active" aria-current="page" href="/cosmetic.nhn">ALL</a>
    </li>

    <li class="nav-item dropdown">
      <a class="nav-link link-dark dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        EYE
      </a>
      <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="#">Eye Shadow</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="#">Eye Liner</a></li>
      </ul>
    </li>

    <li class="nav-item dropdown">
      <a class="nav-link link-dark dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        LIP
      </a>
      <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="/tint.nhn">Tint</a></li>
      </ul>
    </li>
  </ul>
</nav>


<div class="container w-75 mt-5 mx-auto">
			<hr>
			<ul class="list-group">
				<c:forEach var="tint" items="${cosmeticlist}" varStatus="status">
					<li class="list-group-item list-group-item-action d-flex justify-content-between align-items-center"><a href="tint.nhn?action=getTint&cosmetic_id=${tint.cosmetic_id}" class="text-decoration-none">[${status.count}] ${tint.cosmetic_name}</a>
					</li>
				</c:forEach> 
			</ul>
			<hr>
			<c:if test="${error != null}">
				<div class="alert alert-danger alert-dismissible fade show mt-3">
					에러 발생: ${error}
					<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				</div>
			</c:if>
		</div>
		
<!-- ==================================== 여기까지 상단 2번째 네비게이션 바 내용이였음 ======================================== -->
<br>
<br>

          <nav aria-label="Page navigation example" class="link-dark">
            <ul class="pagination justify-content-center">
              <li class="page-item">
                <a class="page-link link-dark" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                  </a>
              </li>
              <li class="page-item">
                <a class="page-link link-dark" href="#" aria-label="Previous">
                  <span aria-hidden="true">&lt;</span>
                  </a>
              </li>
              <li class="page-item"><a class="page-link link-dark" href="#">1</a></li>
              <li class="page-item"><a class="page-link link-dark" href="#">2</a></li>
              <li class="page-item"><a class="page-link link-dark" href="#">3</a></li>
              <li class="page-item"><a class="page-link link-dark" href="#">4</a></li>
              <li class="page-item"><a class="page-link link-dark" href="#">5</a></li>
              <li class="page-item">
                <a class="page-link link-dark" href="#" aria-label="Next">
                  <span aria-hidden="true">&gt;</span>
                </a>
              </li>
              <li class="page-item">
                <a class="page-link link-dark" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>

      </div>
      
         
      </div>
      </div>
    </div>
  </nav>

</body>
</html>