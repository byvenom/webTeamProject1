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
<div id="page-wrapper" style="border: 1px dashed #B5A871;"><!-- mid -->
<nav id="sidebar" ><!-- 사이드 메뉴 -->
         <h2>고객센터</h2>
         <ul class="style3">
            <li class="first">
               <a class="one" style="text-decoration:none">1대1문의</a>
            </li>
            <li>
               <a href="<%=request.getContextPath()%>/yackon.do" style="text-decoration:none">이용약관</a>
            </li>
                <li>
            	<a href="<%=request.getContextPath()%>/konggee.do" style="text-decoration:none">공지사항</a>
            </li>
         </ul>         
      </nav>
      <div id="main" ><!-- 본문 -->
      <section>
            <p style="font-size: 25px; ">1대1 문의 페이지 입니다.무엇을 도와드릴까요?</p>
            <c:if test="${nickname!='운영자' && nickname != null }">
            	<button onclick="location.href='sangdam.do'">문의하기</button>
            </c:if>
            
            <c:if test="${nickname=='운영자' }">
            	<button onclick="location.href='sangdamIndex.do'">문의내역</button>
            </c:if>
            
            <c:if test="${nickname == null }">
            	<p style="font-size: 25px; font-weight: bold; ">로그인이 필요한 서비스 입니다.</p>
            </c:if>
         </section>
      </div>
   </div>
  </div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>