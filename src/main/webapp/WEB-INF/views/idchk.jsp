<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>아이디중복체크</title>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
	rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Abel|Satisfy'
	rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/resources/default.css"
	rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	var idRegExp = /^[a-zA-Z0-9]{5,20}$/;
	$(document).ready(function() {

		$('#inputid').keyup(function() {
			if ($(this).val().length > 20) {
				alert('아이디 제한 길이 초과');
				$(this).val($(this).val().substr(0, 20));
			}
		});

	});
	function idchk() {
		if ($.trim($("#inputid").val()) == "") {
			alert("회원아이디를 입력하세요!");
			$("#inputid").val("").focus();
			return false;
		}
		if (!idRegExp.test($.trim($("#inputid").val()))) {
			alert("아이디는 영문 대소문자와 숫자 5~20자리로 입력해야합니다!");
			$("#inputid").val("").focus();
			return false;
		}
	}
	function selectnow() {
		var id = document.getElementById('id').value;
		opener.document.userInfo.id.value = id;
		opener.document.userInfo.checkedid.value = id;
		parent.window.close();
	}
</script>
</head>

<body>
	<h2 align="center">중복확인</h2>
	<br />
	<c:set var="chk" value="${chk }"></c:set>
	<c:if test="${chk>0 }">
		<h3 align="center">사용 불가능한 아이디 입니다.</h3>
		<form action="idchk.do" onsubmit="return idchk()">
			<div align="center">
				<br> <input type="text" name="id" id="inputid"
					style="height: 46px; padding: 8px;">
				<button type="submit">중복체크</button>
			</div>
		</form>
	</c:if>
	<c:if test="${chk==0}">
		<h3 align="center">사용 가능한 아이디 입니다.</h3>

		<input type="hidden" name="id" value="${id }" id="id">
		<div align="center">
			<br>
			<button type="button" onclick="selectnow()">사용하기</button>
		</div>
	</c:if>
</body>
</html>