<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file="menulist.jsp" %>


<style>
.dropmenu{
	background-color: transparent;
	border-color: transparent;
	width: 250px;	
}
.one{
	display: inline-block;
}
</style>

<div id="header_over">
</div>

<div id="header_outer">
<div id="header">

	<div id="gnb" class="clearfix">
	<ul>
		<li>
			<a href="${contextPath }/user/join">회원가입</a>
		</li>
		<c:if test="${user.car_uid == null}">
			<li>
				<a class="one" href="${contextPath }/user/login">로그인</a>
			</li>
		</c:if>
		<c:if test="${user.car_uid != null}">
			<li>
				<a class="nav-link one" href="${contextPath }/logout">로그아웃</a>
			</li>
		</c:if>
		<c:if test="${user.car_uid == 'admin'}">
			<li>
				<a class="one" style="margin-left: 10px" href="${contextPath }/admin/" target="_blank">관리자</a>
			</li>
		</c:if>
	</ul>
	</div>
	
	<div id="topmenu_outer" class="clearfix">
		<h1><a href="${contextPath }/"><img src="${contextPath }/resources/img/header/logo_off.png" alt="자바 캠핑카" /></a></h1>
		<div id="topmenu">
			<ul class="clearfix">
			<c:forEach items="${menuMap }" var="menu">
			<c:if test="${menu.key<=6 }">
				<li>
					<a href="${menu.value['url'] }">${menu.value['title'] }</a>
					<ul>
					<c:forEach items="${menu.value['sub'] }" var="sub">
						<li><a href="${sub.value['url'] }">${sub.value['title'] }</a></li>
					</c:forEach>
					</ul>
				</li>
			</c:if>
			</c:forEach>
			</ul>
		</div><!-- // #topmenu end -->
	</div><!-- // #topmenu_outer end -->

	
</div><!-- // #header end -->
</div><!-- // #header_outer end -->

<script>
$(document).ready(function(){
	const headerHeight = 310;
	$("#header_outer").mouseenter(function(){
		$(this).stop().animate({"height":headerHeight+"px"}, 500, "easeOutQuint");
		$(this).addClass("over");
		$("#header_over").stop().animate({"height":headerHeight+"px"}, 500, "easeOutQuint");
		var logo = $(this).find("h1 img");
		logo.attr("src", logo.attr("src").replace("off", "on"));
		$(this).find("#topmenu li > a").stop().animate({"width":"150px"},150, "easeOutCubic");
	});
	$("#header_outer").mouseleave(function(){
		$(this).stop().animate({"height":"140px"}, 500, "easeOutQuint");
		$(this).removeClass("over");
		$("#header_over").stop().animate({"height":"1px"}, 500, "easeOutQuint");
		var logo = $(this).find("h1 img");
		logo.attr("src", logo.attr("src").replace("on", "off"));
		$(this).find("#topmenu li > a").stop().animate({"width":"120px"},150, "easeOutCubic");
	});	
	
	$("#topmenu li > a").each(function(index, item){})	
	
});
</script>