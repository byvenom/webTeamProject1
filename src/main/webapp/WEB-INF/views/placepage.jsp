   <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Uncovered 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20120927

-->

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>시설정보</title>
<style type="text/css">
.grid-wrapper {
   display: grid;
   grid-template-columns: 125px 125px 125px 125px 125px 125px 125px 125px;
   grid-template-rows:250px 250px;   
   grid-gap: 10px;
}

.placeItem1 {
   
   grid-column: 1/4;
   position: relative;

   
}   

.placeItem2 {
   
   grid-column: 4/6;
   position: relative;
}

.placeItem3 {

   grid-column: 6/9;
   position: relative;

}

.placeItem4 {
   
   grid-column: 1/3;
   position: relative;
}

.placeItem5 {
   
   grid-column: 3/6;
   position: relative;
}

.placeItem6 {
   
   grid-column: 6/9;
   position: relative;
}



.middle1 {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}
.text1{
 background-color: gray;
  color: white;
  font-size: 16px;
  padding: 16px 32px;
}
.placeItem1:hover .test1{
opacity: 0.3;
}
.placeItem1:hover .middle1{
opacity: 1;
}


.middle2 {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}
.text2{
 background-color: gray;
  color: white;
  font-size: 16px;
  padding: 16px 32px;
}
.placeItem2:hover .test2{
opacity: 0.3;
}
.placeItem2:hover .middle2{
opacity: 1;
}


.middle3 {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-70%, -50%);
  text-align: center;
}
.text3{
 background-color: gray;
  color: white;
  font-size: 16px;
  padding: 16px 32px;
}
.placeItem3:hover .test3{
opacity: 0.3;
}
.placeItem3:hover .middle3{
opacity: 1;
}


.middle4 {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}
.text4{
 background-color: gray;
  color: white;
  font-size: 16px;
  padding: 16px 32px;
}
.placeItem4:hover .test4{
opacity: 0.3;
}
.placeItem4:hover .middle4{
opacity: 1;
}


.middle5 {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}
.text5{
 background-color: gray;
  color: white;
  font-size: 16px;
  padding: 16px 32px;
}
.placeItem5:hover .test5{
opacity: 0.3;
}
.placeItem5:hover .middle5{
opacity: 1;
}


.middle6 {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-70%, -50%);
  text-align: center;
}
.text6{
 background-color: gray;
  color: white;
  font-size: 16px;
  padding: 16px 32px;
}
.placeItem6:hover .test6{
opacity: 0.3;
}
.placeItem6:hover .middle6{
opacity: 1;
}


</style>
</head>
<body>
   <%@ include file="/WEB-INF/views/header.jsp"%>
   <div id="footer-wrapper">
      <div id="footer-content">
   
      <!-- <div align="center" id="placemenu" >
         <ul>
            <li><a>동물병원</a></li>
            <li><a>동반숙박시설</a></li>
            <li><a>운동장</a></li>
            <li><a>애견호텔</a></li>
            <li><a>음식점</a></li>
         </ul>s
      </div> -->
         <div class="grid-wrapper">
            <!--1.동물병원 2.카페 3. 애견카페  4.애견호텔 5.애견펜션 6.애견식당  -->
            <div class="placeItem1">
               <a href="<%=request.getContextPath()%>/place.do?place=1&page=1" >
               <img  class="test1" src ="${pageContext.request.contextPath}/resources/images/place1.jpg" style="width: 100%; height: 100%;" />
                 <div class="middle1">
                  <div class="text1">동물병원</div>
               </div>
               </a>
            </div>
            <div class="placeItem2">
               <a href="<%=request.getContextPath()%>/place.do?place=2&page=1">
               <img class="test2" src="${pageContext.request.contextPath}/resources/images/place2.jpg" style="width: 100%; height: 100%;"/>
               <div class="middle2">
                  <div class="text2">애견카페</div>
               </div>
               </a>
            </div>
            <div class="placeItem3">
               <a href="<%=request.getContextPath()%>/place.do?place=3&page=1">
               <img class="test3" src="${pageContext.request.contextPath}/resources/images/place3.jpg" style="mawidth: 100%; height: 100%;"/>
               <div class="middle3">
                  <div class="text3">애견동반식당</div>
               </div>
               </a>
            </div>
            <div class="placeItem4">
               <a href="<%=request.getContextPath()%>/place.do?place=4&page=1">
               <img class="test4" src="${pageContext.request.contextPath}/resources/images/place4.jpg" style="width: 100%; height: 100%;"/>
               <div class="middle4">
                  <div class="text4">숙박업소</div>
               </div>
               </a>
            </div>
            <div class="placeItem5">
               <a href="<%=request.getContextPath()%>/place.do?place=5&page=1">
               <img class="test5" id="test2" src="${pageContext.request.contextPath}/resources/images/place5.jpg" style="width: 100%; height: 100%;"/>
               <div class="middle5">
                  <div class="text5">애견호텔</div>
               </div>
               </a>
            </div>
            <div class="placeItem6">
               <a href="<%=request.getContextPath()%>/place.do?place=6&page=1">
               <img class="test6" src="${pageContext.request.contextPath}/resources/images/place6.jpg" style="width: 100%; height: 100%;" />
               <div class="middle6">
                  <div class="text6">동반카페</div>
               </div>
               </a>
            </div>
         </div>
      </div>
   </div>
   
   
   <%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>