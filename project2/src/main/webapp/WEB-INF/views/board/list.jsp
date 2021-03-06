<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<! DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <head>
       <title>게시판</title>
       <style type="text/css">
         li {list-style: none; float: left; padding: 6px;}
      </style>
   </head>
   <script type="text/javascript">
   function plus_1page(){
       location.href="http://localhost:8080/board/list?page="+${criteria.page+1}+"&perPageNum=10";
    }
   function plus_10page_1(){
       location.href="http://localhost:8080/board/list?page="+${criteria.page-(criteria.page % 10) +11}+"&perPageNum=10";
    }
   function plus_10page_2(){
       location.href="http://localhost:8080/board/list?page="+${criteria.page-(criteria.page % 10) +1}+"&perPageNum=10";
    }
   function minus_1page(){
       location.href="http://localhost:8080/board/list?page="+${criteria.page-1}+"&perPageNum=10";
    }
   
   function minus_10page_1(){
       location.href="http://localhost:8080/board/list?page="+${criteria.page-(criteria.page % 10)}+"&perPageNum=10";
    }
   function minus_10page_2(){
       location.href="http://localhost:8080/board/list?page="+${criteria.page-(criteria.page % 10) -10}+"&perPageNum=10";
    }
   
   function start_page(){
       location.href="http://localhost:8080/board/list?page=1&perPageNum=10";
    }
   function end_page(){
       location.href="http://localhost:8080/board/list?page="+${pageMaker.real}+"&perPageNum=10";
    }
   
   </script>

   <body>
      <div id="root">
         <section id="container">
            <form role="form" method="post" action="/board/write">
               <table align="center" width="900" cellpadding="0" cellspacing="0" border="1">
                    <tr><th colspan = "5">게시판 보기</th></tr>
                    <tr><th colspan = "5" align="right">
                    <c:if test="${pageMaker.real == 0 }">
                    	<c:out value="${pageMaker.totalCount}(${criteria.page-1}/${pageMaker.real})"/>
                    </c:if>
                    <c:if test="${pageMaker.real != 0 }">
                    	<c:out value="${pageMaker.totalCount}(${criteria.page}/${pageMaker.real})"/>
                    </c:if>
                    </th></tr>
                  <tr>
                     <th align="center">글번호</th>
                     <th align="center">이름</th>
                     <th align="center">제목</th>
                     <th align="center">작성일</th>
                     <th align="center">조회수</th>
                  </tr>
                  
                  <c:forEach items="${list}" var = "list">
                     <tr>
                        <td align="center" width="80"><c:out value="${list.bno}" /></td>
                        <td align="center" width="100"><c:out value="${list.writer}"/></td>
                        
                        <td width="410"><a href="/board/updateView?bno=${list.bno}"  style="color:black; text-decoration:none;">
                        <c:set var="nowTime" value="<%=new java.util.Date() %>"/>
                        <c:set var="now_str"><fmt:formatDate value="${nowTime}" pattern="yyyy.MM.dd"/></c:set>
                        <c:set var="reg_str"><fmt:formatDate value="${list.regdate}" pattern="yyyy.MM.dd"/></c:set>                     
                        <c:if test="${list.depthno > 0}">
                        	<c:forEach begin="1" end="${list.depthno}">
                        		&nbsp;
                        	</c:forEach>
                        	<img src="/resources/img/reply.png">
                        	<c:if test="${now_str==reg_str}">
                        		<img src="/resources/img/new1.png">
                        	</c:if>
                        	<c:out value="${list.title}" />
                        </c:if>
                        <c:if test="${list.depthno == 0 }">
                        	<c:if test="${now_str==reg_str}">
                        		<img src="/resources/img/new1.png">
                        	</c:if>
                        <c:out value="${list.title}" />
                        </c:if>
                        <c:if test="${list.hit >= 11}">
                        <img src="/resources/img/hot.gif">
                        </c:if>
                        </a></td>
                        <c:if test="${now_str!=reg_str}">
                        <td align="center" width="130"><fmt:formatDate value="${list.regdate}" pattern="yyyy.MM.dd(E)"/></td>
                        </c:if>
                        <c:if test="${now_str==reg_str}">
                        <td align="center" width="130"><fmt:formatDate value="${list.regdate}" pattern="a h:mm"/></td>
                        </c:if>
                        <td align="center" width="80"><c:out value="${list.hit}" /></td>
                     </tr>
                  </c:forEach>
                  
                  <!-- 페이지 버튼  -->
                  <tr><th colspan="5" align="center" height="30"> 
                  <div style="display:table-cell; vertical-align:middel;"><li>
                  <c:if test="${criteria.page >= 11}">     
                  	<input type=button value="start page" onClick='start_page()'/>
                  </c:if>
                  <c:if test="${criteria.page < 11}">     
                  	<input type=button value="start page" disabled="disabled"/>
                  </c:if>
 
                  <c:if test="${criteria.page >= 11}">
                     <c:if test="${criteria.page % 10 != 0}">
                     	<input type=button value="-10 page" onClick='minus_10page_1()'/>
                     </c:if>  
                  	 <c:if test="${criteria.page % 10 == 0}">
                     	<input type=button value="-10 page" onClick='minus_10page_2()'/>
                     </c:if> 	
                  </c:if>
				  <c:if test="${criteria.page < 11}">     
                  		<input type=button value="-10 page" disabled="disabled"/>
                  </c:if>
                  
                  <c:if test="${criteria.page -1 >= 1}">     
                  	<input type=button value="-1 page" onClick='minus_1page()'/>
                  </c:if>
                  <c:if test="${criteria.page -1 < 1}">     
                  	<input type=button value="-1 page" disabled="disabled"/>
                  </c:if>            
                  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                  	<c:if test="${criteria.page==idx}">
                    <button type=button style="background-color:white; border-color:red;" onClick="location.href='list${pageMaker.makeQuery(idx)}'">${idx}</button>
                    </c:if>
                    <c:if test="${criteria.page!=idx}">
                    <button type=button style="background-color:white; border:0;" onClick="location.href='list${pageMaker.makeQuery(idx)}'">${idx}</button>
                    </c:if>
                  </c:forEach>  
				  <c:if test="${criteria.page +1 <= pageMaker.real}">     
                  	<input type=button value="+1 page" onClick='plus_1page()'/>
                  </c:if>
                  <c:if test="${criteria.page +1 > pageMaker.real}">     
                  	<input type=button value="+1 page" disabled="disabled"/>
                  </c:if>
                                   
                  <c:if test="${pageMaker.real % 10 == 0}">
                  	<c:if test="${criteria.page <= (pageMaker.real/10) * 10 -10}">
                  		
                  		<c:if test="${criteria.page % 10 != 0}">
                  			<input type=button value="+10 page" onClick='plus_10page_1()'/>
                  		</c:if>
                  		<c:if test="${criteria.page % 10 == 0}">
                  			<input type=button value="+10 page" onClick='plus_10page_2()'/>
                  		</c:if>
                  		<c:if test="${pageMaker.totalCount == 0}">     
                  			<input type=button value="end page" disabled="disabled"/>
                  		</c:if>
                  		<c:if test="${pageMaker.totalCount != 0}">     
                  			<input type=button value="end page" onClick='end_page()'/>
                  		</c:if>
                  	</c:if>
                  	<c:if test="${criteria.page > (pageMaker.real/10) * 10 -10}">
                  		<input type=button value="+10 page" disabled="disabled"/>     
                  		<input type=button value="end page" disabled="disabled"/>
                  	</c:if>
                  </c:if>
                  
                  <c:if test="${pageMaker.real % 10 != 0}">
                  	<c:if test="${pageMaker.real - (pageMaker.real % 10) >= criteria.page}">
                  		<c:if test="${criteria.page % 10 != 0}">
                  			<input type=button value="+10 page" onClick='plus_10page_1()'/>
                  		</c:if>
                  		<c:if test="${criteria.page % 10 == 0}">
                  			<input type=button value="+10 page" onClick='plus_10page_2()'/>
                  		</c:if>
                  		<c:if test="${pageMaker.totalCount == 0}">     
                  			<input type=button value="end page" disabled="disabled"/>
                  		</c:if>
                  		<c:if test="${pageMaker.totalCount != 0}">     
                  			<input type=button value="end page" onClick='end_page()'/>
                  		</c:if>
                  	</c:if>
                  	<c:if test="${pageMaker.real - (pageMaker.real % 10) < criteria.page}">
                  		<input type=button value="+10 page" disabled="disabled"/>     
                  		<input type=button value="end page" disabled="disabled"/>
                  	</c:if>
                  </c:if>
          
                  </li></div>
               	  </th></tr> 
                  <tr><th colspan = "5" align="right">
                     <input type=button value="글쓰기" onClick="window.location='writeView'">   
                 </th></tr> 
               </table>
            </form>
         </section>
      </div>
   </body>
</html>