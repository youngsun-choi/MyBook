<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>CHACKCHECK</title>

	<!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js">
	</script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS CDN -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="css/style.css?a">
    <link rel="stylesheet" href="css/booklist-style.css?a">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
</head>

<body>
	<div class="wrapper">
		<div style="z-index: 500">
			<a href="${pageContext.request.contextPath}/" class="brand-logo-main">
				<div class="container">
					<div class="row">
						<div class="col-sm-auto pr-0 mt-2">
							CHACK<br>CHECK
						</div>
						<div class="col-sm-auto pl-1">
							<img src="images/book.jpg" style="width: 55px">
						</div>
					</div>
				</div>
			</a>
		</div>
		<!-- left Sidebar 시작 -->
		<nav id="sidebar">
			<div class="sidebar-header p-3">
				<a href="${pageContext.request.contextPath}/" class="brand-logo"
					style="font-family: 'Fredoka one'"> CHACKCHECK </a>
			</div>

			<ul class="list-unstyled components">
				<li>
					<form id="leftSideBar" action="${pageContext.request.contextPath}/"
						method="get">
						<input id="leftSideBarColor" type="submit" value="메인">
					</form>
				</li>
				<li class="active">
					<form id="leftSideBar" action="readBook" method="get">
						<a href="#bookSubmenu" data-toggle="collapse"
							aria-expanded="false" class="dropdown-toggle"> <input
							id="leftSideBarColor" type="submit" value="내 서재">
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

			<div class="top-page mb-5 center-block">
				<!-- top page 시작 -->

				<div class="btn-with-fixedInput pr-1 pl-3">
					<!-- 메뉴 버튼 -->

					<button type="button" id="sidebarCollapse"
						class="btn btn-outline-secondary">
						<i class="fas fa-align-left"></i> <span>MENU</span>
					</button>

				</div>

				<div class="fixedInput pl-1">
					<!-- 고정된 인풋 -->

					<form method="get" action="readBook" target="_self">
						<div class="input-group">
							<input name="readkeyword" type="text" class="form-control"
								placeholder="내가 등록한 책 제목, 저자, 출판사 검색"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit">검색</button>
							</div>
						</div>
					</form>

				</div>
				<!-- 고정된 인풋 끝 -->

			</div>
			<!-- top page 끝 -->


			<!-- 책이미지와 서평 내용 출력 -->
			<div class="container">
			
			<c:if test="${ !empty list }">
				<ul id="ulRow">
					<c:forEach var="vo" items="${ list }">
						<li class="row pl-3">
							<img alt="이미지" src="${vo.image}" width="100" height="150" style="border : 1px solid lightgray"/>
							<div style="width: 70%" class="ml-4">
								<span style="margin-right: 5px; font-size: 17pt;">${vo.m_title}</span>
								<span>${vo.registdate}</span><br>
								별점 : 
								<c:forEach var="i" begin="1" end="${vo.m_star}">
									<span>★</span>
								</c:forEach><br>	
								<span style="font-size: 14pt; word-break: keep-all ;">${vo.m_content}</span> <!-- style="word-break: keep-all ;" -->
							</div>
						</li>
						<div class="caption">
						<c:choose>
							<c:when test = '${fn:length(vo.title) >= 19}'>
							${fn:substring(vo.title,0,18)}...
							</c:when>
							<c:otherwise>
							${vo.title}
							</c:otherwise>
						</c:choose>
						</div>
						<div class="float-right"><!-- 수정 및 삭제 시작-->
							<form action="readBook" method="post">
								<input type="hidden" name="bookNum" value="${vo.id}">						
								<button type="button" class="btn btn-outline-primary upDelButton" data-toggle="modal" data-target="#myModal2" 
									onclick="updateButton('${vo.id}', '${vo.m_title}', '${vo.m_star}', '${vo.m_content}');" onmouseover="hover(this);" onmouseleave="leave(this)">
									<img id="pencil" src="images/pencil.png" style="width: 20px" class="mr-2">수정
								</button>
								<button type="submit" class="btn btn-outline-primary upDelButton" onmouseover="hover(this);" onmouseleave="leave(this)">
									<img id="trash" src="images/trash.png" style="width: 20px" class="mr-1">삭제
								</button>
							</form>
						</div><!-- 수정 및 삭제 끝-->
						<div class="line"></div> <!-- 구분선 -->
					</c:forEach>
									<!-- 페이징 버튼 위치 시작 -->
				<c:if test="${!empty listCnt }">
					<div id="paging">
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
			<a href="readBook" style="text-decoration: none"><!-- 전체목록으로 이동 -->
				<button class="btn btn-outline-secondary mx-auto mt-5" type="button" style="display: block;" id="listall">전체 목록</button>
			</a>
			
			<c:if test="${ empty list }">
			<% 
				if(request.getParameter("readkeyword") != null) { 
			%>
				<h2 style="padding-top: 30px">찾으시는 책이 없어요  <img src="images/sad-emoji.png" style="width: 50px; padding-bottom: 5px"></h2>
			<%
				} else {
			%>
				<script>
					$('#listall').hide();
				</script>
				<h2>읽은 책과 서평을 추가해주세요  <img src="images/smile-emoji.png" style="width: 50px; padding-bottom: 5px"></h2>
			<%
				}
			%>
			<div class="line"></div> <!-- 구분선 -->
			</c:if>
			<!-- 책이미지와 서평 내용 출력 끝 -->           
            </div><!-- 컨테이너 끝 -->

			<!-- 모달 영역 시작 -->
			<div id="readMe" class="p-2">
				밑의 버튼을 클릭하여<br>책을 추가해주세요:)
			</div>
			<!-- Button trigger modal -->
			<button id="addButton" type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myModal">+</button>

			<!-- 책 추가 모달 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog"
					style="max-width: 100%; width: auto; display: table;">
					<div class="modal-content">
						<!-- 닫기 버튼 -->
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>

						<div class="modal-body">

							<!--  모달 컨텐트 컨테이너 -->
							<div class="container">
								<!--  인풋 로우 -->
								<div class="row inputrow">
									<div class="col-sm-12  ">
										<div class="input-group">
											<input name="keyword" type="text" class="form-control"
												placeholder="책 제목, 저자 검색" aria-describedby="basic-addon2"
												width="20px">
											<div class="input-group-append">
												<button class="btn btn-outline-secondary" id="submitForm">검색</button>
											</div>
										</div>
									</div>
								</div>

								<br>
								<!--  결과 로우 -->
								<c:forEach items="${bookList}" var="b">
									<div id="row" class="row mr-1 searchResult">
										<div id="imgContainer" class="col-sm-3">
											<img id="image" src="${b.image}" style="width: 200px">
										</div>
										<div class="col-sm-4">
											<span id="title">${b.title}</span><br> <br> <span
												id="author">${b.author}</span><br> <span id="publisher">${b.publisher}</span>
										</div>
										<div class="col-sm" id="description">${b.description}</div>
										<div class="w-150"></div>
									</div>
								</c:forEach>

							</div>
							<!--  모달 컨텐트 컨테이너 끝 -->
						</div>
					</div>
				</div>
			</div>
			<!-- 책 추가 모달 끝 -->

			<!-- 서평 추가 모달 -->
			<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<!-- 컨텐트 시작 -->
					<div class="modal-content form-elegant">
						<!-- 닫기 버튼 -->
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<!--헤더-->
						<div class="modal-header text-center">
							<h3
								class="modal-title w-100 dark-grey-text font-weight-bold my-3"
								id="myModalLabel">
								<strong>글쓰기</strong>
							</h3>
						</div>
						<!--바디-->
						<div class="modal-body mx-4">
							<!-- 제목 -->
							<div class="md-form mb-3">
								<p class="md-form mb-2">제목</p>
								<input type="text" id="m_title" class="form-control validate">
							</div>
							<!-- 별점 -->
							<div class="md-form mb-3">
								<!-- 1:4px 2:8px 3:16px 4:24px 5:48px -->
								<p class="md-form mb-1">별점</p>
								<p class="star_rating">
									<a href="#" target="star" id="1" class="on">★</a> <a href="#"
										target="star" id="2" class="on">★</a> <a href="#"
										target="star" id="3" class="on">★</a> <a href="#"
										target="star" id="4" class="on">★</a> <a href="#"
										target="star" id="5" class="on">★</a>
								</p>
							</div>
							<!-- 내용작성부분 -->
							<div class="md-form mb-3">
								<p class="md-form mb-2">내용</p>
								<textarea id="m_content" class="form-control" rows="5"></textarea>
							</div>
							<!-- 확인버튼 -->
							<div class="text-center mb-3">
								<button type="button" id="m_submit"
									class="btn blue-gradient btn-block btn-rounded z-depth-1a">확인</button>
							</div>
						</div>
					</div>
					<!-- 바디 끝 -->
				</div>
			</div>
			<!-- 서평 추가 모달 끝 -->

			<!-- 모달 영역 끝 -->

		</div>
		<!-- Page Content 끝 -->

		<div class="sign"><!-- 회원가입 및 로그인 -->
			<c:if test="${empty status }">
				<form action="signIn" method="get" style='float: left;'>
					<input id="signColor" type="submit" class="nav-link p-2"
						value="로그인">
				</form>
				<form action="signUp" method="get" style='float: left;'>
					<input id="signColor" type="submit" class="nav-link p-2"
						value="회원가입">
				</form>
			</c:if>
			<c:if test="${!empty status }">
				<form action="signIn" method="post" style='float: left;'>
					<input id="signColor" type="submit" class="nav-link p-2"
						value="로그아웃">
				</form>
			</c:if>
		</div><!-- 회원가입 및 로그인 끝 -->

	</div>


	<script type="text/javascript">
    function fn_paging(curPage) {
    	location.href = "/book/readBook?curPage=" + curPage;
    }
    
	    $(document).ready(function () {
	    	// hide sidebar
	        $('#sidebar').toggleClass('active');
	        $("#sidebar").mCustomScrollbar({
	            theme: "minimal"
	        });
	        
	        $('#sidebarCollapse').on('click', function () {
	        	// open sidebar
	            $('#sidebar, #content').toggleClass('active');
	            $('.collapse.in').toggleClass('in');
	            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
	        });
	    });
    </script>

	<!-- 책추가, 서평추가 내용 controller 보내서 db저장 & 서평작성모달창 띄우기 -->
	<script>   	
    	var image, title, author, publisher, description, log;
    	//책 추가 모달에서 목록을 눌렀을 때
		$('div#row').click(function(){ 
				image = $(this).children('div').children('img#image').attr("src");
			  	title = $(this).children('div').children('span#title').text();
			  	author = $(this).children('div').children('span#author').text();
			  	publisher = $(this).children('div').children('span#publisher').text(); 	
			  	description = $(this).children('div#description').text(); 	

			 	$("#myModal").removeClass("in"); 
			 	$(".modal-backdrop").remove();
		 	 	$("#myModal").hide();
		 	 	$('#myModal2').modal('show');	
		 	 	
		 	 //서평 추가 모달에서 확인버튼 눌렀을 때
		 		$('button#m_submit').click(function(){ 
		 		    var m_title = $('input#m_title').val();
		 		    var m_content = $('textarea#m_content').val();
		 		   	m_content = m_content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	 		    $.ajax({
	 		        url: "readBook",
	 		        type: 'POST', 
	 		        data: {
	 		        	title : title,
	 		        	author : author,
	 		        	publisher : publisher,
	 		        	description : description,
	 		        	image : image, 
	 		        	m_title : m_title,
	 		        	m_star : m_star,
	 		        	m_content : m_content
	 		        },
	 		        dataType : "text",
	 		        success: function(data){           
			 	 		$("#myModal2 .close").click();
			 	 		return false;
	 		        },
	 		        error : function(request, status, error){
	 		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:");
	 		        }
	 		    }); 
	 		}); 
		});	
    </script>
	<!-- 책추가, 서평추가 내용 controller 보내서 db저장 & 서평작성모달창 띄우기 끝 -->

	<script>	
	//서평 모달에서 별점 눌렀을 때 채워지게 함 
	$( ".star_rating a" ).click(function() {
	    $(this).parent().children("a").removeClass("on");
	    $(this).addClass("on").prevAll("a").addClass("on");
	    return false;
	});
	
	//별값 가져오기
	var m_star=5;
	$('a[target]').click(function(){
		   m_star = $(this).attr('id');
	}); 
	</script>


	<!-- 	수정버튼 -->
	<script>
  	function updateButton(id, m_title, m_star, m_content){
  		document.getElementById('m_title').value=m_title; 
  		document.getElementById('m_content').value=m_content.replace(/(<br\/>|(<br><\/button>))/g, '\r\n');
  		$('#'+m_star).parent().children("a").removeClass("on");
  		$('#'+m_star).addClass("on").prevAll("a").addClass("on");

  		var m_star = m_star;
  		$('a[target]').click(function(){
  			m_star = $(this).attr('id');
  		});
  		
  		//서평 추가 모달에서 확인버튼 눌렀을 때
  			$('button#m_submit').click(function(){ 
  				
  			    var m_title = $('input#m_title').val();
  			    var m_content = $('textarea#m_content').val();
  			  	m_content = m_content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
  			    $.ajax({
  			        url: "readBook",
  			        type: 'POST', 
  			        data: {
  			        	bookNum : id,
  			        	m_title : m_title,
  			        	m_star : m_star,
  			        	m_content : m_content
  			        },
  			        dataType : "text",
  			        success: function(data){           
  			 	 		$("#myModal2 .close").click(); 			 	 		
  			        },
  			        error : function(request, status, error){
  			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:");
  			        }
  			    }); 
  			}); 
  	}
	</script>
	<!-- 	수정버튼 끝 -->

	<!-- 도서 검색 -->
	<script>
	function searchFunc(e) {  
		var keyword = $('input[name=keyword]').val();
	
	    var url = "readBook?keyword=" + keyword;
	    if(e.type == "keydown" && e.keyCode != 13) { return; } 
	    
	    $.ajax({
	        url: url,
	        type: 'GET', 
	        success: function(data){
	        	$('body').html(data);
	            $('#myModal').modal('show'); 
	        }
	    });
	}
	
	$(function(){
	    $('#submitForm').on('click', searchFunc);   
	    $('input[name=keyword]').on('keydown', searchFunc);   
	    $('.close').on('click', function() {
	    	$.ajax({
	            url: "readBook",
	            type: 'GET', 
	            success: function(data){
	            	$('body').html(data);
	            }
	        });
	    });   
	});
	</script>
	<!-- 도서 검색 끝-->

	<script>
		function hover(e) {
			var image = e.childNodes[1];
			image.id === 'pencil' ? image.src = 'images/white-pencil.png' : image.src = 'images/white-trash.png';
		}
		function leave(e) {
			var image = e.childNodes[1];
			image.id === 'pencil' ? image.src = 'images/pencil.png' : image.src = 'images/trash.png';
		}
	</script>
</body>
</html>