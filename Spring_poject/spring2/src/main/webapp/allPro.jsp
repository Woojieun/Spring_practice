<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/allPro.css">

<title>전체상품</title>

<!-- 부트 스트랩 연결 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- 부트스트랩 CSS만 붙여왔을 때는 드롭다운이 작동을 안함, 그래서 부트스르탭 번들 코드를 붙여넣으니까 작동함 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body style="background-color: rgb(255, 255, 255);">

	<!-- 네비게이션 바 -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-danger bg-opacity-25 navbar-fixed-top">
		<div class="container-fluid">

			<!-- 로고 사진 누르면 홈으로 돌아오기 -->
			<a class="navbar-brand" href="main_home.jsp"> <img
				src="img/로고.png" width="200" height="70">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Home 버튼 -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="Main_Home.jsp">Home</a></li>

					<!-- 화장품 드롭다운 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							화장품 </a>

						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="newPro.html">신제품</a></li>
							<hr class="dropdown-divider">

							<li><a class="dropdown-item" href="bestPro.html">인기상품</a></li>
							<hr class="dropdown-divider">

							<!-- <li><a class="dropdown-item" href="#">카테고리</a></li>
              <hr class="dropdown-divider"> -->

							<li><a class="dropdown-item" href="cosmetic.nhn">전체보기</a></li>
						</ul></li>

					<!-- 고객 서비스 드롭다운 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							고객 서비스 </a>

						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="FAQ.nhn">FAQ</a></li>
							<hr class="dropdown-divider">

							<li><a class="dropdown-item" href="announce.nhn">공지사항</a></li>
							<hr class="dropdown-divider">

							<li><a class="dropdown-item" href="ask.html">문의사항</a></li>
						</ul></li>

					<!-- <a id="main_name" style="text-decoration-line: none; color:black" class="mx-4"></a>

        <a href="admin_login.html" style="color: white ;">
          <form class="d-flex" role="logout">
            <button id="logoutmenu" type="button" class="btn btn-light">로그아웃</button>
          </form>
        </a> -->
			</div>

			<!-- 오른쪽 상단에 내 정보 확인할 수 있는 오프캔버스 버튼 -->
			<button class="btn btn-primary btn-danger" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
				aria-controls="offcanvasRight">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
        <path fill-rule="evenodd"
						d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
      </svg>
			</button>

		</div>
	</nav>

	<!-- 오프 캔버스 버튼 누르면 나오는 작은 페이지 구성 -->
	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
		aria-labelledby="offcanvasRightLabel">
		<div class="offcanvas-header"
			style="background-color: rgb(247, 157, 157);">
			<h5 class="offcanvas-title" id="offcanvasRightLabel">My Page</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<svg xmlns="http://www.w3.org/2000/svg" width="70" height="70"
				fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
      <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
      <path fill-rule="evenodd"
					d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
    </svg>
			<a value="${sessionId}" name = "sessionId">${sessionId}님</a> <a href="myData.html" style="color: black;">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
					fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
      <path
						d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z" />
      <path
						d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z" />
    </svg>
			</a>
			<hr>
			<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
				fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
      <path fill-rule="evenodd"
					d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
    </svg>
			<a href="myBookmark.html"
				style="text-decoration-line: none; color: black;"> <label>찜
					목록</label>
			</a>
			<hr>
			<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
				fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
      <path
					d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
    </svg>
			<a href="mybasket.html"
				style="text-decoration-line: none; color: black;"> <label>장바구니</label>
			</a>
			<hr>
			<div class="justify-content-md-end">
				<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
					fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16">
      <path
						d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z" />
      <path
						d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z" />
    </svg>
				<a href="myHistory.html"
					style="text-decoration-line: none; color: black;"> <label>구매내역</label>
				</a>
			</div>
			<hr>
			<form class="d-flex position-absolute bottom-0 end-0 mb-4 me-4"
				role="logout">
				<button id="logout" type="button" class="btn btn-light bg-danger"
					style="color: white;">로그아웃</button>
			</form>
		</div>
	</div>
	<!-- ==================================== 여기까지 상단 네비게이션 바 내용이였음 ======================================== -->

	<nav
		class="navbar navbar-expand-lg bg-danger bg-opacity-50 justify-content-center">
		<ul class="nav justify-content-center">

			<li class="nav-item"><a class="nav-link link-dark active"
				aria-current="page" href="#">ALL</a></li>

			<li class="nav-item dropdown"><a
				class="nav-link link-dark dropdown-toggle" href="#" role="button"
				data-bs-toggle="dropdown" aria-expanded="false"> EYE </a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/shadow.nhn">Eye Shadow</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="/eye_liner.nhn">Eye
							Liner</a></li>
				</ul></li>

			<li class="nav-item dropdown"><a
				class="nav-link link-dark dropdown-toggle" href="#" role="button"
				data-bs-toggle="dropdown" aria-expanded="false"> LIP </a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/tint.nhn">Tint</a></li>
				</ul></li>
		</ul>
	</nav>


	<div class="container mt-5 mx-auto " id="cosmetic_allPro">
		<h2>전체 상품</h2>
		<hr>

		<!-- 세로 한줄 출력 -->
		<%--
<ul class="list-group">
				<c:forEach var="cosmetic" items="${cosmeticlist}" varStatus="status">
					<li class="list-group-item list-group-item-action d-flex align-items-center">
					<img src="${cosmetic.cosmetic_img}" alt="" class="card-img" id="cosmetic_img"/>
					<div id="cosmetic_list_content">
					<a href="cosmetic.nhn?action=getCosmetic&cosmetic_id=${cosmetic.cosmetic_id}" class="text-decoration-none" id="cosmetic_list_name">${cosmetic.cosmetic_name}</a>
					<a class="text-decoration-none" id="cosmetic_list_price"><br>${cosmetic.cosmetic_price}원</a>
					</div>
					</li>
				</c:forEach> 
			</ul> 
			--%>


		<!-- row 4 -->
		<div class="row">
			<c:forEach var="cosmetic" items="${cosmeticlist}" varStatus="status">
				<div class="list-group align-items-center col-3">
					<img src="${cosmetic.cosmetic_img}" alt="" class="card-img"
						id="cosmetic_img" />

					<div id="cosmetic_list_content">

							<a
								href="cosmetic.nhn?action=getCosmetic&cosmetic_id=${cosmetic.cosmetic_id}"
								class="text-decoration-none" id="cosmetic_list_name" value="${cosmetic.cosmetic_id}" name = "cosmetic_id">${cosmetic.cosmetic_name}</a>

							<a id="cosmetic_list_price">${cosmetic.cosmetic_price}<a id="cosmetic_list_price_won">원</a></a>
							

					</div>
				</div>


			</c:forEach>
			<hr>
			<c:if test="${error != null}">
				<div class="alert alert-danger alert-dismissible fade show mt-3">
					에러 발생: ${error}
					<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				</div>
			</c:if>
		</div>

		<!-- ==================================== 여기까지 상단 2번째 네비게이션 바 내용이였음 ======================================== -->
		<br> <br>

		<nav aria-label="Page navigation example" class="link-dark">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link link-dark" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item"><a class="page-link link-dark" href="#"
					aria-label="Previous"> <span aria-hidden="true">&lt;</span>
				</a></li>
				<li class="page-item"><a class="page-link link-dark" href="#">1</a></li>
				<li class="page-item"><a class="page-link link-dark" href="#">2</a></li>
				<li class="page-item"><a class="page-link link-dark" href="#">3</a></li>
				<li class="page-item"><a class="page-link link-dark" href="#">4</a></li>
				<li class="page-item"><a class="page-link link-dark" href="#">5</a></li>
				<li class="page-item"><a class="page-link link-dark" href="#"
					aria-label="Next"> <span aria-hidden="true">&gt;</span>
				</a></li>
				<li class="page-item"><a class="page-link link-dark" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>

	</div>


	</div>
	</div>
	</div>
	</nav>

</body>
</html>