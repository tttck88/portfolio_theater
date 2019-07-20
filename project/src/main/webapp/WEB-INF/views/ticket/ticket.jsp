<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 데이트피커 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="seat" id="frm" method="post">
		영화
		<c:forEach var="movieVO" items="${movieList}">
			<button type="button" class="${movieVO.title }" onclick="movieBtn('${movieVO.m_id}')" value="${movieVO.m_id}" id="movie">${movieVO.title }</button>
		</c:forEach>
		극장
		<div>
			<span id="theater"></span>
		</div>
		<div>
			<span id="date"></span>
		</div>
		<div>
			<span id="screen"></span>
		</div>
		<div>
			<span id="time"></span>
		</div>
		<div>
			<span id="reservation"></span>
		</div>
		<div>
			<span id="hidden"></span>
		</div>
		<input type="button" id="btn">전송
	</form>
	
<script>
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
					/* str += '<input type="button" style="margin-top: 5px;" class="btn btn-light btn-lg" onclick="fnTest('+ m_id + ',' + this.t_id + ',' + "'" + this.img1 + "'," + "'" + this.name + "'" + ')" value=' + this.name + '>'; */
					str += '<button type="button" onclick="theaterBtn(' + "${m_id}" + "," + this.t_id + ')" value="' + this.t_id + '">' + this.name + '</button>';
				});
					$("#theater").html(str)
			}
		})
		}
	});
	
	function movieBtn(m_id) {
		$.ajax({
			url: 'theater',
			data: {"m_id": m_id},
			dataType:'json',
			type: 'POST',
			success: function(data){
				var str = "";

				$.each(data, function(member){
					/* str += '<input type="button" style="margin-top: 5px;" class="btn btn-light btn-lg" onclick="fnTest('+ m_id + ',' + this.t_id + ',' + "'" + this.img1 + "'," + "'" + this.name + "'" + ')" value=' + this.name + '>'; */
					str += '<button type="button" onclick="theaterBtn(' + m_id + "," + this.t_id + ')" value="' + this.t_id + '">' + this.name + '</button>';
				});
					$("#theater").html(str)
			}
		})
		$("#date").empty();
		$("#screen").empty();
		$("#time").empty();
		$("#reservation").empty();
		$("#hidden").empty();
	}
	
	function showDate(){
	var minDate = new Date();
	var maxDate = minDate.getDate()+7;
	$( "#r_date" ).datepicker({
		dateFormat: 'yy-mm-dd',
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
		    $("#time").empty();
		  	$("#reservation").empty();
		  	$("#hidden").empty();
	     }
		});
	$('#r_date').val($.datepicker.formatDate('yymmdd', new Date()));
	}
	
	function theaterBtn(m_id,t_id) {
		var str = "";
		str += '<input type="text" name ="r_date" id="r_date">';
		$("#date").html(str)
		showDate();
		$.ajax({
			url: 'screen',
			data: {"t_id": t_id},
			dataType:'json',
			type: 'POST',
			success: function(data){
				console.log(data);
				var str = "";

				$.each(data, function(member){
					/* str += '<button type="button" onclick="theaterBtn(' + this.scr_id + ')">' + this.scr_name + '</button>'; */
					str += '<button type="button" onclick="scrBtn(' + m_id + "," + t_id + "," + this.scr_id + ')" value="' + this.scr_id + '">' + this.scr_name + '</button>';
					
				});
					$("#screen").html(str);
			}
		})
		$("#time").empty();
		$("#reservation").empty();
		$("#hidden").empty();
	}
	
	function scrBtn(m_id,t_id,scr_id) {
		$.ajax({
			url: 'time',
			data: {"m_id": m_id,"t_id": t_id,"scr_id": scr_id},
			dataType:'json',
			type: 'POST',
			success: function(data){
				var str = "";
				$.each(data, function(member){
					str += '<button type="button" onclick="finish(' + m_id + "," + t_id + "," +scr_id + "," + this.sch_id + "," + this.time + ')">' + this.time + '</button>';
					str += '<span id="' + this.sch_id + '"></span>'
					reservation(this.sch_id,scr_id)
				});
					$("#time").html(str);
			}
		})
		$("#hidden").empty();
	}
	
	function reservation(sch_id,scr_id) {
		$.ajax({
			url: 'reservation',
			data: {"sch_id": sch_id,"scr_id": scr_id},
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
				str += "총좌석 " + data.tot + "-- 예매가능좌석 " + toti
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
		$("#hidden").html(str);
	}
	
	/* function check(form) {
		console.log($("#m_id").val());
		console.log($("#t_id").val());
		console.log($("#scr_id").val());
		console.log($("#sch_id").val());
		console.log($("#r_date").val());
		if($("#m_id").val() == null) {
			alert("선택되지 않은 항목이 있습니다. 선택을 완료해주시기 바랍니다.")
		} else {
			alert("영화 - " + $("#m_id").val() + " 극장 - " + $("#t_id").val() + 
					" 상영관 - " + $("#scr_id").val() + " 스케쥴 - " + $("#sch_id").val() + " 날짜 - " + $("#r_date").val())
			location.href = "seat";
			$("#frm").submit();
		}
	} */
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
				alert("영화 - " + $("#m_id").val() + " 극장 - " + $("#t_id").val() + 
						" 상영관 - " + $("#scr_id").val() + " 스케쥴 - " + $("#sch_id").val() + " 날짜 - " + $("#r_date").val())
				$("#frm").submit();
			}
		}); 
});
</script>
</body>
</html>