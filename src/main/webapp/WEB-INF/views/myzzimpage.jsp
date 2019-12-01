<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="item" value="${list }" />



<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>찜페이지</title>
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
function min(no){
   document.getElementById("hint"+no).style.display="block";
}
function mout(no){
   document.getElementById("hint"+no).style.display="none";
}
function delzzim(id,no){
   location.href="deletezzim.do?no="+no+"&id="+id;
}
</script>
</head>
<body>
   <%@ include file="/WEB-INF/views/header.jsp"%>
   
   <div
      style="overflow: hidden; width: 1350px; padding: 50px 0px; margin-left: 300px;">
      <h1
         style="font-family: sans-serif; font-size: 30px; font-weight: bold;">찜목록</h1>
      
      <br></br>
      <c:if test="${!empty item}">
         <c:forEach items="${item}" var="p" varStatus="s">
            <span style="width: 200px; height: 300px; margin-left: 10px; margin-right: 10px; margin-bottom: 20px; background: black; display: inline-block">
               <!-- <span style="width: 200px; height: 200px; background-image: url('/web/resources/upload/nopic.png');">
               </span> -->
               <font id="hint${s.index}" style="display:none; float:left; color:white; font-weight=bold;">찜목록에서 삭제</font>
               <button onclick="delzzim('${userid}' ,${p.getNo()})" onmouseover="min(${s.index})" onmouseout="mout(${s.index})"  onclick="removezzim(${s.index},${p.getNo() },${userid })" style="width:20px; height:20px; border:none; background-image: url('/web/resources/images/close.png'); float: right; padding: 0; background-size: contain;"></button>
               <span  onclick="itemCont(${p.getNo()})">
               <img width="200px" height="190px"
               onerror="this.src='/web/resources/upload/nopic.png';"
               src="/web/resources/upload/${fn:substring(p.getImage(),0,fn:indexOf(p.getImage(),'/'))}"></img>
               <p
                  style="font-family: sans-serif; font-size: 14px; color: white; margin-top: 2px;">${ p.getName() }</p>
               <p
                  style="font-family: sans-serif; font-size: 16px; color: white; margin-top: 4px;"><fmt:formatNumber value="${p.getPrice() }" pattern="#,###" />원 </p>
               </span>
            </span>
         </c:forEach>
      </c:if>
      <c:if test="${empty item }">
         <div style="height: 800px;">
            <h1 style="font-family: sans-serif; font-size: 20px;">찜한 상품이 없습니다.</h1>
         </div>
      </c:if>
   </div>
   <div></div>
   <div style="height: 250px;"></div>
   <%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>