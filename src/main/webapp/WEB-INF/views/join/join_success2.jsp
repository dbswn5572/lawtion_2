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
	<div class="selectForm">
		<h1 class="h1-1">LAWTION의 회원이 되신 것을</h1>
		<h1 class="h1-2">축하드립니다.</h1>
			<form name="joinSelectForm" action="#" method="post" class="joinSelect">
				<ul>
					<div class="butt">
					<li>
						<button type="button" class="button1">홈으로</button>
						<a href="../login/login.jsp"><button type="button" class="button2">로그인</button></a>
					</li>
					</div>
				</ul>
			</form>
	</div>
</body>
	<jsp:include page ="../footer.jsp"/>
</html>