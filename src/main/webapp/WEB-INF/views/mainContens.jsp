<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <!-- <meta http-equiv="Refresh" content="5" /> -->
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	var count = 1;
	function img_back() {
		$("#conten1").css('display', 'none');
		if (count == 1) {
			img2();
			count = 2;
		} else {
			img1();
			count = 1;
		}
		$("#conten1").fadeIn(1000);
	}
	function img_next() {
		$("#conten1").css('display', 'none');
		if (count == 1) {
			img2();
			count = 2;
		} else {
			img1();
			count = 1;
		}
		$("#conten1").fadeIn(1000);
	}
	/* 	var count = 1;
	 function img_back() {
	 $("#conten1").fadeIn("slow");
	 $("#conten2").fadeOut(2000);
	 //document.getElementById('conten1').style.display="block";
	 //document.getElementById('conten2').style.display="none";
	 }
	 function img_next() {
	 $("#conten2").fadeIn("slow");
	 $("#conten1").fadeOut(2000);
	 //document.getElementById('conten1').style.display="none";
	 //document.getElementById('conten2').style.display="block";
	 } */

	function img1() {
		$(".mainItem1").css('background-image',
				'url(./resources/images/잠자는곳을_최적의_온도로.PNG)');
		$(".mainItem2").css('background-image',
				'url(./resources/images/우리집은_내가지킨다.PNG)');
		$(".mainItem3").css('background-image',
				'url(./resources/images/2번사진.gif)');
		$(".mainItem4").css('background-image',
				'url(./resources/images/장난은_금물.PNG)');
		$(".mainItem5").css('background-image',
				'url(./resources/images/절대_고양이를_키워선_안되는사람들.jpg)');
	}

	function img2() {
		$(".mainItem1").css('background-image',
				'url(./resources/images/cat3.jpg)');
		$(".mainItem2").css('background-image',
				'url(./resources/images/dog.gif)');
		$(".mainItem3").css('background-image',
				'url(./resources/images/dog1.gif)');
		$(".mainItem4").css('background-image',
				'url(./resources/images/cat2.gif)');
		$(".mainItem5").css('background-image',
				'url(./resources/images/cat3.jpg)');
	}

	setInterval(function() {

		if (count == 1) {
			img2();
			count = 2;
			$("#conten1").css('display', 'none');
			$("#conten1").fadeIn(1000);

			//document.getElementById('conten1').style.display = "block";
		} else {
			img1();
			count = 1;
			$("#conten1").css('display', 'none');
			$("#conten1").fadeIn(1000);

			//document.getElementById('conten1').style.display = "none";
			//document.getElementById('conten2').style.display = "block";
		}
	}, 9000);

	/* 	setInterval(function() {
	 if (count == 1) {
	 $("#conten1").fadeIn("slow");
	 count=2;
	 $("#conten2").fadeOut(2000);
	
	 //document.getElementById('conten1').style.display = "block";
	 } else {
	 $("#conten2").fadeIn("slow");
	 count=1;		
	 $("#conten1").fadeOut(2000);
	
	
	 //document.getElementById('conten1').style.display = "none";
	 //document.getElementById('conten2').style.display = "block";
	 }
	 }, 4000); */
</script>
<style type="text/css">
#main-wrapper1 {
	margin-left: 20%;
	margin-right: 20%;
	width: 60%;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	width: 60%;
	/* grid-gap: 10px; */
	/* grid-auto-rows: minmax(50px, auto); */
	position: relative;
}

#main-wrapper2 {
	margin-left: 20%;
	margin-right: 20%;
	width: 60%;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	width: 60%;
	/* grid-gap: 10px; */
	/* grid-auto-rows: minmax(50px, auto); */
	position: absolute;
	top: 190px;
	left: 0px;
}

.mainItem1 {
	background-image: url("./resources/images/잠자는곳을_최적의_온도로.PNG");
	background-size: 400px auto;
	grid-column-start: 1;
	grid-column-end: 2;
	grid-row-start: 1;
	grid-row-end: 2;
	color: white;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
	font-size: 24px;
}

.mainItem1:hover {
	opacity: 0.3;
}

.mainItem2 {
	background-image: url("./resources/images/우리집은_내가지킨다.PNG");
	background-size: 400px auto;
	grid-column-start: 1;
	grid-column-end: 2;
	grid-row-start: 2;
	grid-row-end: 3;
	color: white;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
	font-size: 24px;
}

.mainItem2:hover {
	opacity: 0.3;
}

.mainItem3 {
	background-image: url("./resources/images/2번사진.gif");
	background-size: 400px 400px;
	grid-column-start: 2;
	grid-column-end: 3;
	grid-row-start: 1;
	grid-row-end: 3;
	width: 400px;
	height: 400px;
	color: white;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
	font-size: 32px;
}

.mainItem3:hover {
	opacity: 0.3;
}

.mainItem4 {
	background-image: url("./resources/images/장난은_금물.PNG");
	background-size: 400px auto;
	grid-column-start: 3;
	grid-column-end: 4;
	grid-row-start: 1;
	grid-row-end: 2;
	color: white;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
	font-size: 24px;
}

.mainItem4:hover {
	opacity: 0.3;
}

.mainItem5 {
	background-image: url("./resources/images/절대_고양이를_키워선_안되는사람들.jpg");
	background-size: 400px auto;
	grid-column-start: 3;
	grid-column-end: 4;
	grid-row-start: 2;
	grid-row-end: 3;
	color: white;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
	font-size: 24px;
}

.mainItem5:hover {
	opacity: 0.3;
}

.mainItem1_1 {
	background-image: url("./resources/images/cat3.jpg");
	background-size: 400px auto;
	grid-column-start: 1;
	grid-column-end: 2;
	grid-row-start: 1;
	grid-row-end: 2;
	color: white;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
	font-size: 24px;
}

.mainItem1_1:hover {
	opacity: 0.3;
}

.mainItem2_1 {
	background-image: url("./resources/images/dog.gif");
	background-size: 400px auto;
	grid-column-start: 1;
	grid-column-end: 2;
	grid-row-start: 2;
	grid-row-end: 3;
	color: white;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
	font-size: 24px;
}

.mainItem2_1:hover {
	opacity: 0.3;
}

.mainItem3_1 {
	background-image: url("./resources/images/dog1.gif");
	background-size: 400px 400px;
	grid-column-start: 2;
	grid-column-end: 3;
	grid-row-start: 1;
	grid-row-end: 3;
	width: 400px;
	height: 400px;
	color: white;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
	font-size: 32px;
}

.mainItem3_1:hover {
	opacity: 0.3;
}

.mainItem4_1 {
	background-image: url("./resources/images/cat2.gif");
	background-size: 400px auto;
	grid-column-start: 3;
	grid-column-end: 4;
	grid-row-start: 1;
	grid-row-end: 2;
	color: white;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
	font-size: 24px;
}

.mainItem4_1:hover {
	opacity: 0.3;
}

.mainItem5_1 {
	background-image: url("./resources/images/cat3.jpg");
	background-size: 400px auto;
	grid-column-start: 3;
	grid-column-end: 4;
	grid-row-start: 2;
	grid-row-end: 3;
	color: white;
	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
	font-size: 24px;
}

.mainItem5_1:hover {
	opacity: 0.3;
}

#img_back {
	position: absolute;
	top: 355px;
	left: 160px;
	background-color: white;
}

#img_next {
	position: absolute;
	top: 355px;
	right: 160px;
	background-color: white;
}
</style>


<body>
	<div style="height: 400px;">
		<img alt="" id="img_back" src="./resources/images/left.jpg"
			onclick="img_back()" style="cursor: pointer;">
		<div id="conten1" style="display: block;">
			<div id="main-wrapper1" style="margin-bottom: 20px;">
				<div class="mainItem1"
					onclick="location.href='http://localhost:8383/web/cont.do?no=1&cpage=1'"
					style="cursor: pointer">잠자는곳을 최적의 온도로</div>
				<div class="mainItem2"
					onclick="location.href='http://localhost:8383/web/cont.do?no=2&cpage=1'"
					style="cursor: pointer">우리집은 내가지킨다</div>
				<div class="mainItem3"
					onclick="location.href='http://localhost:8383/web/cont.do?no=3&cpage=1'"
					style="cursor: pointer">집사가 돌아왔다?!</div>
				<div class="mainItem4"
					onclick="location.href='http://localhost:8383/web/cont.do?no=4&cpage=1'"
					style="cursor: pointer">장난은 금물</div>
				<div class="mainItem5"
					onclick="location.href='http://localhost:8383/web/cont.do?no=5&cpage=1'"
					style="cursor: pointer">절대 고양이를 키워선 안되는사람들</div>
			</div>
		</div>
		<!-- <div id="conten2" style="display: block;">
				<div id="main-wrapper2" style="margin-bottom: 20px;">
					<div class="mainItem1_1"
						onclick="location.href='http://localhost:8383/web/cont.do?no=6&cpage=1'"
						style="cursor: pointer">5대죄악이있습니다.</div>
					<div class="mainItem2_1"
						onclick="location.href='http://localhost:8383/web/cont.do?no=7&cpage=1'"
						style="cursor: pointer">첫째는 나태의 죄악입니다. 평생 나태해지졍</div>
					<div class="mainItem3_1"
						onclick="location.href='http://localhost:8383/web/cont.do?no=8&cpage=1'"
						style="cursor: pointer">둘째는 탐욕</div>
					<div class="mainItem4_1"
						onclick="location.href='http://localhost:8383/web/cont.do?no=9&cpage=1'"
						style="cursor: pointer">셋쨰는 섹욕</div>
					<div class="mainItem5_1"
						onclick="location.href='http://localhost:8383/web/cont.do?no=10&cpage=1'"
						style="cursor: pointer">넷째는 거짓</div>
				</div>
			</div> -->

		<img alt="" id="img_next" src="./resources/images/right.jpg"
			onclick="img_next()" style="cursor: pointer">
	</div>
</body>
</html>