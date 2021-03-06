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
         var formObj = $("form[name='replyForm']");
         //목록보기
         $(".list_btn").on("click", function(){
            event.preventDefault();
            location.href = "/board/list";
         })
         //답글저장
         $(".reply_btn").on("click", function(){
            if(fn_valiChk()){
               return false;
            }
            formObj.attr("action", "/board/reply");
            formObj.attr("method", "post");
            formObj.submit();
         })
         //돌아가기
         $(".cancel_btn").on("click", function(){
            event.preventDefault();
            history.go(-1);
         })
      })
         
      function fn_valiChk(){
         var listForm = $("form[name='replyForm'] .chk").length;
         for(var i = 0; i<listForm; i++){
            if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
               alert($(".chk").eq(i).attr("title"));
               return true;
            }
         }
      }
      function numberMaxLength(e){
          if(e.value.length > e.maxLength){
              e.value = e.value.slice(0, e.maxLength);
          }
      }
   </script>
   
   <body>
   
      <div id="root">
         
         <section id="container">
            <form name="replyForm" role="form" method="post" action="/board/reply">
               <input type="hidden" name="bno" value="${reply.bno}" readonly="readonly"/>
               <table align="center" width="550" cellpadding="0" cellspacing="0" border="1">
                  <tr><th colspan = "4" align="center">질문글 보기</th></tr>
                  <tr>
                     <th align="center">글번호</th>
                     <th align="center">작성자</th>
                     <th align="center">작성일</th>
                     <th align="center">조회수</th>
                  </tr>
                  <tr>
                      <td align="center" width="60"><c:out value="${reply.bno}" /></td>
                     <td align="center" width="100"><c:out value="${reply.writer}" /></td>
                     <td align="center" width="130">
                           <fmt:formatDate value="${reply.regdate}" pattern="yyyy/MM/dd(E) HH:mm:ss"/>
                     </td>
                     <td align="center" width="60"><c:out value="${reply.hit}" /></td>   
                  </tr>
                    <tr>
                       <th>제목</th>
                       <td colspan = "3">
                           <c:out value=" ${reply.title}"/>
                        </td>
                     </tr>   
                     <tr>
                        <th>내용</th>
                       <td colspan = "3">
                           <div style="white-space:pre"><c:out value="${reply.content}"/></div>
                        </td>
                     </tr>      
               </table>
            </form>
            
            <form name="replyForm" method="post" action="/board/reply">
               <input type="hidden" name="groupno" value="${reply.groupno}" readonly="readonly"/>
               <input type="hidden" name="fk_seq" value="${reply.bno}" readonly="readonly"/>
               <input type="hidden" name="depthno" value="${reply.depthno+1}" readonly="readonly"/>
               <table align="center" width="550" cellpadding="0" cellspacing="0" border="1">
                  <tr><th colspan = "2" align="center">답글쓰기</th></tr> 
                      <tr>
                        <th align="center" width="100" height="30">이름</th>
                        <td>
                          <input style="width:200px;height:20px;" type="text" id="writer" name="writer" class="chk" title="작성자를 입력하세요."
                          maxlength="20" oninput="numberMaxLength(this);"/>
                        </td>
                     </tr>
                     <tr>
                        <th align="center" width="100" height="30">제목</th>
                        <td>
                           <input style="width:200px;height:20px;" type="text" id="title" name="title" class="chk" title="제목을 입력하세요."/>
                        </td>
                     </tr>   
                     <tr>
                        <th align="center" width="100" height="180">내용</th>
                        <td>
                           <textarea style="resize: none; width:380px;height:150px;" id="content" name="content" class="chk" title="내용을 입력하세요."></textarea>
                        </td>
                     </tr>
                     
                     <tr><th colspan="4" align="center" height="30">
                        <div>
                     		<button type="submit" class="reply_btn">답글저장</button>
                     		<button type="reset">다시쓰기</button>
                           <button type="submit" class="cancel_btn">돌아가기</button>
                           <button type="submit" class="list_btn">목록보기</button>
                        </div>
                     </tr>                  
               </table>
            </form>
         </section>
      </div>
   </body>
</html>