<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lawtion.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<jsp:include page ="../header1.jsp"/>
	<div class="content">
		<section class="notice-style">
			<h1>공지사항 등록</h1>
			<form name="noticeForm" action="#" method="post" enctype="multipart/form-data" class="noticeForm">
				<ul>
					<li>
						<label>제목</label>
						<input type="text" name="title" id="title">
					</li>
					<li>
						<label>내용</label>
					</li>
					
				</ul>
			
			</form>
		</section>
	
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>