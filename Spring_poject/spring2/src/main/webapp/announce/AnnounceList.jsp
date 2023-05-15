    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>

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
            <a class="nav-link active" aria-current="page" href="mainHome_login.jsp">Home</a>
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



      </div>

      <!-- 오른쪽 상단에 내 정보 확인할 수 있는 오프캔버스 버튼 -->
      <button class="btn btn-primary btn-danger" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
      </svg></button>
    </div>
  </nav>

<!-- 오프 캔버스 버튼 누르면 나오는 작은 페이지 구성 -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header" style="background-color:rgb(247, 157, 157) ;">
    <h5 class="offcanvas-title" id="offcanvasRightLabel">My Page</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
      <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
      <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
    </svg>
    <label>ㅇㅇㅇ님</label>
    <a href="myData.html" style="color: black;">
    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
      <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z"/>
      <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"/>
    </svg>
  </a>
    <hr>
    <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
      <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
    </svg>
    <a href="myBookmark.html" style="text-decoration-line: none; color: black;">
    <label>찜 목록</label>
    </a>
    <hr>
    <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
      <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
    </svg>
    <a href="mybasket.html" style="text-decoration-line: none; color: black;">
    <label>장바구니</label>
  </a>
    <hr>
    <div class="justify-content-md-end">
    <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16">
      <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"/>
      <path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"/>
    </svg>
    <a href="myHistory.html" style="text-decoration-line: none; color: black;">
    <label>구매내역</label>
    </a>
    </div>
    <hr>
          <form class="d-flex position-absolute bottom-0 end-0 mb-4 me-4" role="logout">
            <button id="logout" type="button" class="btn btn-light bg-danger" style="color: white ;">로그아웃</button>
          </form>
  </div>
</div>
 <!-- ==================================== 여기까지 네비게이션 바 내용이였음 ======================================== -->

    <br>
    <br>

        <!-- 상단바 아래의 컨텐츠 부분 -->
        <div class="container">
          <!-- <hr class="myHr">  -->
          <div class="row">
              <div class="col-7">
                  <h2>공지사항</h2>
                </div>
          </div>
          <hr>
        
         
          <div class="row">
              <div class="col">
                  <table class="table table-hover mytb" id="announceTable">
                          <tbody>
                            <tr>
                              <!-- <td>1</td>
                              <td>긴급!! 꼭 봐주세요</td>
                              <td></td>
                              <td></td>
                              <td>우지은</td>
                              <td>jieun987</td>
                              <td>관리자</td>
                            </tr> -->
                          </tbody>
                          
                        </table>
              </div>
          </div>
          
      		<div class="container w-100 mx-auto">

			<ul class="list-group">
				<c:forEach var="announce" items="${announcelist}" varStatus="status">
					<li class="list-group-item list-group-item-action d-flex justify-content-between align-items-center"><a href="announce.nhn?action=getAnnounce&announce_id=${announce.announce_id}" class="text-decoration-none">[${status.count}] ${announce.announce_title}</a>
					</li>
				</c:forEach> 
			</ul>

			<c:if test="${error != null}">
				<div class="alert alert-danger alert-dismissible fade show mt-3">
					에러 발생: ${error}
					<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				</div>
			</c:if>
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