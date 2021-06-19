<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free singlepage web template created by GraphBerry">
    <meta name="keywords" content="HTML5, Bootstrap 3, CSS3, javascript, PHP, Responsive, Mobile">
    <meta name="author" content="GraphBerry.com"/>
    <!-- Latest compiled and minified CSS -->
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i" rel="stylesheet">
    <!-- Styles -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/modus/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/modus/css/slick.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/modus/css/style2.css">

  
  	<!-- Scripts -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/modus/js/smooth-scroll.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/modus/js/modernizr.mq.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/modus/js/slick.min.js"></script>

	<!-- Latest compiled and minified JavaScript Bootstrap-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
	<!-- Custom JS -->
	<script src="<%=request.getContextPath()%>/modus/js/custom.js"></script>	
	
 <style type="text/css">
 
 	body{
 		background: white;
 	}
 
 	#menubar{
 		margin-bottom : 50px; 
 	}
 	
 	#logout:hover {
 		cursor: pointer;
 	}
 
 </style>
  
  <%
  	String id = (String)session.getAttribute("id");
  %>
  
  <script type="text/javascript">
  $(function(){
  $('#logout').on('click', function(){
		 flag = confirm("로그아웃 하시겠습니까??")
		 if(flag){
			 alert("이용해 주셔서 감사합니다")
			 location.href="<%=request.getContextPath()%>/LogOut.do" 
		 }else{
			 return;
		 }
	 })
  })
</script>


	<header id="header">
		
		<!-- Section title -->
		<h1 class="sr-only">Modus | Home page</h1>
		
		<nav class="navbar navbar-default navbar-fixed-top">
		  <!-- Section title -->
		  <h1 class="sr-only">Main navigation</h1>

		  <div class="container">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand smoothScroll" href="<%=request.getContextPath()%>/index.jsp">
		        <img alt="Modus" src="<%=request.getContextPath()%>/modus/img/로고.png">
		      </a>
		    </div>

		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="main-navbar">
		      <ul class="nav navbar-nav navbar-right">
		        <li class="active"><a class="smoothScroll" href="<%=request.getContextPath()%>/index.jsp">Home <span class="sr-only">(current)</span></a></li>
		        <%if(id == null){%>
		        <li><a class="smoothScroll" href="<%=request.getContextPath()%>/member/login.jsp">로그인</a></li>
		        <li><a class="smoothScroll" href="<%=request.getContextPath()%>/member/join.jsp">회원가입</a></li>
		        <%}else{ %>
		          <li><a class="smoothScroll" id = "logout">로그아웃</a></li>
		         <li><a class="smoothScroll" href="<%=request.getContextPath()%>/mypage/mypageIndex.jsp">마이페이지</a></li>
		        <%} %>
<!-- 		        <li><a class="smoothScroll" href="#clients">Clients</a></li> -->
<!-- 		        <li><a class="smoothScroll" href="#contact">Contact</a></li> -->
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container -->
		</nav>

	</header>

	<main>
		<!--  -->	

<!-- 서브네비게이션 hover : "#00c7fc" (sky색) -->
<div id="menubar">
	<ul id="menubar-menus">
		<li>
			<a href="<%=request.getContextPath()%>/selectPbl.do">공연 정보</a>
		<div><p>
		<a class="menu-style" href="<%=request.getContextPath()%>/selectPbl.do">전체 공연</a>
		<a class="menu-style" href="<%=request.getContextPath()%>/selectPbl.do?team=대전 시립 교향악단">대전 시립 교향악단</a>
		<a class="menu-style" href="<%=request.getContextPath()%>/selectPbl.do?team=대전 시립 합창단">대전 시립 합창단</a>
		<a class="menu-style" href="<%=request.getContextPath()%>/selectPbl.do?team=대전 시립 무용단">대전 시립 무용단</a>
		<a class="smoothScroll" href="<%=request.getContextPath()%>/ticketing/tickecting.jsp">예매하기</a>
		</p></div>
		</li>
		
		<li>
			<a  href="<%=request.getContextPath()%>/introduceTeam/orchestra.jsp">단체소개</a>
		<div><p>
		<a class="menu-style" href="<%=request.getContextPath()%>/introduceTeam/orchestra.jsp">대전 시립 교향악단</a>
		<a class="menu-style" href="<%=request.getContextPath()%>/introduceTeam/chorus.jsp">대전 시립 합창단</a>
		<a class="menu-style" href="<%=request.getContextPath()%>/introduceTeam/dance.jsp">대전 시립 무용단</a>
		</p></div>
		</li>
		
		
		
		<li>
			<a href="<%=request.getContextPath()%>//fboard/fboard_index.jsp">게시판</a>
		<div><p>
		<a class="menu-style" href="<%=request.getContextPath()%>/fboard/fboard_index.jsp">자유게시판</a>
		<a class="smoothScroll" href="<%=request.getContextPath()%>/qna/qna_index.jsp">Q&A</a>
		<a class="menu-style" href="<%=request.getContextPath()%>/notice/notice_index.jsp">공지사항</a>
		</p></div>
		</li>
		
		
		<li>
			<a  href="<%=request.getContextPath()%>/review/review_start.jsp">공연후기</a>
		<div><p>
		<!-- <a class="menu-style" href="#">공연 후기</a> -->
		
		</p></div>
		</li>
		
	</ul>
</div>	




