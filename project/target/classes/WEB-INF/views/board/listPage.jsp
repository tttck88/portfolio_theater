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
			<td><a href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page) }&b_id=${boardVO.b_id}'>
										${boardVO.title}</a></td>
			<td>${boardVO.id}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td>
			<td><span class="badge bg-red">${boardVO.hit }</span></td>
		</tr>
	</c:forEach>
	</table>
	<div class="text-center">
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li><a href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="listPage${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
			</c:if>

		</ul>
	</div>
<script>
</script>
</body>
</html>