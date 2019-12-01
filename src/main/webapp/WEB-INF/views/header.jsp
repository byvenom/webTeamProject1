<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<c:set var="userid" value="${userid }"></c:set>
<c:set var="nickname" value="${nickname }"></c:set>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>이개뭐냥</title>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
	rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Abel|Satisfy'
	rel='stylesheet' type='text/css' />
<link
	href="${pageContext.request.contextPath}/resources/default.css?after"
	rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
   function searchtext() {
	   var f = document.allsearch;
	   var find_name = document.getElementById("find_name").value;
      f.action = "/web/allserach.do?find_name="+find_name;
      f.method = "get";
      f.submit();
      
   };
   function myBasket() {
      var f = document.basket;
      f.action = "/web/basket.do"
      f.method = "post"
      f.submit();
   };
   function myZzim() {
      var f = document.zzim;
      f.action = "/web/zzimpage.do"
      f.method = "post"
      f.submit();
   };
   function myPage() {
      var f = document.mypage;
      f.action = "/web/mypage.do"
      f.method = "post"
      f.submit();
   };
</script>
</head>
<body>
   <div id="header-wrapper">
      <div align="center">
         <div align="right" id="userctr">
         	<form name="allsearch">
            <input type="text" name="find_name" placeholder="검색" id="find_name">
			</form>
			<input type="image" onclick="searchtext()"
               src="${pageContext.request.contextPath}/resources/images/search.png"
               width="30px" height="20px">	
            <c:if test="${empty userid }">
               <a href="<%=request.getContextPath()%>/login.do" style="text-decoration:none">로그인</a>
               <a href="<%=request.getContextPath()%>/registerterms.do" style="text-decoration:none">회원가입</a>
            </c:if>
            <c:if test="${!empty userid}">
               ${nickname}님 환영합니다. &nbsp;&nbsp;&nbsp;
               <a href="javascript:myBasket();" style="text-decoration:none">장바구니</a>
               <a href="javascript:myZzim();" style="text-decoration:none">찜목록</a>
               <a href="javascript:myPage();" style="text-decoration:none">마이페이지</a>
               <a href="<%=request.getContextPath()%>/logout.do" style="text-decoration:none">로그아웃</a>
               <form name="mypage">
                  <input type="hidden" name="id" value="${userid }"> </input>
               </form>
               <form name="basket">
                  <input type="hidden" name="id" value="${userid }"> </input>
               </form>
               <form name="zzim">
                  <input type="hidden"  name="id" value="${userid }"> </input>
               </form>
            </c:if>

         </div>
      </div>
		<div id="header">
			<input type="image" style="width: 280px; height: 120px;"
				src="${pageContext.request.contextPath}/resources/images/logo.png"
				onclick="location.href='main.jsp'" />
			<div id="menu">
				<ul>
					<li class="parent"><a  href="<%=request.getContextPath()%>/info.do"
						accesskey="1" title="">동물지식</a>
						<ul>
							<li class="child"><a  href="<%=request.getContextPath()%>/doginfo.do">강아지
									정보</a></li>
							<li><a href="<%=request.getContextPath()%>/catinfo.do">고양이
									정보</a></li>
						</ul></li>
					<li><a href="<%=request.getContextPath()%>/placepage.do"
						accesskey="2" title="">시설정보</a>
						<ul>
							<li><a href="/web/place.do?place=1&page=1">동물병원</a></li>
							<li><a href="/web/place.do?place=2&page=1">애견카페</a></li>
							<li><a href="/web/place.do?place=3&page=1">동반식당</a></li>
							<li><a href="/web/place.do?place=4&page=1">숙박업소</a></li>
							<li><a href="/web/place.do?place=5&page=1">애견호텔</a></li>
							<li><a href="/web/place.do?place=6&page=1">동반카페</a></li>
						</ul></li>
					<li><a href="<%=request.getContextPath()%>/gallerypage.do"
						accesskey="3" title="">갤러리</a>
						<ul>
							<li><a
								href="<%=request.getContextPath()%>/dog_board.do?page=1">강아지</a></li>
							<li><a
								href="<%=request.getContextPath()%>/cat_board.do?page=1">고양이</a></li>
							<li><a
								href="<%=request.getContextPath()%>/free_board.do?page=1">자유게시판</a></li>
						</ul></li>
					<li><a href="<%=request.getContextPath()%>/parceloutpage.do"
						accesskey="4" title="">분양</a>
						<ul>
							<li><a href="<%=request.getContextPath()%>/selectparce.do?maincate=2&page=1">강아지 분양</a></li>
							<li><a href="<%=request.getContextPath()%>/selectparce.do?maincate=0&page=1">고양이 분양</a></li>
						</ul></li>
					<li><a href="<%=request.getContextPath()%>/marketpage.do"
						accesskey="5" title="">마켓</a>
						<ul>
							<li><a href="<%=request.getContextPath()%>/selectitempage.do?cate=99&maincate=0&page=1">반려견 용품</a></li>
							<li><a href="<%=request.getContextPath()%>/selectitempage.do?cate=99&maincate=2&page=1">반려묘 용품</a></li>
						</ul></li>
					<li><a
						href="<%=request.getContextPath()%>/servicecenterpage.do"
						accesskey="6" title="">고객센터</a>
						<ul>
							<li><a href="<%=request.getContextPath()%>/oneorone.do">1대1문의</a></li>
							<li><a href="<%=request.getContextPath()%>/yackon.do">이용약관</a></li>
						</ul></li>

					<c:if test="${userid eq 'admin' }">

						<li><a
							href="<%=request.getContextPath()%>/placeinsert.do"
							accesskey="7" title="">운영</a>
							<ul>
								<li><a href="<%=request.getContextPath()%>/placeinsert.do">플레이스
										등록</a></li>
								<li><a href="<%=request.getContextPath()%>/iteminsert.do">아이템
										등록</a></li>
							</ul></li>
					</c:if>

				</ul>
			</div>
		</div>
	</div>
	<br><br>
</body>
</html>
