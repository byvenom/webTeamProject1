<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<title>고객센터</title>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
	rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Abel|Satisfy'
	rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/resources/default.css"
	rel="stylesheet" type="text/css" media="all" />
<!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div id="footer-content" >
		<div id="page-wrapper" style="border: 1px dashed #B5A871; height: ">
			<!-- mid -->
			<nav id="sidebar" ><!-- 사이드 메뉴 -->
			<h2>고객센터</h2>
			<ul class="style3">
				<li class="first"><a
					href="<%=request.getContextPath()%>/oneorone.do" style="text-decoration:none">1대1문의</a></li>
				<li><a href="<%=request.getContextPath()%>/yackon.do" style="text-decoration:none">이용약관</a>
				</li>
				<li>
            	<a href="<%=request.getContextPath()%>/konggee.do" style="text-decoration:none">공지사항</a>
            	</li>
			</ul>
			</nav>
			<div id="main">
				<!-- 본문 -->
				
				<p style="font-size: 25px; ">고객센터 입니다. 필요하신 서비스를 선택해주세요.</p>
				
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
