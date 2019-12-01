<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div id="footer-content">
<div id="page-wrapper" style="border: 1px dashed #B5A871;"><!-- mid -->
<nav id="sidebar"><!-- 사이드 메뉴 -->
         <h2>고객센터</h2>
         <ul class="style3">
            <li class="first">
               <a href="<%=request.getContextPath()%>/oneorone.do" style="text-decoration:none">1대1문의</a>
            </li>
            <li>
               <a href="<%=request.getContextPath()%>/yackon.do" style="text-decoration:none">이용약관</a>
            </li>
            <li>
            	<a class="one" style="text-decoration:none">공지사항</a>
            </li>
         </ul>         
      </nav>
      <div id="main"><!-- 본문 -->
      <section>
            <div align="center">
               <h3>공지사항</h3>
               <table border="1" width="750" cellspacing="0">
					<tr>
						<th>번호</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>추천</th>
						<th>조회수</th>
					</tr>
					<c:set var="list" value="${List }"></c:set>    
						<c:if test="${!empty list }">
						<c:forEach items="${list }" var="i">
							<tr>
								<td align="center">${i.getNo() }</td>
								<td align="center"><c:if
										test="${i.getCate().equals('kong')}">
								공지사항</c:if></td>

								<td><a href="cont.do?no=${i.getNo()}" style="text-decoration:none"><img
									src="${pageContext.request.contextPath}/resources/upload/${fn:substring(i.getUpload(),67,fn:indexOf(i.getUpload(),'/'))}"
									alt="" width="72" height="54" style="vertical-align: middle;"></img>
									&nbsp;&nbsp;&nbsp;<b>${i.getTitle() }</b></a></td>
								<td align="center">${i.getWriter() }</td>
								<td align="center">${fn:substring(i.getRegdate(),5,10) }</td>
								<td align="center">${i.getUp() }</td>
								<td align="center">${i.getHit() }</td>
							</tr>


						</c:forEach>
					</c:if>           
              		<c:if test="${empty list }">
              			<tr>
              				<td colspan="7" align="center">
              					<h2>등록된 공지사항이 없습니다.</h2>
              				</td>
              			</tr>
              		
              		</c:if>
              		<c:if test="${nickname=='운영자'}">
              		<div align="center">
					
						<button type="button" onclick="location.href='konggee_insert.do'">글작성</button>
					
                	</div>
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