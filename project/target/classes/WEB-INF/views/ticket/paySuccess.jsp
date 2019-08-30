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
<title>영화예매 - 택택극장</title>
<!-- Bootstrap core CSS -->
<%-- <link href="<%=KPath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
<!-- Custom styles for this template -->
<link href="<%=KPath%>/css/small-business.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	body {background-color: #e9e7e8;}	
	a:link { color: black; text-decoration: none;}	
	a:visited { color: black; text-decoration: none;}
	a:hover { color: black; text-decoration: none; font-weight: bold;}
	
	ul{
   list-style:none;
   padding-left:0px;
   }

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;  height: 745px;">
<table class="table" style="text-align: center; border: 1px solid #303030; margin: 30px auto 30px;">
	<thead>
		<tr>
			<th style="background-color: ; text-align: center;">사진</th>
			<th style="background-color: ; text-align: center;">제목</th>
			<th style="background-color: ; text-align: center;">극장</th>
			<th style="background-color: ; text-align: center;">상영관</th>
			<th style="background-color: ; text-align: center;">일자</th>
			<th style="background-color: ; text-align: center;">시간</th>
			<th style="background-color: ; text-align: center;">좌석</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td style="text-align: center"><img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/movieimg/${movieVO.poster }" style=""></td>
			<td style="text-align: center">${movieVO.title}</td>
			<td style="text-align: center">${theaterVO.name}</td>
			<td style="text-align: center">${screenVO.scr_name}</td>			
			<td style="text-align: center">${reservationList[0].r_date}</td>
			<td style="text-align: center">${scheduleVO.time}</td>
			<td style="text-align: center">
				<c:forEach var="i" begin="0" end="${reservationList.size()-1 }" step="1">
					${reservationList[i].seat_row}/${reservationList[i].seat_col}
				</c:forEach> 
			</td>
		</tr>
 	</tbody>
</table>
</div>
<script>
	var d = new Date();
	var year = d.getFullYear();
	var month = d.getMonth()+ 1;
	var date = d.getDate();
	var hours = d.getHours();
	if(hours>12) {
		hours-=12;
	}
	if(month<10) {
		month = "0"+month;
	}
	if(date<10) {
		date = "0"+date;
	}
	var fullDate = year + "-" + month + "-" + date
	console.log(year);
	console.log(month);
	console.log(date);
	console.log(hours);
	console.log(fullDate);
	
	function deleteRes(r_id,r_date,r_time){
//	 	var today = new Date();
//	 	var dd = today.getDate();
//	 	var mm = today.getMonth()+1; //January is 0!
//	 	var yyyy = today.getFullYear();

//	 	if(dd<10) {
//	 	    dd='0'+dd
//	 	} 

//	 	if(mm<10) {
//	 	    mm='0'+mm
//	 	} 

//	 	today = mm+'/'+dd+'/'+yyyy;
//	 	document.write(today);
		
		console.log(r_id)
		console.log(r_date)
		console.log(r_time)
		
		var r_id = r_id;
		var r_date = r_date;
		var r_time = r_time;
		
		r_date = r_date.substring(0,10);
		
		console.log(r_id)
		console.log(r_date)
		console.log(r_time)
		
		if(r_date == fullDate && r_time <= hours)  {
			alert("취소불가!");
		}
		

		var ok = confirm("취소하시겠습니까?")
		if(ok == true){
			location.href = "deleteRes.do?r_id=" + r_id;
		}
	}
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<!-- Bootstrap core JavaScript -->
</script>
<script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>