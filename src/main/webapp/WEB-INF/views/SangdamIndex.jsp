<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="/WEB-INF/views/header.jsp"%>
<div id="footer-content">
<div id="page-wrapper"><!-- mid -->
<nav id="sidebar"><!-- 사이드 메뉴 -->
         <h2>고객센터</h2>
         <ul class="style3">
            <li class="first">
               <a class="one">1대1문의</a>
            </li>
            <li>
               <a href="<%=request.getContextPath()%>/yackon.do">이용약관</a>
            </li>
            <li>
            	<a href="<%=request.getContextPath()%>/konggee.do">공지사항</a>
            </li>
         </ul>         
      </nav>
      <div id="main"><!-- 본문 -->
      <section>
            <div align="center">
               <h3>1대1문의내역</h3>
               <table border="1" width="800" cellspacing="0">
					<tr>
						<th>이메일</th>
						<th>문의내용</th>
					</tr>    
					<c:set var="list" value="${List }"></c:set>
						<c:if test="${!empty list }">
							<c:forEach items="${list}" var="i">
								<tr>
									<td align="center">${i.getEmail() }</td>
									<td align="center">${i.getInquiry() }</td>
									<td align="center"><button id="ok" onclick="location.href='anserMail.do?mail=${i.getEmail() }'">답변하기</button></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty list }">
							<h2>문의내역이 없습니다.</h2>
						</c:if>
               </table>
            </div>   
         </section>
      </div>
   </div>
  </div>

<%@ include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>