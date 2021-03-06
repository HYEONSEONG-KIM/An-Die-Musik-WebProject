<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="adm.vo.PblprfrVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "<%=request.getContextPath() %>/css/performList.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400;700&display=swap" rel="stylesheet">
<title>공연 정보</title>



<style>

   #pagingNav{
      text-align: center;
   }
   #info h2{
      text-align: center;
      text-shadow: 1px 1px 1px gray;
      font-weight: bold;
      font-family: fantasy;
   }
      .savebtn{
   margin : 6px;
      display: inline-block;
       margin-bottom: 0;
       font-weight: 400;
       text-align: center;
       white-space: nowrap;
       vertical-align: middle;
       touch-action: manipulation;
       cursor: pointer;
       background-image: none;
       border: 1px solid transparent;
       padding: 5px 12px;
       font-size: 14px;
      
       border-radius: 4px;
       user-select: none;
   }
   .save{
      color: #333;
    background-color: #fff;
    border-color: #ccc;
    box-shadow: 1px 1px 1px 1px lightgray;
       
   }

</style>

<script type="text/javascript">
   $(function(){
      
      
      // 다음 페이지 화살표 클릭
      $('#next').on('click',function(){
         vnext = $('.paging').last().text().trim();
         crrentPage = parseInt(vnext) + 1
         location.href = "<%=request.getContextPath()%>/selectPbl.do?page=" + crrentPage;
      })
      
      // 이전 페이지 화살표 클릭
      $('#prev').on('click',function(){
         vprev = $('.paging').first().text().trim();
         crrentPage = parseInt(vprev) - 1
         location.href = "<%=request.getContextPath()%>/selectPbl.do?page=" + crrentPage;
      
      })
      
      $('.test').on('click',function(){
         /* event.preventDefault(); */
         code = $(this).attr('idx')
         location.href=("<%=request.getContextPath()%>/SelectPblDetail.do?code=" + code);
      })
      
   })
</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String admin = (String)session.getAttribute("admin");
   // 일정이 지난 공연의 정보를 담은list가 시작할 번호
   int start = (Integer)request.getAttribute("start");
   // 끝번호
   int end = (Integer)request.getAttribute("end");
   // 페이지 시작 번호
   int sp = (Integer)request.getAttribute("sp");
   // 페이지 마지막 번호
   int ep = (Integer)request.getAttribute("ep");
   // 총 페이지 수
   int tp = (Integer)request.getAttribute("tp");
   // 현재 페이지
   int pageNum = (Integer)request.getAttribute("pageNum");
   
   


%>


<jsp:include page="../include.jsp" flush="false"/>

<div id = "headers">
   <div id = "nav">
      <div class="container">
        <div id = "perfdate">
           <h2>공연 일정</h2>
        </div>
        <div class="list-group">
           <div class = "liList">
          <a href="<%=request.getContextPath()%>/selectPbl.do" class="list-group-item">전체 공연</a>
          </div>
          <div class = "liList">
          <a href="<%=request.getContextPath()%>/selectPbl.do?team=대전 시립 교향악단" class="list-group-item">-대전 시립 교향악단</a>
          </div>
          <div class = "liList">
          <a href="<%=request.getContextPath()%>/selectPbl.do?team=대전 시립 합창단" class="list-group-item">-대전 시립 합창단</a>
          </div>
          <div class = "liList">
          <a href="<%=request.getContextPath()%>/selectPbl.do?team=대전 시립 무용단" class="list-group-item">-대전 시립 무용단</a>
          </div>
          <%if(admin != null){ // 로그인한 계정이 관리자이면 공연 추가 활성화
          if(admin.equals("Y")){ %>
          <a id = "admin" href="<%=request.getContextPath()%>/PblSelectboxServlet.do" class="list-group-item">공연 추가</a>
          <%
         }} %>
          
        </div>
      </div>
   
   </div>
   <div id = "pad"></div>
   <div id = "info">
<%
   List<PblprfrVO> listBefore = (List<PblprfrVO>)request.getAttribute("listBefore");
   List<PblprfrVO> listAfter = (List<PblprfrVO>)request.getAttribute("listAfter");
%>
   <h2>예정 공연</h2>
   <hr>
<%
      for(int i = 0; i < listBefore.size(); i++){ // 공연 예정인 리스트 출력
         PblprfrVO vo = listBefore.get(i);
%>

   <div class = "top">
      <div class = "par">
         <div class = "image">
            <img class = "perfImg" src = "<%=request.getContextPath()%>/images/imagesView.do?fileName=<%=vo.getFile_name()%>">
         </div>
         <div class = "nbsp"></div>
         <div class = "content">
            <h3><%=vo.getPbl_nm()%></h3>
            <table>
               <tr>
                  <td class = "td1">장소</td>
                  <td class = "td2"><%=vo.getPrf_nm()%></td>
               </tr>
               
               <tr>
                  <td class = "td1">날짜</td>
                  <td class = "td2"><%=vo.getPbl_date().substring(0,10) %></td>
               </tr>
               
               <tr>
                  <td class = "td1">시간</td>
                  <td class = "td2"><%=vo.getPbl_time()%></td>
               </tr>
               
               <tr>
                  <td class = "td1">관람등급</td>
                  <td class = "td2"><%=vo.getPbl_grade()%></td>
               </tr>
               
               <tr>
                  <td class = "td1">공연문의</td>
                  <td class = "td2">042-270-8382~8</td>
               </tr>
               
               <tr>
                  <td class = "td1">주최/주관</td>
                  <td class = "td2">대전광역시/<br><%=vo.getTeam_nm()%></td>
               </tr>
            </table>
               
         </div>
      </div>
      
      <div class = "foot">
         <%
         Date now = new Date();
         Calendar cal = Calendar.getInstance();
         

         DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
         String performS = vo.getPbl_date();
         Date perform = df.parse(performS);
         cal.setTime(perform);
         //Date performBefore = df.parse();
         cal.add((Calendar.MONTH),-1);
         String before = df.format(cal.getTime());
         Date performBerform = df.parse(before);
         
         
         if(now.after(performBerform) && now.before(perform)){
         %>
         
         
        <a href="<%=request.getContextPath()%>/ticketing/tickecting.jsp" class="save savebtn" role="button">예매하기</a>
         
         <%}%>
         <a idx = "<%=vo.getPbl_code()%>" class="btn btn-default test" role="button">상세보기</a>
      </div>
      <hr>
   </div>
   

<%
   }
%>

   <h2>지난 공연</h2>
   <hr>
<%
      for(int i = end -1; i >= start -1 ; i--){ // 일정이 지난 공연 리스트 출력
         PblprfrVO vo2 = listAfter.get(i);
%>
   
   <div class = "top">
      <div class = "par">
         <div class = "image">
            <img class = "perfImg" src = "<%=request.getContextPath()%>/images/imagesView.do?fileName=<%=vo2.getFile_name()%>">
         </div>
         <div class = "nbsp"></div>
         <div class = "content">
            <h3><%=vo2.getPbl_nm()%></h3>
            <table>
               <tr>
                  <td class = "td1">장소</td>
                  <td class = "td2"><%=vo2.getPrf_nm()%></td>
               </tr>
               
               <tr>
                  <td class = "td1">날짜</td>
                  <td class = "td2"><%=vo2.getPbl_date().substring(0,10) %></td>
               </tr>
               
               <tr>
                  <td class = "td1">시간</td>
                  <td class = "td2"><%=vo2.getPbl_time()%></td>
               </tr>
               
               <tr>
                  <td class = "td1">관람등급</td>
                  <td class = "td2"><%=vo2.getPbl_grade()%></td>
               </tr>
               
               <tr>
                  <td class = "td1">공연문의</td>
                  <td class = "td2">042-270-8382~8</td>
               </tr>
               
               <tr>
                  <td class = "td1">주최/주관</td>
                  <td class = "td2">대전광역시/<br><%=vo2.getTeam_nm()%></td>
               </tr>
            </table>
               
         </div>
      </div>
      
      <div class = "foot">
         <a idx = "<%=vo2.getPbl_code()%>" class="btn btn-default test" role="button">상세보기</a>
      </div>
      <hr>
   </div>
   

<%
   }
%>


<nav id = "pagingNav" aria-label="Page navigation example">
 <ul class="pagination">
 <%if(sp > 1){ // 시작 페이지가 1보다 클때 이전화살표 출력%>
    <li class="page-item">
      <a class="page-link" id = "prev" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <%}
       for(int i = sp; i <= ep; i++){ // 페이지 번호버튼 출력
    %>   
    
    <li class="page-item"><a class="page-link paging"  href="<%=request.getContextPath()%>/selectPbl.do?page=<%=i%>"><%=i%></a></li>
   <% }
   if(tp > ep){ // 전체 페이지수가 끝페이지 수보다 클때 출력
   %>
    <li class="page-item">
      <a id = "next" class="page-link" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    <%} %>
  </ul>
</nav>
   </div>
</div>


</body>
</html>






