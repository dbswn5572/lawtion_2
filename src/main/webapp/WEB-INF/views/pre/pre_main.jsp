<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ƿ�</title>
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
			alert("�˻�� �Է��ϼ���.");
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
						<td>�ֱٰ˻��̷�</td>
						<td><img src="http://localhost:9000/lawtion/images/pre_close.png" id="ban3"></td>
					</tr>
					<tr class="tr_search">
						<td colspan="2">dd</td>
					</tr>
					<tr class="tr_last">
						<td colspan="2">�ֱٰ˻��̷»���</td>
					</tr>
					</table>
				</div>
			</div>
		<div class="pre_main">
			<div class="pre_select">
				<div class="nomal_pre">
				<a href="#">
				<label>�����Ƿ�</label></a>
				</div>
				<div class="reveiw_pre">
				<a href="#">
				<label>�ı��Ƿ�</label></a>
				</div>
			</div>
			<div class="pre_search">
				<input type="text" name="search" placeholder="  �˻�� �Է��ϼ���" class="pre_search">
				<img src="http://localhost:9000/lawtion/images/pre-search.jpg">
			</div>
			
			<div class="pre_list">
				<table class="pre_table" border=0>
					<tr>
						<th>NO</th>
						<th>�Ҽ۸�</th>
						<th>����</th>
						<th>��ȸ��</th>
					</tr>
					<tr>
						<td>1</td>
						<td>�����ٶ󸶹ٻ������īŸ����</td>
						<td>�¼�</td>
						<td>10</td>
					</tr>
					<tr>
						<td>2</td>
						<td>�����ٶ󸶹ٻ������īŸ����</td>
						<td>�м�</td>
						<td>10</td>
					</tr>
				</table>
			</div>
		</div>
	</div> <!-- end of div.pre -->
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>