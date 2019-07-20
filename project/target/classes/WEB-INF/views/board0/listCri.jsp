<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
	<tr>
		<th>b_id</th>
		<th>title</th>
		<th>id</th>
		<th>regdate</th>
		<th>hit</th>
	</tr>
	<c:forEach var="boardVO" items="${list}">
		<tr>
			<td>${boardVO.b_id}</td>
			<td><a href='/board/read?b_id=${boardVO.b_id}'>${boardVO.title}</a></td>
			<td>${boardVO.id}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td>
			<td><span class="badge bg-red">${boardVO.hit }</span></td>
		</tr>
	</c:forEach>
	</table>
<script>
</script>
</body>
</html>