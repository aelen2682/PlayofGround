<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
    body, html {height:100%;}
  .container {
    width: 101%;
    position: relative;
    background-color: gray;
    height: 101%;
    margin: 0;
    min-width: 960px;
    left: -8px;
    top: -8px;
    overflow:hidden;
}
.left {
    /* background-image: url("PlayofGroundImages/풋살메인1.jpg"); */

    background-repeat: no-repeat;
    background-size: 100%;
    width: 33.33333%;
    background-color: gray;
    float: left;
    height:100%;
    animation: fadein 1s;
}
.left_01 img{
  position: absolute;
  width: 147px;
  height: 31px;
  top: 20px;
  left: 28px;
  transform: scale(1);
}
.left:hover{
  -webkit-filter:grayscale(40%);
}
.left_01 img:hover{
  transform: scale(1.06);
}
.center {
    /* background-image: url("PlayofGroundImages/축구메인1.jpg"); */
    background-repeat: no-repeat;
    background-size: 100%;
    width: 33.33333%;
    background-color: gray;
    float: left;
    height:100%;
    animation: fadein 2s;
}
.center_01{
  position: absolute;
  top: 75%;
  color: white;
  font-weight: bold;
  font-size: 34px;
  width: 315px;
  text-decoration: none;
}

.center_02{
  position: absolute;
  top: 20%;
  color: white;
  font-weight: bold;
  font-size: 60px;
  width: 100%;
  text-align: center;
  left: -3%;
}
.center:hover{
  -webkit-filter:grayscale(40%);
}
.right {
    background-image: url("PlayofGroundImages/농구메인1.jpg");
    background-repeat: no-repeat;
    background-size: 100%;
    width: 33.33333%;
    background-color: gray;
    float: left;
    height:100%;
    animation: fadein 3s;
}
.right:hover{
  -webkit-filter:grayscale(40%);
}

.main {
  position: absolute;
  top: 74%;
  color: white;
  font-weight: bold;
  font-size: 37px;
  width: 100%;
  text-align: center;
  transition: 0.5s;
 }
 .main:hover{
   transform: scale(1.1,1.5);
   color: white;
   text-shadow: 2px 2px 5px red;
 }
 a{
   text-decoration: none;
 }
@keyframes fadein {
  from {
      opacity: 0;
  }
  to {
      opacity: 1;
  }
}
.body{

}
</style>
</head>
<body>
<div class="container">
    <div class="left">
      <img src="/static_image/풋살메인1.jpg" width="100%" height="100%">
      <div class="left_01">
        <a href="#"><img src="/static_image/logo1.jpg"></a>
      </div> 
    </div>
    <div class="center">
      <img src="/static_image/축구메인1.jpg" width="100%" height="100%">
    </div>
    <div class="right">
      <img src="/static_image/농구메인1.jpg" width="100%" height="100%">
    </div>
    <div class="center_02">
    &nbsp; Information<br>
    &nbsp;&nbsp;&nbsp;&nbsp; & Reservation<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; & Matching<br>
  </div>
  <div class="main">
    <a href="http://localhost:8090/soccer/list">
      &nbsp;&nbsp;&nbsp;메인으로</a>
  </div>
</div>
</body>
</html>