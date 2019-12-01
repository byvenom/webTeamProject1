<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
         </ul>         
      </nav>
      <div id="main"><!-- 본문 -->
      <section>
            <div align="center">
               <h3>문의하기</h3>
                  <form method="post" action="<%=request.getContextPath()%>/sangdam_post.do"> 
                  <a>답변을 받으실 이메일을 입력해주세요.</a><br>
                  <input type="text" name="email"><br><br>
                  <textarea cols="50" rows="30" name="inquiry" onclick="value=''">문의하실 내용을 입력해주세요</textarea>
                  <br>
                  <input type="submit" value="입력완료">
                  <input type="button" onclick="history.back()" value="취소">
                  </form>
            </div>   
         </section>
      </div>
   </div>
  </div>

<%@ include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>