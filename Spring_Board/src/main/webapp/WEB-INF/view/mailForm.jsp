<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%
    request.setCharacterEncoding("UTF-8");
 	response.setContentType("text/html; charset=UTF-8");
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 보내기 화면</title>
</head>
<body>
	<%@ include file="/WEB-INF/view/boardTopMenu.jsp" %>
	<div id="container">
		<form action="./mailSending.do" method="post">
			<div class="form-group">
				<label>받는사람</label><br>
				<input class="form-control" type="text" name="toMail" size="120px" width="100%" placeholder="상대방 메일 주소 입력">
			</div>
			<div class="form-group">
				<label>메일 제목</label><br>
				<input class="form-control" type="text" name="title" size="120px" width="100%" placeholder="제목을 입력">
			</div>
			
			<p>
			
			<div class="form-group">
				<label>메일 내용</label><br>
				<textarea class="form-control" name="content" rows="12" cols="120" style="resize: none;" placeholder="메일 내용"></textarea>
			</div>	
			
			<div class="form-group">				
				<input class="btn btn-sm btn-success" type="submit" value="메일보내기">
			</div>	
		</form>
	</div>
</body>
</html>