<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>자바 캠핑카</title>
<link href="${contextPath}/resources/css/main_all.css" rel="stylesheet" />
<link HREF = "http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"  rel="stylesheet" />
<%@ include file="include/plugin.jsp" %>
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/plugins/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/plugins/slick/slick-theme.css"/>
</head>
<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="include/header.jsp" %>
	<!--// #header end -->
	
	<div id="wrap">
<!-- ================================================================================ -->

<style>
#mainvisual .inner {text-align:center; position:relative; top:430px;}
#mainvisual .text {font-family: 'GmarketSansMedium'; font-size:55px; color:#ffffff; letter-spacing:-1px; word-spacing:-1px;}
#mainvisual .text:nth-child(1) {font-weight:bold;}
#mainvisual .text:nth-child(2) {font-family:GmarketSansLight; font-weight:300 !important;}
.mainrow .inner {width:1200px; margin:0px auto; padding:60px 0px 60px 0px;}
.mainrow h3 {font-family: 'GmarketSansMedium'; font-size:42px; text-align:center; text-align:center;}
.mainrow .desc {text-align:center; padding:0px 0px 60px 0px;}
.mainrow.para01 {background:#ffffff;}
.carslide {width:1230px;}
.carslide .card {margin:0px 30px 0px 0px; cursor:pointer; text-align:center;}
.carslide h5 {font-weight:bold; padding:15px 0px 0px 0px;}
.carslide .card img {width:277px; height:277px; border-radius: 5px 5px 0px 0px;}
.carslide .card-text {margin:0px 0px 15px 0px;}
.carslide .card a {color:#ffffff !important; margin:0px 0px 15px 0px;}

.para02 {background:url("${contextPath}/resources/img/main/para02_bg.jpg");}
.para02 h3 {color:#ffffff;}
.para02 .desc {color:rgba(255, 255, 255, 0.6);}
.para02 ul {width:1230px;}
.para02 li {float:left; margin:0px 30px 0px 0px; position:relative; top:0; left:0;}
.para02 .icon {border-radius: 50%; border:1px solid #ffffff; width:175px; height:175px; text-align:center;}
.para02 li i {color:#ffffff; font-size:80px; position:relative; top:40px;}
.para02 li:nth-child(4) i {font-size:70px; top:50px;}
.para02 li:nth-child(5) i {font-size:70px; top:50px;}
.para02 .text {color:#ffffff; font-size:20px; text-align:center; padding:20px 0px 0px 0px; font-weight:bold;}

/* mouseenter */
.para02 li.on .icon {background:#ffffff;}
.para02 li.on i {color:#0b3e09;}
</style>


<div id="mainvisual">
<div class="inner">
	<div class="text" data-aos="fade-down" data-aos-easing="linear" data-aos-duration="800">세상을 바라보는 또 하나의 새로운 창</div>
	<div class="text" data-aos="fade-down" data-aos-easing="linear" data-aos-duration="800" data-aos-delay="300">자바캠핑카가 여러분의 여정과 함께합니다</div>
</div>
</div>

<div class="mainrow para01">
<div class="inner">
	<h3>차량 목록</h3>
	<p class="desc">자바캠핑카가 운용중인 캠핑카를 만나보세요.</p>
	<div class="carslide">
	<c:forEach items="${carlist }" var="car">
	    <div class="card" onclick="location.href='${contextPath}/car/read?car_regid=${car.car_regid }';">
	      <img src="${contextPath }/resources/data/car/${car.car_file }" alt="" />
	      <div class="card-body">
	        <h5 class="card-title">${car.car_name }</h5>
	        <p class="card-text">${car.car_modelname }</p>
	        <a href="#" class="btn btn-primary">자세히 보기</a>
	      </div>
	    </div>	
	</c:forEach>
	</div>
</div>
</div>

<div class="mainrow para02">
<div class="inner">
	<h3>바로가기</h3>
	<p class="desc">자바캠핑카 바로가기 서비스입니다.</p>
	<ul class="clearfix">
		<li>
			<a href="${contextPath }/car/list">
				<p class="icon"><i class="fa-solid fa-truck-moving"></i></p>
				<p class="text">차량 목록</p>			
			</a>
		</li>	
		<li>
			<a href="${contextPath }/rent/list">
				<p class="icon"><i class="fa-regular fa-calendar-plus"></i></p>
				<p class="text">예약하기</p>
			</a>
		</li>
		<li>
			<a href="${contextPath }/rent/read">
				<p class="icon"><i class="fa-regular fa-calendar-check"></i></p>
				<p class="text">예약 확인</p>			
			</a>
		</li>

		<li>
			<a href="${contextPath }/garage/list">
				<p class="icon"><i class="fa-solid fa-wrench"></i></p>
				<p class="text">정비소 검색</p>			
			</a>
		</li>
		<li>
			<a href="${contextPath }/qna/qnalist?keyword=">
				<p class="icon"><i class="fa-solid fa-comments"></i></p>
				<p class="text">이용문의</p>			
			</a>
		</li>		
		<li>
			<a href="${contextPath }/faqboard/listAll?keyword=">
				<p class="icon"><i class="fa-solid fa-clipboard-question"></i></p>
				<p class="text">자주하는 질문</p>			
			</a>
		</li>
	</ul>
</div>
</div>

<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${contextPath }/resources/plugins/slick/slick.min.js"></script>

<script>
AOS.init();
$(document).ready(function(){
	var windowHeight = window.innerHeight;
	$("#mainvisual").css({"height":windowHeight+"px"});
	$('.carslide').slick({
		  slidesToShow: 4,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
	});
	$(".para02 li").each(function(index, item){
		$(this).mouseenter(function(){
			$(this).switchClass("","on",3000);
		});
		$(this).mouseleave(function(){
			$(this).switchClass("on","",3000);
		});		
	})	
});	

</script>

<!-- ================================================================================ -->		

	</div><!-- // #wrap end -->
	
	<!-- #footer start -->
	<%@ include file="include/footer.jsp" %>
	<!-- //#footer end -->
	
</div><!-- // #container end -->


</body>
</html>
