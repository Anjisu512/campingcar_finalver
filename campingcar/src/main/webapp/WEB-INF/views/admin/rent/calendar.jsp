<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="category.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
Calendar cal = Calendar.getInstance();
int curYear = cal.get(Calendar.YEAR);
int curMon = cal.get(Calendar.MONTH); // 0:1월 ~ 11:12월
int today = cal.get(Calendar.DATE);
String curMonStr=String.format("%02d", cal.get(Calendar.MONTH)+1);
String indextoday = String.valueOf(curYear)+curMonStr+String.format("%02d", today);

if(request.getParameter("curYear")!=null&&request.getParameter("curMon")!=null){
	curYear=Integer.parseInt(request.getParameter("curYear"));
	curMon=Integer.parseInt(request.getParameter("curMon"));
}

// 해당 월 1일 요일 구하기
Calendar first = Calendar.getInstance();
first.set(curYear, curMon , 1); // 해당월 -1
int wday = first.get(Calendar.DAY_OF_WEEK);

// 해당 월 마지막 날 

int last = first.getActualMaximum(Calendar.DAY_OF_MONTH);

// 이전 달, 다음 달 구하기
int prevYear = curYear;
int prevMon = curMon-1;
if(prevMon==-1){
	prevYear=prevYear-1;
	prevMon=11;
}
int nextYear = curYear;
int nextMon = curMon+1;
if(nextMon==12){
	nextYear=nextYear+1;
	nextMon=0;
}

// JSTL로 변수 전달
pageContext.setAttribute("curYear", curYear);
pageContext.setAttribute("curMon", curMon);
pageContext.setAttribute("indextoday", indextoday);
pageContext.setAttribute("wday", wday);
pageContext.setAttribute("last", last);
pageContext.setAttribute("prevYear", prevYear);
pageContext.setAttribute("prevMon", prevMon);
pageContext.setAttribute("nextYear", nextYear);
pageContext.setAttribute("nextMon", nextMon);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 캠핑카 - 관리자 페이지</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />

<style>
#wrap {padding:40px 0px 0px 240px;}
table, th, td {border-spacing:0px !important; border:none; border-collapse:collapse; margin:0; padding:0;}
</style>

</head>
<body>

<script>
function wdayReplace(wday){
	var result="";
	if(wday==1){result="일";}
	if(wday==2){result="월";}
	if(wday==3){result="화";}
	if(wday==4){result="수";}
	if(wday==5){result="목";}
	if(wday==6){result="금";}
	if(wday==7){result="토";}
	return result;
}
</script>

<div id="container">
	<!-- #sidebar start -->
	<%@ include file="../include/sidebar.jsp" %>
	<!-- // #sidebar end -->
	
	<div id="topmenu">
		<h2>
			<a href="?curYear=${prevYear}&curMon=${prevMon}" class="btn btn-outline-secondary btn-sm"><i class="fa-solid fa-angle-left"></i></a>
			<%=curYear%>년 ${curMon+1}월
			<a href="?curYear=${nextYear}&curMon=${nextMon}" class="btn btn-outline-secondary btn-sm"><i class="fa-solid fa-angle-right"></i></a>
		</h2>
		
	</div>
	
	<div id="wrap">
<!-- ================================================== -->

<fmt:formatNumber var="curMon" minIntegerDigits="2" value="${curMon+1}" type="number"/>
<c:set var="firstday" value="${curYear}-${curMon}-01" />
<div class="rent_calendar">

<table class="date">
<thead>
<tr>
	<th><div>날짜</div></th>
	<c:forEach var="i" begin="1" end="${last}" step="1">
		<c:set var="dateclass" value="" />
		<c:if test="${indexdate == indextoday}"><c:set var="dateclass" value="today" /></c:if>
		<c:if test="${wday==1}"><c:set var="dateclass" value="sun" /></c:if>
		<c:if test="${wday==7}"><c:set var="dateclass" value="sat" /></c:if>
		<td class="${dateclass }">
			<div>
				<p class="day">${i}</p>
				<p class="wday"><script>document.write(wdayReplace(${wday }));</script></p>
				<c:if test="${indexdate < indextoday}">
				</c:if>
				<c:if test="${indexdate >= indextoday}">
				</c:if>
			</div>
		</td>
		<c:set var="wday" value="${wday+1}" />
		<c:if test="${wday>7}">
			<c:set var="wday" value="1" />
		</c:if>
	</c:forEach>
</tr>
</thead>
</table>
<c:forEach items="${carlist }" var="car">
<div class="row">
	<div class="bg">
		<div class="colhead">${car.car_name }</div>
		<c:forEach var="i" begin="1" end="${last}" step="1">
			<div class="cell">
			</div>
		</c:forEach>
	</div>
	<div class="content">
		<table style="border-collapse:collapse; border:none;">
		<tbody>
		<tr>
		<c:forEach var="i" begin="1" end="${last}">
			<fmt:formatNumber var="day" minIntegerDigits="2" value="${i}" type="number"/>
			<c:set var="keydate" value="${curYear}-${curMon}-${day}" />
			<c:set var="indexdate" value="${curYear}${curMon}${day}" />
			<c:set var="dto" value="${maplist[car.car_regid][keydate] }" />
			<c:set var="length" value="${dto.rent_diffdate+1}" />
			<fmt:formatNumber var="paystate" minIntegerDigits="2" value="${dto.rent_paystate}" type="number"/>
			<!-- 이전달부터 시작하는 예약인지 아닌지 -->
			<c:set var="isfirstday" value="${fn:indexOf(keydate, '-01')}" /> <!-- 키데이트가 월의 1일이면 7을 반환 -->
			<c:set var="isprevstart" value="0" />
			<c:if test="${dto.rent_startdate<firstday and isfirstday==7 }">
				<c:set var="isprevstart" value="1" />
				<c:set var="length" value="${fn:substring(dto.rent_enddate,8,13) }" />
			</c:if>
			
			
			<c:choose>
				<c:when test="${not empty dto.rent_id}">
				<c:if test="${dto.rent_startdate eq keydate or (isprevstart==1) }">
					<td <c:if test="${length>1 }">colspan="${length }"</c:if>  class="filledtd">
						<div style="width:${length*100 }px" class="filled type${paystate }" onclick="location.href='read?rent_id=${dto.rent_id }&listtype=calendar';">
							<p>${cateArr[dto.rent_paystate] }</p>
							<p class="name">${dto.rent_name }</p>
						</div>
						<div class="data" onclick="location.href='read?rent_id=${dto.rent_id }';">
							<table width="100%">
							<colgroup>
							<col width="50%" />
							<col width="50%" />
							</colgroup>
							<thead>
								<tr>
									<th colspan="2">[${cateArr[dto.rent_paystate] }] ${dto.rent_name }</th>
								</tr>
							</thead>
							<tbody>
							<tr>
								<td>출고일<p>${dto.rent_startdate }</p></td><td>반납일<p>${dto.rent_enddate }</p></td>
							</tr> 
							<tr>
								<td>예약 번호<p>${dto.rent_id }</p></td><td>결제 비용<p>${dto.rent_price }</p></td>
							</tr>
							</tbody>
							</table>
						</div>
					</td>
				</c:if>
				</c:when>
				<c:when test="${indexdate < indextoday}">
					<td>
						<div class="disabled">
							예약 불가
						</div>
					</td>
				</c:when>
				<c:when test="${empty maplist[car.car_regid][keydate].rent_id}">
					<td>
						<div>
							예약 가능
						</div>
					</td>
				</c:when>		
			</c:choose>
			

		</c:forEach>
		</tr>
		</tbody>
		</table>
	</div>
</div>
</c:forEach>

</div>



<script>
$(document).ready(function(){
	$(".filledtd").each(function(index, item){
		$(item).mouseenter(function(){
			$(this).find(".data").fadeIn(100);
			$(this).find(".filled").addClass("on");
		});
		$(item).mouseleave(function(){
			$(this).find(".data").fadeOut(100);
			$(this).find(".filled").removeClass("on");
		});
	});
});
</script>

<!-- ================================================== -->
	</div><!-- // #wrap end -->
</div><!-- // #container end -->

</body>
</html>