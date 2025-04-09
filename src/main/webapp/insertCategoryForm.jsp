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
		<title>카테고리 추가</title>
		<style>
	        /* 기본 스타일 초기화 */
	        body, h1, table, th, td, input, button {
	            margin: 0;
	            padding: 0;
	            box-sizing: border-box;
	        }
	
	        body {
	            font-family: Arial, sans-serif;
	            background-color: #f4f7fa;
	            color: #333;
	            display: flex;
	            flex-direction: column;
	            justify-content: center;
	            align-items: center;
	            height: 100vh;
	            padding: 20px;
	        }
	
	        h1 {
	            font-size: 32px;
	            margin-bottom: 20px;
	            color: #4CAF50;
	            text-align: center;
	        }
	
	        /* 폼 스타일 */
	        form {
	            background-color: #fff;
	            padding: 20px;
	            border-radius: 8px;
	            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	            width: 100%;
	            max-width: 600px;
	            box-sizing: border-box;
	        }
	
	        table {
	            width: 100%;
	            margin-bottom: 20px;
	            border-collapse: collapse;
	        }
	
	        th {
	            text-align: left;
	            padding: 12px;
	            font-size: 16px;
	            background-color: #4CAF50;
	            color: white;
	            border-top-left-radius: 4px;
	            border-top-right-radius: 4px;
	        }
	
	        td {
	            padding: 12px;
	            font-size: 16px;
	            border: 1px solid #ccc;
	        }
	        
	        input[type="text"] {
	            width: 100%;
	            padding: 10px;
	            font-size: 16px;
	            border: 1px solid #ccc;
	            border-radius: 4px;
	            outline: none;
	            transition: border-color 0.3s;
	        }
	
	        input[type="text"]:focus {
	            border-color: #4CAF50;
	        }
	
	        /* 버튼 스타일 */
	        button {
	            width: 100%;
	            padding: 12px;
	            font-size: 16px;
	            background-color: #4CAF50;
	            color: #fff;
	            border: none;
	            border-radius: 4px;
	            cursor: pointer;
	            transition: background-color 0.3s;
	        }
	
	        button:hover {
	            background-color: #45a049;
	        }
	
	        button:focus {
	            outline: none;
	        }
	    </style>
	</head>
	<body>
		<h1>카테고리 추기</h1>
		<form action="/cashbook/insertCategoryAction.jsp" method="post">
			<table>
				<tr>
					<th>수입/지출</th>
					<td>
						<input type="text" name="kind" placeholder="수입 또는 지출 입력">
					</td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
						<input type="text" name="title" placeholder="분류 입력">
					</td>
				</tr>
			</table>
			<button type="submit">추가</button>
		</form>
	</body>
</html>