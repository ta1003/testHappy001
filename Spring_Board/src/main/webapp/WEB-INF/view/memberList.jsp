<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 조회</title>
</head>
<body>
	<%@include file="/WEB-INF/view/boardTopMenu.jsp" %>
	<div id="container">
		<form action="#" method="post" id="frm">
			<table class="table table-bordered">
			<tr>
				<th>연번</th>
				<th>아이디</th>
				<th>이름</th>
				<th>권한</th>
				<th>삭제여부</th>
				<th>등록일</th>
				<th>메일전송</th>
			</tr>
			<c:forEach var="dto" items="${mlists}" varStatus="vs">
				<tr>
					<td>${vs.count}</td>
					<td>${dto.id}</td>
					<td>${dto.name}</td>
					<td>${dto.auth}</td>
					<td>${dto.delflag}</td>
					<td>
					<!-- String date : date : String date -->				
						<fmt:parseDate var="stringDate" value="${dto.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${stringDate}" pattern="yyyy.MM.dd"/>
					</td>
					<td>
						<a href="./mail.do"><img alt="메일전송" src="./image/message.png"></a>
					</td>
				</tr>
			</c:forEach>
			<div>
				<input class="btn btn-sm btn-primary btn-center"type="button" value="돌아가기" onclick="history.back(-1)">
			</div>
			</table>
		</form>
	</div>
</body>
</html>