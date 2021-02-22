<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String userId = (String) session.getAttribute("userId");
	Integer apiId = (Integer) session.getAttribute("apiId");
	Byte manager = (Byte) session.getAttribute("manager");
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
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64368b5f76e7c60683cd77d95a4074a4&libraries=services"></script>

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

.rightnav_1 {
	position: fixed;
	background-color: inherit;
	width: 100px;
	height: 100px;
	left: 90%;
	top: 83%;
}

.rightnav_2 {
	font-size: 40px;
	width: 50%;
	height: 100%;
}

.modal_wrap {
	display: none;
	width: 314px;
	height: 195px;
	position: absolute;
	top: 36%;
	left: 94%;
	margin: -250px 0 0 -250px;
	background: #eee;
	z-index: 2;
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

.middle_top {
	border-bottom: 1px solid black;
	border-top: 1px solid black;
	font-size: 20px;
	font-weight: bold;
	text-align: left;
	margin-bottom: 20px;
}

.middle_top span {
	font-size: 14px;
}

#infoBodyRight>#infoBodyIconContainer>.col-xs-3 img {
	width: 67.47px;
}

.col-xs-3>div {
	margin-right: 15px;
	text-align: center;
}

#reservation {
	text-align: center;
	margin-top: 40px;
	font-size: xx-large;
	border: 1px solid black;
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
				<div id="map" style="width: 89%; height: 17%; position: absolute; top: 17%"></div>
				
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<div class="middle_top">
						구장 상세보기 <span>구장상세정보를 확인하세요</span>
					</div>
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid"
								src="${pageContext.request.contextPath}/soccer_img/${soccer.soccerImg}"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="../main_images\축구장1.jpg"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="../main_images\축구장2.jpg"
								alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
				<div id="infoContainer" class="container-fluid">
					<div id="infoHead" class="row">
						<div class="col-xs-12">
							<h2 id="infoName">${soccer.soccerName}</h2>
							<h4 id="infoAddr">
								${soccer.soccerAddress}&nbsp;
								<div id="detail-get-direction"
									style="color: #499df2; font-weight: 500; display: inline-block; line-height: 2.0; cursor: pointer">길찾기
								</div>
							</h4>
							<!--<h5 id="infoTel">(예약 문의:)</h5>-->
						</div>
					</div>
					<div id="infoBody">
						<div class="row">
							<div id="infoBodyLeft" class="col-xs-6">
								<div id="sizeContainerFut" class="col-xs-12">
									<div class="square"></div>
									<h3>구장안내</h3>
									<br>
									<h4>구장 연락처 : ${soccer.soccerPhone}</h4>
									<br>
									<h4>구장크기 : ${soccer.soccerStandard}</h4>
									<br>
									<h4>대여료 : ${soccer.soccerPrice}</h4>
									<br>
								</div>
							</div>
							<div id="infoBodyRight" class="col-xs-6"
								style="padding-left: 125px;">
								<div id="infoBodyIconContainer" class="col-xs-12 fut">
									<div class="col-xs-3" style="display: flex;">
										<c:if test="${soccer.soccerGrass == 1 }">
											<div>
												<img
													src="${pageContext.request.contextPath}/soccer_img/천연잔디.png"
													alt="잔디"><br> <span>천연잔디</span><br>
											</div>
										</c:if>
										<c:if test="${soccer.soccerGrass == 0 }">
											<div>
												<img
													src="${pageContext.request.contextPath}/soccer_img/인조잔디.png"
													alt="잔디"><br> <span>인조잔디</span><br>
											</div>
										</c:if>
										<!--<h6></h6>-->
										<c:if test="${soccer.soccerLighting == 1 }">
											<div>
												<img
													src="${pageContext.request.contextPath}/soccer_img/조명 있음.png"
													alt="조명"><br> <span>조명 있음</span><br>
											</div>
										</c:if>
										<c:if test="${soccer.soccerLighting == 0 }">
											<div>
												<img
													src="${pageContext.request.contextPath}/soccer_img/조명 없음.png"
													alt="조명"><br> <span>조명 없음</span><br>
											</div>
										</c:if>
										<!--<h6></h6>-->
										<c:if test="${soccer.soccerParking == 1 }">
											<div>
												<img
													src="${pageContext.request.contextPath}/soccer_img/주차장 있음.png"
													alt="주차장"><br> <span>주차장 있음</span><br>
											</div>
										</c:if>
										<c:if test="${soccer.soccerParking == 0 }">
											<div>
												<img
													src="${pageContext.request.contextPath}/soccer_img/주차장 없음.png"
													alt="주차장"><br> <span>주차장 없음</span><br>
											</div>
										</c:if>
										<!--<h6></h6>-->
										<c:if test="${soccer.soccerShower == 1 }">
											<div>
												<img
													src="${pageContext.request.contextPath}/soccer_img/샤워실 있음.png"
													alt="샤워실"><br> <span>샤워실 있음</span><br>
											</div>
										</c:if>
										<c:if test="${soccer.soccerShower == 0 }">
											<div>
												<img
													src="${pageContext.request.contextPath}/soccer_img/샤워실 없음.png"
													alt="샤워실"> <br> <span>샤워실 없음</span><br>
											</div>
										</c:if>
									</div>
									<%
						try {
							if (manager == 1) {
					%>
									<div id="reservation">
										<a href="updateForm?id=${soccer.id}">구장 정보 수정</a> <a
											href="delete?id=${soccer.id}">구장 정보 삭제</a> <a
											href="reservation?id=${soccer.id}"> 예약하기 </a>
									</div>
									<%
						} else {
					%>
									<div id="reservation">
										<a href="reservation?id=${soccer.id}"> 예약하기 </a>
									</div>
									<%
						}
						} catch (NullPointerException e) {
						}
					%>
								</div>
							</div>
						</div>
						<div id="infoBody3">
							<div class="row"">
								<div id="infoBodyLeft3" class="col-xs-12">
									<div id="noticeContainer">
										<hr>
										<h3>이용규칙</h3>
										<pre>

■ 운동시에는 마스크를 꼭 착용해주셔야합니다. 호흡이 어려운 경우 운동템포와 휴식시간을 조정해주세요.
■ 실내구장의 경우에는 휴식시에도 마스크를 착용해주셔야합니다.
■ 야외구장의 경우에는 휴식시 2M 이상 거리를 유지해주세요.

■ 위 내용이 지켜지지 않을 경우 퇴장조치 될 수 있으니 예약시 꼭 참고부탁드립니다.
					</pre>
									</div>
								</div>
								<div id="infoBodyRight3" class="col-xs-12" style="width: 825px;">
									<div id="payRuleContainer">
										<hr>
										<h4 style="margin: 30px 0; display: block;">※ 규정 외 요청은
											적용이 불가합니다. 예약 전 반드시 확인해 주시기 바랍니다.</h4>
										<hr>
										<h3>환불 규정</h3>
										<pre>
■ 환불은 예약 날짜를 기준으로만 적용합니다. (예약 시간으로는 적용되지 않습니다)	<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	margin: -10px 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-cey4 {
	border-color: inherit;
	font-size: 15px;
	text-align: left;
	vertical-align: top;
	border: none;
}

.tg .tg-60uc {
	border-color: inherit;
	font-size: 15px;
	text-align: left;
	vertical-align: top;
	border: none;
}

.tg .tg-gmla {
	border-color: inherit;
	font-size: 15px;
	text-align: center;
	vertical-align: top
}

.tg .tg-nej2 {
	background-color: #d6d6d6;
	border-color: inherit;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
	vertical-align: top
}
</style>
	<table class="tg" style="table-layout: fixed; width: 600px">
	<colgroup>
	<col style="width: 100px">
	<col style="width: 100px">
	<col style="width: 100px">
	<col style="width: 100px">
	<col style="width: 100px">
	</colgroup>
	<thead>
		<tr>
			<th class="tg-60uc" colspan="5"> 예를들어, <span
															style="font-weight: bold">5월 7일</span> 예약일 경우 다음과 같습니다</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="tg-nej2">이용 당일</td>
			<td class="tg-nej2">이용 1일 전</td>
			<td class="tg-nej2">이용 2일 전</td>
			<td class="tg-nej2">이용 5일 전</td>
			<td class="tg-nej2">이용 10일 전</td>
		</tr>
		<tr>
			<td class="tg-gmla">5월 7일</td>
			<td class="tg-gmla">5월 6일</td>
			<td class="tg-gmla">5월 5일</td>
			<td class="tg-gmla">5월 2일</td>
			<td class="tg-gmla">4월 27일</td>
		</tr>
	</tbody>
	</table>
 - 사용 3일 전까지 : 100% 환불
 - 2일 전 : 50% 환불
 - 1일 전 ~ 당일 : 환불 불가

** 우천시, 폭설, 천재지변 등 날씨에 관련된 환불은 상단의 구장 환불규정에 따라 처리되며 아래와 같을 시 
날짜시간변경이 가능합니다.
1. 이용 1시간 전 부터 이용 할때 까지 1시간 강수량이 최대 15mm 이상일 때
2. 제설이 안되어서 구장 사용이 어려울 때

** 구장 환불규정에 천재지변의 기준이 없을 경우 호우경보, 대설경보, 태풍주의보, 태풍경보의 경우만
  천재지변으로 판단합니다.

** 기상현상으로 인한 환불 및 날짜시간변경은 예약된 이용시간 종료 전에 구장연락처로 말씀해주셔야합니다. 
 그 이후에는 어떠한 경우라도 상단의 구장 환불 규정대로 처리됩니다.



					</pre>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.col-lg-9 -->
			<!-- /.row -->
			<!-- /.container -->
			<div class="rightnav">
				<div class="rightnav_1">
					<table class="rightnav_2">
						<tr>
							<td><a href="#id01"><i
									class="far fa-arrow-alt-circle-up"></i></a></td>
						</tr>
						<tr>
							<td><a href="#id02"><i
									class="far fa-arrow-alt-circle-down"></i></a></td>
						</tr>
					</table>
				</div>
			</div>
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
	
<script type="text/javascript">
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.56197087935768, 126.8640166441201), // 지도의 중심좌표
    level: 7 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.56197087935768, 126.8640166441201); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

//아래 코드는 지도 위의 마커를 제거하는 코드입니다
//marker.setMap(null);    
</script>
</body>
</html>