<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mn" value="3" />
<c:set var="sn" value="1" />

<c:set var="ismember" value="1" />
<c:if test="${sessionScope.user.car_uid=='' or sessionScope.user.car_uid==null }">
	<c:set var="ismember" value="0" />
</c:if>

<%
Calendar cal = Calendar.getInstance();
int curYear = cal.get(Calendar.YEAR);
int curMon = cal.get(Calendar.MONTH); // 0:1월 ~ 11:12월
int today = cal.get(Calendar.DATE);
String curMonStr=String.format("%02d", cal.get(Calendar.MONTH)+1);
String indextoday = String.valueOf(curYear)+"-"+curMonStr+"-"+String.format("%02d", today);
pageContext.setAttribute("indextoday", indextoday);

// 달력 한계 설정
int lastYear = curYear;
int lastMon = curMon+1;
if(lastMon>11){
	lastYear = lastYear+1;
	lastMon=0;
}
Calendar tempcal = Calendar.getInstance();
tempcal.set(lastYear, lastMon, 1);
int lastday = tempcal.getActualMaximum(Calendar.DAY_OF_MONTH);
Calendar lastcal = Calendar.getInstance();
lastcal.set(lastYear, lastMon, lastday);
SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
String limitdate = sdf.format(lastcal.getTime());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 예약 등록 - 자바 캠핑카</title>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
<%@ include file="../include/plugin.jsp" %>
<!-- 데이트 피커 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>

<div id="container">
	<!-- #header start -->
	<%@ include file="../include/header.jsp" %>
	<!--// #header end -->
	
   <div id="body_head">
      <h2>${menuMap[mn]['sub'][sn]['title'] }</h2>
      <div class="location">
         HOME　<i class="fa-solid fa-circle-chevron-right"></i>　${menuMap[mn]['title'] }　<i class="fa-solid fa-circle-chevron-right"></i>　${menuMap[mn]['sub'][sn]['title'] }　<i class="fa-solid fa-circle-chevron-right"></i>　<span>실시간 예약 등록</span>
      </div>
   </div>
	
	<div id="wrap">
		<div id="submenu">
			<ul>
				<li class="on"><a href="#">실시간 예약</a></li>
			</ul>
		</div>
		
		<div id="body_contents">
<!-- ================================================== -->

<div class="board_write">
<form action="register" method="post" id="rent_form">
<input type="hidden" name="rent_paystate" value="0" />
<input type="hidden" name="rent_option1" value="0" />
<input type="hidden" name="rent_option2" value="0" />
	<div class="input-group">
		<span class="input-group-text">차량 선택</span>
		<select name="car_regid" class="form-control" onchange="if(this.value) location.href='register?car_regid='+(this.value)+'&rent_startdate=${param.rent_startdate}';">
			<c:forEach items="${carlist }" var="car">
				<c:if test="${car.car_state==1 }">
				<option value="${car.car_regid }" <c:if test="${param.car_regid==car.car_regid }">selected</c:if>>[${car.car_name }] ${car.car_modelname } </option>
				</c:if>
			</c:forEach>
		</select>
	</div>

	<input type="hidden" name="user_id" value="" />
	<input type="hidden" name="car_uid" value="${sessionScope.user.car_uid }" />
	<!-- 비회원 -->
	<c:if test="${ismember==0 }">
		<div class="input-group">
			<span class="input-group-text">예약자</span>		
			<input type="text" class="form-control" name="rent_name" value="" required />
		</div>
		<div class="input-group">
			<span class="input-group-text">비밀번호</span>
			<input type="password" class="form-control" name="rent_password" value="" required autocomplete="off" />
			<input type="password" class="form-control" name="rent_password_check" value="" required autocomplete="off" />
		</div>			
	</c:if>
	<!-- 회원 -->
	<c:if test="${ismember==1 }">
		<div class="input-group">
			<input type="hidden" name="rent_password" value="" required />
			<span class="input-group-text">예약자</span>			
			<input type="text" class="form-control" name="rent_name" value="${sessionScope.user.car_uname }" readonly />
		</div>
	</c:if>

	<div class="input-group">
		<span class="input-group-text">연락처</span>
		<input type="text" class="form-control" name="rent_phone1" value="${sessionScope.user.car_uphone }" placeholder="필수 연락처" required oninput="autoHyphen(this)" maxlength="13" />
		<input type="text" class="form-control" name="rent_phone2" value="" placeholder="예비 연락처" oninput="autoHyphen(this)" maxlength="13" />
	</div>
	<div class="input-group">
		<span class="input-group-text">차량 출고일/반납일</span>
		<input type="text" name="datefilter" value="" class="form-control" autocomplete="off" required />
		<input type="text" name="diffdays" class="form-control" value="0박 0일" />
		<input type="hidden" name="rent_startdate" value="" required />
		<input type="hidden" name="rent_enddate" value="" required />
	</div>
	<div class="input-group">
		<span class="input-group-text">결제 비용</span>
		<input type="text" class="form-control" name="rent_price" value="${car.car_rentprice }" required readonly />
	</div>
	<div class="input-group">
		<span class="input-group-text">결제 방법</span>
		<div class="form-control">
			<input type="radio" name="rent_paytype" value="0" /> 무통장 입금　　
			<input type="radio" name="rent_paytype" value="1" /> 신용카드
		</div>
	</div>
	<div class="input-group">
		<span class="input-group-text">추가 문의</span>
		<input type="text" class="form-control" name="rent_memo" value="" />
	</div>
	<a onclick="formsubmit();"  class="btn btn-primary">예약하기</a>
	</form>
</div>		
		
<script type="text/javascript">
$(function() {

  $('input[name="datefilter"]').daterangepicker({
	    "locale": {
	        "format": "YYYY/MM/DD", // 처음 포멧 설정한대로 다른 날짜도 설정
	        "separator": " - ",
	        "applyLabel": "Apply",
	        "cancelLabel": "Cancel",
	        "fromLabel": "From",
	        "toLabel": "To",
	        "customRangeLabel": "Custom",
	        "weekLabel": "W",
	        "daysOfWeek": [
	            "일",
	            "월",
	            "화",
	            "수",
	            "목",
	            "금",
	            "토"
	        ],
	        "monthNames": [
	            "1월",
	            "2월",
	            "3월",
	            "4월",
	            "5월",
	            "6월",
	            "7월",
	            "8월",
	            "9월",
	            "10월",
	            "11월",
	            "12월"
	        ],
	        "firstDay": 0
	    },
	    "minDate": moment().format("YYYY-MM-DD"),
	    "maxDate": "<%=limitdate%>",
	    // "startDate": "${param.re_startday}",
	    // "endDate" :  "${param.re_startday}",
	    autoUpdateInput: false,
	    isInvalidDate: function(date) { //return date.day() != 1;
	    	// return date.format("YYYY-MM-DD")=="2023-01-30" || date.format("YYYY-MM-DD")=="2023-01-29";
	    	return <c:forEach items="${rentlist}" var="rent">date.format("YYYY-MM-DD")=="${rent.key}" || </c:forEach>null
	    }
  });

  $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('YYYY-MM-DD') + ' - ' + picker.endDate.format('YYYY-MM-DD'));
      $('input[name="rent_startdate"]').val(picker.startDate.format('YYYY-MM-DD'));
      $('input[name="rent_enddate"]').val(picker.endDate.format('YYYY-MM-DD'));
      // 숙박일 계산
      var diffdays = picker.endDate.diff(picker.startDate, 'days');
      $('input[name="diffdays"]').val(diffdays+"박 "+(diffdays+1)+"일");
      // 가격 계산
      $('input[name="rent_price"]').val('${car.car_rentprice}');
      var price = parseInt($('input[name="rent_price"]').val())*diffdays;
      $('input[name="rent_price"]').val(price);

  });

  $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
      $('input[name="rent_startdate"]').val('');
      $('input[name="rent_enddate"]').val('');
      $('input[name="diffdays"]').val("0박 0일");
      $('input[name="rent_price"]').val('${car.car_rentprice}');
      
  });
  


});

// 핸드폰 번호 처리
const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}

//예약 날짜 중복 체크
function datecheck(){
	var result = "";
	var url = "${pageContext.request.contextPath}/rent/datecheck";
	$.ajax({
		type : "post",
		url : url,
		data : $("#rent_form").serialize(),
		async: false,     //값을 리턴시 해당코드를 추가하여 동기로 변경
		success : function(data){
			console.log("datecheck ajax 전송 성공");
			result = data;
		},
		error : function(result){
		}
	});
	return result;
}

// 폼 전송
function formsubmit(){
	var datecheckvalue = datecheck();
	// 유효성 검사
	if($("input[name='rent_name']").val() == ""){
	    alert("예약자 성명을 입력하세요.");
	    $("input[name='rent_name']").focus();
	    return false;
	}	
	if($("input[name='rent_password']").val() != $("input[name='rent_password_check']").val()){
	    alert("비밀번호가 일치하지 않습니다.");
	    $("input[name='rent_password']").focus();
	    return false;
	}		
	if($("input[name='rent_phone1']").val() == ""){
	    alert("핸드폰 번호를 입력하세요.");
	    $("input[name='rent_phone1']").focus();
	    return false;
	}
	if($("input[name='rent_startdate']").val() == ""){
	    alert("예약 날짜를 선택하세요.");
	    $("input[name='datefilter']").focus();
	    return false;
	}
	if($("input[name='rent_enddate']").val() == ""){
	    alert("예약 날짜를 선택하세요.");
	    $("input[name='datefilter']").focus();
	    return false;
	}	
	if($("input:radio[name=rent_paytype]:checked").length < 1){
	    alert("결제 방식을 선택해주세요.");
	    return false;
	}
	if(datecheckvalue>0){
		if(confirm("이미 예약된 차량입니다. 예약 목록 페이지로 돌아가시겠습니까?")){
			location.href="${contextPath}/rent/list";
		}else{
			return false;
		}
	}else if(datecheckvalue==0){
		alert("예약이 완료되었습니다.");
		$("#rent_form").submit();
	}else{
		alert("무효한 요청입니다. 예약 목록으로 돌아갑니다.");
		location.href="${contextPath}/rent/list";
	}
}  

</script>		

<!-- ================================================== -->		
		</div> <!-- // #body_contents end -->
	</div><!-- // #wrap end -->
	
	<!-- #footer start -->
	<%@ include file="../include/footer.jsp" %>
	<!-- //#footer end -->
	
</div><!-- // #container end -->
								
</body>
</html>