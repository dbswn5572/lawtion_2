<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/joincss.css">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<style>
	select.phoneselect{
	width:20%;
	height:38px; background-color:#F6F6F6;
	}
	table.user-join-table input.phone{
	width:20%;
	height:38px; background-color:#F6F6F6;
	}
</style>
<script>
	$(document).ready(function(){
		$("#join_bt").click(function(){
			
			memberInfo.submit();
			
		});
		$("#passCheck").focusout(function(){
			if($("#pass").val()==""){
				alert("비밀번호를 입력해주세요");
				$("#pass").focus();
				return false;
			}else{
				if($("passCheck").val()!=""){
					if($("#pass").val()==$("#passCheck").val()){
						$("#msg").css("font-size","9pt").css("color","blue").css("display","block");
						$("#msg").text("비밀번호가 동일합니다.");
						return false;
					}else {
						$("#msg").css("font-size","9pt").css("color","red").css("display","block");
						$("#msg").text("비밀번호가 틀립니다.");
						$("#pass").val("").focus();
						$("#passCheck").val("");
						return false;
					}
				}
			}
				
		});
	});
	
</script>
</head>
<jsp:include page ="../header1.jsp"/>
<body>
	<p>
	<div class="review-title">
		<div class="title-sub">
			<img src="${pageContext.request.contextPath}/images/jointitle.jpg" width="500" height="100" class="title">
		</div>	
	</div>
	<div class="join-title">
		<div class="join-sub">
			<img src="${pageContext.request.contextPath}/images/join_main.jpg"  class="title">
		</div>
		<div class="join-sub-sub">
			<img src="${pageContext.request.contextPath}/images/join-sub-title2.png"  class="title" width="500" height="152">
		</div>
	</div>
	<div class="join-main">
		<div class="join-select">
			<div class="join-text">
				<label class="join-info-title">일반회원 가입</label><br>
				<label class="join-info-sub">개인 정보를 정확히 입력해 주세요.</label>
			</div>
			<div class="join-table">
			<form name="memberInfo" action="join_check.do" method="post">
				<table border=1 class="user-join-table">
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="name"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" id="id"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="password" id="pass"></td>
					</tr>
					<tr>
						<th>비밀번호확인</th>
						<td><input type="password" name="passCheck" id="passCheck">
						<span id="#msg"></span></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="date" id="birth" name="birth"></td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
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
						<td><input type="text" name="email" placeholder=" Email주소 전체를 입력해주세요." id="email"></td>
					</tr>
				</table>
				
				<div class="join-terms">
					<ul>
						<li>
						<label class="terms-title">이용약관<br></label>
						<label class="terms-title-sub">아래의 이용약관을 잘 읽어주세요.</label>
						<div class="terms1" style="width:100%; height:250px; overflow:scroll; padding:10px; margin-top:30px;">
						<b>제 1 조 (목적)</b><p>
						이 약관은 LAWTION(이하 “회사”라고 함)이 제공하는 LAWTION의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.<p>
						
						<b>제 1 조 (목적)</b>
						이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
						1. “서비스”라 함은 구현되는 단말기(PC, 모바일, 태블릿 PC 등의 각종 유무선 장치를 포함)와 상관없이 “회원”이 이용할 수 있는 배달의 민족 사장님사이트 관련 제반 서비스를 의미합니다.<p>
						2. “배달의민족 사장님사이트”란 “회사”가 “서비스” 제공을 위하여 운영하는 인터넷홈페이지(http://ceo.baemin.com)를 의미하며 이하 “사장님사이트”라 합니다.<p>
						3. “회원”이라 함은 회사의 “서비스”에 접속하여 이 약관에 따라 “회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용하는 고객을 말합니다.<p>
						4. “아이디(ID)”라 함은 “회원”의 식별과 “서비스” 이용을 위하여 “회원”이 정하고 “회사”가 승인하는 문자와 숫자의 조합을 의미합니다.<p>
						5. “비밀번호”라 함은 “회원”이 부여받은 “아이디”와 일치되는 “회원”임을 확인하고 비밀보호를 위해 “회원” 자신이 정한 문자 또는 숫자의 조합을 의미합니다.<p>
						6. “게시물”이라 함은 “회원”이 서비스를 이용함에 있어 “사장님사이트”의 게시판 등에 등록한 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.<p><br>
						
						<b>제 1 조 (목적)</b>
						이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
						1. “서비스”라 함은 구현되는 단말기(PC, 모바일, 태블릿 PC 등의 각종 유무선 장치를 포함)와 상관없이 “회원”이 이용할 수 있는 배달의 민족 사장님사이트 관련 제반 서비스를 의미합니다.<p>
						2. “배달의민족 사장님사이트”란 “회사”가 “서비스” 제공을 위하여 운영하는 인터넷홈페이지(http://ceo.baemin.com)를 의미하며 이하 “사장님사이트”라 합니다.<p>
						3. “회원”이라 함은 회사의 “서비스”에 접속하여 이 약관에 따라 “회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용하는 고객을 말합니다.<p>
						4. “아이디(ID)”라 함은 “회원”의 식별과 “서비스” 이용을 위하여 “회원”이 정하고 “회사”가 승인하는 문자와 숫자의 조합을 의미합니다.<p>
						5. “비밀번호”라 함은 “회원”이 부여받은 “아이디”와 일치되는 “회원”임을 확인하고 비밀보호를 위해 “회원” 자신이 정한 문자 또는 숫자의 조합을 의미합니다.<p>
						6. “게시물”이라 함은 “회원”이 서비스를 이용함에 있어 “사장님사이트”의 게시판 등에 등록한 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.<p><br>
						
						<b>제 1 조 (목적)</b>
						이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
						1. “서비스”라 함은 구현되는 단말기(PC, 모바일, 태블릿 PC 등의 각종 유무선 장치를 포함)와 상관없이 “회원”이 이용할 수 있는 배달의 민족 사장님사이트 관련 제반 서비스를 의미합니다.<p>
						2. “배달의민족 사장님사이트”란 “회사”가 “서비스” 제공을 위하여 운영하는 인터넷홈페이지(http://ceo.baemin.com)를 의미하며 이하 “사장님사이트”라 합니다.<p>
						3. “회원”이라 함은 회사의 “서비스”에 접속하여 이 약관에 따라 “회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용하는 고객을 말합니다.<p>
						4. “아이디(ID)”라 함은 “회원”의 식별과 “서비스” 이용을 위하여 “회원”이 정하고 “회사”가 승인하는 문자와 숫자의 조합을 의미합니다.<p>
						5. “비밀번호”라 함은 “회원”이 부여받은 “아이디”와 일치되는 “회원”임을 확인하고 비밀보호를 위해 “회원” 자신이 정한 문자 또는 숫자의 조합을 의미합니다.<p>
						6. “게시물”이라 함은 “회원”이 서비스를 이용함에 있어 “사장님사이트”의 게시판 등에 등록한 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.<p><br>
						
						<b>제 1 조 (목적)</b>
						이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
						1. “서비스”라 함은 구현되는 단말기(PC, 모바일, 태블릿 PC 등의 각종 유무선 장치를 포함)와 상관없이 “회원”이 이용할 수 있는 배달의 민족 사장님사이트 관련 제반 서비스를 의미합니다.<p>
						2. “배달의민족 사장님사이트”란 “회사”가 “서비스” 제공을 위하여 운영하는 인터넷홈페이지(http://ceo.baemin.com)를 의미하며 이하 “사장님사이트”라 합니다.<p>
						3. “회원”이라 함은 회사의 “서비스”에 접속하여 이 약관에 따라 “회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용하는 고객을 말합니다.<p>
						4. “아이디(ID)”라 함은 “회원”의 식별과 “서비스” 이용을 위하여 “회원”이 정하고 “회사”가 승인하는 문자와 숫자의 조합을 의미합니다.<p>
						5. “비밀번호”라 함은 “회원”이 부여받은 “아이디”와 일치되는 “회원”임을 확인하고 비밀보호를 위해 “회원” 자신이 정한 문자 또는 숫자의 조합을 의미합니다.<p>
						6. “게시물”이라 함은 “회원”이 서비스를 이용함에 있어 “사장님사이트”의 게시판 등에 등록한 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.<p><br>
					</div>
						</li>
						<li>
							<div class="terms1" style="width:100%; height:250px; overflow:scroll; padding:10px; margin-top:30px;">
						<b>제 1 조 (목적)</b><p>
						이 약관은 LAWTION(이하 “회사”라고 함)이 제공하는 LAWTION의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.<p>
						
						<b>제 1 조 (목적)</b>
						이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
						1. “서비스”라 함은 구현되는 단말기(PC, 모바일, 태블릿 PC 등의 각종 유무선 장치를 포함)와 상관없이 “회원”이 이용할 수 있는 배달의 민족 사장님사이트 관련 제반 서비스를 의미합니다.<p>
						2. “배달의민족 사장님사이트”란 “회사”가 “서비스” 제공을 위하여 운영하는 인터넷홈페이지(http://ceo.baemin.com)를 의미하며 이하 “사장님사이트”라 합니다.<p>
						3. “회원”이라 함은 회사의 “서비스”에 접속하여 이 약관에 따라 “회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용하는 고객을 말합니다.<p>
						4. “아이디(ID)”라 함은 “회원”의 식별과 “서비스” 이용을 위하여 “회원”이 정하고 “회사”가 승인하는 문자와 숫자의 조합을 의미합니다.<p>
						5. “비밀번호”라 함은 “회원”이 부여받은 “아이디”와 일치되는 “회원”임을 확인하고 비밀보호를 위해 “회원” 자신이 정한 문자 또는 숫자의 조합을 의미합니다.<p>
						6. “게시물”이라 함은 “회원”이 서비스를 이용함에 있어 “사장님사이트”의 게시판 등에 등록한 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.<p><br>
						
						<b>제 1 조 (목적)</b>
						이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
						1. “서비스”라 함은 구현되는 단말기(PC, 모바일, 태블릿 PC 등의 각종 유무선 장치를 포함)와 상관없이 “회원”이 이용할 수 있는 배달의 민족 사장님사이트 관련 제반 서비스를 의미합니다.<p>
						2. “배달의민족 사장님사이트”란 “회사”가 “서비스” 제공을 위하여 운영하는 인터넷홈페이지(http://ceo.baemin.com)를 의미하며 이하 “사장님사이트”라 합니다.<p>
						3. “회원”이라 함은 회사의 “서비스”에 접속하여 이 약관에 따라 “회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용하는 고객을 말합니다.<p>
						4. “아이디(ID)”라 함은 “회원”의 식별과 “서비스” 이용을 위하여 “회원”이 정하고 “회사”가 승인하는 문자와 숫자의 조합을 의미합니다.<p>
						5. “비밀번호”라 함은 “회원”이 부여받은 “아이디”와 일치되는 “회원”임을 확인하고 비밀보호를 위해 “회원” 자신이 정한 문자 또는 숫자의 조합을 의미합니다.<p>
						6. “게시물”이라 함은 “회원”이 서비스를 이용함에 있어 “사장님사이트”의 게시판 등에 등록한 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.<p><br>
						
						<b>제 1 조 (목적)</b>
						이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
						1. “서비스”라 함은 구현되는 단말기(PC, 모바일, 태블릿 PC 등의 각종 유무선 장치를 포함)와 상관없이 “회원”이 이용할 수 있는 배달의 민족 사장님사이트 관련 제반 서비스를 의미합니다.<p>
						2. “배달의민족 사장님사이트”란 “회사”가 “서비스” 제공을 위하여 운영하는 인터넷홈페이지(http://ceo.baemin.com)를 의미하며 이하 “사장님사이트”라 합니다.<p>
						3. “회원”이라 함은 회사의 “서비스”에 접속하여 이 약관에 따라 “회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용하는 고객을 말합니다.<p>
						4. “아이디(ID)”라 함은 “회원”의 식별과 “서비스” 이용을 위하여 “회원”이 정하고 “회사”가 승인하는 문자와 숫자의 조합을 의미합니다.<p>
						5. “비밀번호”라 함은 “회원”이 부여받은 “아이디”와 일치되는 “회원”임을 확인하고 비밀보호를 위해 “회원” 자신이 정한 문자 또는 숫자의 조합을 의미합니다.<p>
						6. “게시물”이라 함은 “회원”이 서비스를 이용함에 있어 “사장님사이트”의 게시판 등에 등록한 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.<p><br>
						
						<b>제 1 조 (목적)</b>
						이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
						1. “서비스”라 함은 구현되는 단말기(PC, 모바일, 태블릿 PC 등의 각종 유무선 장치를 포함)와 상관없이 “회원”이 이용할 수 있는 배달의 민족 사장님사이트 관련 제반 서비스를 의미합니다.<p>
						2. “배달의민족 사장님사이트”란 “회사”가 “서비스” 제공을 위하여 운영하는 인터넷홈페이지(http://ceo.baemin.com)를 의미하며 이하 “사장님사이트”라 합니다.<p>
						3. “회원”이라 함은 회사의 “서비스”에 접속하여 이 약관에 따라 “회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용하는 고객을 말합니다.<p>
						4. “아이디(ID)”라 함은 “회원”의 식별과 “서비스” 이용을 위하여 “회원”이 정하고 “회사”가 승인하는 문자와 숫자의 조합을 의미합니다.<p>
						5. “비밀번호”라 함은 “회원”이 부여받은 “아이디”와 일치되는 “회원”임을 확인하고 비밀보호를 위해 “회원” 자신이 정한 문자 또는 숫자의 조합을 의미합니다.<p>
						6. “게시물”이라 함은 “회원”이 서비스를 이용함에 있어 “사장님사이트”의 게시판 등에 등록한 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.<p><br>
					</div>
						</li>
					</ul>
					
				</div>
				<div class="main-sub">
					<button type="button" class="join-next-btton" id="join_bt">다음</button>
				</div>
				</form>
			</div> <!-- end of select -->
		</div> <!-- end of join-select -->
		
	</div> <!-- end of join-main -->
</body>
<jsp:include page ="../footer.jsp"/>
</html>