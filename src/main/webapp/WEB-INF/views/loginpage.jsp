<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
function chkval(){
	var idRegExp = /^[a-zA-Z0-9]{5,20}$/;
	var pwdRegExp = /^[a-zA-Z0-9]{8,16}$/;
	
	if($.trim($("#id").val())==""){
  		alert("회원아이디를 입력하세요!");
  		$("#id").val("").focus();
  		return false;
  	}
	/* if (!idRegExp.test($.trim($("#id").val()))) {
        alert("아이디는 영문 대소문자와 숫자 5~20자리로 입력해야합니다!");
        $("#id").val("").focus();
        return false;
    } */
  	if($.trim($("#pwd").val())==""){
  		alert("비밀번호를 입력하세요!");
  		$("#pwd").val("").focus();
  		return false;
  	}
	/* if (!pwdRegExp.test($.trim($("#pwd").val()))) {
        alert("비밀번호는 영문 대소문자와 숫자 8~16자리로 입력해야합니다!");
        $("#pwd").val("").focus();
        return false;
    } */
}

function goJoinForm(){
location.href="registerterms.do"
	
}

</script>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<div id="footer-wrapper">
	<div id="footer-content">
		<h2>로그인</h2>
		<br/>
		<br/>
		<div align="center">
		<form method="post" action="logintry.do" onsubmit="return chkval()">
			<table>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="id" maxlength="20" id="id"></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pwd" maxlength="20" id="pwd"></td>
                </tr>
            </table>
            <br>
            <button type="submit">로 그 인</button>
            &nbsp;&nbsp;&nbsp;
            <button type="button"  onclick="goJoinForm()" >회 원 가 입</button>
		</form>
        </div>
	</div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>