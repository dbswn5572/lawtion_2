<%@ page language="java" contentType="text/html; charset=UTF-8" 
   pageEncoding="UTF-8" import="lawtion.vo.*,lawtion.dao.*,java.util.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
   <meta charset="utf-8" />
   <title>My JSP Page</title>
   <!-- Bootstrap 적용 -->
   <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, 
      minimum-scale=1.0, user-scalable=no"/>
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
   <!-- Twitter Bootstrap3 & jQuery -->
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
   <link rel ="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
   <link rel ="stylesheet" type="text/css" href="assets/css/nanumfont.css"/>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin.css">
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
   <script src="http://code.jquery.com/jquery.min.js"></script>
   <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
   <link rel="stylesheet" type="text/css" href= "${pageContext.request.contextPath}/css/lawtion.css">
   <script src="resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/am-pagination.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/paging.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
   
<script>
   $(document).ready(function(){
      $("li.menuu>a").click(function(){
         
         //$("li.menuu>li").slideDown();
         //alert("확인11");
         if($(this).next("ul").is(":visible")){
            $(this).next("ul").slideUp();
         }else{
            $(this).next("ul").slideDown();
         }
         
      });
      
      $("#writesucess").click(function(){
         if($("#title").val()==""){
            alert("제목을 입력해주세요.");
            $("#title").focus();
         }else if($("input[type=file]").val() == ""){
            //alert("파일선택 안함!!")
            $("#code").val("exist");
         }else if(editor.getData() == ""){
             alert("내용을 입력하세요");
             return false;
            }
         
      });
      
      CKEDITOR.replace( 'content', {//해당 이름으로 된 textarea에 에디터를 적용
            width:'790',
            height:'500px',
            filebrowserImageUploadUrl: '/upload/upload', //여기 경로로 파일을 전달하여 업로드 시킨다.
            uiColor: '#D9E5FF'
        });
         
         
        CKEDITOR.on('dialogDefinition', function( ev ){
            var dialogName = ev.data.name;
            var dialogDefinition = ev.data.definition;
          
            switch (dialogName) {
                case 'image': //Image Properties dialog
                    //dialogDefinition.removeContents('info');
                    dialogDefinition.removeContents('Link');
                    dialogDefinition.removeContents('advanced');
                    break;
            }
        });
        
        var editorConfig = { filebrowserUploadUrl : "/fileUpload.do" };
        
        var ck = null;
     
        window.onload = function(){
            ck = CKEDITOR.replace("content" , editorConfig);
        };
   });
</script>

</head>
<body>
   <header>
      <div class="ad-nav1">
      <input type="checkbox" id="menu_state" checked>
         <nav class="ad-header-nav1" >
            <!-- <label for="menu_state"><i class="fa fa-balance-scale"></i></label>-->
            <ul>
               <li data-content="2" class="active unread" >
                  <a href="#"><i class="fa fa-gavel"></i>
                     <span class="main-sub">Lawtion Admin</span>
                  </a>
               </li>
               <li class="menuu"><a href="#"><i class="fa fa-paper-plane"></i>
                     <span class="main-sub">공지사항</span></a>
                  <ul class="sub-group-list">
                     <li><a href="#"><i class="fa fa-pencil"></i><span>게시글 작성</span></a></li>
                     <li><a href="#"><i class="fa fa-inbox"></i><span>게시글 관리</span></a></li>
                  </ul>
               </li>
               <li class="menuu"><a href="#"><i class="fa fa-cog fa-fw"></i>
                     <span class="main-sub">회원관리</span></a>
                  <ul class="sub-group-list">
                     <li><a href="#"><i class="fa fa-paper-plane"></i><span>일반회원</span></a></li>
                     <li><a href="#"><i class="fa fa-pencil"></i><span>변호사회원</span></a></li>
                  </ul>
               </li>
               <li class="menuu"><a href="#"><i class="fa fa-cog fa-fw"></i>
                     <span class="main-sub">판례게시판</span></a>
                  <ul class="sub-group-list">
                     <li><a href="${pageContext.request.contextPath}/admin_precedent_normal.do"><i class="fa fa-pencil"></i><span>기존판례</span></a></li>
                     <li><a href="${pageContext.request.contextPath}/admin_precedent_review.do"><i class="fa fa-pencil"></i><span>후기판례</span></a></li>
                  </ul>
               </li>
            </ul>
         </nav>
      </div>
   </header>
   <div class="review">
      <h3>판례게시판 > 기존판례</h3>
         
      <div class="write">
         <form name="write" action="admin_precedent_normal_ckeck.do" method="post" enctype="multipart/form-data">
            <table  class="talk-Write">
               <tr>
                  <td colspan=2>
                     <label>관리자</label>
                     <input type ="text"   value="hyeona" disabled>
                  </td>
                  <td></td>
               </tr>
               <tr>
                  <td colspan=3>
                     <label>소송명</label>
                     <input type ="text" name="title" id="title" >
                  </td>
               </tr>
               <tr>
                  <td colspan=2>
                  <label>승패</label>
                  <select name="result" id="result">
                     <option value="win">승</option>
                     <option value="lose">패</option>
                  </select>
               </tr>
               <tr>
                  <td colspan=3>
                     <label>내용</label>
                     <textarea name="content" id="content"></textarea>
                  </td>
               </tr>
               <tr>
                  <td colspan=3>
                     <div class="write_button">
                        <button type="submit" id="writesucess" name="writesucess">저장</button>
                        <button type="reset" name="reset">취소</button>
                        <a href="${pageContext.request.contextPath}/amdin_precedent_normal.do"><button type="button">이전 페이지</button></a>
                     </div>
                  </td>
               </tr>
            </table>   
         </form>
      </div>
   </div>
      
         
</body>
   
</html>