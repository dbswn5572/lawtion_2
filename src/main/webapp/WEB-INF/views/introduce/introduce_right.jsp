<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lawtion.vo.*,lawtion.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
  	<link rel="stylesheet" type="text/css" href="http://localhost:9000/mycgv/css/am-pagination.css">
  	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lawtion.css">
  	<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
  	<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="/data/201011/IJ12885672102633/featureList.js"></script>
<title>Insert title here</title>
		<script>

	</script>

</head>
<body>
<div class="introduce3">
	<section class="content_style">			
		
		<div class="right-content" >
			    <div class="right-img" >
				 <img src="${pageContext.request.contextPath}/images/content_img.jpg">
			</div>
			<div class="lawyer-detail">
				<table class="career">
					<tr>
					
						<td rowspan="3" class="profile">
							<img src="${pageContext.request.contextPath}/businessUpload/${vo.rbusiness}">
						</td>
						<td rowspan="3" colspan="3" class="nameSet">
							<div class="dnameGG">
								<span class="dname">법무법인태양</span>&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<hr>
							<div class = "nameGG"><span class="name">${vo.name} 변호사</span></div><br>
							<span class="aaa"> 경력사항 </span><br>
							<div class="detailGG">
			
							<span>
								- 부산대학교 경영학과 졸업<br>
								- 부산지방법원 속초지원 판사<br>
								- 수원지방법원 부장 판사<br>
  								- 똑똑 법률사무소(2012-2017.03)<br>
  								- 법무법인 세종 대표(2017.08-현재)
							</span>
							</div>
						</td>
						<td class="trialSet" rowspan="3" colspan="3">
							<span >낙찰횟수</span><br><br>
							<span class="trial">30</span>
							<hr >
							<span >승소</span><br><br>
							<span class="win">27</span>
							<hr>
							<span >패소</span><br><br>
							<span class="lose">3</span>
							
							
						</td>
						
					</tr>
					
				</table>
			</div>
			

			</div>
		</section>

	</div>
</body>
</html>
































