<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b67384432e7b18e82f08ed86614a1558"></script>
</head>
<body>
	<c:forEach var="theaterVO" items="${list}">
		<div>
			<a href="/theater/theaterOne?t_id=${theaterVO.t_id}">극장이름 : ${theaterVO.name }</a>
		</div>
		<%-- <div>극장번호 : ${theaterVO.phone }</div>
		<div>극장주소 : ${theaterVO.adress }</div>
		<div>극장소개 : ${theaterVO.content }</div>
		<div>상영관수 : ${theaterVO.scr_num }</div>
		<div>사진 : <img src="/resources/theaterimg/${theaterVO.img1 }"
										alt="service thumb" style="height: 210px;"></div>
		<div>
		<div id="${theaterVO.name }" style="width:500px;height:400px;"></div> --%>
		------------------------------------
		</div>
	</c:forEach>
<script>
	/* //확장 for문 사용
	for (var num in "${list}") {
	    alert([num]);
	} */

	/* var container = document.getElementById('극장2');
	var options = {
		center: new daum.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new daum.maps.Map(container, options);
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map); */
</script>
</body>
</html>