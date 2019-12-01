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
<script>
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<c:set var="user" value="${dto }"></c:set>
	<div id="footer-wrapper">
		<div id="footer-content">
			<div align="center">
				<c:if test="${!empty user}">
					<table style="font-size: 30px;">

						<tr>
							<th align="left">아이디 :<br><br></th>
							<td colspan="2" style="border: none;">${user.getId() }<br><br></td>

						</tr>
						<tr>
							<th align="left">닉네임 :<br><br></th>
							<td colspan="2" style="border: none;">${user.getNickname() }<br><br></td>
						</tr>
						<tr>
							<th align="left">성별 :<br><br></th>
							<td colspan="2" style="border: none;">${user.getGender() }<br><br></td>
						</tr>
						<tr>
							<th align="left">생년월일 :<br><br></th>
							<td colspan="2" style="border: none;">${user.getBirth() }<br><br></td>
						</tr>
						<tr>
							<th align="left">휴대폰번호 :<br><br></th>
							<td colspan="2" style="border: none;">${user.getPhone() }<br><br></td>
						</tr>
						<tr>
							<th align="left">주소 :<br><br></th>
							<td colspan="2" style="border: none;">${user.getAddr() }<br><br></td>
						</tr>

					</table>
					<br>
					<br>
					<div align="center" style="display: flex;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
					
						<form method="post"
							action="<%=request.getContextPath()%>/pwdck1.do">
							<input type="hidden" name="id" value="${dto.getId() }"> <input
								type="hidden" name="pwd" value="${dto.getPwd() }">
							<button type="submit">회 원 정 보 변 경</button>
						</form>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<form method="post" 
							action="<%=request.getContextPath()%>/pwdck2.do">
							<input type="hidden" name="id" value="${dto.getId() }"> <input
								type="hidden" name="pwd" value="${dto.getPwd() }">
							<button type="submit">회 원 탈 퇴</button>
						</form>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<div style="height: 120px;"></div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>