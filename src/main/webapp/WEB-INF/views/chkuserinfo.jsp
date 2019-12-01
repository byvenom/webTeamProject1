<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 확인</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
	rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Abel|Satisfy'
	rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/resources/default.css"
	rel="stylesheet" type="text/css" media="all" />
</head>
<body>
   <%@ include file="/WEB-INF/views/header.jsp"%>
   <c:set var="info" value="${dto }"></c:set>
   <div id="footer-wrapper">
		<div id="footer-content">
			<div align="center">
				<c:if test="${!empty info}">
					<table style="font-size: 24px;">

						<tr>
							<th align="left">아이디 :</th>
							<td colspan="2">${info.getId() }<br></td>

						</tr>
						<tr>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th align="left">비밀번호 :</th>
							<td colspan="2">${info.getPwd() }<br></td>

						</tr>
						<tr>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th align="left">닉네임 :</th>
							<td colspan="2">${info.getNickname() }</td>
						</tr>
						<tr>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th align="left">성별 :</th>
							<td colspan="2">${info.getGender() }</td>
						</tr>
						<tr>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th align="left">생년월일 :</th>
							<td colspan="2">${info.getBirth() }</td>
						</tr>
						<tr>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th align="left">휴대폰번호 :</th>
							<td colspan="2">${info.getPhone() }</td>
						</tr>
						<tr>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th align="left">주소 :</th>
							<td colspan="2">${info.getAddr() }</td>
						</tr>
					</table>
				</c:if>
				<br>
				<br>
				<div>
					<button type="button" onclick="location.href='login.do'">로 그 인 페 이 지</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='main.do'">메 인 페 이 지</button>
				</div>
			</div>
		</div>
	</div>
  

   <%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>