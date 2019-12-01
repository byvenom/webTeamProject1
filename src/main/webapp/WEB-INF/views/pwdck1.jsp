<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>회원가입</title>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
	rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Abel|Satisfy'
	rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/resources/default.css"
	rel="stylesheet" type="text/css" media="all" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script>
	function update(i){
		$(function(){
			var a=$("#pwdck").val();
			if(a==i){
				var f = document.updatemember;
				f.action = "/web/memberupdate.do"
				f.method= "post"
				f.submit();
				}
			else{
				alert("비밀번호를 확인해주세요!");
				}
			});
		
		}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div style="height: 250px;"></div>
	<div id="footer-wrapper">
		<div id="footer-content">
			<div align="center">
				
				<table border="0" width="600">
				<tr>
				<th style="font-size: 24px;">비밀번호 확인</th>
				<td><input type="password" name="pwdck" id="pwdck" style="width: 200px;height: 20px;"></td>
				</tr>
				<tr><td><br><br></td></tr>
				<tr><td colspan="2" align="center"><button type="button" onclick="update('${pwd}')">확 인</button>&nbsp;&nbsp;&nbsp;<button type="button" onclick="location.href='mypage.do?id=${id}'">이 전</button></td></tr>
				</table>
				<form name="updatemember">
                  <input type="hidden" name="id" value="${userid }">
                  
              	</form>
			</div>
		</div>
	</div>
	<div style="height: 250px;"></div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>