<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</script>
</head>
<body>
	<div>사진 <img src="resources/movieimg/${movieVO.poster }" width="100"></div>
	<div>제목 ${movieVO.title }</div>
	<div>극장 ${theaterVO.name }</div>
	<div>상영관${screenVO.scr_name }</div>
	<div>일자 ${reservationList[0].r_date }</div>
	<div>시간 ${time}</div>
	<div>좌석 <c:forEach var="reservationOne" items="${reservationList}" >
					${reservationOne.seat_row }
					/
					${reservationOne.seat_col }
					&nbsp
					
				</c:forEach></div>
	<div>가격  ${totPrice}</div>
	<form name="frm" id="frm" action="payOk" method="post">
		<input type="hidden" name="m_id" value=${movieVO.m_id }>
		<input type="hidden" name="t_id" value=${theaterVO.t_id }>
		<input type="hidden" name="scr_id" value=${screenVO.scr_id }>
		<input type="hidden" name="sch_id" value=${scheduleVO.sch_id }>
		<div class="container"  style="margin-bottom: 30px">	
		<div class="row">
		<table class="table table-bordered bordertable th120" >
		<tr><th style="background-color: #fafafa">결제수단</th></tr>
		<tr><td>결제수단선택</td></tr>
		<tr><td>
		신용카드&nbsp<input type="radio" name="pay_type" value="inicis" style="display: inline-block; width: 15px; margin-top: 0px;">&nbsp&nbsp&nbsp
		카카오페이&nbsp<input type="radio" name="pay_type" value="kakaopay" style="display: inline-block; width: 15px; margin-top: 0px;">
		</td></tr>
		<tr><td colspan="2" style="text-align: center;">
			<input type="button" value="결제하기" onclick="sendPay(this.form)" class="cr-btn cr-btn-sm" style="margin-top: 30px;background-color: #ce2c3c;height: 58px; display: inline-block; width: 120px;">
			<input type="reset" value="취소하기" class="cr-btn cr-btn-sm" style="margin-top: 30px;background-color: #ce2c3c;height: 58px; display: inline-block; width: 120px;">
		</td></tr>
		</table>
		</div>
		</div>
	</form>
</body>
</html>