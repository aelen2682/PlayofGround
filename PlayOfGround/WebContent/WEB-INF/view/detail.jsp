<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style type="text/css">
        #wrap {
            width: 800px;
            margin: 0 auto 0 auto;
        }

        #detailBoard{
            text-align :center;
        }

        #title{
            height : 16;
            font-family :'돋움';
            font-size : 12;
            text-align :center;
        }
    </style>
</head>
<body>
	<div id="wrap">
    <br><br>
    <div id="board">
        <table id="detailBoard" width="800" border="3" bordercolor="lightgray">

            <tr>
                <td id="title">아이디</td>
                <td>${data.id }</td>
            </tr>
            <tr>
                <td id="title">작성자</td>
                <td>${data.name }</td>
            </tr>
            <tr>
                <td id="title">제목</td>
                <td>${data.title }</td>
            </tr>
            <tr>
                <td id="title">내용</td>
                <td> ${data.context }</td>
            </tr>
            <tr>
                <td id="title">작성일</td>
				<td>${data.iDate }</td>
            </tr>

            <tr align="center" valign="middle">
                <td colspan="5">

                <a href="view?id=${data.id}"><button>수정</button></a>
				<a href="delete?id=${data.id}"><button>삭제</button></a>
                 
              
              
                </td>
            </tr>
        </table>
    </div>
</div>
	
</body>
</html>