<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="odao" class="com.mni.ord.OrdDAO"></jsp:useBean>
<%
String order_idx_s = request.getParameter("order_idx");
if(order_idx_s == null || order_idx_s.equals("")){
<<<<<<< HEAD
	%>
	<script>
	window.alert('잘못된 접근입니다.');
	location.href = '/mni/admin/ordList.jsp';
	</script>
	<%
=======
   %>
   <script>
   window.alert('잘못된 접근입니다.');
   location.href = '/mni/admin/ordList.jsp';
   </script>
   <%
>>>>>>> branch 'master' of https://github.com/lbr410/mni.git
}
int order_idx = Integer.parseInt(order_idx_s);
int result = odao.orderDelevery(order_idx);
String msg = result > 0 ? "배송 시작":"실패";
%>
<script>
window.alert('<%=msg%>');
location.href = '/mni/admin/ordList.jsp';
</script>