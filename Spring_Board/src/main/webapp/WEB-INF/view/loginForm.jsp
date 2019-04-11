<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>  
 
  <%
    request.setCharacterEncoding("UTF-8");
 	response.setContentType("text/html; charset=UTF-8");
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이ㅈ ㅣ~!!@!~#!~</title>
<link rel="stylesheet" type="text/css" href="./css/login.css">
<link rel="stylesheet" type="text/css" href="./css/sweetalert.css">

<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./js/sweetalert.min.js"></script>
</head>
<script type="text/javascript">
	
	function loginCheck() {
		var id = document.getElementById("inputId").value;
		var pw = document.getElementById("inputPw").value;
		//alert(id+":"+pw+":");
		
		var frm = document.forms[0]; // document.getElementById("frm");
		frm.action = "./login.do";
		var result = "";
		
		if(id==null || id ==""){
			swal("로그인","아이디를 확인해주세요.");
		}else if(pw==null || pw==""){
			swal("로그인","비밀번호를 확인해주세요.");
		}else{
			jQuery.ajax({  // $(ajax)
				url : "./loginCheck.do",
				type : "post",
				data : "id="+id+"&pw="+pw,
				success : function(msg) {					
					//var temp1 = "";
					//var temp2 = "";
					
					var temp1 = msg;
					var temp2 = msg;
					
					temp1 = temp1.slice(0, 2);
					if(temp1 == "성공"){
						/* alert("if문 들어 옴"); */
						temp2 = temp2.split("/")[1];
						document.getElementById("loginChk").value = temp2;
						frm.submit();
					}else{
						swal("로그인실패","아이디 혹은 비밀번호를 확인해주세요.");
					}
				}
			}); 
			
		}
	}

	function signUp() {
		location.href="./signUpForm.do";
	}

	function idSearch() {
		swal("아이디 찾기","문이슬이 준비중입니다.");
	}
	function pwSearch() {
		swal("비밀번호 찾기", "송희가 준비중입니다.");
	}

</script>


<body>
	${mem}확인중<br>

	<div id="container">
		<div id="title">Board Login</div>
		<div id="id">아이디</div>
		<form action="" method="post" id="frm">
			<input type="hidden" id="loginChk" name="auth" value="0">
			<input type="text" name="id" id="inputId" placeholder="숫자-대소문자" required="required">
			
			<div id="pw">비밀번호</div>
			<input type="password" name="pw" id="inputPw" placeholder="비밀번호입력" required="required">
			<br>
			
			<input type="button" id="login" name="login" value="로그인" onclick="loginCheck()">
			
			<div id = "bottom">
				<a href="#" onclick="signUp()">
					<input id="SignUp" type="button" name="signup" value="회원가입">
				</a>
				
				<input id="SearchId" type="button" value="아이디찾기" onclick="idSearch()">
				<input id="SearchPw" type="button" value="비밀번호찾기" onclick="pwSearch()">
			</div>
		</form>
	</div>
</body>
</html>