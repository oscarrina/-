<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍냥이 : 리뷰작성</title>
</head>
<link rel="stylesheet" type="text/css" href="/mni/css/reviewWrite.css">
<script>
	// 리뷰 글자수 확인
	function textCheck() {
		document.all.textLength.innerHTML = document.reviewWrite.review_content.value.length;
	}
	
	// 확장자 확인
	function extensionCheck(rp) {
        var filename = rp.value;
        var len = filename.length;
        var filetype = filename.substring(len-4, len);
        
        if(filetype!='.jpg' && filetype!='.png' && filetype!='jpeg') {
            window.alert('이미지 파일만 등록 가능!');
            rp.value = '';
        }
    }
	
	// 업로드한 이미지 미리보기	
	function setReviewImg(event) {
		var reader = new FileReader();
		
		reader.onload = function(event) {
			var img = document.all.preview;
			img.setAttribute("src", event.target.result);			
		}
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
<body>
<%@ include file="../header.jsp" %>
<%
	String prod_idx_s = request.getParameter("prod_idx");
	if(prod_idx_s==null || prod_idx_s.equals("")) {
%>
		<script>
			window.alert('접근할 수 없는 페이지입니다.');
			location.href = '/mni/index.jsp';
		</script>
<%
		return;
	}
	
	int prod_idx = Integer.parseInt(prod_idx_s);
	
	Integer user_idx = (Integer)session.getAttribute("sidx");
%>
<section>
	<article>
	<br><h1>리뷰작성</h1>
		<form name="reviewWrite" action="reviewWrite_ok.jsp" method="post" enctype="multipart/form-data">
		<table class="tableSize">
			<tr>
				<td colspan="4"><textarea placeholder="최대 300자까지 입력 가능합니다."
				name="review_content" maxlength="299" onkeyup="textCheck()"></textarea></td>
			</tr>
			<tr>
				<td colspan="4"><div class="textCount">(<span id="textLength">0</span> / 300)</div></td>
			</tr>
			<tr>
				<td colspan="4" class="td0">
				<span class="menu">이미지 등록</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="file" name="review_img"
				accept=".jpg, .jpeg, .png" onchange="extensionCheck(this); setReviewImg(event)"></td>
			</tr>
			<tr>
				<td colspan="4" class="td1">
				<img src="/mni/img/preview.jpg" id="preview">
				<td>
			</tr>
			<tr>
				<td colspan="4" class="td2">
				<input type="hidden" name="prod_idx" value="<%=prod_idx %>">
				<input type="hidden" name="user_idx" value="<%=user_idx %>">
				<input type="submit" value="작성" class="countBtn">
				</td>
			</tr>
		</table>
		</form>
	</article>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>