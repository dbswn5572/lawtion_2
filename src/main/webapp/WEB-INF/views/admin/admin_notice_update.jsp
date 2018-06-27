<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" import="lawtion.vo.*,lawtion.dao.*,java.util.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>Lawtion 관리자 </title>
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
		
		$("#btnupdate").click(function(){
			if($("#title").val()==""){
				alert("제목을 입력해주세요.");
				$("#title").focus();
			}else if($("input[type=file]").val() == ""){
				//alert("파일선택 안함!!")
				$("#code").val("exist");
			}
			
			
			write.submit();
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
					<li class="menuu"><a href="${pageContext.request.contextPath}/admin.do"><i class="fa fa-paper-plane"></i>
							<span class="main-sub">공지사항</span></a>
						<ul class="sub-group-list">
							<li><a href="${pageContext.request.contextPath}/admin_notice_write.do"><i class="fa fa-pencil"></i><span>공지사항 작성</span></a></li>
						</ul>
					</li>
					<li class="menuu"><a href="#"><i class="fa fa-cog fa-fw"></i>
							<span class="main-sub">회원관리</span></a>
						<ul class="sub-group-list">
							<li><a href="${pageContext.request.contextPath}/admin_user.do"><i class="fa fa-paper-plane"></i><span>일반회원</span></a></li>
							<li><a href="#"><i class="fa fa-pencil"></i><span>변호사회원</span></a></li>
						</ul>
					</li>
					<li class="menuu"><a href="#"><i class="fa fa-cog fa-fw"></i>
							<span class="main-sub">판례게시판</span></a>
						<ul class="sub-group-list">
							<li><a href="${pageContext.request.contextPath}/admin_precedent_normal.do"><i class="fa fa-paper-plane"></i><span>기존판례</span></a></li>
							<li><a href="${pageContext.request.contextPath}/admin_precedent_review.do"><i class="fa fa-pencil"></i><span>후기판례</span></a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</header>
	<div class="container-admin">
		<h3>공지사항</h3>
		<div class="notice">
		<form name="write" action="admin_notice_update_check.do" method="post" enctype="multipart/form-data">
			<table class="theme" border=1 >
				<tr>
					<th>No</th>
					<td><input type="text" value="${vo.no}" disabled></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input name="title" type="text" value="${vo.title}" type=hidden></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" rows="20" cols="30">${vo.content }</textarea></td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td><input type="file" name="file" value="${vo.fname }"></td>
				</tr>

				</table>
				
				<a href="${pageContext.request.contextPath}/admin.do"><button type="button">목록</button></a>
				<button type="submit" id="btnupdate" name="btnupdate">수정완료</button>
				<a href="${pageContext.request.contextPath}/admin_notice_delete.do?no=${vo.no }&rno=${vo.rno}"><button type="button">삭제하기</button></a>
				<input type="hidden" name="code" id="code">
				<input type="hidden" name="no" value="${vo.no }"> 
			</form>
				
			</div>
		</div>	

	
</body>
</html>
