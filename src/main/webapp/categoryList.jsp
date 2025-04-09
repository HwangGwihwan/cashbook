<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String login = (String)(session.getAttribute("login"));

	if (login == null) { // 로그아웃 상태
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>카테고리</title>
    <style>
 /* Reset some default styles */
        body, h1, div, a, table {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            height: 100vh;
            margin: 0;
            color: #333;
            position: relative;
        }

        /* Header section */
        h1 {
            font-size: 36px;
            margin-top: 20px; /* 상단에 약간의 여백 추가 */
            margin-bottom: 10px;
            color: #4CAF50;
            text-align: center; /* 가운데 정렬 */
        }

        /* Links (로그아웃, 비밀번호 수정) */
        div {
            display: flex;
            gap: 20px;
            font-size: 16px;
            position: absolute;
            top: 60px;
            right: 20px;
        }

        a {
            text-decoration: none;
            color: #fff;
            background-color: #4CAF50;
            padding: 10px 20px;
            border-radius: 4px;
            transition: background-color 0.3s;
            text-align: center;
        }

        a:hover {
            background-color: #45a049;
        }

        a:focus {
            outline: none;
        }
    </style>
</head>
<body>
    <h1>카테고리</h1>
    <div>
        <a href="/cashbook/logout.jsp">로그아웃</a>
        <a href="/cashbook/updateAdminPwForm.jsp">비밀번호 수정</a>
    </div>
</body>
</html>