<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String userId = (String) session.getAttribute("userId");
	Integer apiId = (Integer) session.getAttribute("apiId");
	Byte manager = (Byte) session.getAttribute("manager");
%>
<%System.out.println("아이디값: " + System.getProperty("user.name"));%>
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
	}                                           /*session.getId().substring(0, 6)*/
%>
<c:if test="${(userId ne '') and !(empty userId)}">
        <input type="hidden" value='${userId }' id='chat_id' />
    </c:if>
    <c:if test="${(userId eq '') or (empty userId)}">
        <input type="hidden" value='<%=userId%>'
            id='chat_id' />
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
<link href="../startbootstrap-shop-homepage-gh-pages/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../startbootstrap-shop-homepage-gh-pages/css/shop-homepage.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

$(function() {
	//reservation_btn 버튼을 클릭했을 때
	$("#userForm").on("submit", function() {
		//login_btn 를 param.
		var reservationDate = $("#reservationDate").val();
		var reservationAddress = $("#reservationAddress").val();
		var reservationName = $("#reservationName").val();
		var userId = $("#user_id").val();
		var apiId = $("#api_id").val();
		var name = $("#name").val();
		var phone = $("#phone").val();
		console.log(reservationDate);
		console.log(reservationAddress);
		console.log(reservationName);
		console.log(userId);
		console.log(apiId);
		console.log(name);
		console.log(phone);
		$.ajax({
			async : true,
			type : 'POST',
			data : {"reservationDate" : reservationDate, 
					"reservationAddress" : reservationAddress, "reservationName" : reservationName,
					"userId" : userId, "apiId" : apiId, "name" : name, "phone" : phone},
			url : "http://localhost:8090/reservation/insert",
			success : function(num) {
			 	console.dir(num);
				if (num === 1) {
					
					alert("이미 예약이 된 날짜 입니다. \n다른날짜를 선택해주세요.");
					
					$("#reseArvationDate").value = "";
					$("#reservationDate").focus();
					return false;
					
				} else {
					alert("예약이 완료 되었습니다.");
					location.href = "http://localhost:8090/";
					return true;
				}
			},
			error : function(e) {
				alert("error : " + e); 
			}
		});
		return false;
	}); 
});	

$(function() {
	$("#reservationDate").datepicker({
				changeMonth : true,
				changeYear : true,
				minDate : '-50y',
				nextText : '다음 달',
				prevText : '이전 달',
				yearRange : 'c-50:c+20',
				showButtonPanel : true,
				currentText : '오늘 날짜',
				closeText : '닫기',
				dateFormat : "yy-mm-dd",
				showAnim : "slide",
				showMonthAfterYear : true,
				dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
						'7월', '8월', '9월', '10월', '11월', '12월' ]
			});
});
</script>
</head>
<style media="screen">

#button{
	position: sticky;
    top: 92%;
    margin-left: 10px;
}
.chat{
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

   table.table2{
                border-collapse: separate;
                border-spacing: 1px;
                text-align: left;
                line-height: 1.5;
                border-top: 1px solid #ccc;
                margin : 20px 10px;
        }
        table.table2 tr {
                 width: 50px;
                 padding: 10px;
                font-weight: bold;
                vertical-align: top;
                border-bottom: 1px solid #ccc;
        }
        table.table2 td {
                 width: 100px;
                 padding: 10px;
                 vertical-align: top;
                 border-bottom: 1px solid #ccc;
        }
 
</style>
<body>
<body id="id01">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="http://localhost:8090/PlayofGround/main"> <img
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
					<li class="nav-item"><a class="nav-link" href="http://localhost:8090/board/list">매칭게시판</a></li>
					<%
						try {
							if (apiId == null && userId == null) {
					%>
					<li class="nav-item"><a id="modal_btn" class="nav-link"
						href="#">로그인</a></li>
					<%
						} else {
					%>
					<li class="nav-item">
						<a class="nav-link" href="http://localhost:8090/MyPage/Information">마이페이지</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="http://localhost:8090/MyPage/mypageDelete">삭제</a>
					</li>
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
					아이디 : <input id="user_id" type="text" name="userId" placeholder="아이디"><br>
					비밀번호 : <input id="password" type="password" name="password" placeholder="비밀번호"><br>
					<a href="#" onclick="page_User()">회원가입</a>
					<button id="login_btn" >로그인</button><br>
					<a id="kakaologin_btn" href="https://kauth.kakao.com/oauth/authorize?client_id=de4d29672e935f64ea8e839daf222c18&redirect_uri=http://localhost:8090/auth/kakao/callback&response_type=code">
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
						href="http://localhost:8090/basketball/list" class="list-group-item"><font
						color=orange><i class="fas fa-basketball-ball"></i>Basketball</font></a>
					<%
					try{
						if (manager == 1) {
					%> 
					<a href="http://localhost:8090/soccer/Form" class="list-group-item"><font
						color=black><i class="far fa-futbol"></i>Soccer 구장 등록</font></a> <a
						href="http://localhost:8090/footsal/Form" class="list-group-item"><font
						color=#005666><i class="fas fa-futbol"></i>Footsal 구장 등록</font></a> <a
						href="http://localhost:8090/basketball/Form" class="list-group-item"><font
						color=orange><i class="fas fa-basketball-ball"></i>Basketball 구장 등록</font></a>
				 	<%
						}
						} catch (NullPointerException e) {
						}
					%> 
				</div>
				 
			</div>
			<!-- /.col-lg-3 -->
<%
	try {
			if (apiId == null) {
%>
	<form id="userForm" action="/reservation/insert" method="post">
	<fieldset style="width:800px; margin: auto;">
		<table width="800" align="center">
			<tr height="100">
				<td align="center" style="font-size: xx-large;">
					<b>[구장 예약]</b>
				</td>
			</tr>
		</table>
		<table width="700" height="600" cellpadding="0" style="border-collapse: collapse; font-size: 9pt;" align="center">
      		<tr class="register" height="30">
				<td width="20%" align="center">*</td>
				<th width="20%">구장 이름 : </th>
				<td>
					<input type="text" id="reservationName" name="reservationName" value="${soccer.soccerName}${footsal.footsalName}${basketball.basketballName}" readonly><br>
				</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<td width="20%" align="center">*</td>
				<th width="20%">구장 위치 주소 : </th>
				<td>
					<input type="text" id="reservationAddress" name="reservationAddress" value="${soccer.soccerAddress}${footsal.footsalAddress}${basketball.basketballAddress}" readonly><br>
        	  	</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<td width="20%" align="center">*</td>
				<th width="20%">예약 날짜 : </th>
				<td>
					<input type="text" id="reservationDate" name="reservationDate" placeholder="클릭하세요"><br>
        	  	</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
					<td width="20%" align="center">*</td>
					<th width="20%">회원 ID :</th>
					<td><input type="text" name="userId" id="user_id" value="${userId}" readonly /></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<td width="20%" align="center">*</td>
				<th width="20%">예약자 성함 : </th>
				<td>
					<input type="text" id="name" name="name" placeholder="예약자 성함" required><br>
        	  	</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<td width="20%" align="center">*</td>
				<th width="20%">예약자 연락처 : </th>
				<td>
					<input type="text" id="phone" name="phone" placeholder="예약자 연락처" required><br>
        	  	</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<th colspan="3" style="text-align: center;">
            		<input id="reservation_btn" type="submit" value="예약">
            		<input onclick="Cancellation()" type="submit" value="취소">
				</th>
			</tr>
		</table>
	</fieldset>
	</form>
	<%
		} else {
	%>
	<form id="userForm" action="/reservation/insert" method="post">
	<fieldset style="width:800px; margin: auto;">
		<table width="800" align="center">
			<tr height="100">
				<td align="center" style="font-size: xx-large;">
					<b>[구장 예약]</b>
				</td>
			</tr>
		</table>
		<table width="700" height="600" cellpadding="0" style="border-collapse: collapse; font-size: 9pt;" align="center">
      		<tr class="register" height="30">
				<td width="20%" align="center">*</td>
				<th width="20%">구장 이름 : </th>
				<td>
					<input type="text" name="reservationName" value="${soccer.soccerName}${footsal.footsalName}${basketball.basketballName}" readonly><br>
				</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<td width="20%" align="center">*</td>
				<th width="20%">구장 위치 주소 : </th>
				<td>
					<input type="text" name="reservationAddress" value="${soccer.soccerAddress}${footsal.footsalAddress}${basketball.basketballAddress}" readonly><br>
        	  	</td>
			</tr>
				<tr height="7">
					<td colspan="3"><hr /></td>
				</tr>
			<tr class="register" height="30">
				<td width="20%" align="center">*</td>
				<th width="20%">예약 날짜 : </th>
				<td>
					<input type="text" id="reservationDate" name="reservationDate" placeholder="클릭하세요"><br>
        	  	</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
					<td width="20%" align="center">*</td>
					<th width="20%">회원 ID :</th>
					<td><input type="text" name="apiId" id="api_id" value="${apiId}" readonly /></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<td width="20%" align="center">*</td>
				<th width="20%">예약자 성함 : </th>
				<td>
					<input type="text" name="name" placeholder="예약자 성함" required><br>
        	  	</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<td width="20%" align="center">*</td>
				<th width="20%">예약자 연락처 : </th>
				<td>
					<input type="text" name="phone" placeholder="예약자 연락처" required><br>
        	  	</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<th colspan="3" style="text-align: center;">
            		<input id="reservation_btn" type="submit" value="예약">
            		<input onclick="Cancellation()" type="submit" value="취소">
				</th>
			</tr>
		</table>
	</fieldset>
	</form>
	<%
		}
		} catch (NullPointerException e) {
		}
	%>
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
	<script src="../startbootstrap-shop-homepage-gh-pages/vendor/jquery/jquery.min.js"></script>
	<script src="../startbootstrap-shop-homepage-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	
	//웹소켓 설정
	var webSocket = new WebSocket('ws://localhost:8090/broadcasting');
	
	var inputMessage = document.getElementById('inputMessage');
	//같은 이가 여러번 보낼때 이름 판별할 변수
	var re_send = <%=userId%>;

	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		onMessage(event)
	};

	//	OnClose는 웹 소켓이 끊겼을 때 동작하는 함수.
	function onClose(event){
		var div=document.createElement('div');
		
		//접속했을 때 접속자들에게 알릴 내용.
		webSocket.send("<%=userId%> is DisConnected\n");
	}

	//	OnMessage는 클라이언트에서 서버 측으로 메시지를 보내면 호출되는 함수.
	function onMessage(event) {

		//클라이언트에서 날아온 메시지를 |\| 단위로 분리한다
		var message = event.data.split("|\|");
		
			//금방 보낸 이를 re_send에 저장하고,
			//금방 보낸 이가 다시 보낼경우 보낸이 출력 없도록 함.
			if(message[0] != re_send){
				//messageWindow2에 붙이기
				var who = document.createElement('div');

				who.style["padding"]="3px";
				who.style["margin-left"]="3px";

				who.innerHTML = message[0];
				document.getElementById('messageWindow2').appendChild(who);

				re_send = message[0];
			}
		
			//div는 받은 메시지 출력할 공간.
			var div=document.createElement('div');
		
			div.style["width"]="auto";
			div.style["word-wrap"]="break-word";
			div.style["display"]="inline-block";
			div.style["background-color"]="#fcfcfc";
			div.style["border-radius"]="3px";
			div.style["padding"]="3px";
			div.style["margin-left"]="3px";

			div.innerHTML = message[1];
			document.getElementById('messageWindow2').appendChild(div);
		
		//clear div 추가. 줄바꿈용.		
		var clear=document.createElement('div');
		clear.style["clear"]="both";
		document.getElementById('messageWindow2').appendChild(clear);
		
		//div 스크롤 아래로.
		messageWindow2.scrollTop = messageWindow2.scrollHeight;
		
	}

	//	OnOpen은 서버 측에서 클라이언트와 웹 소켓 연결이 되었을 때 호출되는 함수.
	function onOpen(event) {
		
		//접속했을 때, 내 영역에 보이는 글.
		var div=document.createElement('div');
		
		div.style["text-align"]="center";
		
		div.innerHTML = "반갑습니다.";
		document.getElementById('messageWindow2').appendChild(div);
		
		var clear=document.createElement('div');
		clear.style["clear"]="both";
		document.getElementById('messageWindow2').appendChild(clear);
		
		//접속했을 때 접속자들에게 알릴 내용.
		webSocket.send("<%=userId%>|\|안녕하세요^^");
	}

	//	OnError는 웹 소켓이 에러가 나면 발생을 하는 함수.
	function onError(event) {
		alert("chat_server connecting error " + event.data);
	}
	
	// send 함수를 통해서 웹소켓으로 메시지를 보낸다.
	function send() {

		//inputMessage가 있을때만 전송가능
		if(inputMessage.value!=""){
			
			//	서버에 보낼때 날아가는 값.
			webSocket.send("<%=userId%>|\|" + inputMessage.value);
			
			// 채팅화면 div에 붙일 내용
			var div=document.createElement('div');
			
			div.style["width"]="auto";
			div.style["word-wrap"]="break-word";
			div.style["float"]="right";
			div.style["display"]="inline-block";
			div.style["background-color"]="#ffea00";
			div.style["padding"]="3px";
			div.style["border-radius"]="3px";
			div.style["margin-right"]="3px";

			//div에 innerHTML로 문자 넣기
			div.innerHTML = inputMessage.value;
			document.getElementById('messageWindow2').appendChild(div);

			//clear div 추가
			var clear = document.createElement('div');
			clear.style["clear"] = "both";
			document.getElementById('messageWindow2').appendChild(clear);
			
			//	?
			//inputMessage.value = "";

			//	inputMessage의 value값을 지운다.
			inputMessage.value = '';

			//	textarea의 스크롤을 맨 밑으로 내린다.
			messageWindow2.scrollTop = messageWindow2.scrollHeight;
			
			//	금방 보낸 사람을 임시 저장한다.
			re_send = "<%=userId%>";
		}//inputMessage가 있을때만 전송가능 끝.
		
	}
</script>
</body>
</html>