<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" import="lawtion.vo.*,lawtion.dao.*,java.util.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>Lawtin 관리자 </title>
	<!-- Bootstrap 적용 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, 
		minimum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<!-- Twitter Bootstrap3 & jQuery -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
	<link rel ="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
	<link rel ="stylesheet" type="text/css" href="assets/css/nanumfont.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	
<script>
	$(document).ready(function(){
		$("li.menuu>a").click(function(){
			
			//$("li.menuu>li").slideDown();
			//alert("확인11");
			if($(this).next("ul").is(":visible")){
				$(this).next("ul").slideUp();
			}else{
				$(this).next("ul").slideUp();
			}
			
		});
		
		
	});
</script>
<style>
table.theme{
	border:1px solid black;
	text-align:center;	
	font-size:18px;
	padding:5px;
}
</style>
</head>
<body>
	<header>
		<div class="ad-nav1">
		<input type="checkbox" id="menu_state" checked>
			<nav class="ad-header-nav1" >
				<!-- <label for="menu_state"><i class="fa fa-balance-scale"></i></label>-->
				<ul>
					<li data-content="2" class="active unread" >
						<a href="#"><i class="fa fa-gavel"></i>
							<span class="main-sub">Lawtion Admin</span>
						</a>
					</li>
					<li class="menuu"><a href="${pageContext.request.contextPath}/admin.do?no=${vo.no}&rno=${vo.rno}"><i class="fa fa-paper-plane"></i>
							<span class="main-sub">공지사항</span></a>
						<ul class="sub-group-list">
							<li><a href="${pageContext.request.contextPath}/admin_notice_write.do?no=${vo.no}&rno=${vo.rno}"><i class="fa fa-pencil"></i><span>공지사항 작성</span></a></li>
						</ul>
					</li>
					<li class="menuu"><a href="#"><i class="fa fa-cog fa-fw"></i>
							<span class="main-sub">회원관리</span></a>
						<ul class="sub-group-list">
							<li><a href="#"><i class="fa fa-paper-plane"></i><span>일반회원</span></a></li>
							<li><a href="#"><i class="fa fa-pencil"></i><span>변호사회원</span></a></li>
						</ul>
				</ul>
			</nav>
		</div>
	</header>
	<div class="container-admin">
		<h3>공지사항</h3><br>
		<div class="notice">
			<table class="theme" border=1>
				<tr>
					<th>No</th>
					<th colspan=3>제목</th>
					<th>작성일자</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${list}" var="vo">
					<tr>
						<td>${vo.rno}</td>
						<td colspan=3 class="subject"><a href="${pageContext.request.contextPath}/admin_notice_content.do?no=${vo.no}&rno=${vo.rno}">${vo.title }</a></td>
						<td>${vo.rdate}</td>
						<td>${vo.hits}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan=6>
						<div id="ampaginationsm"></div>
					</td>
				</tr>
			</table>
			</div>
		</div>	

	
</body>
</html>
