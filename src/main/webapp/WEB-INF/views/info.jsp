<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>이개뭐냥</title>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300'
	rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Abel|Satisfy'
	rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/resources/default.css"
	rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div id="footer-wrapper">
		<div id="footer-content">
			<div id="info">
				<h3>
					<span>동물정보입니다</span>
				</h3>
				<p>동물에 관한 정보를 알수있는 동물정보 게시판입니다.</p>
			</div>
			<br></br> <select id="ord" name="ord" onchange="change()">
				<c:if test="${ord == 'date'}">
					<option selected="selected" value="date">최신순</option>
					<option value="cnt">조회순</option>
					<option value="rec">추천순</option>
				</c:if>
				<c:if test="${ord == 'cnt'}">
					<option value="date">최신순</option>
					<option selected="selected" value="cnt">조회순</option>
					<option value="rec">추천순</option>
				</c:if>
				<c:if test="${ord == 'rec'}">
					<option value="date">최신순</option>
					<option value="cnt">조회순</option>
					<option selected="selected" value="rec">추천순</option>
				</c:if>
			</select> <span style="float: right"> <input type="button" value="글쓰기"
				onclick="location.href='write.jsp' "></button> &nbsp;&nbsp;&nbsp; <input
					type="button" value="검색" onclick="location.href='search.jsp' "></button></span>

			<table border="1" width="1000" cellspacing="0">
				<tr>
					<th style="width: 8%">글번호</th>
					<th style="width: 48%">글제목</th>
					<th style="width: 14%">글쓴이</th>
					<th style="width: 14%">작성일자</th>
					<th style="width: 8%">조회수</th>
					<th style="width: 8%">추천수</th>
				</tr>
				<c:set var="list" value="${List }"></c:set>
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="i">
						<tr>
							<td>${i.getNo() }</td>
							<td><a href="board_cont.do?no=${i.getNo() }">
									${i.getTitle() }</a></td>
							<td>${i.getWriter()}</td>
							<td>${i.getRegdate().substring(0,10) }</td>
							<td>${i.getHit() }</td>
							<td>${i.getUp() }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list }">
					<tr>
						<td colspan="6" align="center">
							<h3>검색된 레코드가 없습니다.</h3>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link
	href="${pageContext.request.contextPath}/resources/default.css?ver=1"
	rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>


	<div id="footer-wrapper">
		<div id="footer-content">
			<div id="fbox4">
				<h2 align="center">
					강아지 <span>정보</span>
				</h2>


				<table border="1" width="1000" cellspacing="0">

					<tr>
						<th style="border:5px outset #A4B9C6;">번호</th>
						<th style="border:5px outset #A4B9C6;">카테고리</th>
						<th style="border:5px outset #A4B9C6;">제목</th>
						<th style="border:5px outset #A4B9C6;">작성자</th>
						<th style="border:5px outset #A4B9C6;">작성일</th>
						<th style="border:5px outset #A4B9C6;">추천</th>
						<th style="border:5px outset #A4B9C6;">조회수</th>
					</tr>

					<c:set var="list" value="${List }"></c:set>
					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="i">
							<tr>
								<td align="center" style="border: hidden;">${i.getNo() }</td>
								<td align="center" style="border: hidden;"><c:if
										test="${i.getCate().equals('dogInfo')}">
                        강아지 정보</c:if></td>
								<!-- cont.do?qwe=0 -->
								<td style="border: hidden;"><a href="readcount.do?no=${i.getNo()}"
									style="text-decoration: none"><img
										src="${pageContext.request.contextPath}/resources/upload/${fn:substring(i.getUpload(),0,fn:indexOf(i.getUpload(),'/'))}"
										alt="" width="72" height="54" style="vertical-align: middle;"></img>
										&nbsp;&nbsp;&nbsp;<b>${i.getTitle() }</b></a></td>
								<td align="center" style="border: hidden;">${i.getWriter() }</td>
								<td align="center" style="border: hidden;">${fn:substring(i.getRegdate(),5,10) }</td>
								<td align="center" style="border: hidden;">${i.getUp() }</td>
								<td align="center" style="border: hidden;">${i.getHit() }</td>
							</tr>


						</c:forEach>
					</c:if>
					<c:if test="${empty list }">
						<tr>
							<td colspan="7" align="center"><br> <br>
								<h2>지식 정보가 없습니다.</h2></td>
						</tr>
					</c:if>
					</table>
					<br><br><br><hr style="border: 1px solid #e8e8e8;"><br><br>
				<h2 align="center">
					고양이 <span>정보</span>
				</h2>


				<table border="1" width="1000" cellspacing="0">

					<tr>
						<th style="border:5px outset #A4B9C6;">번호</th>
						<th style="border:5px outset #A4B9C6;">카테고리</th>
						<th style="border:5px outset #A4B9C6;">제목</th>
						<th style="border:5px outset #A4B9C6;">작성자</th>
						<th style="border:5px outset #A4B9C6;">작성일</th>
						<th style="border:5px outset #A4B9C6;">추천</th>
						<th style="border:5px outset #A4B9C6;">조회수</th>
					</tr>

					<c:set var="list2" value="${List2 }"></c:set>
					<c:if test="${!empty list2 }">
						<c:forEach items="${list2 }" var="i">
							<tr>
								<td align="center" style="border: hidden;">${i.getNo() }</td>
								<td align="center" style="border: hidden;"><c:if
										test="${i.getCate().equals('catInfo')}">
                        고양이 정보</c:if></td>
								<!-- cont.do?qwe=0 -->
								<td style="border: hidden;"><a href="readcount.do?no=${i.getNo()}"
									style="text-decoration: none"><img
										src="${pageContext.request.contextPath}/resources/upload/${fn:substring(i.getUpload(),0,fn:indexOf(i.getUpload(),'/'))}"
										alt="" width="72" height="54" style="vertical-align: middle;"></img>
										&nbsp;&nbsp;&nbsp;<b>${i.getTitle() }</b></a></td>
								<td align="center" style="border: hidden;">${i.getWriter() }</td>
								<td align="center" style="border: hidden;">${fn:substring(i.getRegdate(),5,10) }</td>
								<td align="center" style="border: hidden;">${i.getUp() }</td>
								<td align="center" style="border: hidden;">${i.getHit() }</td>
							</tr>


						</c:forEach>
					</c:if>
					<c:if test="${empty list2 }">
						<tr>
							<td colspan="7" align="center"><br> <br>
								<h2>지식 정보가 없습니다.</h2></td>
						</tr>
					</c:if>
				</table>
				<div align="center">
					<br> <br>
					<c:if test="${nickname=='운영자'}"><button type="button" onclick="location.href='info_insert.do'">글
						작 성</button></c:if>
					
					&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='main.do'">홈
						으 로</button>
					<br> <br>

					
				</div>

			</div>

		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>