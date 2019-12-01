<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Uncovered 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20120927

-->
<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>이개뭐냥</title>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
	rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Abel|Satisfy'
	rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/resources/default.css"
	rel="stylesheet" type="text/css" media="all" />
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
var sel_files = [];

$(document).ready(function() {
    $("#input_imgs").on("change", handleImgsFilesSelect);
    $('#title').keyup(function(){
        if ($(this).val().length > 66) {
            alert('제목 제한 길이 초과');
            $(this).val($(this).val().substr(0, 66));
        }
    });
    $('#cont').keyup(function(){
        if ($(this).val().length > 1333) {
            alert('내용 제한 길이 초과');
            $(this).val($(this).val().substr(0, 1333));
        }
    });



}); 
function checkValue(){
	if($.trim($("#title").val())==""){
  		alert("제목을 입력하세요!");
  		$("#title").val("").focus();
  		return false;
  	}
	
}
function handleImgsFilesSelect(e) {
   var sel_files = [];
 $(".imgs_wrap2").empty();
   
    var files = e.target.files;
     var filesArr = Array.prototype.slice.call(files); 
    
    var a=parseInt($('#end').val());
    var b=parseInt($('#chc').val());
 var c=a;
  
    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")){
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
            }

        sel_files.push(f);

        var reader = new FileReader();
        reader.onload = function(e) {

           var img_html ="";
           a+=1;
           img_html += "<img id='img"+a+"' alt='' width='100' height='100' src='" + e.target.result + "'>&nbsp;";
 
            $('#end').val(a); 
            $(".imgs_wrap2").append(img_html);

        }
        reader.readAsDataURL(f);
    });
}
</script>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div id="footer-wrapper">
		<div id="footer-content" style="height: 1000px">
			<div id="fbox4">
				<h2 align="center">
					강아지 <span>게시판 글 작성</span>
				</h2>
				<form id="sub1" method="post" onsubmit="return checkValue()" 
					action="<%=request.getContextPath()%>/dog_insert_ok.do"
					enctype="multipart/form-data">
					<table width="1000" border="1" cellspacing="0" cellpadding="0">
						<tr>
							<th>작성자</th>
							<td><input name="writer" value="${ nickname}" style="width: 930px"
								readonly="readonly"></input></td>
						</tr>
						<tr>
							<th>게시판 종류</th>
							<td><select name="cate" style="height: 24px"
								disabled="disabled">
									<option value="dog" selected="selected">강아지</option>
							</select></td>
						</tr>
						<tr>
							<th>제 목</th>
							<td><input type="text" name="title" style="width: 930px"
								id="title"></input></td>
						</tr>
						<tr>
							<th>내 용</th>
							<td><textarea rows="40" cols="30" name="cont" id="cont"
									style="width: 930px; resize: none"></textarea></td>
						</tr>
						<tr>
							<th>사 진</th>
							<td><label>[사진 등록]
							<input multiple="multiple" type="file" name="file" id="input_imgs" alt="" style="display: none;" accept=".jpg" ></input> </label><div class="imgs_wrap2">
                           &nbsp;
                        </div> </td>
						</tr>
					</table>
					<div align="center">
						<br><br>
						<button type="submit">글 작 성</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" onclick="location.href='main.do'">홈
						으 로</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<div id="page-wrapper">
		<div id="page">
			<div id="content" style="height: 24px"></div>
			<div id="sidebar">
				<h2></h2>

			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>