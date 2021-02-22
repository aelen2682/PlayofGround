<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>

<body>

	<form action="/api_join" method="post">
	<fieldset style="width:800px; margin: auto; border: 2px;">
		<table width="800" align="center">
			<tr height="100">
				<td align="center" style="font-size: xxx-large;color:#F7E600;">
					<b>KAKAO</b>
				</td>
			</tr>
		</table>
		<table width="700" height="600" cellpadding="0" style="border-collapse: collapse; font-size: 9pt;" align="center">
      		<tr class="register" height="30">
				<td width="15%" align="center">*</td>
				<th width="15%">소셜 정보 : </th>
				<td>
					<input type="text" id="company" name="company" value="카카오" readonly/>
					<span>"소셜정보은 자동으로 등록됩니다."</span>
					<input type="hidden" id="api_id" name="apiId" value="${apiId }">
				</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<td width="15%" align="center">*</td>
				<th width="20%">이 름 : </th>
				<td>
					<input type="text" id="name" name="name" placeholder="이 름" onchange="nameCheck()" required/>
            		<span>" 이름은 두 글자 이상 입력해주세요."</span>
        	  	</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<td width="15%" align="center">*</td>
				<th width="20%">성 별 : </th>
				<th style="text-align: left;">
					남 성<input type="radio" name="gender" value="남자" required />&nbsp;&nbsp;&nbsp;
					여 성<input type="radio" name="gender" value="여자" />
				</th>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<td width="15%" align="center">*</td>
				<th width="20%">핸드폰 번호 : </th>
				<td>
					<input type="tel" id="phone" name="phone" placeholder="핸드폰 번호" onchange="phoneCheck()" required/>
		            <span>" - 포함한 번호를 입력해주세요."</span>
				</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<td width="15%" align="center">*</td>
				<th width="20%">생년월일 : </th>
				<td><input type="date" name="birthDate" required/></td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<th colspan="3" style="text-align: center;">
            		<input type="submit" value="가입">
            		<input onclick="Cancellation()" type="submit" value="취소">
				</th>
			</tr>
		</table>
		<br />
      </fieldset>
	</form>

</body>
</html>