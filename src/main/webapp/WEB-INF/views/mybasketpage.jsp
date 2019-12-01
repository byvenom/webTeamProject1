<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="item" value="${list }" />
<c:set var="basket" value="${basket }" />
<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>장바구니</title>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
   rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Abel|Satisfy'
   rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/resources/default.css"
   rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="">

function itemCont(a) {
 location.href="itemCont.do?no="+a;
}

function allselect(a){
   var checkbox = document.getElementsByName("no");
   for(var  i=0; i<a; i++){
   checkbox[i].checked=true;
   }
   
}

function allunselect(a){
   var checkbox = document.getElementsByName("no");
   for(var  i=0; i<a; i++){
   checkbox[i].checked=false;
   }
   
}

function order(no){
   var form = document.createElement("form");
   form.setAttribute("method","post");
   form.setAttribute("action","/web/addorder.do");
   document.body.appendChild(form);
   var input_id = document.createElement("input");
   input_id.setAttribute("type", "hidden");
   input_id.setAttribute("name", "userid");
   input_id.setAttribute("value", document.getElementById("userid").value);
   form.appendChild(input_id);
   var input_pno = document.createElement("input");
   input_pno.setAttribute("type", "hidden");
   input_pno.setAttribute("name", "pno");
   input_pno.setAttribute("value", document.getElementById("no"+no).value);
   form.appendChild(input_pno);
   var input_num = document.createElement("input");
   input_num.setAttribute("type", "hidden");
   input_num.setAttribute("name", "num");
   input_num.setAttribute("value", document.getElementById("num"+no).value);
   form.appendChild(input_num);
   form.submit();
}

function deleteorder(no){
   var form = document.createElement("form");
   form.setAttribute("method","post");
   form.setAttribute("action","/web/basketdelete.do");
   document.body.appendChild(form);
   var input_id = document.createElement("input");
   input_id.setAttribute("type", "hidden");
   input_id.setAttribute("name", "userid");
   input_id.setAttribute("value", document.getElementById("userid").value);
   form.appendChild(input_id);
   var input_pno = document.createElement("input");
   input_pno.setAttribute("type", "hidden");
   input_pno.setAttribute("name", "pno");
   input_pno.setAttribute("value", document.getElementById("no"+no).value);
   form.appendChild(input_pno);
   form.submit();
}

function multideleteorder(){
   var chkitem = new Array();
   $("input:checkbox[name=no]:checked").each(function(){
   chkitem.push($(this).val());
   });
   var form = document.createElement("form");
   form.setAttribute("method","post");
   form.setAttribute("action","/web/basketdeletemulti.do");
   document.body.appendChild(form);
   var input_id = document.createElement("input");
   input_id.setAttribute("type", "hidden");
   input_id.setAttribute("name", "userid");
   input_id.setAttribute("value", document.getElementById("userid").value);
   form.appendChild(input_id);
   var input_pno = document.createElement("input");
   input_pno.setAttribute("type", "hidden");
   input_pno.setAttribute("name", "pno");
   input_pno.setAttribute("value", chkitem);
   form.appendChild(input_pno);
   form.submit();
}

function multiorderadd(){
   var chkitem = new Array();
   var chknum = new Array();
   $("input:checkbox[name=no]:checked").each(function(){
   chkitem.push($(this).val());
   chknum.push(document.getElementById("num"+$(this).val()).value);
   });
   var form = document.createElement("form");
   form.setAttribute("method","post");
   form.setAttribute("action","/web/basketordermulti.do");
   document.body.appendChild(form);
   var input_id = document.createElement("input");
   input_id.setAttribute("type", "hidden");
   input_id.setAttribute("name", "userid");
   input_id.setAttribute("value", document.getElementById("userid").value);
   form.appendChild(input_id);
   var input_pno = document.createElement("input");
   input_pno.setAttribute("type", "hidden");
   input_pno.setAttribute("name", "pno");
   input_pno.setAttribute("value", chkitem);
   form.appendChild(input_pno);
   var input_num = document.createElement("input");
   input_num.setAttribute("type", "hidden");
   input_num.setAttribute("name", "num");
   input_num.setAttribute("value", chknum);
   form.appendChild(input_num);
   form.submit();
}

function savenum(no){
   var form = document.createElement("form");
   form.setAttribute("method","post");
   form.setAttribute("action","/web/changeBasketNum.do");
   document.body.appendChild(form);
   var input_id = document.createElement("input");
   input_id.setAttribute("type", "hidden");
   input_id.setAttribute("name", "userid");
   input_id.setAttribute("value", document.getElementById("userid").value);
   form.appendChild(input_id);
   var input_pno = document.createElement("input");
   input_pno.setAttribute("type", "hidden");
   input_pno.setAttribute("name", "pno");
   input_pno.setAttribute("value", document.getElementById("no"+no).value);
   form.appendChild(input_pno);
   var input_num = document.createElement("input");
   input_num.setAttribute("type", "hidden");
   input_num.setAttribute("name", "num");
   input_num.setAttribute("value", document.getElementById("num"+no).value);
   form.appendChild(input_num);
   form.submit();
}

</script>
</head>
<body>
   <%@ include file="/WEB-INF/views/header.jsp"%>

   <div
      style="overflow: hidden; width: 1350px; padding: 50px 0px; margin-left: 300px;">
      <input type="hidden" value="${userid }" id="userid"/>
      <h1
         style="float: left; font-family: sans-serif; font-size: 30px; font-weight: bold;">내
         장바구니 목록</h1><br></br><br></br><br></br>
      <button class="market_button" 
         onclick="allselect(${fn:length(item)})">전체 선택</button>
      <button class="market_button" 
         onclick="allunselect(${fn:length(item)})">선택 해제</button>
      <button class="market_button"  onclick="multiorderadd()">선택
         주문</button>
      <button class="market_button"  onclick="multideleteorder()">선택
         삭제</button>
      <br></br> <br></br>
      <table id="baskettable">
         <tr>
            <th width="50px">선택</th>
            <th width="180px">이미지</th>
            <th width="400px">상품명</th>
            <th width="120px">판매가격</th>
            <th width="120px">수량</th>
            <th width="100px">주문, 삭제</th>
         </tr>
         <c:if test="${!empty item}">
            <c:forEach items="${item}" var="p" varStatus="s">
               <tr>
                  <td><input type="checkbox" value="${p.getNo() }" name="no"
                     id="no${p.getNo() }"></input></td>
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

                  <td><select id="num${p.getNo()}" >
                        <c:forEach var="cnt" begin="1" end="${ p.getNum() }" step="1">
                           <c:if test="${cnt eq basket[s.index].getNum() }">
                              <option value="${cnt }" selected="selected">${cnt }</option>
                           </c:if>
                           <c:if test="${cnt ne basket[s.index].getNum() }">
                              <option value="${cnt }">${cnt }</option>
                           </c:if>
                        </c:forEach>
                  </select>
                  <button class="market_button" onclick="savenum(${p.getNo()})">변경</button>
                  </td>
                  <td>
                     <button class="market_button" style="margin: 5px; "
                        onclick="order(${p.getNo()})">주문하기</button>
                     <button class="market_button" style="margin: 5px;"
                        onclick="deleteorder(${p.getNo()})">삭제하기</button>
                  </td>

               </tr>
            </c:forEach>

         </c:if>
         <c:if test="${empty item }">
            <tr>
               <td colspan="6">
                  <h1 style="font-family: sans-serif; font-size: 20px;">장바구니에
                     등록된 상품이 없습니다.</h1>
               </td>
            </tr>
         </c:if>
      </table>
   </div>
   <div></div>
   <%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>