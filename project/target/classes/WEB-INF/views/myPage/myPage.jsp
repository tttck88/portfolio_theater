<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table" style="text-align: center; border: 1px solid #303030; margin: 30px auto 30px;">
	<thead>
		<tr>
			<th style="background-color: #303030; text-align: center;">사진</th>
			<th style="background-color: #303030; text-align: center;">제목</th>
			<th style="background-color: #303030; text-align: center;">극장</th>
			<th style="background-color: #303030; text-align: center;">상영관</th>
			<th style="background-color: #303030; text-align: center;">일자</th>
			<th style="background-color: #303030; text-align: center;">시간</th>
			<th style="background-color: #303030; text-align: center;">좌석</th>
			<th style="background-color: #303030; text-align: center;">가격</th>
			<th style="background-color: #303030; text-align: center;">예매취소</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${reservationList.size() != 0}">
 		<c:forEach var="i" begin="0"
								end="${reservationList.size()-1 }" step="1"> 
		<tr>
			<td style="text-align: center"></td>
			<td style="text-align: center">${movieList[i].title}</td>
			<td style="text-align: center">${theaterList[i].name}</td>
			<td style="text-align: center">${screenList[i].scr_name}</td>			
			<td style="text-align: center">${reservationList[i].r_date}</td>
			<td style="text-align: center">${scheduleList[i].time}</td>
			<td style="text-align: center">${reservationList[i].seat_row}/${reservationList[i].seat_col}</td>
			<%-- <td style="text-align: center" id="totPrice">&#8361;${scheduleList[i].price}</td> --%>
			<td style="text-align: center"><input type="button" value="예매취소" onclick="deleteRes('${reservationList[i].r_id}','${reservationList[i].r_date}','${scheduleList[i].time}')" class="cr-btn cr-btn-sm" style="background-color: #ce2c3c;height: 58px; display: inline-block; width: 120px"></td>
		</tr>
 		</c:forEach> 
 	</c:if>
 	</tbody>
</table>
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
</script>
</body>
</html>