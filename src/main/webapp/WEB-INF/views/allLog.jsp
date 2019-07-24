<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.MyBookList, java.util.List" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->

    <title>CHACKCHECK</title>

	<!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS CDN -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="css/style.css?a">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<style>
	#userNameCss{
		font-weight: bold; 
		border:none; 
		background-color: #58C9B9; 
		color: #fff;
	}
</style>
</head>

<body>

    <div class="wrapper">
    
         <div style="z-index:500">
	        <a href="${pageContext.request.contextPath}/" class="brand-logo-main" >
				<div class="container">
					<div class="row" id="tooltip" style="width: 200px;">
						<div class="col-sm-auto pr-0 mt-2">		
							CHACK<br>CHECK
						</div>
						<div class="col-sm-auto pl-1">
							<img src="images/book.jpg" style="width: 55px">
						</div>
					</div>	
					<div class="p-3" id="tooltiptext">안녕하세요! 책첵은 처음인가요?<br>회원가입 후 첫 서평을 작성해보세요:)</div>
				</div>
			</a>		
         </div>
    
  		<!-- left Sidebar 시작 -->
        <nav id="sidebar">

            <div class="sidebar-header p-3">
            	<a href="${pageContext.request.contextPath}/" class="brand-logo">
					CHACKCHECK
				</a>
            </div>

            <ul class="list-unstyled components">
                <!-- <p>Dummy Heading</p> -->
                <li>
                	<form id="leftSideBar" action="${pageContext.request.contextPath}/" method="get">
	                	<input id="leftSideBarColor" type="submit" value="메인">
	                </form>
                </li>
                <c:choose>
                	<c:when test="${ !empty status }">
		                <li class="active">
		                	<form id="leftSideBar" action="readBook" method="get">
			                	<a href="#bookSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
			                		<input id="leftSideBarColor" type="submit" value="내 서재">
			                	</a>
			               	</form>
		                    <ul class="collapse list-unstyled" id="bookSubmenu">
		                        <li>
		                        	<form id="leftSideBar" action="readBook" method="post">
			                			<input id="leftSideBarColor" type="submit" value="읽은 책">
			                		</form>
		                        </li>
		                        <li>
		                        	<form id="leftSideBar" action="interestBook" method="get">
			                			<input id="leftSideBarColor" type="submit" value="관심 책">
			                		</form>
		                        </li>
		                    </ul>
		                </li>
		                <li>
		                	<form id="leftSideBar" action="myPage" method="get">
			                	<input id="leftSideBarColor" type="submit" value="내 정보">
			                </form>
		                </li> 
		                </c:when>
		                <c:otherwise>
			                <li class="active">
			                	<form id="leftSideBar" action="signIn" method="get">
				                	<a href="#bookSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				                		<input id="leftSideBarColor" type="submit" value="내 서재">
				                	</a>
				               	</form>
			                    <ul class="collapse list-unstyled" id="bookSubmenu">
			                        <li>
			                        	<form id="leftSideBar" action="signIn" method="post">
				                			<input id="leftSideBarColor" type="submit" value="읽은 책">
				                		</form>
			                        </li>
			                        <li>
			                        	<form id="leftSideBar" action="signIn" method="get">
				                			<input id="leftSideBarColor" type="submit" value="관심 책">
				                		</form>
			                        </li>
			                    </ul>
			                </li>
			                <li>
			                	<form id="leftSideBar" action="signIn" method="get">
				                	<input id="leftSideBarColor" type="submit" value="내 정보">
				                </form>
			                </li> 
		                </c:otherwise>
		     	</c:choose>
            </ul>
        </nav>
		<!-- left Sidebar 끝 -->
	
        <!-- Page Content 시작 -->
        <div id="content">

			<!-- navbar 시작 -->
			<button type="button" id="sidebarCollapse" class="btn btn-outline-secondary mb-5">
               <i class="fas fa-align-left"></i>
               <span>MENU</span>
            </button>
           		
            <h2 style="font-size: 28px; font-weight: 700; color: #58C9B9;">전체 활동로그</h2>
            	 <br>
	            <c:if test="${ !empty list }">
					<ul>
		           		<c:forEach var="vo" items="${list}" varStatus="status">
			           			<div id="row">    
			           				<c:if test="${!empty vo.myBookTitle}">
			           					<form action="otherReadBook" method="post">
				               				<input type="hidden" name="email" value="${vo.email}">
				           					<input id="userNameCss" type="submit" value="${vo.userName}">
				           					&emsp;<span> ${vo.logregistdate}</span>
			           					</form><br> 
			           					<span style="font-weight: bold; word-break: keep-all ;">${vo.myBookTitle}</span>
				           				<c:if test="${empty vo.isupdate}">
				           					<span style="word-break: keep-all ;"> 책 서평을 작성하였습니다.</span>
				           					</c:if>
				           				<c:if test="${!empty vo.isupdate}">
				           					<span style="word-break: keep-all ;"> 책 서평을 변경하였습니다.</span>
				           				</c:if>	
				           				<br>별점 <span><c:forEach var="i" begin="1" end="${vo.m_star}">
											<span style="color : #58C9B9;">★</span>
										</c:forEach></span><br>
										<div style="word-break: keep-all ;">${vo.m_content}</div>
			           				</c:if> 
			           				<c:if test="${empty vo.myBookTitle}">
			           					<form action="otherInterestBook" method="post">
				               				<input type="hidden" name="email" value="${vo.email}">
				           					<input id="userNameCss" type="submit" value="${vo.userName}">
				           					&emsp;<span> ${vo.logregistdate}</span>
			           					</form><br>
				           				<span style="font-weight: bold; word-break: keep-all ;">${vo.interestBookTitle}</span>
				           				<span style="word-break: keep-all ;"> 책을 관심책에 담았습니다.</span><br>
			           				</c:if>	
								<div class="line"></div>
						 </c:forEach>
						 
						 <!-- 페이징 버튼 위치 시작 -->
						<c:if test="${!empty listCnt }">
							<div>
								<c:if test="${pagination.curPage ne 1 }">
									<a href="#" onClick="fn_paging(1)">[처음]</a>
								</c:if>
								<c:if test="${pagination.curPage ne 1}">
									<a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a>
								</c:if>
								<c:forEach var="pageNum" begin="${pagination.startPage }"
									end="${pagination.endPage }">
									<c:choose>
										<c:when test="${pageNum eq  pagination.curPage}">
											<span style="font-weight: bold;"><a href="#"
												onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
										</c:when>
										<c:otherwise>
											<a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if
									test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
									<a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a>
								</c:if>
								<c:if test="${pagination.curPage ne pagination.pageCnt }">
									<a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a>
								</c:if>
							</div>
						</c:if>
					<!-- 페이징 버튼 위치 종료 -->
						 
					 </ul>
				 </c:if>
				 <c:if test="${ empty list }">
				 	<div>활동기록이 없습니다.</div>
				 	<div class="line"></div>
				 </c:if>

        </div>
        <!-- Page Content 끝 -->
        
        <!-- 회원가입 및 로그인 -->
        <c:if test="${ empty status }">
	        <div class="sign">
	       		<form action="signIn" method="get" style ='float: left;'>
	              		<input id="signColor" type="submit" class="nav-link p-2" value="로그인">
	          	</form>
	       		<form action="signUp" method="get" style ='float: left;'>
	              		<input id="signColor" type="submit" class="nav-link p-2" value="회원가입">
	          	</form>
	        </div>
        </c:if>
        <c:if test="${ !empty status }">
	        <div class="sign">
	       		<form action="signOut" method="get" style ='float: left;'>
	              		<input id="signColor" type="submit" class="nav-link p-2" value="로그아웃">
	          	</form>
	        </div>
        </c:if>
        <!-- 회원가입 및 로그인 끝 -->
        
    </div>
	<!-- jQuery Custom Scroller CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js">
	</script>
    <script type="text/javascript">
    function fn_paging(curPage) {
    	location.href = "/book/allLog?curPage=" + curPage;
    }
    
        $(document).ready(function () {
        	// hide sidebar when refresh the page
            $('#sidebar').toggleClass('active');
 
        	$("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });
            
            $('#sidebarCollapse').on('click', function () {
            	// open sidebar when clicked
                $('#sidebar, #content').toggleClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
            
            $('#tooltip').hover(function(){
            	//$( '#tooltiptext' ).removeClass( 'invisible' );
            	$( '#tooltiptext' ).animate({opacity: "1"}, 1000);
      
            });
            $('#tooltip').mouseleave(function(){
            	$( '#tooltiptext' ).animate({opacity: "0"}, 500);
            	//$( '#tooltiptext' ).fadeTo("fast", 0);
            	//$( '#tooltiptext' ).addClass( 'invisible' );
             });
        });
    </script>
</body>
</html>