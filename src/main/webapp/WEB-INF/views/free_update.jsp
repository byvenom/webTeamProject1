<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 	
	//줄바꿈
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
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
$(document).ready(function() {
	  
    $('#title').keyup(function(){
        if ($(this).val().length > 66) {
            alert('제목 제한 길이 초과');
            $(this).val($(this).val().substr(0, 66));
        }
    });
    $('#cont').keyup(function(){
        if ($(this).val().length > 333) {
            alert('내용 제한 길이 초과');
            $(this).val($(this).val().substr(0, 333));
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
function deleteImg(i){
   var check = confirm("정말로 삭제 하시겠습니까???");
   var vi=document.getElementById("img"+i);
   if(check){
      /* document.getElementById("img"+i).style.display="none"; */
      document.getElementById("close"+i).style.display="none";
      document.getElementById("put"+i).value=vi.src;
      vi.src="";
      }
}


</script>

<body>
   <%@ include file="/WEB-INF/views/header.jsp"%>

   <c:set var="dto" value="${dto }"></c:set>
   <div id="footer-wrapper">
      <div id="footer-content" style="height: 1000px">
         <div id="fbox4">
            <h2 align="center">
               ${nickname }님<span>&nbsp;게시판 글 수정</span>
            </h2>
            <form id="sub1" method="post" onsubmit="return checkValue()"
               action="<%=request.getContextPath()%>/free_update_ok.do?bno=${dto.getNo()}"
               enctype="multipart/form-data" onsubmit="addput()">
               <input type="hidden" name="backfile" value="${dto.getUpload() }">
               <table width="1000" border="1" cellspacing="0" cellpadding="0">
                  <tr>
                     <th>작성자</th>
                     <td><input name="writer" value="${nickname }"
                        style="width: 930px" readonly="readonly"></input></td>
                  </tr>
                  <tr>
                     <th>게시판 종류</th>
                     <td><select name="cate" style="height: 24px"
                        disabled="disabled">
                        	<c:if test="${dto.getCate() eq 'free' }">
                           <option value="free" selected="selected">자유</option>
                        	</c:if>
                        	<c:if test="${dto.getCate() eq 'dog' }">
                           <option value="dog" selected="selected">강아지</option>
                        	</c:if>
                        	<c:if test="${dto.getCate() eq 'cat' }">
                           <option value="cat" selected="selected">고양이</option>
                        	</c:if>
                        	<c:if test="${dto.getCate() eq 'dogBy' }">
                           <option value="dogBy" selected="selected">강아지분양</option>
                        	</c:if>
                        	<c:if test="${dto.getCate() eq 'catBy' }">
                           <option value="catBy" selected="selected">고양이분양</option>
                        	</c:if>
                        	<c:if test="${dto.getCate() eq 'dogInfo' }">
                           <option value="dogBy" selected="selected">강아지정보</option>
                        	</c:if>
                        	<c:if test="${dto.getCate() eq 'catInfo' }">
                           <option value="catBy" selected="selected">고양이정보</option>
                        	</c:if>
                     </select></td>
                  </tr>
                  <tr>
                     <th>제 목</th>
                     <td><input type="text" name="title" style="width: 930px"
                        id="title" value="${dto.getTitle() }"></input></td>
                  </tr>
                  <tr>
                     <th>내 용</th>
                     <td><textarea rows="40" cols="30" name="cont" id="cont"
                           style="width: 930px; resize: none">${fn:replace(dto.getCont(), cn,br)}</textarea></td>
                  </tr>
                  <tr>
                     <th>사 진</th>
                     <td><input multiple="multiple" type="file" name="file"
                        id="file"><c:set var="checkimg" value="0"></c:set>
                     <input type="hidden" name="put" value="">
                        <c:forTokens items="${dto.getUpload() }"
                           delims="/" var="i">
                           <c:set var="checkimg" value="${checkimg+1}"></c:set>
                           <img id="img${checkimg }"alt="" width="100" height="100"
                              src="${pageContext.request.contextPath}/resources/upload/${fn:substring(i,0,fn:indexOf(i,'/')) }"></img>
                           <a href="#" onclick="deleteImg(${checkimg})" style="text-decoration: none;"> <img id="close${checkimg }"
                              src="${pageContext.request.contextPath}/resources/images/close.png"
                              width="15" height="15"
                              style="vertical-align: top; opacity: 0.7;"></a>
                              <input type="hidden" id="put${checkimg }" value="" name="put">&nbsp;
                     </c:forTokens></td>
                  </tr>
               </table>
               <div align="center">
						<br><br>
						<button type="submit">글 수 정</button>
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