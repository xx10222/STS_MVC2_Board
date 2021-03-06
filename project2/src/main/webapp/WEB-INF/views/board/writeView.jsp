<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<! DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       <title>게시판</title>
   </head>
<script type="text/javascript">
      $(document).ready(function(){
         var formObj = $("form[name='writeForm']");
         //작성하기
         $(".write_btn").on("click", function(){
            if(fn_valiChk()){
               return false;
            }
            formObj.attr("action", "/board/write");
            formObj.attr("method", "post");
            formObj.submit();
         })
         //목록보기
         $(".list_btn").on("click", function(){
            event.preventDefault();
            history.go(-1);
            location.href=document.referrer;
         })
      })

      function fn_valiChk(){
         var regForm = $("form[name='writeForm'] .chk").length;
         for(var i = 0; i<regForm; i++){
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
            <form name="writeForm" method="post" action="/board/write">
               <table align="center" width="500" cellpadding="0" cellspacing="0" border="1">
                  <tr><th colspan = "2" align="center">답변형 게시판 입력하기</th></tr> 
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
                     
                     <tr><th colspan="2" align="center" height="30">
                        <div>
                           <button type="submit" class="write_btn">저장하기</button>
                           <button type="reset">다시쓰기</button>
                           <button type="submit" class="list_btn">돌아가기</button>
                        </div>
                     </tr>                  
               </table>
            </form>
         </section>
      </div>
   </body>
</html>