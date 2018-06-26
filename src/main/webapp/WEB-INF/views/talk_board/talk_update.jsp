<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lawtion.vo.TalkBoardVO,lawtion.dao.TalkBoardDAO, java.util.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href= "${pageContext.request.contextPath}/css/lawtion.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>	
$(document).ready(function(){
	$("#btnupdate").click(function(){
		if($("#title").val()==""){
			alert("제목을 입력해주세요.");
			$("#title").focus();
		}else if($("input[type=file]").val() == ""){
			//alert("파일선택 안함!!")
			$("#code").val("exist");
		}
		
		
		boardForm.submit();
		});

});
</script>
</head>
<body>
	<jsp:include page ="../header.jsp"/>
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
		<div class="write-title">
			<img src ="${pageContext.request.contextPath}/images/write.png" width="40" height="40">
			<label>하소연 작성</label>
		</div>
		<div class="write">
			<form name="boardForm" action="talk_update_check.do" method="post" enctype="multipart/form-data">
				<table  class="talk-Write">
					<tr>
						<td colspan=2>
							<label>글쓴이</label>
							<input type ="text"	value="hyeona" disabled>
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan=3>
							<label>제목</label>
							<input type ="text" name="title" id="title" value="${vo.title}">
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>내용</label>
							<textarea class="content" id="content" cols="5" name="content" >${vo.content}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>첨부파일</label>
							<input type ="file" name="file" value="${vo.fname}">
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<div class="write_button">
								<input type="hidden" name="no" value="${vo.no}">
								<input type="hidden" name="code" id="code">
								<button type="submit" id="btnupdate" name="btnupdate">수정완료</button>
								<button type="reset" name="reset">취소</button>
								<a href="${pageContext.request.contextPath}/talk_board_content.do?no=${vo.no}&rno=${rno}"><button type="button">이전 페이지</button></a>
							</div>
						</td>
					</tr>
				</table>	
			</form>
		</div>
	</div>
	<jsp:include page ="../footer.jsp"/>
	
</body>
</html>