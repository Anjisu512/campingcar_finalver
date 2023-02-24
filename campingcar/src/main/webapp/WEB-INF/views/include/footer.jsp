<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="alliance_outer">
<div id="alliance">
	<h3>제휴 문의</h3>
	<p class="desc">최고의 비즈니스 파트너 자바 캠핑카와 함께 하세요</p>
	<ul class="clearfix">
		<li><a href="${contextPath }/company/registerForm" class="btn btn-outline-light">캠핑카 대여 회사 등록 신청</a></li>
		<li><a href="${contextPath }/garage/register" class="btn btn-outline-light">정비소 등록 신청</a></li>
		<li><a href="#" target="blank" class="btn btn-outline-light">제휴회사A</a></li>
		<li><a href="#" target="blank" class="btn btn-outline-light">제휴회사B</a></li>
	</ul>
</div>
</div>

<div id="footer_outer">
<div id="footer">
	<div>
		<p class="img"><img src="${contextPath }/resources/img/header/logo_off.png" style="width:140px;" /></p>
		<p class="address">경기 수원시 팔달구 덕영대로 899 (지번 : 매산로1가 11-9) 3층</p>
		<p>Copyright (c) 자바 캠핑카. All Rights Reserved.</p>
		 
	</div>
</div>
</div>