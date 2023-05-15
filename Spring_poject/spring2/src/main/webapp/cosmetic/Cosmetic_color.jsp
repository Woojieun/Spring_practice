<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<title>JOIN</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<link rel="shortcut icon" href="#">
</head>
<body>
		<div class="container w-75 mt-5 mx-auto">
			<h2>화장품 목록</h2>
<select class="form-select" aria-label="Default select example">
  <option selected>상품을 선택해주세요.</option>	
  <option value="${getCosmetic_color.cosmetic_color_name}">${getCosmetic_color.cosmetic_color_name}</option>
<c:forEach var="getCosmetic_color" items="${cosmeticlist_color}" varStatus="status">
<option value="${status.cosmetic_color_name}" >${getCosmetic_color.cosmetic_color_name}</option>
</c:forEach> 
</select>


<select class="form-select" aria-label="Default select example">
  <option selected>상품을 선택해주세요.</option>	

<option value="${getCosmetic.cosmetic_color_name}">${getCosmetic.cosmetic_color_name}</option>

</select>
		</div>
</body>
</html>