<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap core CSS -->
<link href="<%=KPath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
 body {background-color: black;}
 .carousel-inner img {
    width: 100%;
    height: 850px;
  }
  
nav {
	background-color: black;
	}


.container-fluid {
  padding-right: 80px;
  padding-left: 80px;
  margin-right: auto;
  margin-left: auto;
}

table {
}

a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: none; font-weight: bold;}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
.dropdown-menu {background-color: black}
.dropdown .dropdown-menu a{color: rgba(255,255,255,.5); text-decoration: none;}
.dropdown .btn:hover {background: cyan; color:#000;}
.dropdown .btn:active {background: cyan; color:#000;}
.dropdown .btn:focus {background: cyan; color:#000;}
.dropdown-menu .dropdown-item {display: inline-block; width: 100%; padding: 10px 5px;}
.container .dropdown .dropdown-menu a:hover
{
  color: #fff;
  background-color: #2d2c2c;
  border-color: #fff;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<!-- Page Content -->
   		
	<div id="demo" class="carousel slide" data-ride="carousel">
		<ul class="carousel-indicators">
		  <li data-target="#demo" data-slide-to="0" class="active"></li>
		  <li data-target="#demo" data-slide-to="1"></li>
		  <li data-target="#demo" data-slide-to="2"></li>
		</ul>
		<div class="carousel-inner">
				<div class="carousel-item active" OnClick="location.href ='/movie/readMovie?m_id=${movieList[0].m_id}'" style="cursor:pointer;">
				<img src="<%=KPath%>/movieimg/${movieList[0].img1}" alt="Chicago" width="1100" height="500">
				<div class="carousel-caption">
					<h3>${movieList[0].title}</h3>
				</div> 
				</div> 
				<div class="carousel-item" OnClick="location.href ='/movie/readMovie?m_id=${movieList[1].m_id}'" style="cursor:pointer;">
				<img src="<%=KPath%>/movieimg/${movieList[1].img1}" alt="Chicago" width="1100" height="500">
				<div class="carousel-caption">
					<h3>${movieList[1].title}</h3>
				</div> 
				</div> 
				<div class="carousel-item" OnClick="location.href ='/movie/readMovie?m_id=${movieList[2].m_id}'" style="cursor:pointer;">
				<img src="<%=KPath%>/movieimg/${movieList[2].img1}" alt="Chicago" width="1100" height="500">
				<div class="carousel-caption" style="height: 20%;">
					<h3>${movieList[2].title}</h3>
				</div> 
				</div> 
		</div>
	</div>
	  <a class="carousel-control-prev" href="#demo" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	</div>
	
    <!-- Heading Row -->
    <div class="container-fluid">
    <div class="row align-items-center my-5">
      <div class="col-lg-7">
      	<div class="embed-responsive embed-responsive-16by9">
      	<iframe src="https://www.youtube.com/embed/2iUhSngOGoo?rel=0&autoplay=1&loop=3&showinfo=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
      	</div>
      </div>
      <!-- /.col-lg-8 -->
      <div class="col-lg-5" style="color: white;">
        <h1 class="font-weight-heavy">이번 여름을 상쾌하게 해줄 영화!</h1>
        <p>기쿠지로의여름 기쿠지로의여름 기쿠지로의여름 기쿠지로의여름 기쿠지로의여름 기쿠지로의여름 기쿠지로의여름 기쿠지로의여름 기쿠지로의여름 기쿠지로의여름 기쿠지로의여름 기쿠지로의여름 기쿠지로의여름 기쿠지로의여름</p>
        <a class="btn btn-primary" href="/movie/readMovie?m_id=1">상세보기</a>
        <a class="btn btn-primary" href="/ticket/ticketByMovie?m_id=1">예매하기</a>
      </div>
      <!-- /.col-md-4 -->
    </div>
    <!-- /.row -->
    </div>
	

<div class="container-fluid" style="padding-right: 95px; padding-left: 80px;">
  <div class="row">
    <div class="col-lg-6" style="height: 400px;">
    <table class="table table-hover table-bordered" style="background-color: white;">
    	<thead>
    		<tr>
    			<th>
    				공지사항
    			</th>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="boardOne" items="${boardList}">
    		<tr>
    			<td>
    				<a href='/sboard/readPage?page=1&perPageNum=10&searchType&keyword=&b_id=${boardOne.b_id}'>
					${boardOne.title} </a>
					
				</td>
    		</tr>
    		</c:forEach>
    	</tbody>
    </table>
    </div>
    <div class="col-lg-3">
    <a href="#" target="_blank">
	<img src="<%=KPath%>/movieimg/조제, 호랑이 그리고 물고기들_스틸컷1.jpg" 
    alt="Chicago" style="height: 60%" width="100%"></a>
    </div>
    <div class="col-lg-3">
    <table style="background-color: white; width:100%; height:100%; color: black" >
    	<thead>
    		<tr>
    			<th colspan="2" class="font-weight-heavy" style="font-size:25px;" col>
    			</th>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="theaterOne" items="${theaterList}">
				<tr>
					<td rowspan="2" width="60%" height="20%" >
						<a href="#" target="_blank">
						<img src="<%=KPath%>/theaterimg/${theaterOne.img1}" 
					    alt="Chicago" width="80%" height="30%" style="padding-bottom: 8%;padding-left: 8%;padding-top: 8%;">
					    </a>
				    </td>
					<td colspan="2" style="font-size: medium;">
						<a href="#" target="_blank">
							${theaterOne.name}
							<br>
							${theaterOne.adress}
							<br>
							${theaterOne.phone}
						</a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					</td>
				</tr>
    		</c:forEach>
    	</tbody>
    </table>
    </div>
  </div>
</div>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<!-- Bootstrap core JavaScript -->
<script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>