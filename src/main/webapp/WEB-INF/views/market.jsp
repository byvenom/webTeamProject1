<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="item" value="${list }" />
<c:set var="cate" value="${cate }" />
<c:set var="maincate" value="${maincate }" />
<%
   int cateNo = (Integer) request.getAttribute("cate");
   String pageName = "";
   switch (cateNo) {
   case 99:
      pageName = "전체보기";
      break;
   case 0:
      pageName = "사료";
      break;
   case 1:
      pageName = "캔 / 간식";
      break;
   case 2:
      pageName = "모래 / 탈취제";
      break;
   case 3:
      pageName = "화장실매트";
      break;
   case 4:
      pageName = "건강관리";
      break;
   case 5:
      pageName = "목욕 / 미용";
      break;
   case 6:
      pageName = "장난감";
      break;
   case 7:
      pageName = "식기";
      break;
   case 8:
      pageName = "하우스 / 쿠션";
      break;
   case 9:
      pageName = "이동장 / 하넥스";
      break;
   }
%>


<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>마켓</title>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
   rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Abel|Satisfy'
   rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/resources/default.css"
   rel="stylesheet" type="text/css" media="all" />

<script type="">
function itemCont(a) {
 location.href="itemCont.do?no="+a;
}
</script>
</head>
<body>
   <%@ include file="/WEB-INF/views/header.jsp"%>
   <div class="container pullUpDown">
      
        <a
               href="<%=request.getContextPath()%>/selectitempage.do?cate=99&maincate=${maincate }&page=1">전체보기</a>
        <a
               href="<%=request.getContextPath()%>/selectitempage.do?cate=0&maincate=${maincate }&page=1">사료</a>
        <a
               href="<%=request.getContextPath()%>/selectitempage.do?cate=1&maincate=${maincate }&page=1">캔/간식</a>
         <a
               href="<%=request.getContextPath()%>/selectitempage.do?cate=2&maincate=${maincate }&page=1">모래/탈취제</a>
         <a
               href="<%=request.getContextPath()%>/selectitempage.do?cate=3&maincate=${maincate }&page=1">화장실/매트</a>
         <a
               href="<%=request.getContextPath()%>/selectitempage.do?cate=4&maincate=${maincate }&page=1">건강관리</a>
         <a
               href="<%=request.getContextPath()%>/selectitempage.do?cate=5&maincate=${maincate }&page=1">목용/미용</a>
         <a
               href="<%=request.getContextPath()%>/selectitempage.do?cate=6&maincate=${maincate }&page=1">장난감</a>
         <a
               href="<%=request.getContextPath()%>/selectitempage.do?cate=7&maincate=${maincate }&page=1">식기</a>
         <a
               href="<%=request.getContextPath()%>/selectitempage.do?cate=8&maincate=${maincate }&page=1">하우스/쿠션</a>
         <a
               href="<%=request.getContextPath()%>/selectitempage.do?cate=9&maincate=${maincate }&page=1">이동장/하넥스</a>
         
      
   </div>
   <div
      style="overflow: hidden; width: 900px; height: 1102px; padding: 50px 300px; margin:0 auto; ">
      <h1
         style="font-family: sans-serif; font-size: 23px; font-weight: bold;"><%=pageName%></h1>
      <c:if test="${maincate eq 1 }">
         <button class="market_button" style="background: #5F9EA0;">공용</button>
      </c:if>
      <c:if test="${maincate ne 1}">
         <button class="market_button" 
            onclick="location.href='<%=request.getContextPath()%>/selectitempage.do?cate=${cate }&maincate=1&page=1'">공용</button>
      </c:if>
      <c:if test="${maincate eq 0 }">
         <button class="market_button" style="background: #5F9EA0;">강아지</button>
      </c:if>
      <c:if test="${maincate ne 0}">
         <button class="market_button"
            onclick="location.href='<%=request.getContextPath()%>/selectitempage.do?cate=${cate }&maincate=0&page=1'">강아지</button>
      </c:if>
      <c:if test="${maincate eq 2 }">
         <button class="market_button" style="background: #5F9EA0;">고양이</button>
      </c:if>
      <c:if test="${maincate ne 2}">
         <button class="market_button"
            onclick="location.href='<%=request.getContextPath()%>/selectitempage.do?cate=${cate }&maincate=2&page=1'">고양이</button>
      </c:if>
      <br></br>
      <c:if test="${!empty item}">
         <c:forEach items="${item}" var="p">
            <span onclick="itemCont(${p.getNo()})"
               style="width: 200px; height: 300px; margin-left: 10px; margin-right: 10px; margin-bottom: 20px; background: black; display: inline-block">
               <img width="200" height="200"   
               onerror="this.src='${pageContext.request.contextPath}/resources/upload/nopic.png';"
               src="${pageContext.request.contextPath}/resources/upload/${fn:substring(p.getImage(),0,fn:indexOf(p.getImage(),'/'))}"></img>
               <p
                  style="font-family: '나눔고딕'; font-size: 14px; color: white; margin-top: 2px;">${ p.getName() }</p>
               <p
                  style="font-family: '나눔고딕'; font-size: 16px; color: white; margin-top: 2px;"><fmt:formatNumber value="${p.getPrice() }" pattern="#,###" />원</p>
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
                     href="<%=request.getContextPath()%>/selectitempage.do?cate=${cate }&maincate=${maincate }&page=${i }">${i }</a>]
               </c:if>
               
            </c:forEach>
            <c:if test="${end < all }">
               [<a
                  href="<%=request.getContextPath()%>/selectitempage.do?cate=${cate }&maincate=${maincate }&page=${end + 1 }">▶</a>]
               [<a
                  href="<%=request.getContextPath()%>/selectitempage.do?cate=${cate }&maincate=${maincate }&page=${all }">▶▶</a>]
            </c:if>
            <a style="display:scroll;position:fixed;bottom:30%;right:5%;" hrldef="#" ><img src="./resources/images/top.png" style="width:60px; height:60;"></img></a>

         </div>
      </c:if>
      <c:if test="${empty item }">
         <div style="height: 800px;">
            <h1 style="font-family: sans-serif; font-size: 20px;">준비된 상품이
               없습니다.</h1>
         </div>
      </c:if>
   </div>
   <div></div>
   <%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>