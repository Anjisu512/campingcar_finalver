<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mn" value="2" />
<c:set var="sn" value="1" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보유 차량 - 자바 캠핑카</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />

<style>
.mmsize{
width: 1150px;
}
.tablemm{
width: 450px;
padding-left: 5px;
}
.thmm{
width:120px;
}

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

<div class="carread clearfix">
	<div>
		<img src="${contextPath }/resources/data/car/${dto.car_file }" alt="" />
	</div>
	<table class="table table-bordered">
	<colgroupd>
		<col width="30%" />
		<col width="*" />
	</colgroupd>
	<tr>
		<th class="table-secondary">차량 상태</th>
		<td>
			<c:if test="${dto.car_state==1 }"><strong style="color:#0d6efd; font-weight:bold;">사용 가능</strong></c:if>
			<c:if test="${dto.car_state==0 }"><strong style="color:#dc3545; font-weight:bold;">사용 불가</strong></c:if>
		</td>
	</tr>	
	<tr>
		<th class="table-secondary">등록 번호</th><td>${dto.car_regid }</td>
	</tr>
	<tr>
		<th class="table-secondary">대여 회사</th><td>${companyDTO.comp_name }<!-- ${dto.comp_id } --></td>
	</tr>
	<tr>
		<th class="table-secondary">모델 명</th><td>${dto.car_modelname }</td>
	</tr>
	<tr>
		<th class="table-secondary">차량 이름</th><td>${dto.car_name }</td>
	</tr>
	<tr>
		<th class="table-secondary">차량 번호</th><td>${dto.car_number }</td>
	</tr>
	<tr>
		<th class="table-secondary">탑승 인원</th><td>${dto.car_capa }</td>
	</tr>
	<tr>
		<th class="table-secondary">내부 옵션</th><td>${fn:replace(dto.car_option, ',', ', ')}</td>
	</tr>
	<tr>
		<th class="table-secondary">세부 내용</th><td>${dto.car_detail }</td>
	</tr>
	<tr>
		<th class="table-secondary">대여 비용 (1일 기준)</th><td><fmt:formatNumber value="${dto.car_rentprice }" pattern="#,###" /></td>

	</tr>
	<tr>
		<th class="table-secondary">등록 일</th><td>${dto.car_regdate }</td>
	</tr>
	<tr>
		<th class="table-secondary">자량 정비 내역</th>
		<td>
			<c:if test="${repair.repair_no == null }">
			<button  onclick="emptyrepair()" class="btn btn-outline-dark btn-sm">차량정비 내역보기</button>
			</c:if>
			<c:if test="${repair.repair_no !=null }">
			<button data-bs-toggle="modal" href="#exampleModalToggle" role="button" class="btn btn-outline-dark btn-sm">차량정비 내역보기</button>
			</c:if>	
		</td>
	</tr>
	</table>
</div>


<div style="text-align:center;">

<c:if test="${dto.car_state==1 }"><button onclick="location.href='${contextPath }/rent/register?car_regid=${dto.car_regid }';" class="btn btn-primary" style="width:150px; height:40px;">예약</button></c:if>
<button onclick="location.href='list';" class="btn btn-secondary" style="width:150px; height:40px;">목록</button>
</div>
<!-- 모달start -->
		
		

		<script>
		function emptyrepair() {
			
			alert('차량 정비내역이 없습니다.')
			
		}
		</script>
		
		
		<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5 " id="exampleModalLabel" >차량정비 정보</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		     	
		        <table class="table table-bordered text-center tablemm";>
		        	<tr>
		        		<th class="table-dark thmm">정비소명</th>
		        		<th  id="garage_name" name="garage_name" >${repair.garage_name } </th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">차량명</th>
		        		<th id="car_name" name="car_name">${dto.car_name } </th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">렌트회사</th>
		        		<th id="comp_name" name ="comp_name">${repair.comp_name} </th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">정비내역</th>
		        		<th id="repair_info" name="repair_info">${repair.repair_info} </th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">정비일자</th>
		        		<th id="repair_date" name="repair_date"><c:out value=" ${repair.repair_date}"></c:out></th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">정비가격(원)</th>
		        		<th id="repair_price" name="repair_price">${repair.repair_price}</th>
		        	</tr>
		        	<tr>
		        		<th class="table-dark thmm">추가정비내역</th>
		        		<th id="repair_addinfo" name="repair_addinfo">${repair.repair_addinfo } </th>
		        	</tr>
		        	
		        </table>
		       
		     
		     
		     
		      </div>
		      <div class="modal-footer">		        		
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>		        		
		      </div>
		  </div>
		  </div>
		  </div>
<!-- 모달end -->

<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<!-- #footer start -->
	<%@ include file="../include/footer.jsp" %>
	<!-- //#footer end -->
	
</div><!-- // #container end -->

</body>
</html>