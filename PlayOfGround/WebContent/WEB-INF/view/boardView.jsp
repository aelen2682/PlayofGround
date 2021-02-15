<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
	<form action="/board/update" method="post">
			<input type="hidden" name="id" value=${data.id } readonly">
		제목 : <input type="text" name="title" value="${data.title }"> <br>
		이름 : <input type="text" name="name" value="${data.name }" readonly> <br>
		내용 : <input type="text" name="context" value="${data.context }"> <br> 
		<input type="hidden" name="iDate" value="<%=LocalDateTime.now().withNano(0)%>">
		<!-- <input type="hidden" name="iDate" value="2021-01-26'T'12:58:32"> -->
		<input type="submit" value="수정">
	</form>
 
</body>
</html>