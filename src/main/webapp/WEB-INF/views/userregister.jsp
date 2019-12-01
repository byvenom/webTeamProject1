<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
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
var idRegExp = /^[a-zA-Z0-9]{5,20}$/;
var pwdRegExp = /^[a-zA-Z0-9]{8,16}$/;
var nameRegExp = /^[가-힣]{2,4}$/;
var nicknameRegExp = /^[가-힣a-zA-Z0-9]{2,8}$/;
var phoneRegExp = /^(01[016789]{1}|02|0[3-6]{1}[0-5]{1})-([0-9]{3,4})-([0-9]{4})$/;
var w = 600; //팝업창의 너비
var h = 275; //팝업창의 높이
var LeftPosition=(screen.width-w)/2;
var TopPosition=(screen.height-h)/2;
$(document).ready(function() {
    
    $('#id').keyup(function(){
        if ($(this).val().length > 20) {
            alert('아이디 제한 길이 초과');
            $(this).val($(this).val().substr(0, 20));
        }
    });
    $('#pwd').keyup(function(){
        if ($(this).val().length > 16) {
            alert('비밀번호 제한 길이 초과');
            $(this).val($(this).val().substr(0, 16));
        }
    });
    $('#pwdchk').keyup(function(){
        if ($(this).val().length > 16) {
            alert('비밀번호확인 제한 길이 초과');
            $(this).val($(this).val().substr(0, 16));
        }
    });
    $('#name').keyup(function(){
        if ($(this).val().length > 4) {
            alert('이름 제한 길이 초과');
            $(this).val($(this).val().substr(0, 4));
        }
    });
    $('#nickname').keyup(function(){
        if ($(this).val().length > 8) {
            alert('닉네임 제한 길이 초과');
            $(this).val($(this).val().substr(0, 8));
        }
    });
    $('#birth').keyup(function(){
        if ($(this).val().length > 8) {
            alert('생년월일 제한 길이 초과');
            $(this).val($(this).val().substr(0, 8));
        }
    });
    $('#phone').keyup(function(){
        if ($(this).val().length > 13) {
            alert('전화번호 제한 길이 초과');
            $(this).val($(this).val().substr(0, 13));
        }
    });
    $('#addr').keyup(function(){
        if ($(this).val().length > 66) {
            alert('주소 제한 길이 초과');
            $(this).val($(this).val().substr(0, 66));
        }
    });



}); 
function checkValue(){
	
	if($.trim($("#id").val())==""){
  		alert("회원아이디를 입력하세요!");
  		$("#id").val("").focus();
  		return false;
  	}
	if (!idRegExp.test($.trim($("#id").val()))) {
        alert("아이디는 영문 대소문자와 숫자 5~20자리로 입력해야합니다!");
        $("#id").val("").focus();
        return false;
    }
  	if($.trim($("#pwd").val())==""){
  		alert("비밀번호를 입력하세요!");
  		$("#pwd").val("").focus();
  		return false;
  	}
	if (!pwdRegExp.test($.trim($("#pwd").val()))) {
        alert("비밀번호는 영문 대소문자와 숫자 8~16자리로 입력해야합니다!");
        $("#pwd").val("").focus();
        return false;
    }
  	if($.trim($("#pwdchk").val())==""){
  		alert("비밀번호확인칸을 입력하세요!");
  		$("#pwdchk").val("").focus();
  		return false;
  	}
  	if($.trim($("#pwd").val()) 
  			!= $.trim($("#pwdchk").val())){
  		alert("비밀번호가 일치하지 않습니다!");
  		$("#pwd").val("");//비번 입력창 초기화
  		$("#pwdchk").val("");
  		$("#pwd").focus();//비번입력창으로 초기화
  		return false;
  	}
  	if($.trim($("#name").val())==""){
  		alert("회원이름을 입력하세요!");
  		$("#name").val("").focus();
  		return false;
  	}
	if (!nameRegExp.test($.trim($("#name").val()))) {
        alert("이름은 한글 2~4글자만 입력 가능합니다.");
        $("#name").val("").focus();
        return false;
    }
  	if($.trim($("#nickname").val())==""){
  		alert("회원닉네임을 입력하세요!");
  		$("#nickname").val("").focus();
  		return false;
  	}
  	if($.trim($("#birth").val())==""){
  		alert("생년월일 입력하세요!");
  		$("#birth").val("").focus();
  		return false;
  	}
  	if(isNaN($.trim($("#birth").val()))){
        alert("생년월일은 숫자만 입력 가능합니다.");
        alert("생년월일 입력하세요!");
  		$("#birth").val("").focus();
        return false;
    }
  	if($.trim($("#birth").val()).length != 8) {
		/* var warningTxt = 
		 '<font color="red">생년월일은 8자여야 합니다.</font>';
		$("#idcheck").text('');  // idcheck 영역 초기화
		$("#idcheck").show();  // span 태그 idcheck 영역을 보이자
		$("#idcheck").append(warningTxt);
		$("#member_id").val('').focus(); */
		 alert("생년월일을 8자 입력 해주세요.");
		alert("생년월일 입력하세요!");
  		$("#birth").val("").focus();
		return false;
	};
  	var data = $.trim($("#birth").val());
	var y = parseInt(data.substr(0, 4), 10);
	var m = parseInt(data.substr(4, 2), 10);
	var d = parseInt(data.substr(6, 2), 10);
	var dt = new Date(y, m-1, d);
  	if(dt.getDate() != d) { alert("일이 유효하지 않음"); return false}
	else if(dt.getMonth()+1 != m) { alert("월이 유효하지 않음"); return false}
	else if(dt.getFullYear() != y) { alert("년도가 유효하지 않음"); return false}
  	if($.trim($("#phone").val())==""){
  		alert("전화번호를 입력하세요!");
  		$("#phone").val("").focus();
  		return false;
  	}
	if (!phoneRegExp.test($.trim($("#phone").val()))) {
        alert("전화번호를 확인해 주세요.");
        $("#phone").val("").focus();
        return false;
    }
  	if($.trim($("#addr").val())==""){
  		alert("주소를 입력하세요!");
  		$("#addr").val("").focus();
  		return false;
  	}
  	if($.trim($("#id").val())!=$.trim($("#checkedid").val())){
		alert('아이디를 중복체크 해주세요.');
		return false;
  	}
  	if($.trim($("#nickname").val())!=$.trim($("#checkednickname").val())){
		alert('닉네임을 중복체크 해주세요.');
		return false;
  	}
}


function idchk(){
   if($.trim($("#id").val())==""){
        alert("회원아이디를 입력하세요!");
        $("#id").val("").focus();
        return;
     }
   if (!idRegExp.test($.trim($("#id").val()))) {
        alert("아이디는 영문 대소문자와 숫자 5~20자리로 입력해야합니다!");
        $("#id").val("").focus();
        return ;
    }
     url = "idchk.do?id="+$.trim($("#id").val()); 
     open(url, "ID중복 확인","toolbar=no, location= no, status=no,scrollbars=no,"+"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
}
	
function nickchk(){
	if($.trim($("#nickname").val())==""){
		alert("회원 닉네임을 입력하세요!");
		$("#nickname").val("").focus();
		return;
  	}
   if (!nicknameRegExp.test($.trim($("#nickname").val()))) {
        alert("닉네임은 한글,영문 대소문자와 숫자 2~8자리 입력 가능합니다.!");
        $("#nickname").val("").focus();
        return ;
    }
  	url = "nickchk.do?nick="+document.userInfo.nickname.value;
  	open(url, "닉네임중복 확인","toolbar=no, location= no, status=no,scrollbars=no,resizable=no,"+"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>

	<div id="footer-wrapper">
		<div id="footer-content">
			<h2 align="center">회원가입</h2>
			
			<hr>
			<br><br>
			
			
			
			<form method="post" name="userInfo" onsubmit="return checkValue()" action="adduser.do">
			<input type="hidden" id="checkedid" value="admin">
			<input type="hidden" id="checkednickname" value="운영자">
			<table align="center">
				<tr><th align="left">아 이 디</th></tr>
				<tr>	
					<td><input type="text" name="id" id="id" class="input_insert" placeholder="아이디를 입력해주세요.(영문 대소문자와 숫자 5~20자리로 입력해야합니다!)">  </td>
					<td><button type="button" onclick="idchk()">중 복 확 인</button>
					</td>
				</tr>
				<tr><th align="left">비 밀 번 호</th></tr>
				<tr>
					
					<td colspan="2"><input type="password" name="pwd" id="pwd" class="input_insert" placeholder="비밀번호를 입력해주세요.(영문 대소문자와 숫자 8~16자리로 입력해야합니다!)"></td>
				</tr>
				<tr><th align="left">비 밀 번 호  확 인</th></tr>
				<tr>
					<td colspan="2"><input type="password" name="pwdchk" id="pwdchk" class="input_insert" placeholder="비밀번호 확인을 입력해주세요."></td>
				</tr>
				<tr><th align="left">이 름</th></tr>
				<tr>
					<td colspan="2"><input type="text" name="name" id="name" class="input_insert" placeholder="이름을 입력해주세요."></td>
				</tr>
				<tr>
				<th align="left">닉 네 임</th>
				
				</tr>
				<tr>
					<td><input type="text" name="nickname" id="nickname" class="input_insert" placeholder="닉네임을 입력해주세요.(한글,영문 대소문자와 숫자 2~8자리로 입력해야합니다!)"></td>
					<td><button type="button" onclick="nickchk()">중 복 확 인</button>
					
					</td>
				</tr>
				<tr>
				<th align="left">성 별</th>
				</tr>
				<tr>
					<td colspan="2">
					<input type="radio" value="남" checked="checked" name="gender" style="height:20px; width: 20px; vertical-align: middle; margin-bottom: 5px;">남자&nbsp;&nbsp;
					<input type="radio" value="여" name="gender" style="height:20px; width: 20px; vertical-align: middle;margin-bottom: 5px; ">여자
					<br>
					</td>
				</tr>
				<tr>
				<th align="left">생 년 월 일</th></tr>
				<tr>
					<td colspan="2"><input type="text" name="birth" placeholder="8자리를 입력해주세요." id="birth" class="input_insert" ></td>
				</tr>
				<tr>
				<th align="left">핸 드 폰 번 호</th></tr>
				<tr>
					<td colspan="2"><input type="text" name="phone" placeholder="***-****-**** 형식으로 입력하세요." id="phone" class="input_insert"></td>
				</tr>
				<tr><th align="left">주 소</th></tr>
				<tr>
					<td colspan="2"><input type="text" name="addr" id="addr" class="input_insert" placeholder="주소를 입력해주세요."></td>
				</tr>
				<tr align="center">
				
					<td colspan="3"><button type="submit">가 입</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button type="button"
						onclick="history.back()">취 소</button></td>
				</tr>
			</table>
			</form>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
