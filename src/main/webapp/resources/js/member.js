  /* 기본 회원정보 체크 */


	  function mem_check(){
	  	if($.trim($("#id").val())==""){
	  		alert("회원아이디를 입력하세요!");
	  		$("#id").val("").focus();
	  		return false;
	  	}
	  	if($.trim($("#pwd").val())==""){
	  		alert("비밀번호를 입력하세요!");
	  		$("#pwd").val("").focus();
	  		return false;
	  	}
	  	if($.trim($("#pwdchk").val())==""){
	  		alert("비밀번호확인을 입력하세요!");
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
	  	if($.trim($("nickname").val())==""){
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
            return false;
            }
	  	if($.trim($("#phone").val())==""){
	  		alert("전화번호를 입력하세요!");
	  		$("#phone").val("").focus();
	  		return false;
	  	}
	  	if($.trim($("#addr").val())==""){
	  		alert("주소를 입력하세요!");
	  		$("#addr").val("").focus();
	  		return false;
	  	}
	  	
	  }
  /* 정보 수정 체크 */
  function member_check(){	
  	if($.trim($("#pwd").val())==""){
  		alert("비밀번호를 입력하세요!");
  		$("#member_pass").val("").focus();
  		return false;
  	}
  	if($.trim($("#pwdchk").val())==""){
  		alert("비밀번호확인을 입력하세요!");
  		$("#member_pass2").val("").focus();
  		return false;
  	}
  	if($.trim($("#pwd").val()) 
  			!= $.trim($("pwdchkmember_pass2").val())){
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
  	if($.trim($("#addr").val())==""){
  		alert("주소를 입력하세요!");
  		$("#addr").val("").focus();
  		return false;
  	}
  }