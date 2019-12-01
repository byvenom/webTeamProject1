<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
     if($.trim($("#nickname").val())!=$.trim($("#checkednickname").val())){
      alert('닉네임을 중복체크 해주세요.');
      return false;
     }
}

   
function nickchk(){
   if($.trim($("#nickname").val())==""){
      alert("회원닉네임을 입력하세요!");
      $("#nickname").val("").focus();
      return;
     }
   if (!nicknameRegExp.test($.trim($("#nickname").val()))) {
       alert("닉네임은 한글,영문 대소문자와 숫자 2~8자리 입력 가능합니다.!");
       $("#nickname").val("").focus();
       return;
   }
     url = "nickchk.do?nick="+document.userInfo.nickname.value;
     open(url, "닉네임중복 확인","toolbar=no, location= no, status=no,scrollbars=no,resizable=no,"+"width="+w+",height="+h+",top="+TopPosition+",left="+LeftPosition);
}
</script>
</head>
<body>

   <%@ include file="/WEB-INF/views/header.jsp"%>
   <div id="footer-wrapper">
      <div id="footer-content">
      <form method="post" name="userInfo" onsubmit="return checkValue()" action="<%=request.getContextPath() %>/ok_memberupdate.do">
         <input type="hidden" name="id" value="${userid }">
         <c:set var="info" value="${dto }"></c:set>
         <input type="hidden" id="checkednickname" value="${info.getNickname() }">
         <input type="hidden" name="backnickname" value="${info.getNickname() }">
         <table>
         	<tr><th align="left">패 스 워 드</th></tr>
            <tr>
               <td colspan="2"><input class="input_insert" type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요.(영문 대소문자와 숫자 8~16자리로 입력해야합니다!)"></td>
            </tr>
            <tr><th align="left">패 스 워 드  확 인</th></tr>
            <tr>
               <td colspan="2"><input class="input_insert" type="password" name="pwdchk"
                  id="pwdchk"  placeholder="비밀번호 확인을 입력해주세요."></td>
            </tr>
            <tr><th align="left">이 름</th>
            </tr>
            <tr>
               <td colspan="2"><input type="text" value="${info.getName() }" class="input_insert" readonly></td>
            </tr>
            <tr><th align="left">닉 네 임</th></tr>
            <tr>
               
               <td><input type="text" name="nickname" id="nickname" value="${info.getNickname() }" class="input_insert"></td>
               <td><button type="button" onclick="nickchk()">중 복 확 인</button></td>
            </tr>
            <tr><th align="left">생 년 월 일</th></tr>
            <tr>
               
               <td colspan="2"><input type="text" name="birth" class="input_insert"
                  placeholder="8자리입력 " id="birth" value="${info.getBirth() }"></td>
            </tr>
            <tr><th align="left">핸 드 폰 번 호</th></tr>
            <tr>
               
               <td colspan="2"><input type="text" name="phone" class="input_insert"
                  placeholder="***-****-****식" id="phone" value="${info.getPhone() }"></td>
            </tr>
            <tr><th align="left">주 소</th></tr>
            <tr>
               
               <td colspan="2"><input type="text" name="addr" id="addr" value="${info.getAddr() }" class="input_insert"></td>
            </tr>
            <tr align="center">
               <td colspan="3"><button type="submit" >변 경 하 기</button>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  <button type="button"  onclick="location.href='mypage.do?id=${userid}'">취 소</button></td>
            </tr>
         </table>
         </form>
      </div>
   </div>


   <%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>