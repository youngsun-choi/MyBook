<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/interestbook-style.css">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
<style>
	#kyoboImg, #interparkImg, #aladinImg,  #yes24Img {
		width : 178px;
		height : 65px;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<div style="z-index:500">
	        <a href="${pageContext.request.contextPath}/otherInterestBook?email=<%= request.getParameter("email")%>" class="brand-logo-main" >
				<div class="container">
					<div class="row mt-2 pl-1" id="tooltip" style="width: 50px;">
						<div class="col-sm-auto pl-1">
							<img class="svg arrowlink" src="images/arrow.svg">
						</div>
					</div>	
					<div class="p-3" id="tooltiptext">뒤로 가서 전체 목록 보기</div>
				</div>
			</a>		
         </div>

			
        <!-- left Sidebar 시작 -->
        <nav id="sidebar">
			<div class="sidebar-header p-3">
            	<a href="${pageContext.request.contextPath}/" class="brand-logo" style="font-family: 'Fredoka one'">
					CHACKCHECK
				</a>
            </div>

            <ul class="list-unstyled components">
                <li>
                	<form id="leftSideBar" action="${pageContext.request.contextPath}/" method="get">
	                	<input id="leftSideBarColor" type="submit" value="메인">
	                </form>
                </li>
                <li class="active">
                	<form id="leftSideBar" action="readBook" method="get">
	                	<a href="#bookSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
	                		<input id="leftSideBarColor" type="submit" value="내 서재">
	                	</a>
	               	</form>
                    <ul class="collapse list-unstyled" id="bookSubmenu">
                        <li>
                        	<form id="leftSideBar" action="readBook" method="get">
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
            </ul>
        </nav>
		<!-- left Sidebar 끝 -->
		
        <!-- Page Content 시작 -->
        <div id="content">

			<div class="top-page mb-5"><!-- top page 시작 -->
	 		
	 			<div class="btn-with-fixedInput pr-1 pl-3"><!-- 메뉴 버튼 -->
	
					<button type="button" id="sidebarCollapse" class="btn btn-outline-secondary">
		               <i class="fas fa-align-left"></i>
		               <span>MENU</span>
		            </button>
		            
				</div>
				
	 		</div><!-- top page 끝 -->
			<!-- navbar 끝 -->
			
			<!-- 선택한 관심책 상세 내용 출력 -->
			<c:if test="${ !empty list }">	
				<c:forEach var="vo" items="${ list }">	
				<div style="display:table; margin:0 auto;">
						<div style="display: table-cell; vertical-align:middle;" class="pb-2">
							<img alt="이미지" src="${vo.image}" width="120" height="180" style="border : 1px solid lightgray;  box-shadow: 2px 2px 3px 0px rgba(107,106,107,1);"/>
						</div>
							
						<div style="display: table-cell; vertical-align:middle;" class="pl-4"> 
							<span style="font-weight: bold; font-size: 25px;">${vo.title}</span><br>	
							<span style="font-weight: bold; font-size: 17px;">저자 : ${vo.author}</span><br>	
							<span style="font-weight: bold; font-size: 17px;">출판사 : ${vo.publisher}</span><br><br>	
							<p style="font-size: 15px;">${vo.description}</p>
						</div>
				</div>
				<div class="line"></div> <!-- 구분선 --> 	
				<div class="mb-4" style="font-size: 18px; color: gray">지금 사러 가기</div>
				<div class="booklink"> 
					<% String encodeStr = (String)request.getAttribute("bookTitle"); %>
					<a href="http://www.kyobobook.co.kr/search/SearchKorbookMain.jsp?vPstrCategory=KOR&vPstrKeyWord=<%= URLEncoder.encode(encodeStr, "euc-kr") %>&vPplace=top" target="_blank">KYOBO</a>
					|	 
					<a href="http://bsearch.interpark.com/dsearch/book.jsp?sch=all&bid1=search_auto&bid2=product&bid3=000&bid4=001&query=<%= URLEncoder.encode(encodeStr, "euc-kr") %>" target="_blank">INTERPARK</a>
					|	 
					<a href="https://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=All&SearchWord=<%= URLEncoder.encode(encodeStr, "euc-kr") %>&x=0&y=0" target="_blank">ALADDIN</a>
					|	 
					<a href="http://www.yes24.com/searchcorner/Search?keywordAd=&keyword=&domain=ALL&qdomain=%C0%FC%C3%BC&Wcode=001_005&query=<%= URLEncoder.encode(encodeStr, "euc-kr") %>" target="_blank">YES24</a>
				</div>		 
				</c:forEach>		
			</c:if>
			<!-- 선택한 관심책 상세 내용 출력 끝 -->
			
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
	       		<form action="signOut" method="post" style ='float: left;'>
	              		<input id="signColor" type="submit" class="nav-link p-2" value="로그아웃">
	          	</form>
	        </div>
        </c:if>
        <!-- 회원가입 및 로그인 끝 -->
        
    </div>
    
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

    <script type="text/javascript">
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
    
    	<!-- svg inline -->
		<script>
	    jQuery('img.svg').each(function(){
        var $img = jQuery(this);
        var imgID = $img.attr('id');
        var imgClass = $img.attr('class');
        var imgURL = $img.attr('src');

        jQuery.get(imgURL, function(data) {
            // Get the SVG tag, ignore the rest
            var $svg = jQuery(data).find('svg');

            // Add replaced image's ID to the new SVG
            if(typeof imgID !== 'undefined') {
                $svg = $svg.attr('id', imgID);
            }
            // Add replaced image's classes to the new SVG
            if(typeof imgClass !== 'undefined') {
                $svg = $svg.attr('class', imgClass+' replaced-svg');
            }

            // Remove any invalid XML tags as per http://validator.w3.org
            $svg = $svg.removeAttr('xmlns:a');

            // Replace image with new SVG
            $img.replaceWith($svg);

        }, 'xml');

   	 });
	</script>
	<!-- svg inline -->
</body>
</html>