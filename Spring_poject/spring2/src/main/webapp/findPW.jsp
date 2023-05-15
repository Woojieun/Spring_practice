<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>비밀번호 찾기</title>

  <!-- 부트 스트랩 연결 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body style="background-color: rgb(255, 255, 255);">
  
  <!-- 비밀번호 찾기 참고 링크 
  https://blog.naver.com/PostView.naver?blogId=heartflow89&logNo=221114309890&parentCategoryNo=&categoryNo=139&viewDate=&isShowPopularPosts=true&from=search -->

   <!-- 비밀번호 찾기 폼 시작 -->
  <div class="container w-25 position-absolute top-50 start-50 translate-middle">
    <h1 style="text-align: center;">비밀번호 찾기</h1>

    <p></p>

    <div class="form-group">
      <label for="email">Id:</label>
      <input type="email" class="form-control" id="email">
      <br>
      <label for="email">Email address:</label>
      <input type="email" class="form-control" id="email">
      <br>
      <div style="text-align: center ;">
      <button type="button" class="btn btn-warning">비밀번호 확인</button>
      <button type="button" class="btn btn-warning join">로그인</button>
    </div>
    </div>

    <br><br>

    <!-- <div style="text-align: center ;">
    <label for="email">Id</label>
  </div> -->
  
<!-- 
    <br><br><br><br>

    <div style="text-align: center;">
      <button type="button" class="btn btn-warning join">로그인</button>
    </div> -->

  </div>
</body>
</html>