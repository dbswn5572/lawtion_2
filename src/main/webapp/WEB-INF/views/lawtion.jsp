<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lawtion.vo.TalkBoardVO, lawtion.dao.TalkBoardDAO, java.util.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href= "${pageContext.request.contextPath}/css/lawtion.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/am-pagination.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/paging.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page ="header.jsp"/>
	<div class="review">
		<div class="review-title">
			<div class="title-sub">
				<img src="${pageContext.request.contextPath}/images/talktitle.jpg" width="500" height="100" class="title">
			</div>	
		</div>
		<div class="talknotice">
			<label class="talktitle">
				본 게시판은 역경매 게시판도 후기 게시판도 아닙니다.<br>주변에 하소연하지 못하는 사건, 답답한 일을 주변사람과 공유, 위로, 충고 받는 공간입니다. <br>공격적인 말보다는 따뜻한 말을 사용해주세요			
			</label>
		</div>
		<div class="review-allbest">
			<span>주간 BEST5</span>
			<table border=0 class="best">
				<c:forEach items = "${allbestlist}" var = "vo">
				<tr>
					<td>${vo.rno }</td>
					<td><a href="${pageContext.request.contextPath}/talk_board_content.do?no=${vo.no }&rno=${vo.rno }">${vo.title }</a></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div class="reviewlist">
			<div class="write-btn">
				<a href ="${pageContext.request.contextPath}/talk_write.do"><button type="button">글쓰기</button></a>
			</div>
			<table border=0 class="all">
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items = "${alllist}" var = "vo">
				<tr>
					<td>${vo.rno }</td>
					<td><a href="${pageContext.request.contextPath}/talk_board_content.do?no=${vo.no }&rno=${vo.rno }">${vo.title }</a></td>
					<td>정현아</td>
					<td>${vo.tdate }</td>
					<td>${vo.hits }</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan=5>
						<div id="ampaginationsm"></div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page ="footer.jsp"/>
	
</body>
</html>