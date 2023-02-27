<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="category.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="title" value="목록형 예약 현황" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 캠핑카 - 관리자 페이지</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
</head>
<body>

<div id="container">
	<!-- #sidebar start -->
	<%@ include file="../include/sidebar.jsp" %>
	<!-- // #sidebar end -->
	
	<div id="topmenu">
		<h2><i class="fa-solid fa-house"></i> 관리자　<i class="fa-solid fa-angle-right"></i>　예약 관리　<i class="fa-solid fa-angle-right"></i>　오늘의 출고/반납 차량</h2>
		<div id="gnb"></div>
	</div>
	
	<div id="wrap">
<!-- ================================================== -->

<style>
.renttoday h3 {font-weight:bold; font-size:20px; padding:0px 0px 30px 0px;}
.renttoday .col1, .renttoday .col2 {width:50%; float:left; min-height:300px;}
.renttoday .col1 {padding:0px 15px 0px 0px;}
.renttoday .col2 {padding:0px 0px 0px 15px;}
.renttoday table {cursor:pointer;}
.empty {background:#e2e3e5; border:1px solid #c8c8c8; padding:30px; text-align:center; color:#787878;}
</style>

<div class="renttoday">

	<div class="col1">
		<h3><i class="fa-sharp fa-solid fa-circle-up"></i> 오늘의 출고 차량</h3>
		<c:if test="${not empty startlist }">
			<c:forEach items="${startlist }" var="dto">
			<div>
				<table class="table table-bordered" onclick="location.href='read?rent_id=${dto.rent_id}&listtype=today';">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<thead>
				<tr>
					<th colspan="4" class="state type0${dto.rent_paystate }">#${dto.rent_id } <span>${cateArr[dto.rent_paystate] }</span></th>
				</tr>
				</thead>
				<tr>
					<th>예약 번호</th>
					<td>${dto.rent_id }</td>
					<th>차량 번호</th>
					<td>(${dto.car.car_regid }) [${dto.car.car_modelname }] ${dto.car.car_name }</td>
				</tr>			
	
				<tr>
					<th>고객명</th>
					<td>${dto.rent_name }</td>
					<th>연락처</th>
					<td>${dto.rent_phone1 }</td>
				</tr>
				</table>
			</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty startlist }">
			<div class="empty">오늘의 출고 차량이 없습니다.</div>
		</c:if>
	</div>
	
	<div class="col2">
		<h3><i class="fa-sharp fa-solid fa-circle-down"></i> 오늘의 반납 차량</h3>
		<c:if test="${not empty endlist }">
			<c:forEach items="${endlist }" var="dto">
			<div>
				<table class="table table-bordered" onclick="location.href='read?rent_id=${dto.rent_id}&listtype=today';">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<thead>
				<tr>
					<th colspan="4" class="state type0${dto.rent_paystate }">#${dto.rent_id } <span>${cateArr[dto.rent_paystate] }</span></th>
				</tr>
				</thead>				
				<tr>
					<th>예약 번호</th>
					<td>${dto.rent_id }</td>
					<th>차량 번호</th>
					<td>(${dto.car.car_regid }) [${dto.car.car_modelname }] ${dto.car.car_name }</td>
				</tr>			
	
				<tr>
					<th>고객명</th>
					<td>${dto.rent_name }</td>
					<th>연락처</th>
					<td>${dto.rent_phone1 }</td>
				</tr>
				</table>
			</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty endlist }">
			<div class="empty">오늘의 반납 차량이 없습니다.</div>
		</c:if>	
	</div>

 </div>

<!-- ================================================== -->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->

</body>
</html>