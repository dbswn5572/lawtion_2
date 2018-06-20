<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lawtion.vo.*,lawtion.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lawtion.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/am-pagination.css">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/paging.js"></script>
<script>
	$(document).ready(function(){
		//모두 수신동의 체크
		var pager = jQuery('#ampaginationsm').pagination({
			
		    maxSize: 7,	    		// max page size
		    totals: '${dbCount}',	// total pages	
		    page: '${rpage}',		// initial page		
		    pageSize: 5,			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			  //jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "${pageContext.request.contextPath}/notice.do?rpage="+e.page);         
	    });
		
	});

</script>
</head>
	<jsp:include page ="../header1.jsp"/>
<body>
	<p>
	<div class="review-title">
		<div class="title-sub">
			<img src="${pageContext.request.contextPath}/images/noticetitle.jpg" width="500" height="100" class="title">
		</div>	
	</div>
	<div class="notice_menu">

	</div>
	
				<div class="review-content">
			<ul>
				<li><a href="${pageContext.request.contextPath}/notice_content_next.do?no=${vo.no }&rno=${rno}"><img src="${pageContext.request.contextPath}/images/previous.png" width="25" height="20">이전글</a></li>
				<li><a href="${pageContext.request.contextPath}/notice.do">목록</a></li>
				<li><a href="${pageContext.request.contextPath}/notice_content_pre.do?no=${vo.no }&rno=${rno}">다음글<img src="${pageContext.request.contextPath}/images/next.png" width="25" height="20"></a></li>
			</ul>
			<table border=0 class="content">
				<tr>
					<td colspan=6>
						${vo.title}
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>관리자</td>
					<td>${vo.rdate}</td>
					<td>${vo.hits}</td>
					<td></td>
				</tr>
				<tr>
					<td>
					</td>
					<c:choose>
					<c:when test="${vo.content != 'empty'}">
						<td colspan="4">
							${vo.content}<br>
							<c:if test="${not empty vo.rfname}">								
							<img src="${pageContext.request.contextPath}/images/${vo.rfname}"
							width="400" height="300">
							</c:if>		
						</td>			
					</c:when>
					</c:choose>
					<td>
					</td>
				</tr>
		</table>
		
	
	</div>
	<p><br>
	<hr>
	<p><br>

</body>
	<jsp:include page ="../footer.jsp"/>
</html>