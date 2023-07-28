<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id = "udao" class = "com.mni.userInfo.userInfoDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String juminfront_s = request.getParameter("juminfront");
String juminback_s = request.getParameter("juminback");
int juminfront = Integer.parseInt(juminfront_s);
int juminback = Integer.parseInt(juminback_s);
String id = udao.getUserId(juminfront, juminback);
%>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이: 아이디 정보</title>
</head>
<style>
.button{
	width: 200px; 
	height: 45px; 
	margin-top: 15px; 
	border: 1px solid #ff7f50;
	border-radius: 10px;
	background-color: #ff7f50;
	color: white;
	cursor: pointer;
}
.submit{
	width: 200px; 
	height: 45px; 
	margin-top: 15px; 
	border: 1px solid #ff7f50;
	border-radius: 10px;
	background-color: #ff7f50;
	color: white;
	cursor: pointer;
}
.div{
	font-size: 35px;
}
h3{margin-top: 30px;}
</style>
<body>
<%@include file = "/header.jsp" %>
<section>
	<article>
	<form name = "fm" action = "pwdSearch.jsp?id=<%=id %>" method = "post">
		<%
		if(id != null){
			%>
			<h3>회원님의 아이디는</h3>
			<div class = "div"><%=id %> 입니다.</div>
			<input type = "button" value = "로그인 하러가기" class = "button" onclick = "javascript:location.href='login.jsp'">
			<input type = "submit" value = "비밀번호 찾기" class = "submit">
			<%
		}else{
			%>
			<script>
				window.alert('일치하는 정보가 없습니다..!');
				location.href='/mni/user/idSearch.jsp';
			</script>
			<!-- <div class = "div">가입된 정보가 없습니다...</div>
			<input type = "button" value = "회원가입 하기" class = "button" onclick = "javascript:location.href='join.jsp'"> -->
			<%
		}
		%>
		
	</form>
	</article>
</section>
<%@include file = "/footer.jsp" %>
</body>
</html>