
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
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

<style type="">
#boxx {
   list-style: none;
   display: inline-block;
}
</style>
</head>
<body>
   <%@ include file="/WEB-INF/views/header.jsp"%>
   <%@ include file="/WEB-INF/views/mainContens.jsp"%>

   <div id="footer-wrapper">
      <div id="footer-content">
         
   
         <div id="fbox2" style="float:left;" >
            <h2>      
               <span>공지사항</span>
            </h2>
            <table cellspacing="0">
               <tr>
                  <td>공지사항</td>
                  <td>공지사항 제목이 올 자리입니다.</td>
               </tr>
               <tr>
                  <td>공지사항</td>
                  <td>공지사항 제목이 올 자리입니다.</td>
               </tr>
            </table>
            <p>
               <a id="notice">더보기</a>
            </p>
         </div>

         
         <div id="fbox3" style="float:right;">
            <h2>      
               <span>새로운글</span>
            </h2>
            <table>
               <tr>
                  <th>※</th>
                  <td>새로운 글 올 자리입니다.</td>
               </tr>
            </table>

         </div>

      </div>
   </div>

   <%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>