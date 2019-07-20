<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// ��� /biz ���� ����  [http://localhost:8080/biz/ @@.do ��û �ϱ� ����]
	String contextPath = request.getContextPath();
	// theme ���� ���� ��� 
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
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="<%=KPath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<%=KPath%>/css/small-business.css" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b67384432e7b18e82f08ed86614a1558"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	 body {background-color: #e9e7e8;}
	 
	ul{
		list-style:none;
		padding-left:0px;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<!-- Page Content -->
<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;">
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
      	<li><strong>�����ȣ</strong> ${theaterVO.phone }</li><br>
      	<li><strong>�����ּ�</strong> ${theaterVO.adress }</li><br>
      	<li><strong>����Ұ�</strong> ${theaterVO.content }</li>
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
        <img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/theaterimg/${theaterVO.img1 }"
										alt="service thumb">
      </div>
    </div>
    <!-- /.col-md-4 -->
    <div class="col-md-4 mb-5">
      <div class="card h-100">
        <img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/theaterimg/${theaterVO.img2 }"
										alt="service thumb">
      </div>
    </div>
    <!-- /.col-md-4 -->
    <div class="col-md-4 mb-5">
      <div class="card h-100">
        <img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/theaterimg/${theaterVO.img3 }"
										alt="service thumb">
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
	
	// ��Ŀ�� ǥ�õ� ��ġ�Դϴ� 
	var markerPosition  = new daum.maps.LatLng("${theaterVO.location1 }", "${theaterVO.location2 }"); 

	// ��Ŀ�� �����մϴ�
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
	marker.setMap(map);
</script>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<!-- Bootstrap core JavaScript -->
<script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>