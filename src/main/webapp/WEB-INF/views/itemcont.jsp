<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="p" value="${dto}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${p.getName() }</title>
<script type="text/javascript">
   function minusnum() {
      document.getElementById("usernum").value -= 1;
      document.getElementById("num").value = document.getElementById("usernum").value;
   }
   function plusnum() {
      document.getElementById("usernum").value = parseInt(document.getElementById("usernum").value)+1;
      document.getElementById("num").value = document.getElementById("usernum").value;
   }
   function numchk() {
      document.getElementById("num").value = document.getElementById("usernum").value;
      if(parseInt(document.getElementById("usernum").value)>parseInt(document.getElementById("usernum").max)){
         document.getElementById("usernum").value=document.getElementById("usernum").max;
         document.getElementById("num").value = document.getElementById("usernum").value;
         }
   }
   
</script>
</head>
<body>
   <%@ include file="/WEB-INF/views/header.jsp"%>

   <div id="footer-wrapper">
      <div id="footer-content">
         <div
            style="width: 420px; height: 420px; float: left; margin-right: 100px;">
            <img onerror="this.src='/web/resources/upload/nopic.png';"
               src="${pageContext.request.contextPath}/resources/upload/${fn:substring(p.getImage(),0,fn:indexOf(p.getImage(),'/'))}"
               style="width: 100%; height: 100%;"></img>
         </div>
         <div style="height: 478px; width: 480px; float: left;">
            <p style="font-family: sans-serif; font-size: 14px; color: #004B91;">${p.getSup() }</p>
            <p
               style="font-family: sans-serif; font-size: 24px; font-weight: bold; color: black;">${p.getName() }</p>
            <br>
            <hr style="width: 100%; height: 2px; color: black; display: block;">
            <br>
            <p
               style="font-family: sans-serif; font-size: 14px; font-weight: bold; color: black;">
               판매가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
                  style="font-family: sans-serif; font-size: 14px; font-weight: bold; color: #AAAAAA;">
                  <fmt:formatNumber value="${p.getPrice() }" pattern="#,###" />원</font>
            </p>
            <br>
            <p
               style="font-family: sans-serif; font-size: 14px; font-weight: bold; color: black;">
               배송&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
                  style="font-family: sans-serif; font-size: 14px; color: #333333;">
                  3만원 이상 구매시 무료배송</font>
            </p>
            <br> <br>
            <hr style="width: 100%; height: 2px; color: black; display: block;">
            <br>
            <p
               style="font-family: sans-serif; font-size: 12px; color: #004B91; margin-bottom: 4px;">
               남은 수량 : ${p.getNum() }개</p>
            <br> <font
               style="font-family: sans-serif; font-size: 14px; font-weight: bold; color: black;">
               수량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
            <button onclick="minusnum()">-</button>
            <input type="number" id="usernum" value="1" min="1" max="${p.getNum() }" oninput="numchk()">
            <button onclick="plusnum()">+</button>
            <br> <br> <br>
            <c:if test="${!empty userid}">
            <form action="addbasket.do" style="float:left;">
               <input type="hidden" name="id" value="${userid }">
               <input type="hidden" name="pno" value="${p.getNo() }">
               <input type="hidden" name="num" value="1" id="num">
               <input type="submit" value=""
                  style="border: none; background-image: url('/web/resources/images/basket.png'); width: 215px; height: 50px; margin-right: 20px;">
            </form>
            </c:if>
            <c:if test="${empty userid }">
            <button style="border: none; background-image: url('/web/resources/images/basket.png'); width: 215px; height: 50px; margin-right: 20px; float: left;" onclick="alert('로그인을 해주세요')"></button>
            </c:if>
            <c:if test="${!empty userid}">
            <form action="addzzim.do">
               <input type="hidden" name="id" value="${userid }">
               <input type="hidden" name="pno" value="${p.getNo() }">
               <input type="submit" value=""
                  style="border: none; background-image: url('/web/resources/images/zzim.png   '); width: 215px; height: 50px;">
            </form>
            </c:if>
            <c:if test="${empty userid }">
            <button style="border: none; background-image: url('/web/resources/images/zzim.png'); width: 215px; height: 50px;" onclick="alert('로그인을 해주세요')"></button>
            </c:if>
         </div>
         <c:forTokens var="name" items="${p.getImage() }" delims="/"
            varStatus="state">
            <c:if test="${state.index ne 0 }">
               <img width="100%"
                  onerror="this.src='${pageContext.request.contextPath}/resources/upload/nopic.png';"
                  src="${pageContext.request.contextPath}/resources/upload/${name}"></img>
            </c:if>
         </c:forTokens>
      </div>
   </div>
   <%@ include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>
