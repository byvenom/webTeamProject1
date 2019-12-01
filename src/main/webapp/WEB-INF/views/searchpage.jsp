<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Uncovered 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20120927

-->
<html xmlns="http://www.w3.org/1999/xhtml">
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
<body>
   <%@ include file="/WEB-INF/views/header.jsp"%>

   <div id="footer-wrapper">
      <div id="footer-content">
         <div id="info">
            <h3>
               <span>동물정보입니다</span>
            </h3>
            <P>동물에 관한 정보를 알수있는 동물정보 게시판입니다.</P>
         </div>
         <br></br> <select>
            <option value="최신순">최신순</option>
            <option value="조회순">조회순</option>
            <option value="추천순">추천순</option>
         </select>
         <span style="float: right">
            <input type="button" value="글쓰기" onclick="location.href='write.jsp' "></button> &nbsp;&nbsp;&nbsp; 
            <input type="button" value="검색" onclick="location.href='search.jsp' "></button>
         </span>

         <table border="1" width=100% cellspacing="0">
            <tr>
               <th style="width :8%">글번호</th>
               <th style="width :60%">글제목</th>
               <th style="width :8%">글쓴이</th>
               <th style="width :8%">작성일자</th>
               <th style="width :8%">조회수</th>
               <th style="width :8%">추천수</th>
            </tr>
            <c:set var="catlist" value="${catList }"></c:set>
              <c:set var="list" value="${search }"></c:set>
       <c:if test="${!empty list }">
         <c:forEach items="${list }" var="i">
           <tr>
                     <td>${i.getNo() }</td>
                     <td><a href="board_cont.do?no=${i.getNo() }">
                           ${i.getTitle() }</a></td>
                     <td>${i.getWriter()}</td>
                     <td>${i.getRegdate().substring(0,10) }</td>
                     <td>${i.getHit() }</td>
                     <td>${i.getUp() }</td>
           </tr>
         </c:forEach>
       </c:if>
       <c:if test="${empty list }">
         <tr>
            <td colspan="4" align="center">
               <h3>검색된 레코드가 없습니다.</h3>
            </td>
         </tr>
       </c:if>
            </table>
      </div>
   </div>

   <div id="footer">
      <p>Copyright&copy;2019 이개뭐냥 All rights reserved.</p>
      <p>대한민국 서울특별시 마포구 서교동 447-5 풍성빌딩 2,3,4층 | 쌍용강북교육센터</p>
      <p>
         문의 : 02)336-8546~8 &nbsp;&nbsp;<a
            href="<%=request.getContextPath()%>/terms.do">이용약관</a> &nbsp;|&nbsp;
         <a>개인정보취급방침</a>.
      </p>
      <P>
         ● 메일문의 : <a href="mailto:bowwow999@gmail.com">bowwow999@gmail.com</a>
      </P>

   </div>
</body>
</html>