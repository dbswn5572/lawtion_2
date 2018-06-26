<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>정말삭제하시겠습니까?</h1>
<a href="${pageContext.request.contextPath}/delete_check.do?id=${id}"><button type="button" id="yes">예</button></a>
<a href="${pageContext.request.contextPath}/admin_user.do"><button type="button" id="no">아니오</button></a>
</body>
</html>