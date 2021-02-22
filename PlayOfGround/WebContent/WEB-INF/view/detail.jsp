<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String userId = (String) session.getAttribute("userId");
	Integer apiId = (Integer) session.getAttribute("apiId");
	Byte manager = (Byte) session.getAttribute("manager");
%>
<%
	System.out.println("아이디값: " + System.getProperty("user.name"));
%>
<%
	String id = "";
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	String nick = "";
	if (session.getAttribute("nick") != null) {
		nick = (String) session.getAttribute("nick");
	} else {
		nick = "비로그인회원";
	} /*session.getId().substring(0, 6)*/
%>
<c:if test="${(userId ne '') and !(empty userId)}">
	<input type="hidden" value='${userId }' id='chat_id' />
</c:if>
<c:if test="${(userId eq '') or (empty userId)}">
	<input type="hidden" value='<%=userId%>' id='chat_id' />
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link
	href="../startbootstrap-shop-homepage-gh-pages/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="../startbootstrap-shop-homepage-gh-pages/css/shop-homepage.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	window.onload = function() {

		function onClick() {
			document.querySelector('.modal_wrap').style.display = 'block';
			document.querySelector('.black_bg').style.display = 'block';
		}
		function offClick() {
			document.querySelector('.modal_wrap').style.display = 'none';
			document.querySelector('.black_bg').style.display = 'none';
		}

		document.getElementById('modal_btn').addEventListener('click', onClick);
		document.querySelector('.modal_close').addEventListener('click',
				offClick);

	};

	function checkValue() {
		inputForm = eval("document.loginInfo");

		if (!inputForm.userId.value) {
			alert("아이디를 입력하세요");
			inputForm.userId.focus();
			return false;
		}
		if (!inputForm.password.value) {
			alert("비밀번호를 입력하세요");
			inputForm.password.focus();
			return false;
		}
	}

	function page_User() {
		location.href = "http://localhost:8090/PlayofGround/joinForm";
	}

	function logout() {
		location.href = "http://localhost:8090/PlayofGround/logout";
	}
	
	$(function() {
		//login_btn 버튼을 클릭했을 때
		$("#login_btn").on("click", function() {
			//login_btn 를 param.
			var userId = $("#user_id").val();
			var password = $("#password").val();
			$.ajax({
				async : true,
				type : 'POST',
				data : {"userId" : userId, "password" : password},
				url : "http://localhost:8090/PlayofGround/login",
				success : function(data) {
					console.dir(data);
					if (data == 0) {
	
						alert("일치하는 아이디가 없습니다.");

						$("#user_id").value = "";
						$("#user_id").focus();
						
						return false;

					} else if (data == 1) {
						
						alert("로그인 되었습니다.");
						location.href = "http://localhost:8090/";
						return true;
						
					} else {
						alert("패스워드가 일치하지 않습니다.");
						
						$("#password").value = "";
						$("#password").focus();
						return false;
					}
				},
				error : function(e) {
					alert("error : " + e);
				}
			});
			return false;
		});
	});	
	

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;		
			var url = "${pageContext.request.contextPath}/board/list";
			url +="?page=" + page;
			url +="&range=" + range;
			location.href = url;
		}
	  //페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {
			var url = "${pageContext.request.contextPath}/board/list";
			url +="?page=" + page;
			url +="&range=" + range;
			location.href = url;	
		}

		//다음 버튼 이벤트
		function fn_next(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "${pageContext.request.contextPath}/board/list";
			url +="?page=" + page;
			url +="&range=" + range;
			location.href = url;
		}	
</script>
</head>
<style media="screen">
#button {
	position: sticky;
	top: 92%;
	margin-left: 10px;
}

.chat {
	display: flex;
	place-content: center;
	color: green;
	font-size: x-large;
	padding: 10px;
}

.navbar-brand img {
	width: 35px;
	height: 35px;
}

.my-4 {
	text-align: center;
}

.list-group a {
	text-align: left;
	font-size: 20px;
	/* text-decoration: none; */
}

.carousel-inner img {
	width: 900px;
	height: 350px;
}

.carousel-inner {
	border-radius: 1.25rem;
}
.modal_wrap {
	display: none;
    width: 303px;
    height: 184px;
    position: absolute;
    top: 52%;
    left: 90%;
    margin: -250px 0 0 -250px;
    background: #eee;
    z-index: 2;
    border-radius: 15px;
}

.black_bg {
	display: none;
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	top: 0;
	left: 0;
	z-index: 1;
}

.modal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.modal_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}

th {
	text-align: left;
	font-size: initial;
}

.Form {
	border-top: 2px solid #49505733;
}

#wirte_btn{
	float: right;
    margin-right: 15px;
}
.border{
	position: relative;
    top: 7%;
    width: 98%;
    height: 90%;
}
</style>
<body>
<body id="id01">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand"
				href="http://localhost:8090/PlayofGround/main"> <img
				src="../main_images/로고.png"> Play of Ground
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="http://localhost:8090/soccer/list">홈
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8090/board/list">매칭게시판</a></li>
					<%
						try {
							if (apiId == null && userId == null) {
					%>
					<li class="nav-item"><a id="modal_btn" class="nav-link"
						href="#">로그인</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8090/MyPage/Information">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8090/MyPage/mypageDelete">삭제</a></li>
					<li class="nav-item"><a href="#" class="nav-link"
						onclick="logout()">로그아웃</a></li>
					<%
						}
						} catch (NullPointerException e) {
						}
					%>

				</ul>
			</div>
		</div>
	</nav>
	<div class="black_bg"></div>
	<div class="modal_wrap">
		<div class="modal_close">
			<a href="#">close</a>
		</div>
		<div>
			<form name="loginInfo" action="/PlayofGround/login" method="post"
				onsubmit="return checkValue()">
				<fieldset>
					<legend>Login</legend>
					아이디 : <input id="user_id" type="text" name="userId"
						placeholder="아이디"><br> 비밀번호 : <input id="password"
						type="password" name="password" placeholder="비밀번호"><br>
					<a href="#" onclick="page_User()">회원가입</a>
					<button id="login_btn">로그인</button>
					<br> <a id="kakaologin_btn"
						href="https://kauth.kakao.com/oauth/authorize?client_id=de4d29672e935f64ea8e839daf222c18&redirect_uri=http://localhost:8090/auth/kakao/callback&response_type=code">
						<img alt="이미지가 없습니다." src="/static_image/kakao_login_button.png">
					</a>
				</fieldset>
			</form>
		</div>
	</div>
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-3">

				<h1 class="my-4">구장정보</h1>
				<div class="list-group">
					<a href="http://localhost:8090/soccer/list" class="list-group-item"><font
						color=black><i class="far fa-futbol"></i>Soccer</font></a> <a
						href="http://localhost:8090/footsal/list" class="list-group-item"><font
						color=#005666><i class="fas fa-futbol"></i>Footsal</font></a> <a
						href="http://localhost:8090/basketball/list"
						class="list-group-item"><font color=orange><i
							class="fas fa-basketball-ball"></i>Basketball</font></a>
					<%
						try {
							if (manager == 1) {
					%>
					<a href="http://localhost:8090/soccer/Form" class="list-group-item"><font
						color=black><i class="far fa-futbol"></i>Soccer 구장 등록</font></a> <a
						href="http://localhost:8090/footsal/Form" class="list-group-item"><font
						color=#005666><i class="fas fa-futbol"></i>Footsal 구장 등록</font></a> <a
						href="http://localhost:8090/basketball/Form"
						class="list-group-item"><font color=orange><i
							class="fas fa-basketball-ball"></i>Basketball 구장 등록</font></a>
					<%
						}
						} catch (NullPointerException e) {
						}
					%>
				</div>
				<div id="messageWindow2" style="padding:10px 0;height: 21em; overflow: auto; background-color: white;border-radius: 7px;"></div>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9" style="border: 1px solid #49505733;">
				<div class="border">
					<div style="position:absolute; width:100%; height: 38px; top: 3%;text-align: center;font-size: x-large;">
					<strong>[매칭게시판]</strong> 
					</div>
					<div style="position:absolute; width:100%; height: 30px; top: 15%; background: lightgray; ">
					아이디 : <span>${data.id }</span>
					</div>
					<div style="position:absolute; width:100%; height: 30px; top: 22%;background: lightsteelblue; ">
					작성자 : <span>${data.name }</span>
					</div>
					<div style="position:absolute; width:100%; height: 40px; top: 29%;background: lightcoral; ">
					제목 : <span>${data.title }</span></div>
					<div style="position:absolute; width:100%; height: 42%; top: 39%;background: lightyellow; ">
					내용 : <span> ${data.context }</span></div>
					<div style="position:absolute; width:100%; height: 30px;  top: 84%;background: lightpink;text-align: right;font-size: small; ">
					작성일 : <span>${data.iDate }</span></div>
					<div style="position:absolute; width:100%; height: 30px;  top: 90%;text-align: center;font-size: small; ">
					<a href="view?id=${data.id}"><button>수정</button></a>
				<a href="delete?id=${data.id}"><button>삭제</button></a></div>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.col-lg-9 -->
		<!-- /.row -->
		<!-- /.container -->
	</div>
	</div>
	<!-- Footer -->
	<footer class="py-5 bg-dark" id="id02">
		<div class="container">
			<p class="m-0 text-center text-white">
				Copyright &copy; <font color=red>PlayofGround</font> 2021
			</p>
		</div>
		<!-- /.container -->
	</footer>
	<!-- Bootstrap core JavaScript -->
	<script
		src="../startbootstrap-shop-homepage-gh-pages/vendor/jquery/jquery.min.js"></script>
	<script
		src="../startbootstrap-shop-homepage-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>