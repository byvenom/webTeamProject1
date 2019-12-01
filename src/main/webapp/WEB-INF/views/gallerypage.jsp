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
<body>
   <%@ include file="/WEB-INF/views/header.jsp"%>
   
   <c:set var="list" value="${Best }"></c:set>
   <c:set var="list2" value="${Best2 }"></c:set>
   <c:set var="list3" value="${Best3 }"></c:set>
   
   <div id="footer-wrapper">
      <div id="footer-content">
         <div id="fbox11">
            <h2>
               <span>강아지게시판</span> 인기글
            </h2>
            
            <ul class="style2">
               <c:forEach items="${list }" var="i">
               <li><a href="readcount.do?no=${i.getNo()}" style="text-decoration:none"><img src="${pageContext.request.contextPath}/resources/upload/${fn:substring(i.getUpload(),0,fn:indexOf(i.getUpload(),'/'))}" alt="" width="128" height="128" style="vertical-align: middle;"></img>
               <b>&nbsp;&nbsp;&nbsp;${i.getTitle() }</b></a>
               
               </li>
               
               </c:forEach>
            </ul>
            <div style="width: 320px" align="center">
            <br><br>
           	<button type="button" onclick="location.href='dog_board.do?page=1'">상 세  게 시 판</button>
            </div>
         </div>
         <div id="fbox22">
            <h2>
               <span>고양이게시판</span> 인기글
            </h2>
            
            <ul class="style2">
               <c:forEach items="${list2 }" var="i">
               <li><a href="readcount.do?no=${i.getNo()}" style="text-decoration:none"><img src="${pageContext.request.contextPath}/resources/upload/${fn:substring(i.getUpload(),0,fn:indexOf(i.getUpload(),'/'))}" alt="" width="128" height="128" style="vertical-align: middle;"></img>
               <b>&nbsp;&nbsp;&nbsp;${i.getTitle() }</b></a>
               
               </li>
               
               </c:forEach>
            </ul>
            <div style="width: 320px" align="center">
            <br><br>
            <button type="button" onclick="location.href='cat_board.do?page=1'">상 세  게 시 판</button>
            </div>
         </div>
         <div id="fbox33">
             <h2>
               <span>자유게시판</span> 인기글
            </h2>
            
            <ul class="style2">
               <c:forEach items="${list3 }" var="i">
               <li><a href="readcount.do?no=${i.getNo()}" style="text-decoration:none"><img src="${pageContext.request.contextPath}/resources/upload/${fn:substring(i.getUpload(),0,fn:indexOf(i.getUpload(),'/'))}" alt="" width="128" height="128" style="vertical-align: middle;"></img>
               <b>&nbsp;&nbsp;&nbsp;${i.getTitle() }</b></a>
               
               </li>
               
               </c:forEach>
            </ul>
            <div style="width: 320px" align="center">
            <br><br>
            <button type="button" onclick="location.href='free_board.do?page=1'">상 세  게 시 판</button>
            </div>
         </div>
         </div>
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