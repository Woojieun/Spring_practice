<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>

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
      <a class="navbar-brand" href="main_home.html">
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
            <a class="nav-link active" aria-current="page" href="main_home.html">Home</a>
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

              <li><a class="dropdown-item" href="allPro.html">전체보기</a></li>
            </ul>

          </li>

          <!-- 고객 서비스 드롭다운 -->
          <li class="nav-item dropdown">

            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">
              고객 서비스
            </a>

            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="faq.jsp">FAQ</a></li>
                <hr class="dropdown-divider">

              <li><a class="dropdown-item" href="announce.jsp">공지사항</a></li>
              <hr class="dropdown-divider">

              <li><a class="dropdown-item" href="ask.jsp">문의사항</a></li>
            </ul>

          </li>

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
 <!-- ==================================== 여기까지 네비게이션 바 내용이였음 ======================================== -->

    <br>
    <br>

        <!-- 상단바 아래의 컨텐츠 부분 -->
        <div class="container">
          <!-- <hr class="myHr">  -->

		<div class="container w-110 mt-5 mx-auto">
			<h2>${announce.announce_title}</h2>
			<hr>
			<div class="card w-40 mx-auto">
					<h4 class="card-title">${announce.announce_content}</h4>
			</div>
			<hr>
			<a href="javascript:history.back()" class="btn btn-primary"><< Back</a>
		</div>
      </div>
      </div>
      </div>
    </div>
  </nav>

  <!-- <script type="module">
    // Import the functions you need from the SDKs you need
    import { initializeApp } from "https://www.gstatic.com/firebasejs/9.14.0/firebase-app.js";
    import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.14.0/firebase-analytics.js";
    // TODO: Add SDKs for Firebase products that you want to use
    // https://firebase.google.com/docs/web/setup#available-libraries
  
    // Your web app's Firebase configuration
    // For Firebase JS SDK v7.20.0 and later, measurementId is optional
    const firebaseConfig = {
      apiKey: "AIzaSyD5Siv5pV8pGTXpgd8OAMdQd8JTp390u5w",
      authDomain: "newrepbook-587cf.firebaseapp.com",
      databaseURL: "https://newrepbook-587cf-default-rtdb.firebaseio.com",
      projectId: "newrepbook-587cf",
      storageBucket: "newrepbook-587cf.appspot.com",
      messagingSenderId: "986136626008",
      appId: "1:986136626008:web:bdd8f7beeceae8f66c5b2d",
      measurementId: "G-C25WXHVHZE"
    };
  
    // Initialize Firebase
    const app = initializeApp(firebaseConfig);
    const analytics = getAnalytics(app);

    import {getDatabase, ref, set, update, remove, onValue}
    from "https://www.gstatic.com/firebasejs/9.14.0/firebase-database.js";


    //$('#adminListDbTable td').remove();
    //console.log("test")
    var rowNum = 0;

    const db = getDatabase(app);
    const dbref = ref(db, 'announce');

    onValue(dbref, (snapshot) => {
      snapshot.forEach((childSnapshot) => {
        const childKey = childSnapshot.key;
        const childData = childSnapshot.val();

        rowNum += 1;
        var row =
        "<tr><td>" + rowNum +
          "</td><td>" + childData.title +
            // "</td><td>" + childData.comment +
              "</td><td>" + "관리자" +
              "</td></tr>"
              console.log(row);

        $(row).appendTo('#announceTable')

      });
    }, {
      onlyOnce: true
    });


  </script> -->

</body>
</html>