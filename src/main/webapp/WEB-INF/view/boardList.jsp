<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- Core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	// rowPerPage 처리
	$(document).ready(function(){
		$('#rowPerPage').change(function(){
			alert($('#rowPerPage option:selected').val());
			let selectedRowPerPage = $('#rowPerPage option:selected').val();
			$('#pageForm').submit();
			$($('#rowPerPage').val(selectedRowPerPage)).prop('selected', 'selected');
			
		});

	});
</script>
</head>
<body>
	<h1>게시판</h1>
	<div><a href="${pageContext.request.contextPath}/CreateBoardFormController">글쓰기</a></div>
	<!-- form post로 처리 -->
	<form action="${pageContext.request.contextPath}/BoardListController" id="pageForm">
		<select name="rowPerPage" id="rowPerPage">
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
		</select>
	</form>
	<table>
		<c:forEach var="b" items="${boardList}">
			<tr>
				<td>${b.boardNo}</td>
				<td><a href="${pageContext.request.contextPath}/BoardOneController?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
				<td>${b.createdate}</td>
				<c:if test="${b.memberId}==${loginMember.memberId}">
					<td><a href="${pageContext.request.contextPath}/ModifyBoardFormController?boardNo=${b.boardNo}">수정</a></td>
					<td><a href="${pageContext.request.contextPath}/RemoveBoardController?boardNo=${b.boardNo}">삭제</a></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</body>
</html>