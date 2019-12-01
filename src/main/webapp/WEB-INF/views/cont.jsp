<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 	
	//줄바꿈
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
   
   function recomant(i){
      var watch="recomant"+i;
      
      if(document.getElementById(watch).style.display=="none"){
         document.getElementById(watch).style.display="";
         
      }else{
         document.getElementById(watch).style.display="none";
         
      }
   }
   function recomants(i){
      var watch="recomants"+i;
      
      if(document.getElementById(watch).style.display=="none"){
         document.getElementById(watch).style.display="";
         
      }else{
         document.getElementById(watch).style.display="none";
         
      }
   }
   function recomantz(i){
      var watch="recomantz"+i;
      var d = "watch"+i;
      var a = document.getElementsByClassName(watch);
      for(var c=0;c<a.length;c++){
      if(a[c].style.display==""){
         a[c].style.display="none";
         document.getElementById(d).value="[더보기]";
         
         
      }else{
         a[c].style.display="";
         document.getElementById(d).value="[숨기기]";
      }
      }
   }
   function watch(step,grp){
      var watch="watch"+grp;
      if(step!=0){
         var a = document.getElementsByClassName(watch);
         document.getElementById(watch).style.display="none";
      }
      
   }
   function login(i){
      if(typeof i == "undefined" || i == null ||i == ""){
         alert("로그인을 해주세요!");
         }
      }
   function deleteCheck1(i){
         var check = confirm("정말로 삭제 하시겠습니까???");

         if(check){
            location.href="board_delete.do?bno="+i;
            }
      }
   function deleteCheck2(i,y,a,b,c,d){
      
      var check = confirm("정말로 삭제 하시겠습니까???");
   
      if(check){
         location.href="commant_delete.do?bno="+y+"&no="+i+"&a="+a+"&b="+b+"&c="+c+"&d="+d;
         }
   }
   
   
</script>
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

	<c:set var="dto" value="${cont }"></c:set>
	<div id="footer-wrapper">
		<div id="footer-content">
			<div id="fbox4">
				<%-- <h2 align="center">
					${dto.getWriter() }님 &nbsp;<span>상세내역</span>
				</h2> --%>
				<div align="right">

					
					<c:if test="${dto.getWriter()==nickname }">
						<a
							href="<%=request.getContextPath()%>/free_update.do?bno=${dto.getNo()}"
							style="text-decoration: none"><b>[수정]</b></a> &nbsp;
               <a href="#" style="text-decoration: none"
							onclick="deleteCheck1(${dto.getNo()})"><b>[삭제]</b></a>&nbsp;&nbsp;
<%--                <a href="<%=request.getContextPath()%>/board_delete.do?bno=${dto.getNo()}" style="text-decoration:none">[삭제]</a> --%>
					</c:if>
					
					<c:set var="ck" value="${qwe }"></c:set>
					<c:set var="ck2" value="${asd }"></c:set>
					<c:set var="ck3" value="${grpCnt }"></c:set>

					<c:if test="${ ck==0 or ck==null}">
						<c:if test="${!(userid==''or userid==null) }">
							<a
								href="<%=request.getContextPath()%>/like.do?bno=${dto.getNo()}&id=${userid}&cpage=${cpage}"
								style="text-decoration: none"><img
								src="${pageContext.request.contextPath}/resources/images/unheart.png"
								width="28" height="28" style="vertical-align: bottom;"></a>
						</c:if>
						<c:if test="${(userid==''or userid==null) }">
							<a href="#" onclick="login(${userid})"
								style="text-decoration: none"><img
								src="${pageContext.request.contextPath}/resources/images/unheart.png"
								width="28" height="28" style="vertical-align: bottom;"></a>
						</c:if>

					</c:if>
					<c:if test="${ck==1}">
						<a
							href="<%=request.getContextPath()%>/unlike.do?bno=${dto.getNo()}&id=${userid}&cpage=${cpage}"
							style="text-decoration: none"><img
							src="${pageContext.request.contextPath}/resources/images/heart.png"
							width="28" height="28" style="vertical-align: bottom;"></a>

					</c:if>
				</div>


				<table border="1" width="1000" cellspacing="0">
					<tr>
						<th width="120" height="50">작성자</th>
						<td>${dto.getWriter() }</td>
					</tr>
					<tr>
						<th height="50">제목</th>
						<td>${dto.getTitle() }</td>
					<tr>
					<tr>
						<th height="50">내용</th>
						<td><div style="min-height: 1000px;">${fn:replace(dto.getCont(), cn,br)}<br><br><c:forTokens
								items="${dto.getUpload() }" delims="/" var="i">
								<img alt="" style="min-height: 360px; min-width: 480px; max-height: 600px; max-width: 800px;"
									src="${pageContext.request.contextPath}/resources/upload/${i}"></img> <br>
                     </c:forTokens></div></td>
					<tr>
					<tr>
						<th height="50">좋아요</th>
						<td>${dto.getUp() }</td>
					<tr>
					<tr>
						<th height="50">조회수</th>
						<td>${dto.getHit() }</td>
					<tr>
				</table>

				<div align="center">



					&nbsp;&nbsp;&nbsp;
					<br><br>
					<button type="button" onclick="location.href='main.do'">홈 으 로</button>
				</div>
				<br> <br>

				<div id="footer-reply">


					<c:set var="commant" value="${commant }"></c:set>

					<ul class="style2">


						<c:if test="${!empty commant }">
							<c:set var="index" value="0"></c:set>
							<%
								int change = 0;
							%>
							<c:forEach items="${commant }" var="v">





								<c:if test="${v.getIndent()==0 }">
									<li>
								</c:if>
								<c:if test="${v.getIndent()>0 }">
									<li class="recomantz${v.getGrp() }" style="display:;">
								</c:if>
								<div style="float: left">


									<c:forEach begin="1" end="${v.getIndent() }">·&nbsp;&nbsp;</c:forEach>
								</div>
								<c:if test="${v.getIndent()>0 }">
									<b style="color: orange;">└</b>
								</c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${v.getWriter() }</b>&nbsp;<c:if
									test="${v.getWriter().equals(dto.getWriter()) }">
									<img
										src="${pageContext.request.contextPath}/resources/images/writer.png"
										width="54" height="20" style="vertical-align: top;">
								</c:if>
                           &nbsp;(${v.getRegdate().substring(0,16) })&nbsp;
                        <c:if
									test="${ (ck2[index]==0 or ck2[index]==null) and !v.getWriter().equals('운영자')}">
									<c:if test="${!(userid==''or userid==null)}">
                           ${ch2[index] }
                           <a
											href="<%=request.getContextPath()%>/commant_like.do?no=${dto.getNo() }&bno=${v.getNo()}&id=${userid}&cpage=${cpage}"
											style="text-decoration: none"><img
											src="${pageContext.request.contextPath}/resources/images/unheart.png"
											width="20" height="20" style="vertical-align: top;"></a>
									</c:if>
									<c:if test="${(userid==''or userid==null)}">
                           ${ch2[index] }
                              <a href="#" onclick="login(${userid})"
											style="text-decoration: none"><img
											src="${pageContext.request.contextPath}/resources/images/unheart.png"
											width="20" height="20" style="vertical-align: top;"></a>
									</c:if>


								</c:if>
								<c:if test="${ck2[index]==1 and !v.getWriter().equals('운영자')}">
                        ${ch2[index] }
                           <a
										href="<%=request.getContextPath()%>/commant_unlike.do?no=${dto.getNo() }&bno=${v.getNo()}&id=${userid}&cpage=${cpage}"
										style="text-decoration: none"><img
										src="${pageContext.request.contextPath}/resources/images/heart.png"
										width="20" height="20" style="vertical-align: top;"></a>

								</c:if>
                              &nbsp;
                        <c:if test="${!v.getWriter().equals('운영자')}">
									<b>${v.getUp() }</b>
								</c:if>
								<c:if test="${v.getWriter().equals(nickname) }">
                              &nbsp;
                              

                           
                              
                           <input type="button"
										style="border: none; background: none; vertical-align: top;"
										onclick="recomants(${index })" value="[수정]">
                              &nbsp;
                              
                           <a href="#" style="text-decoration: none"
										onclick="deleteCheck2(${v.getNo()},${dto.getNo() },'${userid }',${ck },${ck2[index] },${cpage })">
										<img
										src="${pageContext.request.contextPath}/resources/images/close.png"
										width="12" height="12" style="vertical-align: top;">
									</a>


								</c:if>
								<br>
								<c:forEach begin="1" end="${v.getIndent() }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${v.getCont() }
                           <div align="right"
									style="margin-right: 20px;">
									<%-- <c:if test="${v.getIndent()==0 }"> onload="watch(${v.getStep()},${v.getGrp() })" --%>
									<%--    <input type="button"  value="rsa" onclick="watch(${v.getStep()},${v.getGrp() })"> --%>
									<c:if test="${v.getIndent()==0 and ck3[index]>1}">
										<input type="button" id="watch${v.getGrp() }"
											style="border: none; background: none; vertical-align: middle;"
											onclick="recomantz(${v.getGrp()})" value="[숨기기]">

									</c:if>

									<c:if test="${!v.getWriter().equals('운영자')}">
										<input type="button"
											style="border: none; background: none; vertical-align: middle;"
											onclick="recomant(${index})" value="[답글]">
									</c:if>



								</div>
								<c:if test="${v.getWriter().equals('운영자')}">
									<input type="button"
										style="border: none; background: none; vertical-align: middle;"
										onclick="" value="">
								</c:if>
								</li>


								<li id="recomant${index }" style="display: none;">
									<form method="post" id="frm"
										action="<%=request.getContextPath()%>/reply.do?bno=${dto.getNo()}&cpage=${cpage}">



										<table>

											<tr>
												<td><input type="hidden" value="${v.getGrp() }"
													name="grp"> <input type="hidden"
													value="${v.getStep() }" name="step"> <input
													type="hidden" value="${v.getIndent() }" name="indent">
													<input type="hidden" name="writer" value="${nickname }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if
														test="${!(userid==''or userid==null) }">
														<textarea cols="105" rows="3" name="cont"
															placeholder="내용을 작성해 주세요." style="resize: none;"></textarea>
													</c:if> <c:if test="${userid==''or userid==null}">
														<textarea cols="105" rows="3" name="cont"
															placeholder="로그인이 필요합니다." style="resize: none;" readonly></textarea>
													</c:if>&nbsp;&nbsp;<button type="submit" 
													onclick="login(${userid})"
													style="float: right; margin-right: 20px;">작 성 하 기</button></td>
											</tr>
										</table>
									</form>
								</li>
								<li id="recomants${index }" style="display: none;">
									<form method="post"
										action="<%=request.getContextPath()%>/commant_update.do?bno=${dto.getNo()}&no=${v.getNo()}&userid=${userid}&qwe=${ck}&asd=${ck2[index]}&cpage=${cpage}">
										<table>

											<tr>
												<td><input type="hidden" value="${v.getGrp() }"
													name="grp"> <input type="hidden"
													value="${v.getStep() }" name="step"> <input
													type="hidden" value="${v.getIndent() }" name="indent">
													<input type="hidden" name="writer" value="${nickname }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if
														test="${!(userid==''or userid==null) }">
														<textarea cols="105" rows="3" name="cont"
															placeholder="수정 할 내용을 작성해 주세요." style="resize: none;"></textarea>
													</c:if> <c:if test="${userid==''or userid==null}">
														<textarea cols="105" rows="3" name="cont"
															placeholder="로그인이 필요합니다." style="resize: none;" readonly></textarea>
													</c:if>&nbsp;&nbsp;<button type="submit" 
													onclick="login(${userid})"
													style="float: right; margin-right: 20px;">작 성 하 기</button></td>
											</tr>
										</table>
									</form>
								</li>
								<c:set var="index" value="${index+1}"></c:set>
							</c:forEach>
						</c:if>
					</ul>
					<br>
					<div align="center">
						<c:if test="${cpage > block }">
                [<a href="cont.do?no=${dto.getNo() }&cpage=1">◀◀</a>]
                [<a
								href="cont.do?no=${dto.getNo() }&cpage=${startBlock-1 }">◀</a>]
             </c:if>

						<c:forEach begin="${startBlock }" end="${endBlock }" var="p">
							<c:if test="${p == cpage }">
								<u><b>[${p }]</b></u>

							</c:if>
							<c:if test="${!(p == cpage) }">
                   [<a href="cont.do?no=${dto.getNo() }&cpage=${p }">${p }</a>]
                
                </c:if>
						</c:forEach>

						<c:if test="${endBlock < allPage }">
                   [<a
								href="cont.do?no=${dto.getNo() }&cpage=${endBlock +1 }">▶</a>]
                   [<a
								href="cont.do?no=${dto.getNo() }&cpage=${allPage }">▶▶</a>]
                </c:if>
					</div>
					<form method="post"
						action="<%=request.getContextPath()%>/commant.do?no=${dto.getNo()}&cpage=${cpage}">



						<input type="hidden" name="contdto" value="${cont }"> <input
							type="hidden" name="writer" value="${nickname }">
						<div align="center">
							<br> <br>
							<c:if test="${!(userid==''or userid==null) }">
								<textarea rows="8" cols="120" name="cont"
									placeholder="내용을 작성해 주세요."
									style="width: 600px; resize: none; vertical-align: middle; margin-bottom: 30px"></textarea>
							</c:if>
							<c:if test="${userid==''or userid==null }">
								<textarea rows="8" cols="120" name="cont"
									placeholder="로그인이 필요합니다."
									style="width: 600px; resize: none; vertical-align: middle; margin-bottom: 30px"
									readonly></textarea>
							</c:if>
							&nbsp;&nbsp; <button type="submit"
								onclick="login(${userid})"
								style="width: 125px; height: 125px; vertical-align: middle; margin-bottom: 30px; font-size:20px; font-weight: bold; ">작 성</button>

						</div>
					</form>
				</div>

			</div>

		</div>
	</div>


	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>