<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mn" value="6" />
<c:set var="sn" value="2" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${menuMap[mn]['sub'][sn]['title'] } - 자바 캠핑카</title>
<%@ include file="../include/plugin.jsp" %>
<link href="${contextPath}/resources/css/sub_all.css" rel="stylesheet" />
</head>
<style>
	.trr{
		 background-color: #b3e5fc;
	}
	.ja{
		padding: 10px 0px;
	}
	h1 {
    font-size: 28px;
<<<<<<< HEAD
    
=======
    -webkit-background-clip: text;
>>>>>>> 6ed552403be76ced568df3bf12640bb910044017
}
</style>
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

	<section class="content container-fluid">
			<div class="table-responsive">
				<div class="container text-center table-hover">
				  <table class="table table-bordered text-center">
				  <colgroup> 
				</colgroup>
			<div style="text-align:center">
		<h1>가장 많은 질문들을 정리해 올렸습니다. 궁금한점이 있으면 확인해 주세요</h1>
	</div>
</table>

</div>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12" style="margin: auto;">
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
	<div class="table_wrap ja">
	</div>
	<table  class="table table-bordered text-center">
		<thead>
			<tr class="trr" style="color:#6699ff">
			
				<th class="bno_width"><b>번호</b></th>
				<th class="title_width"><b>제목</b></th>
				<th class="writer_width"><b>작성자</b></th>
				<th class="regdate_width"><b>작성일</b></th>
				<th class="updatedate_width"><b>수정일</b></th>
			
			</tr>
</thead>
		 <c:forEach items="${list}" var="list">
            <tr>
                <td><c:out value="${list.bno}"/></td>
                <td>
                	 <a class="move" href='<c:out value="${list.bno}"/>'>
       					 <c:out value="${list.title}"/>
   					 </a>
                </td>
                <td><c:out value="${list.writer}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></td>
             </tr>
        </c:forEach>
	</table>
			<div style="text-align:center">
		 <div class="search_wrap ja">
        <div class="search_area">
        	   <select name="type">
                <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>선택해 주세요</option>
                <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
                <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
                <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
                <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
                <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
            </select>
           <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
            <button>검색</button>
          		</div>
        			</div>
        				</div>
        					</div>
        						</div>
        					<div class="container text-center">	
						<div class="pageInfo_wrap ja" >
       				 <div class="pageInfo_area">
 				<ul id="pageInfo" class="pageInfo">
 				
 				 <!-- 이전페이지 버튼 -->
                <c:if test="${pageMaker.prev}">
<<<<<<< HEAD
                    <li class="btn btn-outline-secondary"><a href="${pageMaker.startPage-1}">&laquo;</a></li>
=======
                    <a class="btn btn-outline-secondary" href="${pageMaker.startPage-1}">&laquo;</a>
>>>>>>> 6ed552403be76ced568df3bf12640bb910044017
                </c:if>
                
                
                
				
				<!-- 각 번호 페이지 버튼 -->
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
<<<<<<< HEAD
                     <c:choose>
            
			            <c:when test="${pageMaker.cri.pageNum != num }">
			            <a class="btn btn-outline-secondary" href="${num}">${num}</a>
			            </c:when>
			            
			            <c:otherwise>
			            <a style="color: white;" class="<c:if test="${pageMaker.cri.pageNum == num }">btn btn-secondary</c:if>"  href="${num}">${num}</a>
			            </c:otherwise>
			            
			          </c:choose>   
        
                </c:forEach>

=======
					<c:choose>            
						<c:when test="${pageMaker.cri.pageNum != num }">
						<a class="<c:if test="${pageMaker.cri.pageNum != num }">btn btn-outline-secondary</c:if>"  href="${num}" >${num }</a>
						</c:when>
						            
						<c:otherwise>
						<a style="color: white;" class="btn btn-secondary" href="${num}" >${num }</a>
						</c:otherwise>					            
					</c:choose>        
                </c:forEach>

  

>>>>>>> 6ed552403be76ced568df3bf12640bb910044017

				<!-- 다음 페이지 버튼 -->
				<c:if test="${pageMaker.next}">
					<a class="btn btn-outline-secondary" href="${pageMaker.endPage + 1 }">&raquo;</a>
				</c:if>
								
				
				</ul>
			</div>
		</div>
	</div>		
		<form id="moveForm" method="get">
		  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
       	 <input type="hidden" name="amount" value="${pageMaker.cri.amount }">   
       	 <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">  
       	 <input type="hidden" name="type" value="${pageMaker.cri.type }">
		</form>
 			</div>
 				</div>
 				
 					<div class="box">
 				<div class="container text-right">

				</div>
				<!-- /.box-body -->
				
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->
		</section>
     <script>
$(document).ready(function(){
    
    let result = '<c:out value="${result}"/>';
    
    checkAlert(result);
    
    function checkAlert(result){
        
        if(result === ''){
            return;
        }
        
        if(result === "enrol success"){
            alert("등록이 완료되었습니다.");
        }
        if(result === "modify success"){
            alert("수정이 완료되었습니다.");
        }
        if(result === "delete success"){
        	alert("삭제가 완료되었습니다.");
        }
        
    }    
    
});

	let moveForm = $("#moveForm");

	$(".move").on("click", function(e){
    	e.preventDefault();
   	 
    moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
    moveForm.attr("action", "/notice/get");
    moveForm.submit();
});

    $(".pageInfo a").on("click", function(e){
 
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/notice/list");
        moveForm.submit();
        
    });
    $(".search_area button").on("click", function(e){
        e.preventDefault();
        
        let type = $(".search_area select").val();
        let keyword = $(".search_area input[name='keyword']").val();
        
        if(!type){
            alert("검색 종류를 선택하세요.");
            return false;
        }
        
        if(!keyword){
            alert("키워드를 입력하세요.");
            return false;
        }        
        
        moveForm.find("input[name='type']").val(type);
        moveForm.find("input[name='keyword']").val(keyword);
        moveForm.find("input[name='pageNum']").val(1);
        moveForm.submit();
    });
		
	
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