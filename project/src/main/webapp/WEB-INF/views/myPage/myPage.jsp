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
<title>마이페이지 - 택택극장</title>
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

#bigDiv {
box-shadow: 0 0 5px rgba(0,0,0,.2);
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<script>
	function seat(row_num) {
		console.log(row_num)
		$.ajax({
			url: 'seat',
			data: {"row_num": row_num},
			dataType:'json',
			type: 'POST',
			success: function(data){
				var str = "";
				var i = 0;
				$.each(data, function(member){
					i++;
					console.log(data);
					console.log("this.seat_row " + this.seat_row);
					console.log("this.seat_col " + this.seat_col);
					this.seat_row;
					this.seat_col;
					
					str += this.seat_row + "/" + this.seat_col + " "
				});
				$("#"+row_num).html(str)
				var totprice = i*300;
				$("#totPrice"+row_num).html(totprice)
			}
		})
	}
	
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
	
	function deleteRes(row_num,r_date,time){
		console.log("row_num " + row_num);
		var arr = row_num.split(",");
		r_date=arr[1];
		time = arr[2];
		
	 	var today = new Date();
	 	var dd = today.getDate();
	 	var mm = today.getMonth()+1;
	 	var yyyy = today.getFullYear();

	 	if(dd<10) {
 	 	    dd='0'+dd
	 	} 

	 	if(mm<10) {
	 	    mm='0'+mm
	 	} 

	 	today = yyyy+mm+dd;
		
		var d = new Date();
		var now = d.getHours();
		
		today =  parseInt(today);
		r_date = parseInt(r_date);
		time = parseInt(time);
		now = parseInt(now);
		
		console.log("time,now" + time + "," +now)
		console.log("r_date,today" + r_date + "," +today)
		
		if(r_date <= today && time <= now) {
			alert("취소 하실 수 없습니다.")
			return;
		}
		
		var row_num = row_num;
		
		var ok = confirm("취소하시겠습니까?")
		if(ok == true){
			self.location = "deleteRes?row_num=" + arr[0];
		}
	}
</script>
<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;" id="bigDiv">
<table class="table" style="text-align: center; border: 1px solid #303030; margin: 30px auto 30px;">
	<thead>
		<tr>
			<th style="background-color: ; text-align: center;">번호</th>
			<th style="background-color: ; text-align: center;">제목</th>
			<th style="background-color: ; text-align: center;">극장</th>
			<th style="background-color: ; text-align: center;">상영관</th>
			<th style="background-color: ; text-align: center;">일자</th>
			<th style="background-color: ; text-align: center;">시간</th>
			<th style="background-color: ; text-align: center;">좌석</th>
			<th style="background-color: ; text-align: center;">가격</th>
			<th style="background-color: ; text-align: center;">예매취소</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${reservationList.size() == 0}">
		<tr>
			<td style="text-align: center;" colspan="9">예매내역이 없습니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${reservationList.size() != 0}">
 		
 		<c:forEach var="i" begin="0" end="${reservationList.size()-1 }" step="1"> 
		<tr>
			<%-- <td style="text-align: center"><img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/movieimg/${movieVO.poster }" style="width: 70px;height: 110px;"></td> --%>
			<td style="text-align: center">${reservationList[i].row_num}</td>
			<td style="text-align: center"><a href="/movie/readMovie?m_id=${movieList[i].m_id}">${movieList[i].title}</a></td>
			<td style="text-align: center">${theaterList[i].name}</td>
			<td style="text-align: center">${screenList[i].scr_name}</td>			
			<td style="text-align: center">${reservationList[i].r_date}</td>
			<td style="text-align: center">${scheduleList[i].time} 시</td>
			<td style="text-align: center">
					<span id="${reservationList[i].row_num}"></span>
				<script>
					seat("${reservationList[i].row_num}");
				</script>
			</td>
			<td style="text-align: center" id="totPrice">
				&#8361;<span id="totPrice${reservationList[i].row_num}"></span>
			</td>
			<td style="text-align: center"><input type="button" value="예매취소" onclick="deleteRes('${reservationList[i].row_num}' + ',' + '${reservationList[i].r_date}' + ',' + ${scheduleList[i].time})" class="btn btn-primary" style="color: white; height: 58px; display: inline-block;"></td>
		</tr>
 		</c:forEach>
 	</c:if>
 	</tbody>
</table>
</div>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<!-- Bootstrap core JavaScript -->
<script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>