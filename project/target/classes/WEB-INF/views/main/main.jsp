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
<title>택택극장</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap core CSS -->
<%-- <link href="<%=KPath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
<!-- Custom styles for this template -->
<link href="<%=KPath%>/css/small-business.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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

a:link { color: white; text-decoration: none;}
a:visited { color: white; text-decoration: none;}
a:hover { color: white; text-decoration: none; font-weight: bold;}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}

.btn-primary {
	color: #fff;
	background-color: #e50914;
	border-color: #e50914
}

.btn-primary:hover {
	color: #fff;
	background-color: #f40612;
	border-color: #f40612
}

.btn-primary.focus, .btn-primary:focus {
	box-shadow: 0 0 0 .2rem rgba(38, 143, 255, .5)
}

.table td, .table th {
	padding: .75rem;
	vertical-align: top;
	border-top: 1px solid black
}

.table thead th {
	vertical-align: bottom;
	border-bottom: 2px solid black
}

.table tbody+tbody {
	border-top: 2px solid black
}

.table-sm td, .table-sm th {
	padding: .3rem
}

.table-bordered {
	border: 1px solid black
}

.table-bordered td, .table-bordered th {
	border: 1px solid black
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
				<img src="<%=KPath%>/movieimg/${movieList[0].img1}" alt="Chicago" width="1100" height="500" style="height: ;">
				<div class="carousel-caption">
					<h3>${movieList[0].title}</h3>
					<h3>Star Wars: The Force Awakens</h3>
				</div> 
				</div> 
				<div class="carousel-item" OnClick="location.href ='/movie/readMovie?m_id=${movieList[1].m_id}'" style="cursor:pointer;">
				<img src="<%=KPath%>/movieimg/${movieList[1].img1}" alt="Chicago" width="1100" height="500" style="height: ;">
				<div class="carousel-caption">
					<h3>${movieList[1].title}</h3>
					<h3>Spider-Man</h3>
				</div> 
				</div> 
				<div class="carousel-item" OnClick="location.href ='/movie/readMovie?m_id=${movieList[2].m_id}'" style="cursor:pointer;">
				<img src="<%=KPath%>/movieimg/${movieList[2].img1}" alt="Chicago" width="1100" height="500" style="height: ;">
				<div class="carousel-caption">
					<h3>${movieList[2].title}</h3>
					<h3>The Hateful Eight</h3>
				</div> 
				</div> 
		</div>
	</div>
	<div>
	  <a class="carousel-control-prev" href="#demo" data-slide="prev" style="height: ;">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo" data-slide="next" style="height: ;">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	</div>
	
    <!-- Heading Row -->
    <div class="container-fluid">
    <div class="row align-items-center my-5">
      <div class="col-lg-7">
      	<div class="embed-responsive embed-responsive-16by9">
      	<iframe width="560" height="315" src="https://www.youtube.com/embed/JcpWXaA2qeg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<!--       	<iframe width="560" height="315" src="https://www.youtube.com/embed/_EAxUq_Ilf8?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
      	<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/5zxofCzttfU?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
      	<!-- <iframe src="https://www.youtube.com/embed/G7VijpXyAXI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
      	<<!-- iframe src="https://www.youtube.com/embed/nMN4JZ8crVY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
<!--       	<iframe src="https://www.youtube.com/embed/2iUhSngOGoo?rel=0&autoplay=1&loop=3&showinfo=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
      	</div>
      </div>
      <!-- /.col-lg-8 -->
      <div class="col-lg-5" style="color: white;">
        <h2 class="font-weight-heavy">"버즈! 너 정말 하늘을 날고 있어"</h2>
        <h2 class="font-weight-heavy">"이건 나는게 아니야, 폼나게 떨어지는 거지!"</h2><br><br>
        <h3 class="font-weight-heavy">&#60;토이스토리3&#62; 픽사가 전하는 인생의 위로</h3><br><br>
        <p>어린이들에게는 무한한 상상력을, 어른들에게는 옛 추억을 선사하고, 관계맺음의 의미를 돌이켜 보게하는 픽사의 명작 시리즈</p><br>
        <h4>지금 여기서 관람하실 수 있습니다.</h4><br><br><br>
        <a class="btn btn-primary" href="/movie/readMovie?m_id=6">상세보기</a>
        <a class="btn btn-primary" href="/ticket/ticketByMovie?m_id=6">예매하기</a>
      </div>
      <!-- /.col-md-4 -->
    </div>
    <!-- /.row -->
    </div>
	

<div class="container-fluid" style="padding-right: 95px; padding-left: 80px;">
  <div class="row">
    <div class="col-lg-6" style="height: 400px;">
    <table class="table table-hover" style="background-color: black; color:#999;">
    	<thead style="color:white;">
    		<tr>
    			<th style="border-bottom: 5px solid #e50914;">
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
    <div class="col-lg-3 text-center">
    <a href="/main/profile">
	<img src="<%=KPath%>/img/프로필2.jpg" 
    alt="Chicago" style="height: 80%" width="80%"></a>
    </div>
    <div class="col-lg-3">
    <!-- <table style="background-color: black; width:100%; height:100%; color: black" >
    	<tbody> -->
    		<%-- <c:forEach var="theaterOne" items="${theaterList}">
	    		<a href="/theater/theaterOne?t_id=${theaterOne.t_id}">
							<img src="<%=KPath%>/theaterimg/${theaterOne.img1}" 
						    alt="Chicago" width="80%" height="30%" style="height: 135px;">
						    </a>
			</c:forEach> --%>
			
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <a href="/theater/theaterOne?t_id=1">
							<img src="<%=KPath%>/theaterimg/아트하우스대표.jpg" 
						    alt="Chicago" width="80%" height="100%" style="height: 400px;">
						    </a>
				    </div>
				    <div class="carousel-item">
				      <a href="/theater/theaterOne?t_id=2">
							<img src="<%=KPath%>/theaterimg/피카다리대표.jpg" 
						    alt="Chicago" width="80%" height="100%" style="height: 400px;">
						    </a>
				    </div>
				    <div class="carousel-item">
				      <a href="/theater/theaterOne?t_id=3">
							<img src="<%=KPath%>/theaterimg/모모대표.jpg" 
						    alt="Chicago" width="80%" height="100%" style="height: 400px;">
						    </a>
				    </div>
				  </div>
			  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>

    		<%-- <c:forEach var="theaterOne" items="${theaterList}">
				<tr>
					<td rowspan="2" width="60%" height="20%" >
						<a href="/theater/theaterOne?t_id=${theaterOne.t_id}">
						<img src="<%=KPath%>/theaterimg/${theaterOne.img1}" 
					    alt="Chicago" width="80%" height="30%" style="height: 135px;">
					    </a>
				    </td>
					<td colspan="2" style="font-size: medium;">
						<a href="/theater/theaterOne?t_id=${theaterOne.t_id}">
						</a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					</td>
				</tr>
    		</c:forEach> --%>
    	<!-- </tbody>
    </table> -->
    </div>
  </div>
</div>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<!-- Bootstrap core JavaScript -->
<script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>