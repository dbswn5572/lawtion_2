<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lawtion.vo.*,lawtion.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lawtion.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/am-pagination.css">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/paging.js"></script>
<script>
   $(document).ready(function(){
      //모두 수신동의 체크
      var pager = jQuery('#ampaginationsm').pagination({
         
          maxSize: 7,             // max page size
          totals: '${dbCount}',   // total pages   
          page: '${rpage}',      // initial page      
          pageSize: 5,         // max number items per page
      
          // custom labels      
          lastText: '&raquo;&raquo;',       
          firstText: '&laquo;&laquo;',      
          prevText: '&laquo;',      
          nextText: '&raquo;',
                 
          btnSize:'sm'   // 'sm'  or 'lg'      
      });
      
      jQuery('#ampaginationsm').on('am.pagination.change',function(e){
           //jQuery('.showlabelsm').text('The selected page no: '+e.page);
              $(location).attr('href', "${pageContext.request.contextPath}/notice.do?rpage="+e.page);         
       });
      
   });

</script>
</head>
   <jsp:include page ="../header.jsp"/>
<body>
   <p>
   <div class="review-title3">
      <div class="title-sub">
         <img src="${pageContext.request.contextPath}/images/noticetitle.jpg" width="500" height="100" class="title">
      </div>   
   </div>
   <div class="notice_menu">

   </div>
   <div class="notice">
      <table border=0 class="notice_list">
         <tr class="theme">
            <th>No</th>
            <th class="subject">제목</th>
            <th>작성자</th>
            <th>조회수</th>
         </tr>
         <c:forEach items="${list}" var="vo">
            <tr>
               <td>${vo.rno}</td>
               <td class="subject"><a href="${pageContext.request.contextPath}/notice_content.do?no=${vo.no}&rno=${vo.rno}" style='color:black;'>${vo.title}</a></td>
               <td>${vo.rdate }</td>
               <td>${vo.hits }</td>
            </tr>
         </c:forEach>
         <tr>
                  <td colspan="4">
                     <!--  <span> << 1 2 3 4 5 6 7 8 9 10 >> </span>-->   
                     <div id="ampaginationsm"></div>
                  </td>
               </tr>
      </table>
      
   
   </div>
   <p><br>
   <hr>
   <p><br>

</body>
   <jsp:include page ="../footer.jsp"/>
</html>