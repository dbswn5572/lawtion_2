<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lawtion.vo.PrecedentVO_review, lawtion.dao.PrecedentDAO_review, java.util.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href= "${pageContext.request.contextPath}/css/lawtion.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/am-pagination.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/paging.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pop	per.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
    	$("#ban1").click(function(){
       		$(this).css("display","none");
       		$("#ban2").css("display","block").animate({width:'300px',height:'600px'})
       		$("#ban3").animate({width:'20px',height:'20px'})
     	})
    	$("#ban3").click(function(){
            $(this).css('display','none');
            $("#ban2").css('display','none');
            $('#ban1').css('display','block');

    	})
	
		
    	$("#search").click(function(){
      		if($("#search_form").val()==""){
         		alert("검색어를 입력하세요.");
        		$("#search_form").focus();
         		return false;
      		}       
      
      		searchform.submit();
  		 });
    	
    	var pager = jQuery('#ampaginationsm').pagination({
    	      
            maxSize: 7,             // max page size
            totals: '${dbCount}',   // total pages   
            page: '${rpage}',      // initial page      
            pageSize: 10,         // max number items per page
        
            // custom labels      
            lastText: '&raquo;&raquo;',       
            firstText: '&laquo;&laquo;',      
            prevText: '&laquo;',      
            nextText: '&raquo;',
                   
            btnSize:'sm'   // 'sm'  or 'lg'      
        });
        
        jQuery('#ampaginationsm').on('am.pagination.change',function(e){
              jQuery('.showlabelsm').text('The selected page no: '+e.page);
                $(location).attr('href', "${pageContext.request.contextPath}/precedent_review.do?rpage="+e.page);         
         });
	
 	});
</script> 
</head>
<body>
	<jsp:include page ="../header.jsp"/>
	<div class="review0">
		<div class="review-title">
			<div class="title-sub">
				<img src="${pageContext.request.contextPath}/images/precedenttitle.jpg" width="500" height="100" class="title">
			</div>	
		</div>
		<nav class="review-select1">
			<div class="select">
				<ul>
					<li class="select2"><a href="${pageContext.request.contextPath}/precedent_normal.do">기존판례</a></li>
					<li class="select1"><a href="${pageContext.request.contextPath}/precedent_review.do">후기판례</a></li>
				</ul>
			</div>
		</nav>
		
		 <form name="searchform" action="search_input.do" method="post">
      		<div class="gogo">
         		<input type="text" name="search2" class="s_input" placeholder="  검색어를 입력하세요" id="search_form">
         		<a href="#"><img src="${pageContext.request.contextPath}/images/magnifier3.jpg" id="search"></a>
      		</div>
   		</form>
		
		<div class="reviewlist1">
			<table border=0 class="all">
				<tr>
					<th width="70px">No</th>
					<th width="77px"></th>
					<th width="950px">소송명</th>
					<th>승패</th>
					<th>담당변호사</th>
					<th>조회수</th>
				</tr>
				<c:forEach items = "${list}" var = "vo">
				<tr>
					<td>${vo.rno }</td>	
					<td></td>
					<td><a href="${pageContext.request.contextPath}/precedent_content_review.do?no=${vo.no }&rno=${vo.rno }">${vo.title }</a></td>
					<td>${vo.result }</td>
					<td>${vo.lname }</td>
					<td>${vo.hits }</td>
				</tr>
				</c:forEach>
				<tr>
					
              		<td colspan="5">
                     	<div id="ampaginationsm"></div>
               		</td>
               		<td></td>
               		
           		</tr>
			</table>
		</div>
	</div>
	
	<div class="wrap">
	 <div class="btn">
         	 <img src="${pageContext.request.contextPath}/images/btn_search_log_off.png" id="ban1" width="200" height="50">
    	 </div>
   	 
  		 </div>
     	 
	<jsp:include page ="../footer.jsp"/>
	
      
     <div class="done" id="ban2">
	         <table border=1 class="table3">
	            <tr>
	               <th>최근검색이력(${count }건)</th>
	               <th><img src="${pageContext.request.contextPath}/images/close.png" id="ban3"></th>
	            </tr>
	            <c:forEach items="${list1 }" var="vo">
	            <tr class="search_tr">
	               <td colspan="2"><a href="${pageContext.request.contextPath}/search_input2.do?wpage=review&sno=${vo.sno }&keyword=${vo.keyword}">${vo.keyword }</a></td>
	            </tr>
	            </c:forEach>
	            <tr class="table3_last">
	               <td colspan="2"><a href="${pageContext.request.contextPath}/search_delete.do?wpage=review">최근검색이력삭제</a></td>
	            </tr>
	         </table>
     	 </div>
	
	
</body>
</html>