<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lawtion.vo.*,lawtion.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
  	<link rel="stylesheet" type="text/css" href="http://localhost:9000/mycgv/css/am-pagination.css">
  	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lawtion.css">
  	<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
  	<!-- <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"> -->
  	<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="/data/201011/IJ12885672102633/featureList.js"></script>
<!-- 하부메뉴 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"> <!-- Resource style -->
	<script src="${pageContext.request.contextPath}/js/modernizr.js"></script> <!-- Modernizr -->
	<script src="${pageContext.request.contextPath}/js/main.js"></script> <!-- Resource jQuery -->
<title>변호사 소개</title>

		<script>
		$(document).ready(function(){
			
			$("#word").keydown(function(key){
				if(key.keyCode==13){
					word();
				}	
			});
			
			
			
			$("#popup").css({
				"top":(($(window).height()-$("#popup").outerHeight())/2+$(window).scrollTop())+"px",
				"left":(($(window).width()-$("#popup").outerWidth())/2+$(window).scrollLeft())+"px"
			});
			var pager = jQuery('#ampaginationsm').pagination({
				
			    maxSize: 7,	    		// max page size
			    totals: '${dbCount}',	// total pages	
			    page: '${rpage}',		// initial page		
			    pageSize: 20,			// max number items per page
			
			    // custom labels		
			    lastText: '&raquo;&raquo;', 		
			    firstText: '&laquo;&laquo;',		
			    prevText: '&laquo;',		
			    nextText: '&raquo;',
					     
			    btnSize:'sm'	// 'sm'  or 'lg'		
			});
			
			jQuery('#ampaginationsm').on('am.pagination.change',function(e){
				  //jQuery('.showlabelsm').text('The selected page no: '+e.page);
		           $(location).attr('href', "${pageContext.request.contextPath}/introduce_list.do?page="+e.page);         
			
			});
		});
	</script>
	

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
		
		<div class="introduce2">
	<section class="content_style">
		<div class="review-title">
			<div class="title-sub">
				<img src="${pageContext.request.contextPath}/images/introducetitle.jpg" width="500" height="100" class="title">
			</div>	
		</div>
		<div class="left-list">
			<iframe id="left-iframe" name="ifram1" height="616" width="400" src ="${pageContext.request.contextPath}/introduce_left.do?no=${no} " ></iframe>
		</div>
		
		
		<div class="right-iframe" >
			<iframe id="right-iframe" name="ifram2" height="620" width="1100" src ="${pageContext.request.contextPath}/introduce_right.do?no=${no} " scrolling="no"></iframe>
			
			
		</div>
	
	</section>
	</div> 
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>