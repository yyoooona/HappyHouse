<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.mycom.happyhouse.dto.UserDto"%>
<%
	String root = request.getContextPath();

// 세션에서 로그인 되어있는지 확인
UserDto userDto = (UserDto) session.getAttribute("userDto");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=" shortcut icon" href="<%=root%>/img/favicon.ico"
	type="image/x-icon" />
<link rel="icon" href="<%=root%>/img/favicon.ico" type="image/x-icon" />
<!-- bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<!-- alertify -->
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css" />
<title>Happy House</title>
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="<%=root%>/"> <img
				src="<%=root%>/img/logo.png" width="40" height="40" alt="logo" />
			</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Happy House </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="<%=root%>/processAbout">소개</a>
							<a class="dropdown-item" href="<%=root%>/processBoard">공지사항</a>
						</div></li>

					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="" id="navbarDropdown"
					   role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 검색 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							 	<a class="dropdown-item" href="<%=root%>/processHouse">아파트별 실거래가 검색</a>
								<a class="dropdown-item" href="<%=root%>/processHouse">동별 실거래가 검색</a>
								<a class="dropdown-item" href="<%=root%>/processHouse">동네업종 정보 검색</a>
								<a class="dropdown-item" href="<%=root%>/processHouse">대기오염 정보 검색</a>
						</div>
					</li>

					<li class="nav-item"><a class="nav-link disabled" href=""
						tabindex="-1" aria-disabled="true">관리자</a></li>
				</ul>
				<%
					if (userDto == null) {
				%>
				<div class="joinBtns">
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#joinModal">회원가입</button>
					<button type="button" class="btn btn-secondary" data-toggle="modal"
						data-target="#loginModal">로그인</button>
					<%
						} else {
					%>
					<button type="button" class="btn btn-secondary" onclick="logout()">로그아웃</button>
					<%
						}
					%>
					<!-- join modal -->
					<div class="modal fade" id="joinModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="joinModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="joinModalLabel">회원가입</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form>
										<div class="form-group">
											<label for="userid" class="col-form-label">아이디:</label> <input
												type="text" class="form-control" id="userid" />
										</div>
										<div class="form-group">
											<label for="userpassword" class="col-form-label">비밀번호
												(4자 이상):</label> <input type="password" class="form-control"
												id="userpassword" />
										</div>
										<div class="form-group">
											<label for="userpassword2" class="col-form-label">비밀번호
												확인 :</label> <input type="password" class="form-control"
												id="userpassword2" />
										</div>
										<div class="form-group">
											<label for="username" class="col-form-label">이름 :</label> <input
												type="text" class="form-control" id="username" />
										</div>
										<div class="form-group">
											<label for="useremail" class="col-form-label">E-mail
												:</label> <input type="text" class="form-control" id="useremail"
												size="25" /> @ <select class="form-control"
												id="emaildomain" name="emaildomain">
												<option value="naver.com">naver.com</option>
												<option value="google.com">google.com</option>
												<option value="daum.net">daum.net</option>
												<option value="nate.com">nate.com</option>
												<option value="hanmail.net">hanmail.net</option>
											</select>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-warning" id="register"
										onclick="javascript:register()">회원가입</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End join modal -->

					<!-- login modal -->
					<div class="modal fade" id="loginModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="loginModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="loginModalLabel">로그인</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form>
										<div class="form-group">
											<label for="loginid" class="col-form-label">아이디:</label> <input
												type="text" class="form-control" id="loginid" />
										</div>
										<div class="form-group">
											<label for="loginpassword" class="col-form-label">비밀번호
												:</label> <input type="password" class="form-control"
												id="loginpassword" />
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">비밀번호 찾기</button>
									<button type="button" class="btn btn-primary" onclick="login()">로그인</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End login modal -->

				</div>
			</div>
		</nav>
	</header>

	<script type="text/javascript">
    function validateJoin(){
    	if($("#userid").val() == "") {
    		alertify.alert("아이디를 입력해주세요");
    		return false;
    	} else if($("#userpassword").val() == "") {
    		alertify.alert("비밀번호를 입력해주세요");
    		return false;
    	} else if($("#username").val() == "") {
    		alertify.alert("이름을 입력해주세요");
    		return false;
    	} else if($("#useremail").val() == "") {
    		alertify.alert("이메일을 입력해주세요");
    		return false;
    	} else if($("#userpassword").val().length < 4) {
    		alertify.alert("비밀번호는 4자 이상입니다!");
    		return false;
    	} else if($("#userpassword").val() != $("#userpassword2").val()) {
    		alertify.alert("비밀번호를 다시 확인해주세요");
    		return false;
    	}
    	else return true;
    }
    
    function validateLogin(){
    	if($("#loginid").val() == "") {
    		alertify.alert("아이디를 입력해주세요");
    		return false;
    	} else if($("#loginpassword").val() == "") {
    		alertify.alert("비밀번호를 입력해주세요");
    		return false;
    	} 
    	else return true;
    }
    
    
    function register(){
    	
    	let registerData = JSON.stringify({
    		user_id: $("#userid").val(),
    		user_password: $("#userpassword").val(),
    		user_name: $("#username").val(),
    		email: $("#useremail").val() + '@' + $("#emaildomain option:selected").val(),
        });
    	
    	if(validateJoin()){
    		$.ajax({
    			type: 'post',
    			url: '<%=root%>/user/register',
    			dataType: 'json',
    			data: registerData,
    			contentType : "application/json;",
    			success: function(data, status, xhr) {
    				window.location.href = "<%=root%>/";
<%--     				if(data.result == "success") {
    					window.location.href = "<%=root%>/";
						} else {
							alertify.notify('로그인에 실패했습니다.', 'error', 3,
									function() {
										console.log(xhr.responseText);
									});
						} --%>
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alertify.notify('회원가입에 실패했습니다.', 'error', 3, function() {
							console.log(jqXHR.responseText);
    				});
    			}
    		});
    	}
    	
    }
    
    
    
    function login(){
    	
    	let loginData = JSON.stringify({
        	user_id: $("#loginid").val(),
    		user_password: $("#loginpassword").val(),
        });
    	
    	if(validateLogin()){
    		$.ajax({
    			type: 'post',
    			url: '<%=root%>/user/login',
    			dataType: 'json',
    			data: loginData,
    			contentType : "application/json;",
    			success: function(data, status, xhr) {
    				window.location.href = "<%=root%>/";
<%--     				if(data.result == "success") {
    					window.location.href = "<%=root%>/";
						} else {
							alertify.notify('로그인에 실패했습니다.', 'error', 3,
									function() {
										console.log(xhr.responseText);
									});
						} --%>
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alertify.notify('로그인에 실패했습니다.', 'error', 3, function() {
							console.log(jqXHR.responseText);
						});
					}
				});
			}

		}
    
  <%--   
function board(){
	if(<%=userDto%>==null){
		// 그냥 페이지 이동
		window.location.href = "<%=root%>/board";
	}else{
		
	let userData = JSON.stringify({
    	user_seq: userDto.getUser_seq(),
    	user_id : userDto.getUser_id(),
    	user_password : userDto.getUser_password(),
    });
	console.log(userData);
  
    		$.ajax({
    			type: 'post',
    			url: '<%=root%>/boards/lg',
    			dataType: 'json',
    			data: userData,
    			contentType : "application/json;",
    			success: function(data, status, xhr) {
    				console.log(data);
    				window.location.href = "<%=root%>/board";
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alertify.notify('공지사항 불러오기에 실패했습니다.', 'error', 3, function() {
							console.log(jqXHR.responseText);
						});
					}
				});
			}
} --%>
		
function logout(){
    	

    		$.ajax({
    			type: 'get',
    			url: '<%=root%>/user/logout',
    			
    		/* 	contentType : "application/json;", */
    			success: function(data, status, xhr) {
    				window.location.href = "<%=root%>/";
<%--     				if(data.result == "success") {
    					window.location.href = "<%=root%>/";
						} else {
							alertify.notify('로그인에 실패했습니다.', 'error', 3,
									function() {
										console.log(xhr.responseText);
									});
						} --%>
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alertify.notify('로그아웃에 실패했습니다.', 'error', 3, function() {
							console.log(jqXHR.responseText);
						});
					}
				});
			

		}
	</script>

</body>
</html>