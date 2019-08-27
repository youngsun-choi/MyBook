<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	<title>CHACKCHECK</title>
	
	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<!-- Bootstrap CSS CDN -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!-- Font Awesome JS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
	<!-- Our Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/form-style.css">

</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<div class="card bg-light">
		<article class="card-body mx-auto mt-3 mb-3" style="max-width: 400px;">
		<div class="row justify-content-center">
			<%-- <a href="${pageContext.request.contextPath}/"><img class="logo" src="images/logo.svg" width="38" height="37"></a>
			<h4 class="card-title mt-3 text-center">회원가입</h4> --%>
			<div class="col-sm-auto logo pl-1 pr-0 mb-4">
				<a href="${pageContext.request.contextPath}/">CHACKCHECK</a>
			</div>
<!-- 				<div class="col-sm-auto"><h4 class="card-title mt-2 text-center">회원가입</h4></div> -->
		</div>
		
		<!-- 회원가입 폼태그 시작 -->
		<form action="${pageContext.request.contextPath}/signUp" method="POST" >
			<!-- 닉네임 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-user"></i>
					</span>
				</div>
				<input id="userName" name="userName" class="form-control" placeholder="닉네임" type="text" required autofocus>
				<div class="input-group-append">
				<input class="btn btn-primary" type="button" id="name_check" value="중복체크">
				</div>
			</div>
			
			<!-- 이메일 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-envelope"></i>
					</span>
				</div>
				<input id="userId" name="userId" class="form-control" placeholder="이메일" type="email" required>
				<div class="input-group-append">
				<input class="btn btn-primary"  type="button" id="id_check" value="중복체크"> 
				</div>
			</div>
			
			<!-- 비밀번호 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<input class="form-control" id="userPass" name="userPass" placeholder="비밀번호" type="password" required>
				<span class="check_font" id="pass_check"></span>
			</div>
			
			<!-- 비밀번호 확인 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<input class="form-control" id="rePass" name="rePass" placeholder="비밀번호 확인" type="password" required>
				<div class="input-group-append">
				<input class="btn btn-primary" type="button" id="repass_check" value="확인">
				</div>
			</div>
			
			<!-- 등록 버튼 -->
			<div class="form-group">
				<!-- <input type="submit" id="signUp" class="btn btn-primary btn-block" value="등록"> -->
				<button id="signUp" class="btn btn-outline-secondary btn-block" style="font-weight:700">등록</button> 
			</div>
			
		</form>
		<!-- 회원가입 폼태그 끝 -->
		
		<p class="divider-text"><span class="bg-light">or</span></p>
		
		<!-- 네이버 로그인 버튼 -->
		<div class="row justify-content-center mb-3">
			<a href="${ url }" class="btn btn-outline-info"><img src="images/naver.png" width="35px" height="35px"><span style="font-size: 16px">  네이버 아이디로 로그인</span></a>
		</div>
		
			
		<!-- 로그인 링크 -->
		<form class="text-center" action="signIn" method="get">
	                 이미 회원가입을 하셨나요? <input id="signColor" type="submit" value="로그인">
	    </form>	
		
	</article>
</div>
	
<script>
// 뒤로가기시 회원가입페이지 안뜨게하기
window.history.forward();
function noBack() { window.history.forward(); }

// 이름 정규식 : 가~힣, 한글로 이루어진 문자만으로 2~6자리 이름을 적어야한다
var nameJ = /^[가-힣a-zA-z0-9]{2,6}$/;
// 이메일 검사 정규식 : -_특수문자 가능하며 중앙에 @ 필수 그리고 . 뒤에 2~3글자 필요
/* var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; */
var mailJ = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
// 비밀번호 정규식 : A~Z, a~z,,0~9로 시작하는 4~12자리 비밀번호 가능
var pwJ = /^[A-Za-z0-9]{4,16}$/;

var text;
var check=new Array(true, true, true);

// btn disabled
$("#signUp").click(function(e) {
	if(loginBtn() !== "success") {
		e.preventDefault();
		$("#signUp").prop("disabled", true); 
	} 
})

//이름 유효성 및 중복 검사(한글로만 2~6자리 또는 특수문자 안됨)
$("#name_check").on("click", function() {						
	var userName = $('#userName').val();
	if(userName != "") {
		$.ajax({
			url : '/book/nameCheck?userName='+ userName,
			type : 'get',
			success : function(data) {			
				if (data == 1) {	// 1 : 닉네임이 중복되는 경우
					text = "이미 등록된 이름입니다.";
					check[0]=true;
				} else {		// 0 : 닉네임 길이 / 문자열 검사					
					if(nameJ.test(userName)){
						text = "사용 가능합니다.";
						check[0]=false;			
					} else {			 
						text = "한글 또는 영어로만 2~6자리 입력가능합니다.";
						check[0]=true;
					}	
				}
				alert(text);
				loginBtn();
			}, error : function(request, status, error){
		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:");
		       }
		});
	}
});
//아이디 유효성 검사(1 = 중복 / 0 != 사용가능)
$("#id_check").on("click", function() {						
	var userId = $('#userId').val();
	if(userId != "") {
		$.ajax({
			url : '/book/idCheck?userId='+ userId,
			type : 'get',
			success : function(data) {			
				if (data == 1) {	// 1 : 아이디가 중복되는 문구
					text = "이미 가입된 이메일입니다.";
					check[1]=true;
				} else {		// 0 : 아이디 길이 / 문자열 검사					
					if(mailJ.test(userId)){
						text = "사용 가능합니다.";
						check[1]=false;			
					} else {			 
						text = "유효하지 않은 양식입니다.";
						check[1]=true;
					}	
				}
				alert(text);
				loginBtn();
			}, error : function() {
					console.log("실패");
			}
		});
	}
});

// 비밀번호 유효성 검사 및 비밀번호 재확인
$("#repass_check").on("click", function() {
	var userPass = document.getElementById("userPass").value;
	var rePass = document.getElementById("rePass").value;

	if(rePass != "") { 
		if(pwJ.test(rePass)) {
			if(userPass != rePass) {
				text = "비밀번호가 일치하지 않습니다.";
				check[2]=true;
			} else {
				text = "비밀번호가 일치합니다.";
				check[2]=false;
			}
		} else {
			text = "숫자 또는 문자로만 4~12자리 입력가능합니다.";
			check[2]=true;
		}
	alert(text);
	loginBtn();
	}
});

$('#signUp').on("click",function(){
	signUpBtn();
});

function signUpBtn(count){
	console.log(count);
	if(count == 3)
		document.getElementById("#signUp").submit();
	else
		alet("중복체크를 확인해주세요.");
}

function loginBtn() {
	var count=0;
	var btn = true;
	for(var i in check) {
		if(check[i] == false)
			count++;
	}
	console.log(count);
	if(count == 3) {
		$("#signUp").prop("disabled", false);
		return "success";
	} else if(count == 0) {
		alert('중복체크 버튼을 눌러 확인해주세요!')
	} else {
		btn = true;
		signUpBtn(count);
	}
	$("#signUp").attr("disabled", btn);
}
</script>
</body>
</html>