<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="sidebar" class="overflow-scroll">
	<h1>
		<a href="${contextPath }/admin/"><img src="${contextPath }/resources/img/header/logo.png" alt="" /></a>
		<p>관리자 페이지</p>
	</h1>
	<ul>
		<li><a href="${contextPath }/admin/car/list"><i class="fa-solid fa-truck"></i>　차량 관리</a></li>
		<li><a href="${contextPath }/admin/rent/calendar"><i class="fa-regular fa-clock"></i>　예약 현황</a>
			<ul>
				<li><a href="${contextPath }/admin/rent/today"><i class="fa-regular fa-circle"></i>　오늘의 출고/반납 차량</a></li>
				<li><a href="${contextPath }/admin/rent/calendar"><i class="fa-regular fa-circle"></i>　달력형 예약 현황</a></li>
				<li><a href="${contextPath }/admin/rent/list"><i class="fa-regular fa-circle"></i>　목록형 예약 현황</a></li>
			</ul>
		</li>
		<li><a href="${contextPath }/admin/company/listForm2"><i class="fa-solid fa-warehouse"></i>　대여 회사 관리</a>
			<ul>
				<li><a href="${contextPath }/admin/company/listForm2?keyword="><i class="fa-regular fa-circle"></i>　대여 회사 목록</a></li>
				<li><a href="${contextPath }/admin/company/listForm?keyword="><i class="fa-regular fa-circle"></i>　대여 회사 현황</a></li>
			</ul>		
		</li>
		<li><a href="${contextPath }/admin/garage/register"><i class="fa-solid fa-wrench"></i>　정비소 관리</a>
			<ul>
				<li><a href="${contextPath }/admin/garage/register"><i class="fa-regular fa-circle"></i>　정비소 등록신청 현황</a></li>
				<li><a href="${contextPath }/admin/garage/list?keyword="><i class="fa-regular fa-circle"></i>　정비소 정보 수정 및 삭제</a></li>				
			</ul>		
		</li>
		<li><a href="${contextPath }/admin/faqboard/listAll?keyword="><i class="fa-solid fa-bars"></i>　게시판 관리</a>
		<ul>
				<li><a href="${contextPath }/admin/faqboard/listAll?keyword="><i class="fa-regular fa-circle"></i>　FAQ게시판</a></li>							
				<li><a href="${contextPath }/admin/notice/list"><i class="fa-regular fa-circle"></i>　공지사항</a></li>							
			</ul>
			</li>
		<li><a href="${contextPath }/admin/user/list?keyword="><i class="fa-solid fa-user"></i>　회원 정보</a></li>
	</ul>
</div>
