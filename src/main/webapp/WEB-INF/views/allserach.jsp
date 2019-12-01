<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<!-- 
<html xmlns="http://www.w3.org/1999/xhtml"> -->
<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>갤러리</title>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
	rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Abel|Satisfy'
	rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/resources/default.css"
	rel="stylesheet" type="text/css" media="all" />
<!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->

</head>
<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}



</script>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<c:set var="list1" value="${list1 }"></c:set>
	<c:set var="list2" value="${list2 }"></c:set>
	<c:set var="list3" value="${list3 }"></c:set>


	<div id="footer-wrapper">
		<div id="footer-content" style="margin-bottom:50px;border-bottom: 1px solid #e8e8e8;">
		<h2 style="padding-top: 50px;border-top: 1px solid #e8e8e8;">게시판</h2>
			<c:if test="${!empty list1 }">
			<c:forEach items="${list1 }" var="i">
			<div>
			
			<c:if test="${i.getUpload() !=null }"><div style="width:128px;float: left;" ><a href="readcount.do?no=${i.getNo()}"><img src="${pageContext.request.contextPath}/resources/upload/${fn:substring(i.getUpload(),0,fn:indexOf(i.getUpload(),'/'))}"alt=""width="128" height="96" style="vertical-align: top;border: 1px solid #e8e8e8;" ></a></div></c:if><div style="width:800px; height:96px;"><font>&nbsp;<a href="readcount.do?no=${i.getNo()}" style="font-size:13;color: blue;">${i.getTitle() }</a> - (${i.getWriter() }) &nbsp;&nbsp;&nbsp;${fn:substring(i.getRegdate(),0,10 )}
			<br>&nbsp;${i.getCont() }</font></div>
			
			</div><br>
			</c:forEach>
			</c:if>
			<c:if test="${empty list1 }">
			<b style="font-size: 24px">검색 결과없음</b>
			
			</c:if>
			
		<h2 style="padding-top: 50px;border-top: 1px solid #e8e8e8;">시설정보</h2>
			<c:if test="${!empty list2 }">
			<c:forEach items="${list2 }" var="i">
			<div>
			<c:if test="${i.getPhoto()!=null }"><div style="width:128px;float: left;" ><img src="${pageContext.request.contextPath}/resources/upload/${fn:substring(i.getPhoto(),0,fn:indexOf(i.getPhoto(),'/'))}"alt=""width="128" height="96" style="vertical-align: top;border: 1px solid #e8e8e8;" ></div></c:if><div style="width:800px; height:96px;"><font>&nbsp;${i.getTitle() }
			<br>&nbsp;${i.getCont() }</font></div>
			</div><br>
			</c:forEach>			
			</c:if>
			<c:if test="${empty list2 }">
			<b style="font-size: 24px">검색 결과없음</b>
			
			</c:if>
		<h2 style="padding-top: 50px;border-top: 1px solid #e8e8e8;">마켓</h2>
			<c:if test="${!empty list3 }">
			<c:set value="1" var="index"></c:set>
			<c:forEach items="${list3 }" var="i">
			<div style="float:left; padding: 5px;">
			<c:if test="${i.getImage() !=null }"><div style="width:128px;float: left;" ><a href="itemCont.do?no=${i.getNo()}"><img src="${pageContext.request.contextPath}/resources/upload/${fn:substring(i.getImage(),0,fn:indexOf(i.getImage(),'/'))}"alt=""width="120" height="96" style="vertical-align: top;padding: 1px; border-right: 1px solid #e8e8e8;" ></a></div></c:if><div style="width:350px; height:96px; border: 1px solid #e8e8e8;"><font size="2"><br><a href="itemCont.do?no=${i.getNo() }" style="color: blue;">${i.getName() }</a><br>
			<font style="color: red;">${i.getPrice() }원</font>
			<br>${i.getSup() }</font></div>
			
			</div><c:if test="${index%2==0 }"><br></c:if>
			<c:set value="${index+1 }" var="index"></c:set>
			</c:forEach>			
			</c:if>
			<c:if test="${empty list3 }">
			<b style="font-size: 24px">검색 결과없음</b>
			</c:if>
		</div>
	</div>
	
	<%--    <div id="page-wrapper">
      <div id="page">
         <div id="content">
            <div>
               <form method="post"
                  action="<%=request.getContextPath()%>/board_search.do">
                  <select name="find_field" style="height: 24px" >
                     <option value="title">제목</option>
                     <option value="cont">내용</option>
                     <option value="title_cont">제목+내용</option>
                     <option value="writer">작성자</option>
                  </select>
                  &nbsp;&nbsp;
                  <input type="text" name="find_name" style="height: 24px">
                     <button type="submit">검 색</button>
               </form>
            </div>
         </div>
         <div id="sidebar">
            <h2></h2>

         </div>
      </div>
   </div> --%>

	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>