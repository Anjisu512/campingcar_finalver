<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 캠핑카 - 관리자 페이지</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<script>

$(document).ready(function(){  
	
       //유효성검사
    $("#updatesubmit").on("click", function(){
    	
       if($("#garage_name").val()==""){
          alert("정비소명을 입력해주세요.");
          $("#garage_name").focus();
          return false;
       }
      
       if($("#repair_info").val()==""){
          alert("정비내역을 입력해주세요.");
          $("#repair_info").focus();
          return false;
       }
       
       if($("#repairdate").val()==""){
          alert("정비일자를 선택해주세요.");
          $("#repairdate").focus();
          return false;
       }
      
       alert('정비내역 수정이 완료되었습니다')
    });
       
       //정비내역 등록 유효성검사
    $("#registersubmit").on("click", function(){
    	
        if($("#garage_name").val()==""){
           alert("정비소명을 입력해주세요.");
           $("#garage_name").focus();
           return false;
        }
       
        if($("#repair_info").val()==""){
           alert("정비내역을 입력해주세요.");
           $("#repair_info").focus();
           return false;
        }
        
        if($("#repairdate").val()==""){
           alert("정비일자를 선택해주세요.");
           $("#repairdate").focus();
           return false;
        }
       
        alert('정비내역 등록이 완료되었습니다')
     });
    
$("#deletesubmit").on("click", function(){

        alert('정비내역 삭제가 완료되었습니다.')
     }); 
       
 })
 
</script>

</head>
<body>

<div id="container">
	<!-- #sidebar start -->
	<%@ include file="../include/sidebar.jsp" %>
	<!-- // #sidebar end -->

	<div id="topmenu">
		<h2><i class="fa-solid fa-house"></i> 관리자　<i class="fa-solid fa-angle-right"></i>　차량 관리　<i class="fa-solid fa-angle-right"></i>　차량 조회</h2>
		<div id="gnb"></div>
	</div>
	
	<div id="wrap">
<!-- ================================================== -->

<div class="admcarread clearfix">
<table class="layout">
<colgroup>
	<col width="430px" />
	<col width="*" />
</colgroup>
<tr>
	<td><img src="${contextPath }/resources/data/car/${dto.car_file }" alt="" /></td>
	<td>
		<table class="table table-bordered">
		<colgroupd>
			<col width="30%" />
			<col width="*" />
		</colgroupd>
		<tr>
			<th class="table-secondary">등록 번호</th><td>${dto.car_regid }</td>
		</tr>
		<tr>
			<th class="table-secondary">대여 회사</th><td><a href="../company/read?comp_id=26">${companyDTO.comp_name }</a></td>
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
			<th class="table-secondary">대여 비용 (1일 기준)</th><td>${dto.car_rentprice }</td>
		</tr>
		<tr>
			<th class="table-secondary">등록 일</th><td>${dto.car_regdate }</td>
		</tr>
		</table>
	</td>
</tr>
</table>

</div>

<button onclick="location.href='list';" class="btn btn-secondary" id="btn-list">목록</button>
<button onclick="location.href='register?car_regid=${dto.car_regid }';"  class="btn btn-primary">차량 수정</button>

<script>
document.querySelector("#btn-list").addEventListener("click",function(e){
	location.href="list?${pageRequestDTO.link }";
},false);
</script>

<!-- 차량정비내역 등록/수정모달start -->				
<c:if test="${repair.repair_no == null }">		
	<button data-bs-target="#exampleModalToggle3" data-bs-toggle="modal" class="btn btn-primary">정비내역 등록</button>
		<div class="modal fade" id="exampleModalToggle3" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalToggleLabel2">정비내역 등록</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      		</div>
				<form action="repair/register" method="post">
					<div class="modal-body">		   
			    		<table class="table table-bordered text-center tablemm">
					    	<tr style="display: none">
					    		<th class="table-dark thmm">차량ID</th>
					    		<th><input type ="text" id="car_regid" name="car_regid" value="${dto.car_regid }" readonly/></th>
					    		<th class="table-dark thmm">대여회사ID</th>
					    		<th><input type ="text" id="comp_id" name="comp_id" value="${companyDTO.comp_id }" readonly/></th>
					    	</tr>
					    	
					       	<tr>
				        		<th class="table-dark thmm">정비소명</th>
				        		<th><input type="text" id="garage_name" name="garage_name" value="${repair.garage_name }" /></th>
				        	</tr>
				        	<tr>
				        		<th class="table-dark thmm">차량명</th>
				        		<th><input type="text" id="car_name" name="car_name" value="${dto.car_name }" readonly /></th>
				        	</tr>
				        	<tr>
				        		<th class="table-dark thmm">렌트회사</th>
				        		<th><input type="text" id="comp_name" name="comp_name" value="${companyDTO.comp_name }" readonly /></th>
				        		
				        	</tr>
				        	<tr>
				        		<th class="table-dark thmm">정비내역</th>
				        		
				        		<th>
				        		<textarea type="text" id="repair_info" name="repair_info" value="${repair.repair_info }">${repair.repair_info }</textarea>
				        		</th>
				        	</tr>
				        	<tr>
				        		<th class="table-dark thmm">정비일자</th>
				        		<th ><input type="date" id="repairdate" name="repair_date" /></th>		
		
				        	</tr>
		
				        	<tr>
				        		<th class="table-dark thmm">정비비용(원)</th>
				        		<th><input type="text" id="repair_price" name="repair_price" value="${repair.repair_price }"/></th>
				        	</tr>
				        	<tr>
				        		<th class="table-dark thmm">추가정비내역</th>
				        		<th><input type="text" id="repair_addinfo" 	 name="repair_addinfo" value="${repair.repair_addinfo }" /></th>
				        	</tr>
						</table>
					</div>			
					<div class="modal-footer">
					    <button class="btn btn-success" type="submit" name="submit"
					    id="registersubmit" >등록</button>
					    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>		
</c:if>
<c:if test="${repair.repair_no !=null }">
<button data-bs-target="#exampleModalToggle2" data-bs-toggle="modal"  class="btn btn-primary">정비내역 수정</button>
</c:if>
		
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalToggleLabel2">정비내역 수정</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
		        	
		    <!-- 모달2(수정폼) -->
			<form method="post"  >
		      	<div class="modal-body">		   
			    	<table class="table table-bordered text-center tablemm";>
				       	<tr>
			        		<th class="table-dark thmm">정비소명</th>
			        		<th><input type="text" id="garage_name" name="garage_name" value="${repair.garage_name }"/></th>
			        	</tr>
			        	<tr>
			        		<th class="table-dark thmm">차량명</th>
			        		<th id="car_name" name="car_name" value="${dto.car_name }">${dto.car_name } </th>
			        	</tr>
			        	<tr>
			        		<th class="table-dark thmm">렌트회사</th>
			        		<th><input type="text" id="comp_name" name="comp_name" value="${companyDTO.comp_name }" readonly/></th>
			        	</tr>
			        	<tr>
			        		<th class="table-dark thmm">정비내역</th>			        		
			        		<th>
			        		<textarea style="width: 100%; height: 250px"; type="text" id="repair_info" name="repair_info" value="${repair.repair_info }">${repair.repair_info }</textarea>
			        		</th>
		        		</tr>
		        		<tr>
			        		<th class="table-dark thmm">정비일자</th>
			        		<th ><input style="width: 70%" type="date" id="repairdate" name="repair_date" value="${repair.repair_date }" /></th>		
							<script>
								var now_utc = Date.now()
								var timeOff = new Date().getTimezoneOffset()*60000;
								var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
								document.getElementById("repairdate").setAttribute("max", today);
							</script>
		        		</tr>
		        		<tr>
			        		<th class="table-dark thmm">정비비용(원)</th>
			        		<th><input type="text" id="repair_price" name="repair_price" value="${repair.repair_price }"/></th>
		        		</tr>
		        		<tr>
			        		<th class="table-dark thmm">추가정비내역</th>
			        		<th><input type="text" id="repair_addinfo" 	 name="repair_addinfo" value="${repair.repair_addinfo }" /></th>
		        		</tr>
		        	</table>
		      	</div>			
		      	<div class="modal-footer">
			    	<button class="btn btn-success" type="submit" id="updatesubmit" name="modify" value="${repair.car_regid }">수정완료</button>
				</form>			
				<form action="repair/remove" method="get">				
					<button type="submit" class="btn btn-danger" data-bs-dismiss="modal" 
					name="car_regid" id="deletesubmit" value="${repair.car_regid}">
					<input type="text" name="comp_id" value="${companyDTO.comp_id}" style="display: none" readonly/>
					내역 삭제</button>
				</form>		   	
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal">돌아가기</button>
			</div>			
		</div>
	</div>
</div>
<!-- 차량정비 수정/등록 모달end -->





<form action="remove" method="post" style="display:inline;" id="remove">
	<input type="hidden" name="car_regid" value="${dto.car_regid }" />
	<a class="btn btn-danger" onclick="removeAlert();">삭제</button>
</form>

<script>
function removeAlert(){
	if(confirm("해당 차량을 삭제하시겠습니까?")){
		$("#remove").submit();
	}else{
		return;
	}
}
</script>

<!-- ================================================== -->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->

</body>
</html>