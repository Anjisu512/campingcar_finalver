<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ include file="../admin/rent/category.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mn" value="4" />
<c:set var="sn" value="1" />

<c:set var="member" value="${sessionScope.user }" />
<c:set var="ismember" value="1" />
<c:if test="${member.car_uid eq '' or member.car_uid eq null }">
	<c:set var="ismember" value="0" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 - 자바 캠핑카</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
<style>

</style>
</head>
<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="../include/header.jsp" %>
	<!--// #header end -->
	
   <div id="body_head">
      <h2>${menuMap[mn]['sub'][sn]['title'] }</h2>
      <div class="location">
         HOME　<i class="fa-solid fa-circle-chevron-right"></i>　${menuMap[mn]['title'] }　<i class="fa-solid fa-circle-chevron-right"></i>　<span>${menuMap[mn]['sub'][sn]['title'] }</span>
      </div>
   </div>
	
	<div id="wrap">
	
      <!-- #submenu start -->
      <%@ include file="../include/submenu.jsp" %>
      <!-- // #submenu end -->
		
		<div id="body_contents">
<!-- ================================================== -->

<style>
.login {width:440px; margin:0px auto;}
.input-group-text {width:180px; font-weight:400; text-align:center;}
.input-group {margin:0px 0px 5px 0px;}
</style>

<c:if test="${check != 1 and (sessionScope.user.car_uid eq '' or sessionScope.user.car_uid eq null ) }">
<form action="read" method="post">
<div class="login">
	<div class="input-group">
		<span class="input-group-text">고객명</span>
		<input type="text" class="form-control" name="rent_name" value="" required />
	</div>
	<div class="input-group">
		<span class="input-group-text">핸드폰 번호</span>
		<input type="text" id="car_uphone" class="form-control" name="rent_phone1" value="" required />
	</div>
	<script>
  $(document).on("keyup", "#car_uphone", function () {
    $(this).val(
      $(this)
        .val()
        .replace(/[^0-9]/g, "")
        .replace(
          /(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,
          "$1-$2-$3"
        )
        .replace("--", "-")
    );
  });
</script>

	<div class="input-group">
		<span class="input-group-text">비밀번호</span>
		<input type="text" class="form-control" name="rent_password" value="" required />
	</div>	
	<div class="d-grid gap-2">
		<button type="submit" class="btn btn-primary">예약 확인</button>
	</div>	
	
</div>
</form>
</c:if>

<!-- 비회원 정보 일치 or 회원인 경우 예약 목록 출력 -->
<c:if test="${(check==1 and not empty dtolist) or (ismember==1) }">
<form action="cancel" method="post" id="cancelform">
<input type="hidden" name="rent_id" value="" />
<input type="hidden" name="rent_state" value="1" />
<table class="table table-bordered center">
<thead>
<tr class="table-secondary">
	<th>#</th>
	<th>고객명</th>
	<th>핸드폰 번호</th>
	<th>차량</th>
	<th>차량 예약일</th>
	<th>예약 등록일</th>
	<th>예약 상태</th>
	<th>예약 취소</th>
</tr>
</thead>
<tbody>
	<c:forEach items="${dtolist }" var="dto">
	<fmt:formatNumber var="paystate" minIntegerDigits="2" value="${dto.rent_paystate}" type="number"/>
	<tr>
		<td>${dto.rent_id }</td>
		<td>${dto.rent_name }</td>
		<td>${dto.rent_phone1 }</td>
		<td>#${dto.car.car_regid } ${dto.car.car_modelname } ${dto.car.car_name }</td>
		<td>${dto.rent_startdate } ~ ${dto.rent_enddate }</td>
		<td>${dto.rent_datetime }</td>
		<td><p class="state type${paystate}">${cateArr[dto.rent_paystate] }</p></td>
		<td>
			<c:if test="${dto.rent_state==0 }"><a class="btn btn-danger" onclick="rentCancel(${dto.rent_id});">예약 취소</a></c:if>
			<c:if test="${dto.rent_state==1 }">예약 취소 대기</c:if>
			<c:if test="${dto.rent_state==2 }">예약 취소 완료</c:if>
		</td>
	</tr>
	</c:forEach>
</tbody>
</table>
</form>
<script>
function rentCancel(rent_id){
	$("input[name='rent_id']").val(rent_id);
	if(confirm("해당 예약을 취소하시겠습니까?")){
		$("#cancelform").submit();
	}else{
		return;
	}	
	
}
</script>
</c:if>



<c:if test="${check==1 and empty dtolist }">
<table class="table table-bordered center">
<thead>
<tr class="table-secondary">
	<th>#</th>
	<th>고객명</th>
	<th>핸드폰 번호</th>
	<th>차량</th>
	<th>차량 예약일</th>
	<th>예약 등록일</th>
	<th>예약 상태</th>
</tr>
</thead>
<tbody>
	<tr>
		<td colspan="7">일치하는 내용이 없습니다.</td>
	</tr>
</tbody>
</c:if>

<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<!-- #footer start -->
	<%@ include file="../include/footer.jsp" %>
	<!-- //#footer end -->
	
</div><!-- // #container end -->

</body>
</html>