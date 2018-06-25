<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>판례</title>
<link rel="stylesheet" type="text/css" href= "http://localhost:9000/lawtion/css/lawtion.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/am-pagination.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://localhost:9000/lawtion/js/paging.js"></script>
</head>
<body>
	<jsp:include page="../header1.jsp"/>
	<div class="review-title1">
		<div class="title-sub">
			<img src="http://localhost:9000/lawtion/images/precedenttitle.jpg" width="500" height="100" class="title">
		</div>	
	</div>
	<div class="pre_content">
		<div class="pre_content1">
			<table>
				<tr>
					<th>소송명</th>
				</tr>
				<tr>
					<td>내용을 적으세요</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>