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
<!-- 데이트피커 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<style>
	body {background-color: #e9e7e8;}	
	a:link { color: white; text-decoration: none;}	
	a:visited { color: white; text-decoration: none;}
	a:hover { color: white; text-decoration: none; font-weight: bold;}
	
	ul{
   list-style:none;
   padding-left:0px;
   }
.short-div {
  height:220px;
}
.card-header {
	font-weight: bold;
	/* background-color: #e9e7e8;
	color: #4c4b4b;
    border-bottom: 4px solid #000000; */
}
.ui-datepicker{ width: 100%; }

#bigDiv {
box-shadow: 0 0 5px rgba(0,0,0,.2);
}
.card {
/* border-radius: .0rem; */
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
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;" id="bigDiv">
	<form action="seat" id="frm" method="post">
	    <div class="row" style="height: 660px; width: 100%; margin-left: 0px;margin-right: 0px;">
	    	
	    	<div class="card col-lg-4 col-md-3 col-sm-3 col-xs-3 overflow-auto list-group" style="padding-right: 0px; border: 1px solid rgba(0,0,0,.125);">
	    		<h5 class="card-header text-center">영화</h5>
				<c:forEach var="movieVO" items="${movieList}">
					<button type="button" class="list-group-item list-group-item-action" onclick="movieBtn('${movieVO.m_id}' + '-' + '${movieVO.title }' + '-' + '${movieVO.poster }')"
																						
																						value="${movieVO.m_id}" id="movie" style="cursor:pointer; font-weight: bold; color: #4c4b4b;">${movieVO.title }</button>
				</c:forEach>															
	    	</div>
		    <div class="card col-lg-3 col-md-3 col-sm-3 col-xs-3" style="padding:0px">
		    	<div class="short-div list-group" style="height: 330px; border: 1px solid rgba(0,0,0,.125);">
					<h5 class="card-header text-center">극장</h5>
					<span id="theater"></span>
				</div>
		    	<div class="short-div" style="height: 330px; border: 1px solid rgba(0,0,0,.125);">
					<h5 class="card-header text-center">날짜</h5>
					<span id="date"></span>
				</div>
		    </div>
		    <div class="card col-lg-3 col-md-2 col-sm-3 col-xs-2" style="padding:0px">
		      	<div class="short-div list-group" style="border: 1px solid rgba(0,0,0,.125);">
		      	<h5 class="card-header text-center">상영관</h5>
					<span id="screen"></span>
				</div>
		    	<div class="short-div list-group" style="height: 440px; border: 1px solid rgba(0,0,0,.125);">
		    	<h5 class="card-header text-center">시간</h5>
					<span id="time"></span>
				</div>
		    </div>
		    <div class="card col-lg-2 col-md-2 col-sm-3 col-xs-2" style="padding:0px; border: 1px solid rgba(0,0,0,.125);">
		      	<div class="short-div">
		      	<h5 class="card-header text-center">예매정보</h5>
		      	<span id="moviePoster"></span>
					<!-- <img src="/resources/movieimg/조제, 호랑이 그리고 물고기들_스틸컷1.jpg" 
	    			alt="Chicago" style="height: 60%" width="100%"> -->
	    			
	    			<%-- <img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/movieimg/${movieVO.poster }"
										alt="service thumb" style="height:639.797px; width:100%"> --%>
	    			
				</div>
		      	<div class="short-div"><br><br><br>
		      		<ul>
						<li><strong>영화</strong> <span id="movieInfo"></span></li>
						<li><strong>극장</strong> <span id="theaterInfo"></span></li>
						<li><strong>날짜</strong> <span id="dateInfo"></span></li>
						<li><strong>상영관</strong> <span id="screenInfo"></span></li>
						<li><strong>시간</strong> <span id="timeInfo"></span></li>
					</ul>
				</div>
		      	<div class="short-div text-center text-bottom">
		      	<br><br><br><br><br>
		      		<input type="button" id="btn" class="btn btn-primary btn-lg float-bottom" style="width: 90%;height: 78px;" value="좌석선택">
		      		<%-- <img src="<%=KPath%>/img/right-arrow.png" 
	    			alt="Chicago" style="height: 60%; cursor: pointer;margin-top: 50px;" width="80%" id="btn" class="btn"> --%>
				</div>
		    </div>
	    </div>
	<span id="hidden"></span>
    </form>
</div>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>


<script charset="UTF-8">
/* $(function(){
	  var sBtn = $("ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
	  sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
	   sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
	   $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
	  })
	 }) */

	$(function(){
		var sBtn = $("div > button");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
		$("button").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
		sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
		$(this).addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
	 })
	});
	
	/* 영화예매창에서 넘어왔을 경우 */
	$(document).ready(function() {
		/* $(id).on("click", function() {
			alert(id);
		}); */
		if("${m_id}" != '') {
		/* alert('${m_id}');  */
		$.ajax({
			url: 'theater',
			data: {"m_id": "${m_id}"},
			dataType:'json',
			type: 'POST',
			success: function(data){
				var str = "";

				$.each(data, function(member){
				var theaterInfo = this.name;
				console.log(data);
				console.log(theaterInfo);
					str += '<button id="theater" type="button" class="list-group-item list-group-item-action" style="cursor:pointer; font-weight: bold; color: #4c4b4b;" onclick="theaterBtn(' + "${m_id}" + "," + this.t_id + "," + "'" + this.name + "'" + ')" value="' + this.t_id + '">' + this.name + '</button>';
				});
					$("#theater").html(str)
			}
		})
		$("#movieInfo").html("${movieVO.title}");
		
		var poster = '<img src="/resources/movieimg/';
		poster += '${movieVO.poster}"';
		poster += 'style="height: 100%; width:100%">';
		/* poster += '<img src="/resources/movieimg/';
		+ 'alt="조제, 호랑이 그리고 물고기들_스틸컷1.jpg"';
		+ 'alt="Chicago" style="height: 60%" width="100%">'; */
		
		/* '<img src="/resources/movieimg/조제, 호랑이 그리고 물고기들_스틸컷1.jpg" alt="Chicago" style="height: 60%" width="100%">' */
			
		$("#moviePoster").html(poster);
		}
	});
	function movieBtn(m_id,title,moviePoster) {
		console.log(m_id);
		console.log(title);
		console.log(m_id.split("-"));
		var arr = m_id.split("-");
		var m_id = arr[0];
		var title = arr[1] 
		var moviePoster = arr[2] 
		$.ajax({
			url: 'theater',
			data: {"m_id": m_id},
			dataType:'json',
			type: 'POST',
			success: function(data){
				var str = "";

				$.each(data, function(member){
				var theaterInfo = this.name;
					console.log(data);
					console.log(this.name);
					console.log(theaterInfo);
					str += '<button type="button" class="list-group-item list-group-item-action" style="cursor:pointer; font-weight: bold; color: #4c4b4b;" onclick="theaterBtn(' + m_id + "," + this.t_id + "," + "'" + this.name + "'" + ')" value="' + this.t_id + '">' + this.name + '</button>';
				});
					$("#theater").html(str)
			}
		})
		$("#date").empty();
		$("#screen").empty();
		$("#time").empty();
		$("#reservation").empty();
		$("#hidden").empty();
		
		$("#dateInfo").empty();
		$("#screenInfo").empty();
		$("#timeInfo").empty();
		$("#theaterInfo").empty();
		
		$("#movieInfo").html(title)
		
		var poster = '<img src="/resources/movieimg/';
		poster += moviePoster + '"';
		poster += 'style="height: 100%; width:100%">';
		
		$("#moviePoster").html(poster);
	}
	
	function showDate(){
	console.log($('#r_date').val());
	var minDate = new Date();
	var maxDate = minDate.getDate()+7;
	$( "#r_date" ).datepicker({
		dateFormat: 'yymmdd',
		minDate : 0,
		defalutDate : new Date(), // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다.
		todayHighlight: true,
		autoclose: true,
		showOn: "both",
		/* buttonImage: "resources/img/date.png ", 
		buttonImageOnly: true, //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함 */
		buttonText: "선택", //버튼에 마우스 갖다 댔을 때 표시되는 텍스트    
		yearSuffix: "년",
		monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'], //달력의 월 부분 텍스트
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 Tooltip 텍스트
		dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 부분 텍스트
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], //달력의 요일 부분 Tooltip 텍스트
		  
		//In Datepicker set the Calendar display start with Sunday (by default datepicker starts from Sunday)
		firstDay: 1,	
		  
		  //해당주만 선택가능하게..
          //Before Populating the Calendar set the Enabled &amp; Disabled Dates using beforeShowDay(Date) function
		  beforeShowDay: function (date) {
	            //Get today's date
				var monday = new Date();
	            //Set the time of today's date to 00:00:00 
				monday.setHours(0,0,0,0);
	            /*
	            Below Line sets the Date to Monday (Start of that Week)
	            (monday.getDay() || 7) returns the value of getDay() 
	            ie., [ 1 - Mon, 2 - Tue, 3 - Wed, 4 - Thu, 5 - Fri, 6 - Sat ]  
	            except for Sunday where it returns 7. 
	            The return value is used to calculate the Date of that Week's Monday
	            */
				monday.setDate(monday.getDate() + 1 - (monday.getDay() || 7));
	            //Set the Date to Monday
				var sunday = new Date(monday);
	            //Now add 6 to Monday to get the Date of Sunday (End of that Week)
				sunday.setDate(monday.getDate() + 6);
	            //Now return the enabled and disabled dates to datepicker
				return [(date >= monday && date <= sunday), ''];
			},
          onSelect: function(dateText, inst) {
		    var date = $(this).val();
		    $("#dateInfo").html($(this).val());
		    $("#time").empty();
		  	$("#reservation").empty();
		  	$("#hidden").empty();
		  	
			$("#timeInfo").empty();
	     }
		});
	$('#r_date').val($.datepicker.formatDate('yymmdd', new Date()));
	$("#dateInfo").html($('#r_date').val());
	}
	
	function theaterBtn(m_id,t_id,theaterInfo) {
		console.log(m_id);
		console.log(t_id);
		console.log(theaterInfo);
		var str = "";
		str += '<div name ="r_date" id="r_date"></div>';
		$("#date").html(str)
		showDate();
		$.ajax({
			url: 'screen',
			data: {"t_id": t_id, "m_id":m_id},
			dataType:'json',
			type: 'POST',
			success: function(data){
				console.log(data);
				var str = "";
				
				$.each(data, function(member){
					/* str += '<button type="button" onclick="theaterBtn(' + this.scr_id + ')">' + this.scr_name + '</button>'; */
					str += '<button type="button" style="cursor:pointer; font-weight: bold; color: #4c4b4b;" class="list-group-item list-group-item-action" onclick="scrBtn(' + m_id + "," + t_id + "," + this.scr_id + "," + "'" + this.scr_name + "'" + ')" value="' + this.scr_id + '">' + this.scr_name + '</button>';
					
				});
					$("#screen").html(str);
			}
		})
		$("#theaterInfo").html(theaterInfo);
		$("#time").empty();
		$("#reservation").empty();
		$("#hidden").empty();
		
		$("#timeInfo").empty();
		$("#screenInfo").empty();
	}
	
	function scrBtn(m_id,t_id,scr_id,scr_name) {
		
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
	 	
	 	var now = new Date().getHours();
	 	
	 	today =  parseInt(today);
	 	now = parseInt(now);
	 	
	 	console.log("today " + today);
	 	console.log("now " +now);
	 	
		$.ajax({
			url: 'time',
			data: {"m_id": m_id,"t_id": t_id,"scr_id": scr_id},
			dataType:'json',
			type: 'POST',
			success: function(data){
			 	
				var str = "";
				$.each(data, function(member){
					console.log("==========11===========");
					console.log($("#r_date").val());
					console.log(today);
					console.log(this.time);
					console.log(now);
					console.log("===========11==========");
					
					if ($("#r_date").val() <= today && this.time <= now) {
						console.log("=========22============");
						console.log($("#r_date").val());
						console.log(today);
						console.log(this.time);
						console.log(now);
						console.log("=========22============");
						
						str += '<button type="button" style="color:#b3b2b2; cursor:pointer; font-weight: bold;" class="list-group-item list-group-item-action" disabled="true" onclick="finish(' + m_id + "," + t_id + "," +scr_id + "," + this.sch_id + "," + this.time + ')">' + this.time + "시(예매불가)" + '</button>';
						str += '<span id="' + this.sch_id + '" + style=\"color: red; font-size: small;\"></span>'
						reservation(this.sch_id,scr_id)
					} else {
							console.log("=========22============");
							console.log($("#r_date").val());
							console.log(today);
							console.log(this.time);
							console.log(now);
							console.log("=========22============");
							
							str += '<button type="button" style="cursor:pointer; font-weight: bold; color: #4c4b4b;" class="list-group-item list-group-item-action" onclick="finish(' + m_id + "," + t_id + "," +scr_id + "," + this.sch_id + "," + this.time + ')">' + this.time + "시" + '</button>';
							str += '<span id="' + this.sch_id + '" + style=\"color: red; font-size: small;\"></span>'
							reservation(this.sch_id,scr_id)
					}
				});
					$("#time").html(str);
			}
		})
		$("#screenInfo").html(scr_name);
		$("#hidden").empty();
		$("#timeInfo").empty();
	}
	
	function reservation(sch_id,scr_id) {
		var r_date = $("#r_date").val();
		console.log('$("#r_date").val()' +$("#r_date").val());
		$.ajax({
			url: 'reservation',
			data: {"sch_id": sch_id,"scr_id": scr_id,"r_date": r_date},
			dataType:'json',
			type: 'POST',
			success: function(data){
				console.log(data);
				console.log(data.i);
				console.log(data.tot);
				
				var tot = data.tot;
				var i = data.i;
				var toti = tot-i;
				
				var jq = "#"+sch_id;
				var str = "";
				str += "총좌석 " + data.tot + "  예매가능좌석 " + toti + "<br>"
					$(jq).html(str);
			}
		})
	}
	
	function finish(m_id,t_id,scr_id,sch_id,time) {
		var str = "";
		str += '<input type="hidden" name = "m_id" value=' + m_id + '>';
		str += '<input type="hidden" name = "t_id" value=' + t_id + '>';
		str += '<input type="hidden" name = "scr_id" value=' + scr_id + '>';
		str += '<input type="hidden" name = "sch_id" value=' + sch_id + '>';
		str += '<input type="hidden" name = "time" value=' + time + '>';
		str += '<input type="hidden" name = "r_date" value=' + $("#r_date").val() + '>';
		$("#hidden").html(str);
		$("#timeInfo").html(time);
	}
	
	$(document).ready(function() {
		$("#btn").click(function(){
			console.log($("#m_id").val());
			console.log($("#t_id").val());
			console.log($("#scr_id").val());
			console.log($("#sch_id").val());
			console.log($("#r_date").val());
			if($("input[name=m_id]").val() == null) {
				alert("선택되지 않은 항목이 있습니다. 선택을 완료해주시기 바랍니다.")
			} else {
				$("#frm").submit();
			}
		}); 
});
</script>
<!-- Bootstrap core JavaScript -->
<%-- <script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script> --%>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>