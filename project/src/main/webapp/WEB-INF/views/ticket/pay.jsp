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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
<script>
function sendPay(form) {
	/* var IMP = window.IMP; // 생략가능
	IMP.init('imp78918944'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	IMP.request_pay({
	    pg : form.pay_type.value,
	    pay_method : form.pay_type.value,
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : "300",
	    buyer_email : "${usersVO.email}",
	    buyer_name : "${usersVO.name}",
	    buyer_tel : "${usersVO.phone}",
	}, function(rsp) {
	    if ( rsp.success ) {
	    	console.log(rsp);
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	$.ajax({
	    		type: 'POST',
	    		dataType: 'text',
	    		url: "pay", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
	    		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    		success : function(data) {
	    			$("#frm").submit();
	    		},
	    		error : function(jqXHR, textStatus, errorThrown) {
			        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			        $("#okok").html("데이터실패 " + jqXHR, textStatus, errorThrown);
			    }
	    	})
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;

	        alert(msg);
	    }
	}); */
	$("#frm").submit();
}

function sendPay_import(form) {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp78918944'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	IMP.request_pay({
	    pg : form.pay_type.value,
	    pay_method : form.pay_type.value,
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : "300",
	    buyer_email : "${usersVO.email}",
	    buyer_name : "${usersVO.name}",
	    buyer_tel : "${usersVO.phone}",
	}, function(rsp) {
	    if ( rsp.success ) {
	    	console.log(rsp);
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	$.ajax({
	    		type: 'POST',
	    		dataType: 'text',
	    		url: "pay", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
	    		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    		success : function(data) {
	    			$("#frm").submit();
	    		},
	    		error : function(jqXHR, textStatus, errorThrown) {
			        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			        $("#okok").html("데이터실패 " + jqXHR, textStatus, errorThrown);
			    }
	    	})
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;

	        alert(msg);
	    }
	});
	/* $("#frm").submit(); */
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;" id="bigDiv">
	<div class="row">
	<div class="col-lg-5" style="height: 140%">
		<img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/movieimg/${movieVO.poster }" style="height:519px; width:100%">
	</div>
	<div class="col-lg-6">
		<ul>
			<li><strong>제목</strong> ${movieVO.title }</li>
			<li><strong>극장</strong> ${theaterVO.name }</li>
			<li><strong>상영관</strong> ${screenVO.scr_name }</li>
			<li><strong>일자</strong> ${reservationList[0].r_date }</li>
			<li><strong>시간</strong> ${time}</li>
			<li><strong>좌석</strong> 
				<c:forEach var="reservationOne" items="${reservationList}" >
							${reservationOne.seat_row }
							/
							${reservationOne.seat_col }
							&nbsp
							
				</c:forEach>
			<li><strong>가격</strong> ${totPrice}</li>
		</ul>
	</div>
	</div>
	<form name="frm" id="frm" action="payOk" method="post">
		<input type="hidden" name="m_id" value=${movieVO.m_id }>
		<input type="hidden" name="t_id" value=${theaterVO.t_id }>
		<input type="hidden" name="scr_id" value=${screenVO.scr_id }>
		<input type="hidden" name="sch_id" value=${scheduleVO.sch_id }>
		
		<div class="my-5">
		<table class="table table-bordered bordertable th120" >
		<tr><th style="background-color: #fafafa">결제수단</th></tr>
		<tr><td>결제수단선택</td></tr>
		<tr><td>
		신용카드&nbsp<input type="radio" name="pay_type" value="inicis" style="display: inline-block; width: 15px; margin-top: 0px;">&nbsp&nbsp&nbsp
		카카오페이&nbsp<input type="radio" name="pay_type" value="kakaopay" style="display: inline-block; width: 15px; margin-top: 0px;">
		</td></tr>
		<tr><td colspan="2" style="text-align: center;">
			<input type="button" value="일반결제" onclick="sendPay(this.form)" class="btn btn-primary" style="margin-top: 30px; height: 58px; display: inline-block; width: 120px;">
			<input type="button" value="API결제" onclick="sendPay_import(this.form)" class="btn btn-primary" style="margin-top: 30px; height: 58px; display: inline-block; width: 120px;">
			<input type="reset" value="취소하기" class="btn btn-primary" style="margin-top: 30px; height: 58px; display: inline-block; width: 120px;">
		</td></tr>
		</table>
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<!-- Bootstrap core JavaScript -->
<%-- <script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script> --%>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>