<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	body{width:500px;}
	h2{width: 200px;}
	h2 hr{width: 300px;}
	.zip{
		width: 65px;
		height: 30px;
		border: 1px solid lightgray;
		border-radius: 5px;
		font-size:20px;
	}
	.addr{
		width: 300px;
		height: 30px;
		border: 1px solid lightgray;
		border-radius: 5px;
		font-size:20px;
	}
	input[type="text"]{margin-bottom: 20px; margin-left: 20px;}
	
	.button{
		width: 150px;
		height: 50px;
		border-radius: 10px;
		color: white;
		background-color: #ff7f50;
		font-size: 17px;
		margin-left: 150px;
		cursor: pointer;
		border: 0px;
	}
</style>
<script>
	function show(){
		
		var zip = document.addr.order_zip.value;
		
		var addr1 = document.addr.order_addr1.value;
		
		opener.document.payment.order_zip.value = zip;
		
		opener.document.payment.order_addr1.value = addr1;
		
		window.self.close();
	}
</script>
<body>
<form name = "addr">
<h2>주소 입력</h2>
<hr>
우편번호 <input type = "text" name = "order_zip" maxlength="5" class = "zip" required="required"><br>
기본주소 <input type = "text" name = "order_addr1" class = "addr" required="required"><br>
<input type = "button" value = "확인" class = "button" onclick = "show()"> 
</form>
</body>
</html>