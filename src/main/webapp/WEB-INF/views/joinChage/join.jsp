<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/joincss.css">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
</head>
<jsp:include page ="../header1.jsp"/>
<body>
	<p>
	<div class="review-title">
		<div class="title-sub">
			<img src="${pageContext.request.contextPath}/images/join.jpg" width="500" height="100" class="title">
		</div>	
	</div>
	<div class="join-title">
		<div class="join-sub">
			<img src="${pageContext.request.contextPath}/images/join_main.jpg"  class="title">
		</div>
		<div class="join-sub-sub">
			<img src="${pageContext.request.contextPath}/images/join-sub-title.png"  class="title" width="500" height="152">
		</div>
	</div>
	<div class="join-main">
		<div class="join-select">
			<div class="join-text">
				<label class="join-info-title">���� ����</label><br>
				<label class="join-info-sub">�Ʒ� �� �̿��Ͻ� ���񽺸� Ȯ���Ͻð� ������ ������ �ּ���.</label>
			</div>
			<div class="select">
				<section class="select-content1">
					<div class="sel-img">
						<img src="${pageContext.request.contextPath}/images/user.png" width="90" height="90" class="user-title">
					</div>
					<div class="sel-info">
						<a href="${pageContext.request.contextPath}/join_user.do"><button class="join-user-button">�����</button></a>
					</div>
				</section>
				<section class="select-content2">
					<div class="sel-img">
						<img src="${pageContext.request.contextPath}/images/lawyer.png" width="90" height="90" class="user-title">
					</div>
					<div class="sel-info">
						<a href="${pageContext.request.contextPath}/join_lawyer.do"><button class="join-lawyer-button">��ȣ��</button></a>
					</div>
				</section>
			</div> <!-- end of select -->
		</div> <!-- end of join-select -->
		<div class="main-sub">
		</div>
	</div> <!-- end of join-main -->
</body>
<jsp:include page ="../footer.jsp"/>
</html>