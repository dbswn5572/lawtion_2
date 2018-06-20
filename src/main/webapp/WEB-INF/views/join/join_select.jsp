<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lawtion.css">
<title>Insert title here</title>
</head>
	<jsp:include page ="../header1.jsp"/>
<body>
<p>
<div class="review-title">
	<div class="title-sub">
		<img src="${pageContext.request.contextPath}/images/jointitle.jpg" width="500" height="100" class="title">
	</div>	
</div>
	<div class="selectForm">
		<h1 class="h1-1">LAWTION에 오신 것을</h1>
		<h1 class="h1-2">환영합니다.</h1>
			<form name="joinSelectForm" action="#" method="post" class="joinSelect">
				<ul>
					<div class="butt">
					<li>
					
						<a href="${pageContext.request.contextPath}/join_access2.do"><button type="button" class="button1">일반 회원</button></a>
						<a href="${pageContext.request.contextPath}/join_access.do"><button type="button" class="button2">변호사</button></a>
						<p><br>
					</li>
					</div>
				</ul>
			</form>
	</div>
</body>
	<jsp:include page ="../footer.jsp"/>
</html>