<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- ===============head include=============== -->
<jsp:include page="headInclude.jsp" flush="true" />

</head>

<body>

<% 
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	if(id!=null){
%>  

	<!-- ===============header include=============== -->
	<jsp:include page="headerInclude.jsp" flush="true" />


	<!--===============  마이페이지 초록색 메뉴바 ===============-->
	<jsp:include page="myPageInclude.jsp" flush="true" />

	<!--=============== 본문내용 ===============-->
    <section class="main">
       
    </section>
	
<%}else{ %>		
	<script> 
	alert("로그인 후 이용해 주세요.");
	history.back();
	</script>
<%} %>

	<!--=============== footer ===============-->
	<jsp:include page="footerInclude.jsp" flush="true" />
</body>
</html>