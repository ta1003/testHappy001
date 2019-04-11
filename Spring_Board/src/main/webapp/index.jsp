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
<title>인덱스 페이지</title>
</head>
<body>
	<h1>
		<a href="./loginForm.do">로그인 폼 이동</a>
	</h1>

	<a href="./signUp.do?id=happy&name=happy&pw=happy">회원가입</a>
	<a href="./idCheck.do?id=happy">아이디 확인</a>
	<a href="./login.do?id=TEST001&pw=TEST001">로그인</a>
	<a href="./memberList.do">회원리스트</a>
	
	<hr>
	<a href="./writeBoard.do?id=TEST001&title=글두개&content=ㅋㅋㅋㅋ">root글작성하기</a>
	<a href="./reply.do?seq=21&id=TEST001&title=답글입다4&content=수류탄투척6">답글달기</a>
	<a href="./getOneBoard.do?seq=22">상세글</a>
	<a href="./readcountBoard.do?seq=22">조회수증가</a>
	<a href="./modifyBoard.do?seq=22&title=수정&content=사격개시">글 수정</a>
	<a href="./delflagBoard.do?seq=21">글 삭제(변경)</a>
	<a href="./deleteBoardSel.do?seq=21">삭제선택</a>
	<a href="./userBoardListTotal.do">유저</a>
	<a href="./adminBoardListTotal.do">관리자</a>
	<a href="./userBoardListRow.do">사용자 글 개수</a>
	<a href="./adminBoardListRow.do">관리자 글 개수</a>
	
</body>
</html>