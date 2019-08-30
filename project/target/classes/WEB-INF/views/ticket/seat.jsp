<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
.short-div {
  height:220px;
}
.ui-datepicker{ width: 100%; }
.btn-primary {
    color: #fff;
    border-color: #fffdfd;
}
.button> .btn-primary {
	color: #fff;
	background-color: #e50914;
	border-color: #e50914
}

.button> .btn-primary:hover {
	color: #fff;
	background-color: #f40612;
	border-color: #f40612
}

.button> .btn-primary.focus, .btn-primary:focus {
	box-shadow: 0 0 0 .2rem rgba(38, 143, 255, .5)
} 


#bigDiv {
box-shadow: 0 0 5px rgba(0,0,0,.2);
}
</style>
<script>
    // html 이 다 로딩된 후 실행
    $(document).ready(function() {
        // 체크박스들이 변경됬을때
        $('[name="check_seat"]').change(function() {
        	
            var cnt = $("#person").val();
             
            // 셀렉트박스의 값과 체크박스중 체크된 갯수가 같을때, 다른 체크박스들을 disable 처리
            if( cnt==$('[name="check_seat"]:checked').length ) {
                $('[name="check_seat"]:not(:checked)').attr("disabled", true);
            }
            // 체크된 갯수가 다르면 활성화 시킴
            else {
                $('[name="check_seat"]').prop("disabled",false);
            }
        });
         
        // 셀렉트박스에서 다른 인원수를 선택하면 초기화 시킴
        $("#person").change(function(){
            
            $('[name="check_seat"]').attr("disabled",false);
            $('[name="check_seat"]').prop("checked",false);
            $("#seat").empty();

        });
    });
    
    function seat(rowCol) {
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "chosenSeat?rowCol=" + rowCol,
			success : function(data) {
				console.log(data);
				var str = data.toString();
				var row = str.substring(0, 1);
				var col = str.substring(1, 3);
				var rowCol = row + "/" + col
				console.log(rowCol);
				
				console.log($("#seat").html());
				
				if($("#seat").html() == "") {
// 					alert("내용없음");
					$("#seat").html(rowCol);
				} else if ($("#seat").html() != "") {
					if($("#seat").html().indexOf(rowCol) == -1) {
// 						alert("내용없음");
						$("#seat").append(" " + rowCol);
					} else {
// 						alert("내용있음");
// 						alert($("#seat").html().indexOf(rowCol));
// 						alert($("#seat").html());
						$("#seat").html($("#seat").html().replace(rowCol, ''));
					}
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
		        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		    }
		})
    }
    
    function sendSeat(form) {
    	console.log(form);
    	form.action = "pay";
    	form.submit();
    }
    
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
	<form method="post">
	<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;" id="bigDiv">
		<div class="card">
			<div class="card-header text-center">
				<!-- <h5 class="h1 card-title" style="color: black">인원/좌석선택</h5> -->
				<h1 style="font-weight: 700;">인원/좌석선택</h1>
			</div>
				<!-- <div class="card-body d-flex flex-column" style="height: 573px;"> -->
				<ul class="list-unstyled text-center">
					<li><br>
						<span>인원수 선택 </span> 
						<select id="person">
								<option value="1">1명</option>
								<option value="2">2명</option>
								<option value="3">3명</option>
								<option value="4">4명</option>
								<option value="5">5명</option>
						</select>
					</li>
						<li style="margin-top: 30px; font-size: 2em; color: #9d7e4a;">
							${scheduleVO.time }:00
						</li>
					<li style="margin-top: 15px;">
						예매가능좌석 : <input type="button" name="check_seat" style="width: 12px;height: 12px;padding-right: 0px;padding-left: 0px; background-color: #007bff;"><br>
						예매불가좌석 : <input type="button" name="check_seat" style="width: 12px;height: 12px;padding-right: 0px;padding-left: 0px; background-color: #888;">					
					</li>
					<li>
						<div style="background-color: gray;color: black;font-weight: bold;margin-top: 20px;">SCREEN</div>
					</li>
					<li style="margin-top: 30px;">
						<c:forEach var="i" begin="1" end="${map.screenVO.getScr_seat_row()}" step="1">
							<span style="margin-right: 25px;">${i }</span>
							<tr>
								<c:forEach var="k" begin="1"
									end="${map.screenVO.getScr_seat_col()}" step="1">
									<td>
									<div class=" custom-checkbox custom-control-inline btn-group-toggle data-toggle='buttons'">
											<input type="checkbox"
											name="check_seat" id="${i }${k }" value="${i }/${k }"
											class="custom-control-input" onclick="seat('${i }${k }');">  
											<label class="custom-control-label btn btn-primary ${i }${k }" for="${i }${k }" 
											style="padding-left: 0px;padding-right: 0px;padding-top: 0px;padding-bottom: 0px;width: 27px;height: 27px; margin-right: 10px;">${k }</label>
									</div>
									
									</td>
									<c:forEach var="reservationVO" items="${map.reservationList }">
										<c:set var="resRow" value="${reservationVO.getSeat_row() }" />
										<c:set var="resCol" value="${reservationVO.getSeat_col() }" />
										<c:if test="${i == resRow && k == resCol }">
											<script>
						    			var resRow = "${i }";
						    			var resCol = "${k }";
						    			
						    			$("#"+resRow+resCol).remove();
						    			$("."+resRow+resCol).attr('style', 'background-color:gray; padding-left: 0px;padding-right: 0px;padding-top: 0px;padding-bottom: 0px;width: 27px;height: 27px; margin-right: 10px;');
							    	</script>
										</c:if>
									</c:forEach>
								</c:forEach>
								<br>
							</tr>
						</c:forEach>
					</li>
				</ul>
				</div>
				<div class="card-footer" style="height: 146px;">
							<div class="row">
								<div class="col-lg-4">
								
								</div>
								<div class="col-lg-" style="padding-right: 20px;">
									<img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/movieimg/${poster}"
										alt="service thumb" style="height:; width:90px">
								</div>
								<div class="col-lg-" style="font-size: smaller;">
									<ul>
										<li><strong>영화</strong> <span id="movieInfo">${movieTitle}</span></li>
										<li><strong>극장</strong> <span id="theaterInfo">${theaterName}</span></li>
										<li><strong>날짜</strong> <span id="dateInfo">${r_date}</span></li>
										<li><strong>상영관</strong> <span id="screenInfo">${screenName}</span></li>
										<li><strong>시간</strong> <span id="timeInfo">${time}</span></li>
										<li><strong>좌석</strong> <span id="seat"></span></li>
									</ul>
								</div>
							<div class="button float-right ">
								<input type="hidden" name="sch_id" value=${map.scheduleVO.sch_id }>
								<input type="hidden" name="scr_id" value=${map.scheduleVO.scr_id }>
								<input type="hidden" name="m_id" value=${map.scheduleVO.m_id }>
								<input type="hidden" name="t_id" value=${map.scheduleVO.t_id }>
								<input type="hidden" name="time" value=${map.scheduleVO.time }>
								<input type="hidden" name="r_date" value=${map.r_date }>
								<input type="button" value="결제하러 가기" onclick="sendSeat(this.form)" class="btn btn-primary btn-lg" style="margin-top: 30px; width: %;height: 78px;">
							</div>
							</div>
				</div>
			<div class="w-100 d-md-none mt-4"></div>
		</div>
	</form>
	
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<script>
	console.log("${map.scheduleVO}");
	console.log("${map.reservationList}");
	console.log("${map.screenVO}");
	console.log("${map.r_date}");
</script>
<!-- Bootstrap core JavaScript -->
<%-- <script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script> --%>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>