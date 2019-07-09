<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script  src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
body {
	font-family:  ''Noto Sans KR";
}

#imgContainer {
	text-align:center;
}

.row {
	padding: 5px;
}

.row:hover {
	background-color: #dcebf7;
	cursor: pointer;
}

.inputrow:hover {
	background-color: white;
}

.inputrow {
	margin: 0 auto;
    float: none;
    text-align: center;
}

</style>
</head>
<body>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>
 
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
    <div class="modal-content">
	<!-- 닫기 버튼 -->
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
	 
	 <div class="modal-body">
	 	
	 	 <!--  모달 컨텐트 시작 -->     	
	 	<div class="container">
	
			<div class="row inputrow">
		
				<div class="col-sm-12  ">
					
					<form action="bookList.do" id="searchForm">
				        <div class="input-group">
				        	<input name="keyword" 
				        	type="text" class="form-control" 
				        	placeholder="책 제목, 저자 검색"
				        	 aria-describedby="basic-addon2"
				        	 width="20px"
				        	 onkeydown="return ignoreEnter(event);">
				        	 <div class="input-group-append">
				    			<button class="btn btn-outline-secondary" type="submit" id="submitForm">검색</button>
				 			 </div>
				           </div>
				        </form>	  
					
				</div>
			</div>
	
	
	
	       <br>
	        <c:forEach items="${bookList}" var ="b">
	        
	        		<div class="row">
	        		<div id="imgContainer" class="col-2 col-sm-2">
	                	<img src="${b.image}">
		            </div>
		            <div class="col-2 col-sm-3">
		            	${b.title}<br>
		                ${b.author}<br>
		                ${b.publisher }
		            </div>
		             <div class="col-6 col-md-7">
		                ${b.description}
		            </div>
		            <div class="w-150"></div>
	        	</div>
	 
	        </c:forEach>
			
			</div>
        	<!--  모달컨텐트 끝 -->
	 	
	 </div>

	
        	
    </div>
  </div>
</div>

<script>
$(document).ready(function () {
    $("#searchForm").on("submit", function(e) {
        var postData = $(this).serializeArray();
        var formURL = $(this).attr("action");
        $.ajax({
            url: formURL,
            type: "POST",
            data: postData,
            success: function(data, textStatus, jqXHR) {

                $('.modal-body').html(data);
                $("#submitForm").remove();
            },
            error: function(jqXHR, status, error) {
                console.log(status + ": " + error);
            }
        });
        e.preventDefault();
    });
     
    $("#submitForm").on('click', function() {
        $("#searchForm").submit();
    });
});


</script>

</body>
</html>