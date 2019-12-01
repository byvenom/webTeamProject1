<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div id="post_ok" align="center">
<p>문의 신청이 완료되었습니다.</p>
<button name="ok" value="돌아가기" onclick="location.href='main.jsp'" >돌아가기</button>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>