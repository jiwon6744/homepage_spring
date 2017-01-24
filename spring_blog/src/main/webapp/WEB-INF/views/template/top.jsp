<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${empty sessionScope.id }">
		<c:set var="str">JIWON</c:set>
	</c:when>
	<c:when test="${not empty sessionScope.id && sessionScope.grade=='A' }">
		<c:set var="str">관리자 님</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">${sessionScope.id } 님!</c:set>
	</c:otherwise>
</c:choose>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/ico/favicon.png">

    <title>Jiwon`s MemoPage</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/assets/css/main.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font-awesome.min.css">

    <script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/modernizr.custom.js"></script>
	
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    #admin {
    		font-weight: bold;
		}
	</style>
  </head>

  <body data-spy="scroll" data-offset="0" data-target="#theMenu">
		
	<!-- Menu -->
	<nav class="menu" id="theMenu">
		<div class="menu-wrap">
			<h1 class="logo"><a href="#home">
			${str }
			</a></h1>
<%-- 			<c:if test="${empty sessionScope.id }"> --%>
<%-- 			<c:redirect>"${pageContext.request.contextPath }/index.jsp"</c:redirect> --%>
<%-- 			</c:if> --%>
			<i class="icon-remove menu-close"></i>
			<a href="${pageContext.request.contextPath }/" class="smoothScroll">Home</a>
			<c:choose>
				<c:when test="${empty sessionScope.id }">
			<a href="${pageContext.request.contextPath }/member/agree" class="smoothScroll">Join </a>
			<a href="${pageContext.request.contextPath }/member/login" class="smoothScroll">Login</a>
				</c:when>
				<c:when test="${not empty sessionScope.id && sessionScope.grade=='H'}">
			<a href="${pageContext.request.contextPath }/member/read" class="smoothScroll">MyInfo</a>
<%-- 			<a href="${pageContext.request.contextPath }/member/update.do" class="smoothScroll">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Edit</a> --%>
			<a href="${pageContext.request.contextPath }/member/delete" class="smoothScroll">&nbsp;&nbsp;&nbsp;&nbsp;Withdrawal</a>
			<a href="${pageContext.request.contextPath }/member/logout" class="smoothScroll">&nbsp;&nbsp;&nbsp;&nbsp;Logout</a>
				</c:when>
			</c:choose>
			<c:if test="${not empty sessionScope.id && sessionScope.grade=='A'}">
			<a href="${pageContext.request.contextPath }/member/logout">&nbsp;&nbsp;&nbsp;&nbsp;Logout</a>
			<a href="${pageContext.request.contextPath }/admin/list" id="admin">&nbsp;&nbsp;&nbsp;&nbsp;Member list</a>
			</c:if>
			
			<a href="${pageContext.request.contextPath }/memo/list" class="smoothScroll">Memo</a>
<%-- 			<a href="${pageContext.request.contextPath }/memo/create.do#create" class="smoothScroll">메모등록</a> --%>
			<a href="${pageContext.request.contextPath }/address/list" class="smoothScroll">Address</a>
<%-- 			<a href="${pageContext.request.contextPath }/address/create.do#create" class="smoothScroll">주소생성</a> --%>
			<a href="${pageContext.request.contextPath }/bbs/list" class="smoothScroll">Board</a>
<%-- 			<a href="${pageContext.request.contextPath }/bbs/create.do#create" class="smoothScroll">게시판등록</a> --%>
			<a href="${pageContext.request.contextPath }/team/list" class="smoothScroll">Team</a>
<%-- 			<a href="${pageContext.request.contextPath }/team/create.do#create" class="smoothScroll">팀생성</a> --%>
			<a href="${pageContext.request.contextPath }/imgbbs/list" class="smoothScroll">Image</a>
<%-- 			<a href="${pageContext.request.contextPath }/imgbbs/create.do#create" class="smoothScroll">이미지등록</a> --%>
			<a href="#"><i class="icon-facebook"></i></a>
			<a href="#"><i class="icon-twitter"></i></a>
			<a href="#"><i class="icon-dribbble"></i></a>
			<a href="#"><i class="icon-envelope"></i></a>
		</div>
		
		<!-- Menu button -->
		<div id="menuToggle"><i class="icon-reorder"></i></div>
	</nav>


	
	<!-- ========== HEADER SECTION ========== -->
	<section id="home" name="home"></section>
	<div id="headerwrap">
		<div class="container">
			<br>
			<h1>Jiwon`s</h1>
			<h2>Homepage</h2>
			<div class="row">
				<br>
				<br>
				<br>
				<div class="col-lg-6 col-lg-offset-3">
				</div>
			</div>
		</div><!-- /container -->
	</div><!-- /headerwrap -->
	
	
	<!-- ========== WHITE SECTION ========== -->
	<div id="w">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
				<h3>WELCOME TO <bold>JIWON`S</bold>. HOMEPAGE</br><bold>BE HAPPY</bold>AND 
				<bold>SMILE</bold>. <br/><bold>PORTFOLIO</bold>.</h3>
				</div>
			</div>
		</div><!-- /container -->
	</div><!-- /w -->
	
	<!-- ========== SERVICES - GREY SECTION ========== -->
	<!-- 내용 시작 -->
<!-- 	<div style="width: 100%; padding-top: 10px;"> -->

