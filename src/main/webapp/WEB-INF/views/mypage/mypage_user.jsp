<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lawtion.vo.joinNormalVO, lawtion.dao.joinNormalDAO" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</style>
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
            <a href="${pageContext.request.contextPath}/mypageuser.do">
            <label>${name}님의</label>
            <span>역경매<br>신청현황</span>
            </a>
         </div>
         
         <div class="mypage-box2">
            <a href="${pageContext.request.contextPath}/mypageuserpro.do">
               <img src="${pageContext.request.contextPath}/images/mypage-write.png">
               <span>입찰 대기중</span>
               <label>1건</label>
            </a>
         </div>
         
         <div class="mypage-box3">
            <a href="${pageContext.request.contextPath}/mypageusersuccess.do">
               <img src="${pageContext.request.contextPath}/images/mypage-success.png">
               <span>낙찰 및 마감</span>
               <label>2건</label>
            </a>
         </div>
         <div class="mypage-box4">
            <a href="${pageContext.request.contextPath}/mypageuserinfo.do?sid=${sid}">
               <img src="${pageContext.request.contextPath}/images/mypage-my.png">
               <span>개인정보 수정</span>
            </a>
         </div>
      </div>
   </div>
</body>
<jsp:include page ="../footer.jsp"/>
</html>