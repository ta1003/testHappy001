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
<title>타이틀</title>
</head>
<body>
	<h1>시작합니다.스프링</h1>
	${sessionScope.mem}
</body>
</html>