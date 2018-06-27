<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="lawtion.vo.joinLayerVO, lawtion.dao.joinLayerDAO"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8" />
   <title>Lawtion 관리자</title>
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
   <link rel="stylesheet" type="text/css" href= "${pageContext.request.contextPath}/css/lawtion.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/am-pagination.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/paging.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<title>Insert title here</title>
<script>
   $(document).ready(function(){
      $("li.menuu>a").click(function(){
         
         //$("li.menuu>li").slideDown();
         //alert("확인11");
         if($(this).next("ul").is(":visible")){
            $(this).next("ul").slideUp();
         }else{
            $(this).next("ul").slideDown();
         }
         
      });
   });
</script>
<style>

  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
    
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  div.content{
  	width:80%;
  	float:right;
  }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
							<li><a href="${pageContext.request.contextPath}/admin_lawyer.do"><i class="fa fa-pencil"></i><span>변호사회원</span></a></li>
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
	<div class = "content">
      <h1>변호사 ${vo.id}님 상세정보</h1>
      <table>
         <tr>
            <th>JOIN_DATE</th>
            <th>ID</th>
            <th>NAME</th>
            <th>PHONE</th>
            <th>EMAIL</th>
            <th>BIRTH</th>
            <th>PICTURE</th>
            <th>LICENSE</th>
            <th>LIST</th>
         </tr>
         <tr>
            <td>${vo.jdate}</td>
            <td>${vo.id}</td>
            <td>${vo.name}</td>
            <td>${vo.phone}</td>
            <td>${vo.email }</td>
            <td>${vo.birth}</td>
            <td><img src="${pageContext.request.contextPath}/businessUpload/${vo.rbusiness}" style='width=100px; height=100px;'></td>
            <td><img src="${pageContext.request.contextPath}/licenseUpload/${vo.rlicense}" style='width=100px; height=100px;'></td>
            <td><a href="${pageContext.request.contextPath}/admin_lawyer.do"><button>LIST</button></a></td>
         </tr>
         <tr>
            <td colspan="4" >
               <div id="ampaginationsm"></div>               
            </td>
         </tr>   
      
      </table>
   </div> 

</body>
</html>