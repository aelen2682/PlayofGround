<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64368b5f76e7c60683cd77d95a4074a4&libraries=services"></script>
    <script type="text/javascript">
      $(function(){
        var cnt = 1; // 먼저 1로 초기화한걸 선언해줘야 된다.
        $("#next").click(function(){
          if($(this).text()=="다음"){
            // alert("test");
            if(cnt < 10){
              cnt++;
            }else{
              cnt =1;
            }
            if (cnt < 10) {
              cnt = "0"+cnt;
            }					//이미지 파일은=> /static_image/XXX0+cnt+.jpg 이런식으로 저장해야함
            $("#img").attr("src","images/bimg"+cnt+".jpg")
          }
        });
        var cnt = 10;
        $("#prev").click(function(){
          if($(this).text()=="이전"){
            // alert("test");
            if(cnt > 0){
              cnt--;
            }else{
              cnt =1;
            }
            if (cnt > 0) {
              cnt = "0"+cnt;
            }
            $("#img").attr("src","images/bimg"+cnt+".jpg")
          }
          });
      });
    </script>
    <style>
    body, html {height:100%; width:100%;}
    body{margin: 0;}
  .container {
    display: flex;
    flex-wrap: wrap;
    width: 100%;
    position: relative;
    background-color: red;
    height: 100%;
    margin: 0;
    min-width: 960px;
}
.top{
  position: relative;
  width: 100%;
  height: 6%;
  background-color:green;
}
.middle{
  position:relative;
  width:100%;
  height:89%;
  background-color:yellow;
  top:0%;
  margin: 0;
}
.middle_left{
  position: absolute;
  width: 20%;
  height: 100%;
  left: 17%;
  background-color: blue;
}
.middle_left_top{
  position: absolute;
  width: 100%;
  height: 20%;
  background-color: pink;
}
#map{
  position: absolute;
  width: 100%;
  height: 50%;
  background-color: orange;
  top:20%;
}
.middle_top{
  position: absolute;
  width: 41%;
  height: 4%;
  top: 2.5px;
  left: 37%;
  border-bottom: 1px solid black;
  border-top: 1px solid black;
  background-color: skyblue;
  font-size: 20px;
  font-weight: bold;
  text-align: left;
}
.middle_top span{
  font-size: 14px;
}
.middle_picture {
  width: 41%;
  height: 35%;
  background-color: red;
  position: absolute;
  left: 37%;
  top: 5.5%;
  border-radius:4%;
}
.middle_picture> #prev{
  /*버튼 위치*/
  position: absolute;
  top:45%;
  left:0%;
  /*버튼 모양*/
  background-color: blue;
  width: 50px;
  height: 40px;
  border-radius:25%;
  /*글자 모양,위치*/
  color:white;
  line-height: 40px;
  text-decoration: none;
  text-align: center;
}
.middle_picture> #next{
  /*버튼 위치*/
  position: absolute;
  top:45%;
  left:92%;
  /*버튼 모양*/
  background-color: blue;
  width: 50px;
  height: 40px;
  border-radius:25%;
  /*글자 모양,위치*/
  color:white;
  line-height: 40px;
  text-decoration: none;
  text-align: center;
}
.under{
  position: relative;
  width: 100%;
  height: 5%;
  top:0%;
  background-color: green;
}
.middle_text{
  position: absolute;
}
.Copyright{
  position: absolute;
  width: 31%;
  height: 80%;
  left: 44%;
  margin: 0;
  top: 16%;
}
</style>
</head>
<body>
<div class="container">
  <div class="top">
  </div>
  <div class="middle">
    <div class="middle_left">
      <div class="middle_left_top"></div>
      <div id="map">
      </div>
    </div>
    <!-- 상세보기글자-중앙상단 -->
    <div class="middle_top">
      구장 상세보기
      <span>구장상세정보를 확인하세요</span>
    </div>
    <div class="middle_picture">
      <img src="images/bimg01.jpg" style="width:100%;height:100%; position:absolute;
      border-radius: 4%; border: 4px solid green;" id="img">
      <a href="#" id="prev">이전</a>
      <a href="#" id="next">다음</a>
    </div>
    <div class="middle_text">

    </div>
  </div>
  <div class="under">
      <p class="Copyright">Copyright &copy; <font color=red>PlayofGround</font> 2021</p>
  </div>
</div>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.520379213157675, 126.99463922397365), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();

// 키워드로 장소를 검색합니다
ps.keywordSearch('신길동 카페', placesSearchCB);

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
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
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x)
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        /*  infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>'); */
    	 window.open('http://www.naver.com',marker);
    });
}
</script>
</body>
</html>