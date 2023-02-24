<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="title" value="FAQ" />
<!DOCTYPE html>
<html>
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>전체조회목록</title>
<%@ include file="../../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/admin/admin_all.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/kakaomap.css" rel="stylesheet" />
<script>

   function search(){//검색기능
         var $keyword = $('#keyword');
         $('#searchBtn').on('click',function(){
            var keywordVal = $keyword.val();
            var url = "list?page=1"
               + "&perPageNum=" + "${pageMaker.cri.perPageNum}"         
               + "&keyword=" + encodeURIComponent(keywordVal);
            window.location.href = url;         
         })   
   }
</script>
</head>
<body>

 <div id="container">
				  <!-- #sidebar start -->
	<%@ include file="../include/sidebar.jsp" %>
	<!-- // #sidebar end -->

	<!-- #topmenu start -->
	<%@ include file="../include/topmenu.jsp" %>
	<!-- // #topmenu end -->
	<div id="wrap">
	
	<section class="content container-fluid">
			<div class="table-responsive">
			 <div class="container text-center table-hover">
			<table class="table table-bordered">
			<colgroup>
				</colgroup>
		


			<!-- /.panel-heading -->
			
			
			  
			  
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr align="center">
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>					
						</tr>
					</thead>


					<c:forEach items="${list }" var="board">
						<tr>
						  <td >
						  ${board.bno}
						  </td>
						   <td class="left"> <a href = "read?bno=${board.bno }" style="color:#3399ff">
						  ${board.title}</a>
						  </td>
						   <td>
						  ${board.writer}
						  </td>
						   <td>
						  ${board.regdate}
						  </td>								
						</tr>
					</c:forEach>
				</table>

				<div class='row'>
				
				<div class="container text-center">
    
			      <ul>
			         <c:if test="${pageMaker.prev }">
			            <a class="btn btn-outline-secondary" href = "listAll${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a>
			            
			         </c:if>      
			            
			         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var = "idx">            
			            <c:choose>
			            
			            <c:when test="${cri.page != idx }">
			            <a class="<c:if test="${cri.page != idx }">btn btn-outline-secondary</c:if>" href = "listAll${pageMaker.makeSearch(idx)}"  >${idx }</a>
			            </c:when>
			            
			            <c:otherwise>
			            <a style="color: white;" class="<c:if test="${cri.page == idx }">btn btn-secondary</c:if>" href = "listAll${pageMaker.makeSearch(idx)}"  >${idx }</a>
			            </c:otherwise>
			            
			            </c:choose>   
			         </c:forEach>         
			         
			         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			            <a class="btn btn-outline-secondary " href = "listAll${pageMaker.makeSearch(pageMaker.endPage +1 )}">&raquo;</a>
			         </c:if>
			      </ul>
			            
			</div>
			<br><br>	  
		<form name="search_faq" autocomplete="on">
		
   <div class="input-group mb-3" style="width:100%;">
   
    <input class="form-control" id="keyword" name="keyword" type="search" value="${pageMaker.cri.keyword}" 
    placeholder="  글을 검색하세요." />  
   <button type="submit" id="searchBtn" class="btn btn-outline-primary" style="width:100px;">　검색　</button>
	　　<button type="button"  border-radius: 5px 5px 5px 5px; border:0;" 
                 id="searchBtn" class="btn btn-primary" onclick="location.href= 'registerForm' " >　새로운 글 작성　</button>
      
   </div>
   
	<div class="container text-right"" style="padding-bottom: 15px"> 
   </div>
   </div>
</form>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</div>
</div>


</body>
</html>