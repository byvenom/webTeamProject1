<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="item" value="${list }" />
<c:set var="maincate" value="${maincate }" />



<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>분양</title>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
   rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Abel|Satisfy'
   rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/resources/default.css"
   rel="stylesheet" type="text/css" media="all" />

<script type="">
function itemCont(a,b) {
 location.href="cont.do?no="+a+"&cpage="+b;
}
function showtitle(a){
	document.getElementById("title"+a).style.display="block";
}
function hidetitle(a){
	document.getElementById("title"+a).style.display="none";
}
function writepage(id){
	if(id==null){
		alert('로그인하세요');
		return;
	}
	var f = document.createElement("form");
	f.setAttribute("method","post");
	f.setAttribute("action","parceloutwrite.do");
	document.body.appendChild(f);
	var inp = document.createElement("input");
	inp.setAttribute("name","id");
	inp.setAttribute("value",id);
	f.appendChild(inp);
	f.submit();
}
</script>
</head>
<body>
   <%@ include file="/WEB-INF/views/header.jsp"%>
   
   <div align="center"
      style="overflow: hidden; width: 100%; height: 1102px; padding: 50px 0px;">
      <div align="left" style="overflow: hidden; width: 1100px; padding: 50px 0px;">
      <c:if test="${maincate eq 1 }">
         <button  class="market_button"style="background: pink;" >전체</button>
      </c:if>
      <c:if test="${maincate ne 1}">
         <button class="market_button"
            onclick="location.href='<%=request.getContextPath()%>/selectparce.do?maincate=1&page=1'">전체</button>
      </c:if>
      <c:if test="${maincate eq 2 }">
         <button class="market_button" style="background: pink;">강아지</button>
      </c:if>
      <c:if test="${maincate ne 2}">
         <button class="market_button"
            onclick="location.href='<%=request.getContextPath()%>/selectparce.do?maincate=2&page=1'">강아지</button>
      </c:if>
      <c:if test="${maincate eq 0 }">
         <button  class="market_button"style="background: pink;">고양이</button>
      </c:if>
      <c:if test="${maincate ne 0}">
         <button class="market_button"
            onclick="location.href='<%=request.getContextPath()%>/selectparce.do?maincate=0&page=1'">고양이</button>
      </c:if>
      </div>
     
      <div align="left" style="overflow: hidden; width: 1200px; height: 1102px; ">
      <c:if test="${!empty item}">
         <c:forEach items="${item}" var="p">
            <span onmouseover="showtitle(${p.getNo()})" onmouseout="hidetitle(${p.getNo()})" onclick="itemCont(${p.getNo()},${page })"
               style="background-image : url(/web/resources/upload/${fn:substring(p.getUpload(),0,fn:indexOf(p.getUpload(),'/'))}),url(/web/resources/upload/nopic.png); width: 200px; height: 300px; margin-left: 10px; margin-right: 10px; margin-bottom: 20px; display: inline-block; background-size:cover; ">
			   <p id="title${p.getNo() }" style="margin-top:250px; opacity:0.75; height:50px; width:200px; display:none; text-align:center; position:absolute;  background:gray; font-family: sans-serif; font-size: 20px; color: white;">${p.getTitle() }</p>
            </span>
         </c:forEach>
         <div align="center">
            <c:if test="${page > 3 }">
               [<a href="place.do?page=1&place=${no } ">◀◀</a>]
               [<a href="place.do?page=${start - 1 }&place=${no }">◀</a>]
            </c:if>
            <c:forEach begin="${start }" end="${end }" var="i">
               <c:if test="${i == page }">
                  <u> <b>[${i }]</b></u>
               </c:if>

               <c:if test="${!(i == page) }">
                  [<a
                     href="<%=request.getContextPath()%>/selectparce.do?maincate=${maincate }&page=${i }">${i }</a>]
               </c:if>
            </c:forEach>
            <c:if test="${end < all }">
               [<a
                  href="<%=request.getContextPath()%>/selectparce.do?maincate=${maincate }&page=${end + 1 }">▶</a>]
               [<a
                  href="<%=request.getContextPath()%>/selectparce.do?maincate=${maincate }&page=${all }">▶▶</a>]
            </c:if>
            <button style="float: right;" onclick="writepage('${userid}')">글쓰기</button>
         </div>
      </c:if>
      <c:if test="${empty item }">
         <div style="height: 800px;">
            <h1 style="font-family: sans-serif; font-size: 20px;">분양 목록이 
               없습니다.</h1>
         <button style="float: right;" onclick="writepage('${userid}')">글쓰기</button>
         </div>
      </c:if>
      </div>
   </div>
   <div></div>
   <%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>