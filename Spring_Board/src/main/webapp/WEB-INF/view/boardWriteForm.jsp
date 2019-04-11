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
<title>작성</title>
<script type="text/javascript">
function listMove(){
	location.href="./boardList.do";
}

</script>

</head>
<body>
	<%@include file="/WEB-INF/view/boardTopMenu.jsp" %>
	
	<div id="container">
		<div class="col-sm-12">
			<p class="lead">게시글 작성</p>
			
			<form role="form" action="./write.do" method="post">
				<input type="hidden" name="id" value="${mem.id}">
				
				<div class="form-group">	
					<label>작성자</label>		
					<p class="form-control">${mem.id}</p>	
				</div>
				
				<div class="form-group">	
					<label>제목</label><br>
					<input type="text" class="form-control" placeholder="제목을 입력하세요"
					name="title" required="required">							
				</div>
				<div class="form-group">		
					<label>내용</label>	
					<textarea rows="7" class="form-control" name="content"></textarea>	
				</div>
				
				
				<div class="form-group">	
					<input class="btn btn-sm btn-success" type="submit" value="글 등록">
					<input class="btn btn-sm btn-info" type="button" value="목록이동" onclick="listMove()"> 
				</div>
			
			</form>
			
		</div>
	</div>
</body>
</html>