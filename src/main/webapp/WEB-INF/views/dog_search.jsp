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
<link
   href="${pageContext.request.contextPath}/resources/default.css?ver=1"
   rel="stylesheet" type="text/css" media="all" />
</head>
<body>
   <%@ include file="/WEB-INF/views/header.jsp"%>


   <div id="footer-wrapper">
      <div id="footer-content">
         <div id="fbox4">
            <h2 align="center">
               강아지 <span>게시판</span>
            </h2>


            <table border="1" width="1000" cellspacing="0">

               <tr>
                  <th style="border:5px outset lightgray;">번호</th>
                  <th style="border:5px outset lightgray;">카테고리</th>
                  <th style="border:5px outset lightgray;">제목</th>
                  <th style="border:5px outset lightgray;">작성자</th>
                  <th style="border:5px outset lightgray;">작성일</th>
                  <th style="border:5px outset lightgray;">추천</th>
                  <th style="border:5px outset lightgray;">조회수</th>
               </tr>

               <c:set var="list" value="${List }"></c:set>
               <c:if test="${!empty list }">
                  <c:forEach items="${list }" var="i">
                     <tr>
                        <td align="center" style="border: hidden;">${i.getNo() }</td>
                        <td align="center" style="border: hidden;"><c:if
                              test="${i.getCate().equals('dog')}">
                        강아지</c:if></td>
                                 <!-- cont.do?qwe=0 -->
                        <td style="border: hidden;"><a href="readcount.do?no=${i.getNo()}" style="text-decoration:none"><img
                           src="${pageContext.request.contextPath}/resources/upload/${fn:substring(i.getUpload(),67,fn:indexOf(i.getUpload(),'/'))}"
                           alt="" width="72" height="54" style="vertical-align: middle;"></img>
                           &nbsp;&nbsp;&nbsp;<b>${i.getTitle() }</b></a></td>
                        <td align="center" style="border: hidden;">${i.getWriter() }</td>
                        <td align="center" style="border: hidden;">${fn:substring(i.getRegdate(),5,10) }</td>
                        <td align="center" style="border: hidden;">${i.getUp() }</td>
                        <td align="center" style="border: hidden;">${i.getHit() }</td>
                     </tr>


                  </c:forEach>
               </c:if>
               <c:if test="${empty list }">
                  <tr>
                     <td colspan="7" align="center">
                        <br><br>
                        <h2>검색된 레코드가 없습니다.</h2></td>
                  </tr>
               </c:if>
            </table>
            <div align="center">
               <br> <br>
					<c:if test="${!(userid==null || userid=='')}"><button type="button" onclick="location.href='dog_insert.do'">글
						작 성</button></c:if>
					<c:if test="${userid==null || userid==''}"><button type="button" onclick="location.href='login.do'">글
						작 성</button></c:if>	
					&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='main.do'">홈
						으 로</button>
					<br> <br>
               
               <c:if test="${page > block }">
                [<a href="dog_search.do?page=1&find_field=${find_field}&find_name=${find_name}">◀◀</a>]
                [<a href="dog_search.do?page=${startBlock-1 }&find_field=${find_field}&find_name=${find_name}">◀</a>]
             </c:if>
             
             <c:forEach begin="${startBlock }" end="${endBlock }" var="i">
                <c:if test="${i == page }">
                   <u><b>[${i }]</b></u>
                
                </c:if>
                <c:if test="${!(i == page) }">
                   [<a href="dog_search.do?page=${i }&find_field=${find_field}&find_name=${find_name}">${i }</a>]
                
                </c:if>
             </c:forEach>
                
                <c:if test="${endBlock < allPage }">
                   [<a href="dog_search.do?page=${endBlock +1 }&find_field=${find_field}&find_name=${find_name}">▶</a>]
                   [<a href="dog_search.do?page=${allPage }&find_field=${find_field}&find_name=${find_name}">▶▶</a>]
                </c:if>
            </div>
            
         </div>

      </div>
   </div>
   <div id="page-wrapper">
      <div id="page">
         <div id="content" style="height: 24px">
            <div>
               <form method="get"
                  action="<%=request.getContextPath()%>/dog_search.do">
                  <input type="hidden" value=${page } name="page">
                  <select name="find_field" style="height: 40px; padding: 5px;">
                     <c:if test="${find_field.equals('Title') }"><option value="Title" selected="selected">제목</option></c:if>
                     <c:if test="${!find_field.equals('Title') }"><option value="Title">제목</option></c:if>
                     <c:if test="${find_field.equals('Cont') }"><option value="Cont" selected="selected">내용</option></c:if>
                     <c:if test="${!find_field.equals('Cont') }"><option value="Cont">내용</option></c:if>
                     <c:if test="${find_field.equals('Title_Cont') }"><option value="Title_Cont" selected="selected">제목+내용</option></c:if>
                     <c:if test="${!find_field.equals('Title_Cont') }"><option value="Title_Cont">제목+내용</option></c:if>
                     <c:if test="${find_field.equals('Writer') }"><option value="Writer" selected="selected">작성자</option></c:if>
                     <c:if test="${!find_field.equals('Writer') }"><option value="Writer">작성자</option></c:if>
                  </select> &nbsp;&nbsp; <input type="text" name="find_name"
                     style="height: 35px;padding: 2px; width: 240px;" value="${find_name }"> &nbsp;&nbsp; <button type="submit">검 색</button>
               </form>
            </div>
         </div>
         <div id="sidebar">
            <h2></h2>

         </div>
      </div>
   </div>
   <%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>