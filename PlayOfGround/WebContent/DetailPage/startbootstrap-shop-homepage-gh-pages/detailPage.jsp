<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Bootstrap core CSS111 -->
<link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64368b5f76e7c60683cd77d95a4074a4&libraries=services"></script>
<!-- Custom styles for this template -->
<link href="css/shop-homepage.css" rel="stylesheet">
<!-- 달력 -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
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
.navbar-brand img {
	display: inline-block;
	width: 35px;
	height: 35px;
}

.my-4 {
	text-align: center;
}

.carousel-inner img {
	width: 900px;
	height: 350px;
}

.carousel-inner {
	border-radius: 1.25rem;
}

#map {
	position: absolute;
	width: 97%;
	height: 277px;
	background-color: white;
	top: 100px;
	float: left;
	left: 0%;
	border: 4px solid red;
	border-radius: 0.5em;
}

.Reservation {
	position: absolute;
    width: 97%;
    height: 143px;
    background-color: white;
    top: 410px;
    float: left;
    left: 0%;
    border: 4px solid red;
    border-radius: 1.5em;
}
.reInfo{
	position: absolute;
    width: 97%;
    height: 17%;
    top: 3%;
    left: 1%;
    text-align: center;
    font-size: xx-large;
}
.info {
	margin: 17px;
}
.date{
	position: absolute;
    top: 46%;
    left: 9%;
    border: 2px solid green;	
}
</style>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="http://www.naver.com"><img
				src="C:\Users\enker\Desktop\atom File\PlayofGroundImages\로고.png">
				Play of Gorund</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#">홈
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">매칭게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
					<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="my-4">구장상세보기</h1>
				<!-- 카카오맵 -->
				<div id="map"></div>
				<!-- 예약 -->
				<div class="Reservation">
				<div class="reInfo">구장예약하기</div>
				<div class="date"><input type="text" id="datepicker" placeholder="클릭하세요"></div> 
				</div>

			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid"
								src="C:\Users\enker\Desktop\atom File\PlayofGroundImages\마스크.jpg"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="C:\Users\enker\Desktop\atom File\PlayofGroundImages\축구장1.jpg"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid"
								src="C:\Users\enker\Desktop\atom File\PlayofGroundImages\축구장2.jpg"
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

				<div class="row">
					<!--구장 정보 적는 곳-->
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top"
								src="http://placehold.it/700x400" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="http://www.naver.com">잠실 종합운동장 보조 경기장</a>
								</h4>
								<h5>서울시 송파구 잠실동 10</h5>
								<p class="card-text">Lorem ipsum dolor sidt amet,
									consectetur adipisicing elit. Amet numquam aspernatur!</p>
							</div>
						</div>
					</div>
					<div class="info">
						<h4>이용안내</h4>
						<pre>■ 성인레슨 대체 운영 구장 ■
- 거리두기 정책에 따라 1월 31일까지는 일반 대관 대신 성인레슨 프로그램 형태로 운영됩니다. 예약시 꼭 참고 부탁드립니다.



※ 천마풋살파크를 이용하시는 모든 고객분들께 더 좋은 경험을 제공하기 위해
모든 구장이 친환경 인조잔디로 교체되었습니다. (2020.09월)

■구장당 예약시간내 주차차량 7대제한, 무료
(그외차량 주차불가)

■ 7대 초과 혹은 주차장 만차시 천마공영주차장 유료이용
( 도보3분, 5분당 50원 )

■음료판매 / 샤워실무료이용

■ 운동복 대여 가능

■풋살공,팀조끼 무료대여/풋살화 유료대여 3,000원
(우천시 풋살화 대여불가)

■ 축구화 착용불가 **

■인원제한

○운동하시는분,구경하시는분 상관없이 15명까지만 입장가능
     초과인원 퇴장조치

■구장이용제한

○축구화착용 또는 주차7대 제한 불이행시 구장이용이 불가능합니다.</pre>
						<hr>
						<h3>이용규칙</h3>
						<pre>■ 잔디보호와 부상방지를 위하여 스터드가 있는 축구화(SG,FG,HG,AG)는 착용이 금지되며, 풋살화(TG)만 착용 가능합니다.

■ 운동시에는 마스크를 꼭 착용해주셔야합니다. 호흡이 어려운 경우 운동템포와 휴식시간을 조정해주세요.
■ 실내구장의 경우에는 휴식시에도 마스크를 착용해주셔야합니다.
■ 야외구장의 경우에는 휴식시 2M 이상 거리를 유지해주세요.

■ 위 내용이 지켜지지 않을 경우 퇴장조치 될 수 있으니 예약시 꼭 참고부탁드립니다.
					</pre>
					</div>
				</div>
				<hr>
				<h4 style="margin: 30px 0; display: block;">※ 규정 외 요청은 적용이
					불가합니다. 예약 전 반드시 확인해 주시기 바랍니다.</h4>
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
- 7일 전 까지 : 100% 환불

- 6일 전 ~ 4일 전 : 70% 환불

- 3일 전 : 50% 환불

- 2일 전 ~ 당일 : 환불불가


<b>[ 변경 규정 ]</b>

- 이용 7일 전 까지 : 구장 허가 후 변경 가능 ( 예약시 안내된 구장연락처로 문의 )

- 이용 6일 전 ~ 이용 당일 : 변경 불가

- 일정변경은 최초1회만 가능하며 날짜 변경된 예약건은 환불 처리가 불가능합니다


<b>[ 날씨에 의한 환불 및 변경 규정 ]</b>

** 날씨에 의한 환불 및 변경 규정은 야외구장에만 적용됩니다.

** 우천시 다음과 같을 때 날짜 및 시간변경 요청이 가능합니다. ( 환불은 불가능합니다 )
-> <a href="http://www.weather.go.kr/weather/forecast/timeseries.jsp">기상청 날씨누리</a> 예보 기준 '구장 주소지', '이용 예정일시'의 '실시간' 강수량 확인
-> 1시간 강수량이 최대 1mm 이상일 때 (상단 실시간 예보)
-> <a href="http://www.iamground.kr/img/asset/rain_rule.jpg">예시 확인</a>


** 천재지변의 경우에는 100% 환불이 가능합니다. <br> 호우경보, 대설경보, 태풍주의보, 태풍경보의 경우만 천재지변으로 판단합니다.

** 기상현상으로 인한 환불 및 날짜시간변경은 예약된 이용시간 시작 1시간 전에 구장연락처 혹은 플러스친구로<br>  말씀해주셔야합니다. 그 이후에는 현장 관리자가 결정합니다.

** 구장 이용 중 비가 오기 시작 할 경우 관련 사항은 현장 관리자가 결정합니다.



					</pre>
			</div>
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

	<!-- Bootstrap core JavaScript 
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>-->
</body>
<script>
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({
		zIndex : 1
	});

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : new kakao.maps.LatLng(37.520379213157675, 126.99463922397365), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();

	// 키워드로 장소를 검색합니다
	ps.keywordSearch('신길동 카페', placesSearchCB);

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			var bounds = new kakao.maps.LatLngBounds();

			for (var i = 0; i < data.length; i++) {
				displayMarker(data[i]);
				bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			}

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {

		// 마커를 생성하고 지도에 표시합니다
		var marker = new kakao.maps.Marker({
			map : map,
			position : new kakao.maps.LatLng(place.y, place.x)
		});

		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
			// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			/*  infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>'); */
			window.open('http://www.naver.com', marker);
		});
	}
</script>

</html>