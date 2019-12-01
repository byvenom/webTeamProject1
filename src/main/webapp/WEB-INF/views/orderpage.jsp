<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="orderList" value="${orderList }" />
<c:set var="numList" value="${numList }" />
<c:set var="addr" value="${addr }" />
<c:set var="totalprice" value="0" />
<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>주문하기</title>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
   rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Abel|Satisfy'
   rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/resources/default.css"
   rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript"
   src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>

</head>
<body>
   <%@ include file="/WEB-INF/views/header.jsp"%>

   <div
      style="overflow: hidden; width: 1350px; padding: 50px 0px; margin-left: 300px;">
      <h1
         style="float: left; font-family: sans-serif; font-size: 30px; font-weight: bold;">주문하기</h1>

      <br></br> <br></br>
      <table id="baskettable">
         <tr>
            <th width="180px"></th>
            <th width="380px">상품명</th>
            <th width="120px">판매가격</th>
            <th width="120px">주문 수량</th>
            <th width="140px">총 가격</th>
         </tr>
         <c:if test="${!empty orderList}">
            <c:forEach items="${orderList}" var="p" varStatus="s">
               <tr>
                  <td><img onclick="itemCont(${p.getNo()})" width="160px"
                     height="100px"
                     onerror="this.src='/web/resources/upload/nopic.png';"
                     src="/web/resources/upload/${fn:substring(p.getImage(),0,fn:indexOf(p.getImage(),'/'))}"></img></td>

                  <td><a href="itemCont.do?no=${p.getNo()}"
                     style="font-family: sans-serif; font-size: 14px; color: black; margin-top: 2px;">${ p.getName() }</a>

                  </td>

                  <td><p
                        style="font-family: sans-serif; font-size: 14px; color: black; margin-top: 2px;">
                        <fmt:formatNumber value="${p.getPrice() }" pattern="#,###" />
                        원
                     </p></td>

                  <td>
                     <p
                        style="font-family: sans-serif; font-size: 14px; color: black; margin-top: 2px;">
                        ${numList[s.index] }개</p>
                  </td>
                  <td><p
                        style="font-weight:bold; font-family: sans-serif; font-size: 14px; color: black; margin-top: 2px;">
                  <fmt:formatNumber
                        value="${p.getPrice()*numList[s.index] }" pattern="#,###" />원</p></td>

               </tr>

            </c:forEach>
            <tr>
               <th>주문 종합</th>
               <td><c:forEach items="${orderList}" var="p">
                     <p
                        style="font-family: sans-serif; font-size: 14px; color: black; margin-top: 2px;">${ p.getName() }</p>
                  </c:forEach></td>
               <td><c:forEach items="${orderList}" var="p">
                     <p
                        style="font-family: sans-serif; font-size: 14px; color: black; margin-top: 2px;">
                        <fmt:formatNumber value="${p.getPrice() }" pattern="#,###" />
                        원
                     </p>
                  </c:forEach></td>
               <td><c:forEach items="${orderList}" var="p" varStatus="s">
                     <p
                        style="font-family: sans-serif; font-size: 14px; color: black; margin-top: 2px;">
                        ${numList[s.index] }개</p>
                  </c:forEach></td>
               <td><c:forEach items="${orderList}" var="p" varStatus="s">
                     <p>
                        <p style="font-weight:bold; font-family: sans-serif; font-size: 14px; color: black; margin-top: 2px;">
                        <fmt:formatNumber value="${p.getPrice()*numList[s.index] }"
                           pattern="#,###" /> 원</p>
                        <c:set var="totalprice"
                           value="${totalprice+p.getPrice()*numList[s.index] }" />
                        
                     </p>
                  </c:forEach></td>
            </tr>
            <tr>
               <td><p>결제 방법</p>
               <select>
                  <option>카드 결제</option>
                  <option>무통장 입금</option>
                  <option>핸드폰 결제</option>
               </select>
               </td>
               <td colspan="3"><p style="font-family: sans-serif; font-size: 14px; color: black; margin-top: 2px;">${addr }</p></td>
               <td><p
                     style="font-family: sans-serif; font-size: 14px; color: black; margin-top: 2px;">
                     30,000원 이상 무료배송 (배송비 2,500원)</p> <c:if test="${totalprice ge 30000 }">
                     <p
                        style="font-weight:bold; font-family: sans-serif; font-size: 14px; color: black; margin-top: 2px;">
                        <fmt:formatNumber value="${totalprice}" pattern="#,###" /> 원
                     </p>
                  </c:if> <c:if test="${totalprice lt 30000 }">
                     <p
                        style="font-weight:bold; font-family: sans-serif; font-size: 14px; color: black; margin-top: 2px;">
                        <fmt:formatNumber value="${totalprice+2500}" pattern="#,###" /> 원
                     </p>
                  </c:if></td>
            </tr>

         </c:if>
         <c:if test="${empty orderList }">
            <tr>
               <td colspan="6">
                  <h1 style="font-family: sans-serif; font-size: 20px;">장바구니에
                     등록된 상품이 없습니다.</h1>
               </td>
            </tr>
         </c:if>
      </table>
   </div>
   <div align="center" style="margin-bottom: 100px;">
   <button style=" margin-right: 100px; background: white; padding: 20px; font-size: 30px;" onclick="alert('현재 주문 서비스는 지원하지 않습니다.')">주문 하기</button>
      <button style=" margin-left: 100px; background: white; padding: 20px; font-size: 30px;" onclick="history.back()">취소 하기</button></div>
   <%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>