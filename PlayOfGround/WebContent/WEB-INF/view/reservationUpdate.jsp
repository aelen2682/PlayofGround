<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 리스트</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

function DateCheck(){
   var datepicker = document.getElementById("datepicker").value;
   var DatePatten = /^202([1|99]?)-([0-9]{2})-([0-9]{2})$/;

   if(!DatePatten.test(datepicker)){
   window.alert("날짜 형식이 잘못 되었습니다 (예시) 2021-00-00 ")
   document.getElementById("datepicker").value="";
   datepicker.focus();
   }
}

function phoneCheck() {
   var phone = document.getElementById("phone").value;
   var phonePattern = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;

   if (!phonePattern.test(콜)) {
    window.alert("핸드폰 번호 형식이 아닙니다.")
    document.getElementById("phone").value="";
    phone.focus();
   }
}

function nameCheck() {
     var name = document.getElementById("name").value;
     var namePattern = /([^가-힣\x20a-zA-Z])/i;  //한글과 영어만

     if (namePattern.test(name)){ //패턴에 포함되지 않은 문자 메세지 출력
       window.alert("이름 형식이 아닙니다.")
       name.value="";
       name.focus();
     }

      if (name.length < 2 || name.length > 10) {
       window.alert("이름은 2글자 이상, 10글자 이하로 입력하세요.");
         document.getElementById("name").innerHTML="";
       document.getElementById("name").value="";
         document.getElementById("name").focus();
       }
     }


   
function upDate() {
   window.alert("수정이 완료되었습니다.")
}




</script>
</head>
<body>
   <fieldset style="width: 800px; margin: auto;">
      <table width="800" align="center">
         <tr height="100">
            <td align="center" style="font-size: xx-large;">
               <b>[구장 예약 수정]</b>
            </td>
         </tr>
      </table>
   </fieldset>
<%
   String userId = (String) session.getAttribute("userId");
   Integer apiId = (Integer) session.getAttribute("apiId");
   System.out.println("userId: " + userId + ", apiId: " + apiId );
   try {
      if (apiId == null) {
%>
<form action="/reservation/update" method="post">
   <fieldset style="width: 800px; margin: auto;">
      <table width="800" height="600" cellpadding="0"
         style="border-collapse: collapse; font-size: 9pt;" align="center">
         <tr class="register" height="30">
            <td width="15%" align="center">*</td>
            <th width="15%">구장 이름 :</th>
            <td>
               <input type="hidden" name="id" value="${reservation.id}">
               
               <input type="text" name="reservationName" id="reservation_name" value="${reservation.reservationName}" readonly />
            </td>
         </tr>
         <tr height="7">
            <td colspan="3"><hr /></td>
         </tr>
         <tr class="register" height="30">
            <td width="15%" align="center">*</td>
            <th width="15%">구장 위치 정보 :</th>
            <td>
               <input type="text" name="reservationAddress" id="reservation_address" value="${reservation.reservationAddress}" readonly />
            </td>
         </tr>
         <tr height="7">
            <td colspan="3"><hr /></td>
         </tr>
         <tr class="register" height="30">
            <td width="15%" align="center">*</td>
            <th width="20%"> 예약 날짜 :</th>
            <td>
               <input type="text" id="datepicker" name="reservationDate" value="${reservation.reservationDate}" required onchange="DateCheck()"><br>
            </td>
         </tr>
            <tr height="7">
            <td colspan="3"><hr /></td>
         </tr>
         <tr class="register" height="30">
            <td width="15%" align="center">*</td>
            <th width="20%">회원 ID :</th>
            <td>
               <input type="text" name="userId" value="${userId}" readonly />
               </td>
         </tr>
         <tr height="7">
            <td colspan="3"><hr /></td>
         </tr>
         <tr class="register" height="30">
            <td width="15%" align="center">*</td>
            <th width="20%">이 름 :</th>
            <td>
            <input type="text" id="name" name="name" value="${reservation.name}" onchange="nameCheck()"
               /></td>
         </tr>
         <tr height="7">
            <td colspan="3"><hr /></td>
         </tr>
         <tr class="register" height="30">
            <td width="15%" align="center">*</td>
            <th width="20%">핸드폰 번호 :</th>
            <td>
               <input type="tel" id="phone" name="phone" value="${phone}" required  />
            </td>
         </tr>
         <tr height="7">
            <td colspan="3"><hr /></td>
         </tr>
         <tr class="register" height="30">
            <th colspan="3" style="text-align: center;">
            <input type="submit" value="수정" onclick="upDate()"> 
            <a href="#" onclick="Cancellation()"><button>취소</button></a>
            
            </th>
            
         </tr>
         
      </table>
      <br />
   </fieldset>
   </form>
<%
      } else {
%>
   <form action="/reservation/update" method="post">
   <fieldset style="width: 800px; margin: auto;">
      <table width="800" height="600" cellpadding="0"
         style="border-collapse: collapse; font-size: 9pt;" align="center">
         <tr class="register" height="30">
            <td width="15%" align="center">*</td>
            <th width="15%">구장 이름 :</th>
            <td>
               <input type="hidden" name="id" value="${reservation.id}">
               <input type="text" name="reservationName" id="reservation_name" value="${reservation.reservationName}"  onchange="nameCheck()" />
            </td>
         </tr>
         <tr height="7">
            <td colspan="3"><hr /></td>
         </tr>
         <tr class="register" height="30">
            <td width="15%" align="center">*</td>
            <th width="15%" ">구장 위치 정보 :</th>
            <td>
               <input type="text" name="reservationAddress" id="reservation_address" value="${reservation.reservationAddress}" readonly />
            </td>
         </tr>
         <tr height="7">
            <td colspan="3"><hr /></td>
         </tr>
         <tr class="register" height="30">
            <td width="15%" align="center">*</td>
            <th width="20%"> 예약 날짜 :</th>
            <td>
               <input type="text" id="datepicker" name="reservationDate" value="${reservation.reservationDate}" required required onchange="DateCheck()"><br>
            </td>
         </tr>
            <tr height="7">
            <td colspan="3"><hr /></td>
         </tr>
         <tr class="register" height="30">
            <td width="15%" align="center">*</td>
            <th width="20%">회원 ID :</th>
            <td>
               <input type="text" name="userId" value="${apiId}" readonly />
               </td>
         </tr>
         <tr height="7">
            <td colspan="3"><hr /></td>
         </tr>
         <tr class="register" height="30">
            <td width="15%" align="center">*</td>
            <th width="20%">이 름 :</th>
            <td>
            <input type="text" id="name" name="name" value="${reservation.name}" onchange="nameCheck()"
                /></td>
         </tr>
         <tr height="7">
            <td colspan="3"><hr /></td>
         </tr>
         <tr class="register" height="30">
            <td width="15%" align="center">*</td>
            <th width="20%">핸드폰 번호 :</th>
            <td>
               <input type="tel" id="phone" name="phone" value="${apiphone}" required onchange="phoneCheck()"/>
            </td>
         </tr>
         <tr height="7">
            <td colspan="3"><hr /></td>
         </tr>
         <tr class="register" height="30">
            <th colspan="3" style="text-align: center;">
            <input type="submit" value="수정" required onclick="upDate()"> 
            <a href="#" onclick="Cancellation()"><button>취소</button></a>
            <button>예약취소</button>
            </th>
         </tr>
      </table>
      <br />
   </fieldset>
   </form>
   <%
      }
      } catch (NullPointerException e) {
      }
   %>
</body>
</html>