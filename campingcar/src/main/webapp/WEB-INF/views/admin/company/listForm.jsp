<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>자바 캠핑카 - 관리자 페이지</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<c:set var="title" value="대여 회사 승인 및 거절" />
<script>
   function search3(){//검색기능
         var $keyword = $('#keyword');
         $('#searchBtn3').on('click',function(){
            var keywordVal = $keyword.val();
            var url = "listForm?page=1"
               + "&perPageNum=" + "${pageMaker.cri.perPageNum}"         
               + "&keyword=" + encodeURIComponent(keywordVal);
            window.location.href = url;         
         })   
   }
</script>
</head>
<style>

</style>
<body>
	    
	<div id="container">
	<!-- #sidebar start -->
	<%@ include file="../include/sidebar.jsp" %>
	<!-- // #sidebar end -->



	<div id="topmenu">
		<h2><i class="fa-solid fa-house"></i> 관리자　<i class="fa-solid fa-angle-right"></i>　대여 회사 관리　<i class="fa-solid fa-angle-right"></i>　대여 회사 현황</h2>
		<div id="gnb"></div>
	</div>
	
	<div id="wrap">
<!-- ================================================== -->
	
		
	
			
		
			<div class="board_list">
			<table width="100%" class="table table-bordered center table-hover">
			<colgroup>
			</colgroup>
			<thead>
			<tr class="table-secondary">
				  	<th>회사번호</th>
				  	<th>회사명</th>
				  	<th>주소</th>
				  	<th>전화번호</th>
				  	<th>담당자</th>
				  	<th>담당자 이메일</th>
				  	<th>신청 상태</th>
			  </tr>
			 </thead>
			<tbody>
			<c:forEach var="company" items="${list2}">
			 	<tr>
				 	<th>${company.comp_id}</th>
				 	<td><a href="read?comp_id=${company.comp_id}" style="color:#3399ff"><b>${company.comp_name}</b></a></td>
				 	<td>${company.comp_addr}</td>
				 	<td>${company.comp_phone}</td>
				 	<td>${company.comp_pic}</td>
				 	<td>${company.comp_pic_email}</td>
				 	<th style="color:#bbbbeb">대기</th> 
			 	</tr>
			</c:forEach>
			</tbody>
			 </table>	

<!-- ============================================================================================= -->			 
		<!--  페이징 처리 -->
		  <c:if test="${pageMaker.cri.page!=null }">
   <div class="container text-center">
    
      <ul>
         <c:if test="${pageMaker.prev }">         
            <a class="btn btn-outline-secondary "  href = "listForm${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a>            
         </c:if>      
         
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var = "idx">            
            <c:choose>
            
            <c:when test="${cri.page != idx }">
            <a class="<c:if test="${cri.page != idx }">btn btn-outline-secondary</c:if>" href = "listForm${pageMaker.makeSearch(idx)}"  >${idx }</a>
            </c:when>
            
            <c:otherwise>
            <a style="color: white;" class="<c:if test="${cri.page == idx }">btn btn-secondary</c:if>" href = "listForm${pageMaker.makeSearch(idx)}"  >${idx }</a>
            </c:otherwise>
            
            </c:choose>   
         </c:forEach>
            
         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <a class="btn btn-outline-secondary " href = "listForm${pageMaker.makeSearch(pageMaker.endPage +1 )}">&raquo;</a>
         </c:if>
      </b>
      </ul>

            
</div>
</c:if>
<!-- ============================================================================================= -->
<br>
<br>
			<!-- 검색 기능  -->
			<form name="search3_company" items="${list2}" autocomplete="on">
	<div class="input-group mb-3">
    <input class="form-control" id="keyword" name="keyword" type="search" value="${pageMaker.cri.keyword}" 
    placeholder=" 회사명으로 검색" />
    
	<button type="submit" id="searchBtn3" class="btn btn-outline-primary" style="width:100px;">　검색　</button>
		
	</div>
		</form>
			 </div>
		<br>
		<br>
<!-- ============================================================================================= -->
			 </div>
		  </div> 
</body>
</html>