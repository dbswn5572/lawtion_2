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
   select.phoneselect{
   width:20%;
   height:38px; background-color:#F6F6F6;
   }
   form.mypage-info table input.phone{
   width:20%;
   height:38px; background-color:#F6F6F6;
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
            <a href="${pageContext.request.contextPath}/mypageuser.do?sid=${sid}">
            <label>${vo.name }님의</label>
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
            <a href="${pageContext.request.contextPath}/mypageuserinfo.do">
               <img src="${pageContext.request.contextPath}/images/mypage-my.png">
               <span>개인정보 수정</span>
            </a>
         </div>
      </div>
      <div class="mypage-content">
         <div class="mypage-content-sub">
            <span class="mypage-sub-title">개인정보 수정</span>
         </div>
         <div class="mypage-content-table">
            <form name="update" action="mypageuser_update.do" method="post" class="mypage-info">
               <table>
                  <tr>
                     <th>아이디</th>
                     <td><input type="text" disabled value="${vo.id}">
                     </td>
                  </tr>
                  <tr>
                     <th>비밀번호</th>
                     <td><input type="password" id="password" name="password">
                     </td>
                  </tr>
                  <tr>
                     <th>비밀번호 확인</th>
                     <td><input type="password"></td>
                  </tr>
                  <tr>
                     <th>휴대폰 번호</th>
                     <td>
                        <select name="phone1" id="phone1" class="phoneselect">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="017">017</option>
                        </select>
                        -<input type="text" name="phone2" class="phone" id="phone2" value="${vo.phone2}">
                        -<input type="text" name="phone3" class="phone" id="phone3" value="${vo.phone3}">
                     </td>
                  </tr>
                  <tr>
                     <th>이메일</th>
                     <td><input type="text" name="email" value="${vo.email }" id="email"></td>
                  </tr>
               </table>
            
            <div class="mypage-info">
               <input type="hidden" name="id" value="${vo.id}">
               <button type="submit">수정완료</button>
               
            </div>
            </form>
         </div>
      </div>
   </div>
</body>   
<jsp:include page ="../footer.jsp"/>
</html>