<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lawtion.vo.joinLayerVO, lawtion.dao.joinLayerDAO" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lawtion.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<style>
	div.mypage-box2 a:hover, div.mypage-box2 a:active, div.mypage-box2 a:visited,div.mypage-box2 a:link,
	div.mypage-box3 a:hover, div.mypage-box3 a:active, div.mypage-box3 a:visited,div.mypage-box3 a:link{
	text-decoration:none;
	color:#353535;
	}
	div.mypage-box1 a:hover, div.mypage-box1 a:active, div.mypage-box1 a:visited,div.mypage-box1 a:link,
	div.mypage-box4 a:hover, div.mypage-box4 a:active, div.mypage-box4 a:visited,div.mypage-box4 a:link{
	text-decoration:none;
	color:white;
	}
	select.phoneselect{
	width:20%;
	height:38px; background-color:#F6F6F6;
	}
	form.mypage-info table input.phone{
	width:20%;
	height:38px; background-color:#F6F6F6;
	}
</style>
<script language="javascript">
function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;

  //ie�϶�(IE8 ���Ͽ����� �۵�)
	if (ua.indexOf("MSIE") > -1) {
		targetObj.select();
		try {
			var src = document.selection.createRange().text; // get file full path(IE9, IE10���� ��� �Ұ�)
			var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);
			if (ie_preview_error) {
				preview.removeChild(ie_preview_error); //error�� ������ delete
			}
			var img = document.getElementById(View_area); //�̹����� �ѷ��� ��
			//�̹��� �ε�, sizingMethod�� div�� ���缭 ����� �ڵ����� �ϴ� ����
			img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
			
		} catch (e) {

			if (!document.getElementById("ie_preview_error_" + View_area)) {
				var info = document.createElement("<p>");
				info.id = "ie_preview_error_" + View_area;
				info.innerHTML = e.name;
				preview.insertBefore(info, null);
			}
		}

  //ie�� �ƴҶ�(ũ��, ���ĸ�, FF)
	} else {
		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //�̹��� �����ϰ�츸.. �ѷ��ش�.
			if (!file.type.match(imageType))
				continue;
			var prevImg = document.getElementById("prev_" + View_area); //������ �̸����Ⱑ �ִٸ� ����
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '200px'; 
			img.style.height = '200px';
			preview.appendChild(img);
			if (window.FileReader) { // FireFox, Chrome, Opera Ȯ��.
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			} else { // safari is not supported FileReader
				//alert('not supported FileReader');
				if (!document.getElementById("sfr_preview_error_"
						+ View_area)) {
					var info = document.createElement("p");
					info.id = "sfr_preview_error_" + View_area;
					info.innerHTML = "not supported FileReader";
					preview.insertBefore(info, null);
				}
			}
		}
	}
}

</script>
</head>
<jsp:include page ="../header.jsp"/>
<body>	
	<p>
	<div class="review-title">
		<div class="title-sub">
			<img src="${pageContext.request.contextPath}/images/mypage.jpg" width="500" height="100" class="title">
		</div>	
	</div>
	<div class="mypage-main">
		<div class="mypage-auction">
			<div class="mypage-box1">
				<a href="${pageContext.request.contextPath}/mypagelawyer.do">
				<label>김선웅님의</label>
				<span>역경매<br>신청현황</span>
				</a>
			</div>
			
			<div class="mypage-box2">
				<a href="${pageContext.request.contextPath}/mypagelawyerpro.do">
					<img src="${pageContext.request.contextPath}/images/mypage-write.png">
					<span>입찰신청</span>
					<label>1건</label>
				</a>
			</div>
			
			<div class="mypage-box3">
				<a href="${pageContext.request.contextPath}/mypagelawyersuccess.do">
					<img src="${pageContext.request.contextPath}/images/mypage-success.png">
					<span>낙찰 및 마감</span>
					<label>2건</label>
				</a>
			</div>
			<div class="mypage-box4">
				<a href="${pageContext.request.contextPath}/mypagelawyerinfo.do">
					<img src="${pageContext.request.contextPath}/images/mypage-my.png">
					<span>개인정보수정</span>
				</a>
			</div>
		</div>
		<div class="mypage-content">
			<div class="mypage-content-sub">
				<span class="mypage-sub-title">개인정보 수정</span>
			</div>
			<div class="mypage-content-table">
				<form action="#" method="post" class="mypage-info">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" disabled value="hyeona6923"></td>
							<th>본인사진</th>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password"></td>
							<td rowspan=4>
								<div class="mypage-img">
									<input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')" style='width:100%;'>
									<div id='View_area' style='position:relative; width: 200px; height: 200px; color: black; border: 0px solid black; dispaly: inline; margin-top:10px;'></div>
								</div>
							</td>
						</tr>
						<tr>
							<th>비밀번호확인</th>
							<td><input type="password"></td>
						</tr>
						<tr>
							<th>핸드폰번호</th>
							<td>
								<select name="phone1" id="phone1" class="phoneselect">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
								</select>
								-<input type="text" name="phone2" class="phone" id="phone2">
								-<input type="text" name="phone3" class="phone" id="phone3">
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" placeholder=" Email 주소 전체를 입력해주세요." id="email"></td>
						</tr>
					</table>
				</form>
				<div class="mypage-info">
					<button type="mypage-info-button">수정완료</button>
				</div>
			</div>
		</div>
	</div>
</body>	
<jsp:include page ="../footer.jsp"/>
</html>