<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String userId = (String) session.getAttribute("userId");
   Byte manager = (Byte) session.getAttribute("manager");
   Integer apiId = (Integer) session.getAttribute("apiId");   
   System.out.println("userId : "+ userId +", manager : " + manager);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style media="screen">
th {
   text-align: left;
   font-size: initial;
}
</style>

</head>
<body>
</head>
<body>
   <table width="800" align="center">
      <tr height="100">
         <td align="center" style="font-size: xx-large;"><b>[예약 현황]</b></td>
      </tr>
   </table>
   <c:forEach var="reservation" items="${ReservationList}">
      <fieldset id="" style="width: 800px; margin: auto;">
         <table width="800" height="600" cellpadding="0"
            style="border-collapse: collapse; font-size: 9pt;" align="center">
            <tr height="7">
               <td colspan="3"><hr /></td>
            </tr>
            <tr class="register" height="30">
               <td width="15%" align="center">*</td>
               <th width="20%">구장 이름 :</th>
               <td>${reservation.reservationName}</td>
            </tr>
            <tr height="7">
               <td colspan="3"><hr /></td>
            </tr>
            <tr class="register" height="30">
               <td width="15%" align="center">*</td>
               <th width="15%" style="text-align: left;">구장 주소 :</th>
               <td>${reservation.reservationAddress}</td>
            </tr>
            <tr height="7">
               <td colspan="3"><hr /></td>
            </tr>
            <tr class="register" height="30">
               <td width="15%" align="center">*</td>
               <th width="20%">예약 날짜 :</th>
               <td>${reservation.reservationDate}</td>
            </tr>
            <tr height="7">
               <td colspan="3"><hr /></td>
            </tr>
            <tr class="register" height="30">
               <td width="15%" align="center">*</td>
               <th width="20%">예약자 성함 :</th>
               <td>${reservation.name}</td>
            </tr>
            <tr height="7">
               <td colspan="3"><hr /></td>
            </tr>
            <tr class="register" height="30">
               <td width="15%" align="center">*</td>
               <th width="20%">에약자 연락처 :</th>
               <th>${reservation.phone}</th>
            </tr>
            <tr height="7">
               <td colspan="3"><hr /></td>
            </tr>
            <tr class="register" height="30">
               <th colspan="3" style="text-align: center;">
                  <a href="updateForm?id=${reservation.id}"><button>수정</button></a>
                  <a href="delete?id=${reservation.id}" > <button>예약취소</button ></a>
               </th>
            </tr>
         </table>
      </fieldset>
   </c:forEach>
   <br>
</body>
</html>