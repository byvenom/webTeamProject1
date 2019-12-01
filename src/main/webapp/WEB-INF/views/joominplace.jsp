<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="name" value="${place }"></c:set>
<c:set var="place" value="${list }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${name }정보</title>

</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div id="footer-wrapper">
		<div id="footer-content">
			<h2>${name }</h2>
			<c:if test="${!empty place}">
				<c:forEach items="${place}" var="p">
					<span
						style="display: inline-block; width: 450px; height: 300px; background-color: gray; margin: 20px;"
						onclick="location.href='placeinfo.do?no=${p.getNo()}'"> <c:forTokens
							items="${p.getPhoto() }" delims="/" var="i">
							<img alt="" width="450" height="200" onerror="this.src='${pageContext.request.contextPath}/resources/upload/nopic.png';"
								src="${pageContext.request.contextPath}/resources/upload/${fn:substring(i,0,fn:indexOf(i,'/')) }"> &nbsp;&nbsp;
							</c:forTokens><br> ${p.getTitle() }<br> ${p.getAddr() }<br>
						${p.getTel() }<br>
					</span>
				</c:forEach>
			</c:if>
			<br/>
			<br/>
			<br/>
			<div align="center">
				<c:if test="${page > 3 }">
	  	    	[<a href="place.do?page=1&place=${no } ">◀◀</a>]
	  	    	[<a href="place.do?page=${start - 1 }&place=${no }">◀</a>]
	  	    </c:if>
				<c:forEach begin="${start }" end="${end }" var="i">
					<c:if test="${i == page }">
						<u><b>[${i }]</b></u>
					</c:if>

					<c:if test="${!(i == page) }">
	  	    		[<a href="place.do?page=${i }&place=${no }">${i }</a>]
	  	    	</c:if>
				</c:forEach>
				<c:if test="${end < all }">
	  	    	[<a href="place.do?page=${end + 1 }&place=${no }">▶</a>]
	  	    	[<a href="place.do?page=${all }&place=${no }">▶▶</a>]
	  	    </c:if>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>