<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<! DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <title>게시판</title>
   </head>
   <script type="text/javascript">
      $(document).ready(function(){
         var formObj = $("form[name='updateForm']");
         //돌아가기
         $(".cancel_btn").on("click", function(){
            event.preventDefault();
            history.back(-1);
            location.href=document.referrer;
         })
         
         //수정
         $(".update_btn").on("click", function(){
            if(fn_valiChk()){
               return false;
            }
            formObj.attr("action", "/board/update");
            formObj.attr("method", "post");
            formObj.submit();
         })
         
         // 삭제
         $(".delete_btn").on("click", function(){
            formObj.attr("action", "/board/delete");
            formObj.attr("method", "post");
            formObj.submit();
         })
         //답변달기
         $(".reply_btn").on("click", function(){
            event.preventDefault();
            location.href = "/board/replyView?bno=${update.bno}";
         })
      })
         
      function fn_valiChk(){
         var updateForm = $("form[name='updateForm'] .chk").length;
         for(var i = 0; i<updateForm; i++){
            if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
               alert($(".chk").eq(i).attr("title"));
               return true;
            }
         }
      }

   </script>
   <body>
   
      <div id="root">
         
         <section id="container">
            <form name="updateForm" role="form" method="post" action="/board/update">
               <input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
               <input type="hidden" name="depthno" value="${update.depthno}" readonly="readonly"/>
               <table align="center" width="550" cellpadding="0" cellspacing="0" border="1">
               	<tr><th colspan = "4" align="center">게시글 보기</th></tr>
                  <tr>
                     <th align="center">글번호</th>
                     <th align="center">작성자</th>
                     <th align="center">작성일</th>
                     <th align="center">조회수</th>
                  </tr>
                  <tr>
                  	 <td align="center" width="50"><c:out value="${update.bno}" /></td>
                     <td align="center" width="100"><c:out value="${update.writer}" /></td>
                     <td align="center" width="130">
                           <fmt:formatDate value="${update.regdate}" pattern="yyyy/MM/dd(E) HH:mm"/>
                     </td>
                     <td align="center" width="80"><c:out value="${update.hit}" /></td>   
                  </tr>
                  
                 	<tr>
                 		<th align="center" width="100" height="30">제목</th>
                        <td colspan="3">
                           <input style="width:200px;height:20px;" type="text" id="title" name="title" value="${update.title}" class="chk" title="제목을 입력하세요."/>
                        </td>
                     </tr>   
                     <tr>
                     	<th align="center" width="100" height="200">내용</th>
                        <td colspan="3">
                           <textarea style="resize: none; width:380px;height:180px;" id="content" name="content" class="chk" title="내용을 입력하세요."><c:out value="${update.content}" /></textarea>
                        </td>
                     </tr>
                     
               <tr><th colspan="4" align="center" height="30">      
               <div>
                  <button type="submit" class="update_btn">수정하기</button>
                  <button type="submit" class="delete_btn">삭제하기</button>
                  <button type="submit" class="reply_btn">답변달기</button>
                  <button type="submit" class="cancel_btn">돌아가기</button>       
               </div> 
               </th></tr>      
               </table>

            </form>
         </section>
      </div>
   </body>
</html>