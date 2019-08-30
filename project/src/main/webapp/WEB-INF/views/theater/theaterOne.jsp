<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources";
	
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	
	String name = "";
	if(principal != null) {
		name = auth.getName();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${theaterVO.name } - 택택극장</title>
<!-- Bootstrap core CSS -->
<%-- <link href="<%=KPath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
<!-- Custom styles for this template -->
<link href="<%=KPath%>/css/small-business.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b67384432e7b18e82f08ed86614a1558"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
body {background-color: #e9e7e8;}
 
ul{
	list-style:none;
	padding-left:0px;
}

#bigDiv {
box-shadow: 0 0 5px rgba(0,0,0,.2);
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<!-- Page Content -->
<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;" id="bigDiv">
  <!-- Heading Row -->
  <div class="row">
    <div class="col-lg-5" style="height: 140%">
      <img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/theaterimg/${theaterVO.img1 }"
										alt="service thumb" style="height:536px">
    </div>
    <!-- /.col-lg-8 -->
    <div class="col-lg-6">
      <h1 style="font-weight: 700;">${theaterVO.name }</h1>
      <ul>
      	<li><strong>극장번호</strong> ${theaterVO.phone }</li>
      	<li><strong>극장주소</strong> ${theaterVO.adress }</li>
      	<li><strong>극장소개</strong> ${theaterVO.content }</li>
      </ul>
      <div id="map" style="height:320px"></div>
    </div>
    <!-- /.col-md-4 -->
  </div>
  <!-- /.row -->


  <!-- Content Row -->
  <div class="row my-5">
    <div class="col-md-4 mb-5">
      <div class="card h-100">
        <img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/theaterimg/${theaterVO.img2 }"
										alt="service thumb" style="height: 261px;">
      </div>
    </div>
    <!-- /.col-md-4 -->
    <div class="col-md-4 mb-5">
      <div class="card h-100">
        <img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/theaterimg/${theaterVO.img3 }"
										alt="service thumb" style="height: 261px;">
      </div>
    </div>
    <!-- /.col-md-4 -->
    <div class="col-md-4 mb-5">
      <div class="card h-100">
        <img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/theaterimg/${theaterVO.img4 }"
										alt="service thumb" style="height: 261px;">
      </div>
    </div>
    <!-- /.col-md-4 -->

  </div>
  <!-- /.row -->

<!-- /.container -->
</div>
<script>
	var container = document.getElementById('map');
	var options = {
		center: new daum.maps.LatLng("${theaterVO.location1 }", "${theaterVO.location2 }"),
		level: 3
	};

	var map = new daum.maps.Map(container, options);
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new daum.maps.LatLng("${theaterVO.location1 }", "${theaterVO.location2 }"); 

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
</script>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<!-- Bootstrap core JavaScript -->
<script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>