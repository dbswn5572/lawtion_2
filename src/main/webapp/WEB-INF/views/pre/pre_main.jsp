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
<script type="text/javascript" src="./jquery-1.4.2.min.js"></script>
<script src="http://localhost:9000/lawtion/js/paging.js"></script>
<script>
$(document).ready(function(){
    $("#ban1").click(function(){
       $(this).css("display","none");
       $("#ban2").css("display","block").animate({width:'200px',height:'300px'})
       $("#ban3").animate({width:'10px',height:'10px'})
     })
    $("#ban3").click(function(){
            $(this).css('display','none');
            $("#ban2").css('display','none');
            $('#ban1').css('display','block');

    })

	$("#search").click(function(){
		if($("#search_form").val()==""){
			alert("검색어를 입력하세요.");
			$("#search_form").focus();
			return false;
		} 		
		
		searchform.submit();
	});
});
</script>
<style>
</style>
</head>

<body>
	<jsp:include page="../header1.jsp"/>
	<div class="review-title1">
		<div class="title-sub">
			<img src="http://localhost:9000/lawtion/images/precedenttitle.jpg" width="500" height="100" class="title">
		</div>	
	</div>
	<div class="pre">
			<div class="pre_quick">
				<div class="pre_quick1" >
					<img src="http://localhost:9000/lawtion/images/btn_search_log_off.png" width="150" height="50" id="ban1">
				</div>
				<div class="pre_quick2" id="ban2">
					<table border=0 class="quick_table">
					<tr class="tr_first">
						<td>최근검색이력</td>
						<td><img src="http://localhost:9000/lawtion/images/pre_close.png" id="ban3"></td>
					</tr>
					<tr class="tr_search">
						<td colspan="2">dd</td>
					</tr>
					<tr class="tr_last">
						<td colspan="2">최근검색이력삭제</td>
					</tr>
					</table>
				</div>
			</div>
		<div class="pre_main">
			<div class="pre_select">
				<div class="nomal_pre">
				<a href="#">
				<label>기존판례</label></a>
				</div>
				<div class="reveiw_pre">
				<a href="#">
				<label>후기판례</label></a>
				</div>
			</div>
			<div class="pre_search">
				<input type="text" name="search" placeholder="  검색어를 입력하세요" class="pre_search">
				<img src="http://localhost:9000/lawtion/images/pre-search.jpg">
			</div>
			
			<div class="pre_list">
				<table class="pre_table" border=0>
					<tr>
						<th>NO</th>
						<th>소송명</th>
						<th>승패</th>
						<th>조회수</th>
					</tr>
					<tr>
						<td>1</td>
						<td>가나다라마바사아자차카타파하</td>
						<td>승소</td>
						<td>10</td>
					</tr>
					<tr>
						<td>2</td>
						<td>가나다라마바사아자차카타파하</td>
						<td>패소</td>
						<td>10</td>
					</tr>
				</table>
			</div>
		</div>
	</div> <!-- end of div.pre -->
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>