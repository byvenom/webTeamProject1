<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.pet.model.memberDTO"%>
<%@page import="com.pet.model.PetDaoImpl"%>
<%@page import="com.pet.model.PetDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>닉네임 중복체크</title>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
	rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Abel|Satisfy'
	rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/resources/default.css"
	rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
var nicknameRegExp = /^[가-힣a-zA-Z0-9]{2,8}$/;
$(document).ready(function() {
    
    
    $('#nickname').keyup(function(){
        if ($(this).val().length > 8) {
            alert('닉네임 제한 길이 초과');
            $(this).val($(this).val().substr(0, 8));
        }
    });
   



}); 
function selectnow(){
      var nick = document.getElementById('nick').value;
      opener.document.userInfo.nickname.value=nick;
      opener.document.userInfo.checkednickname.value=nick;
      parent.window.close();
   }
   function nickchk(){
	   if($.trim($("#nickname").val())==""){
		      alert("회원닉네임을 입력하세요!");
		      $("#nickname").val("").focus();
		      return false;
		     }
		   if (!nicknameRegExp.test($.trim($("#nickname").val()))) {
		       alert("닉네임은 한글,영문 대소문자와 숫자 2~8자리 입력 가능합니다.!");
		       $("#nickname").val("").focus();
		       return false;
		   }
	   }
</script>
</head>

<body>
	<h2 align="center">중복확인</h2>
	<br />
	<c:set var="chk" value="${chk }"></c:set>
	<c:if test="${chk>0 }">
		<h3 align="center">사용 불가능한 닉네임 입니다.</h3>
		<form action="nickchk.do" onsubmit="return nickchk()">
			<div align="center">
				<br> <input type="text" id="nickname" name="nick" placeholder="2~8자리로 입력 해야 합니다."
					style="height: 46px; padding: 8px; width: 200px;" >
				<button type="submit">중복체크</button>
			</div>
		</form>
	</c:if>
	<c:if test="${chk==0}">
		<h3 align="center">사용 가능한 닉네임 입니다.</h3>
		<input type="hidden" name="nick" value="${nick }" id="nick">
		<div align="center">
			<br>
			<button type="button" onclick="selectnow()">사용하기</button>
		</div>
	</c:if>
</body>
</html>