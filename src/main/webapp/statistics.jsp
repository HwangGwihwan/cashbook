<%@page import="java.util.*"%>
<%@ page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String login = (String)(session.getAttribute("login"));
	
	if (login == null) { // 로그아웃 상태
		response.sendRedirect("/cashbook/login/loginForm.jsp");
		return;
	}

	int year = 2025;
	if (request.getParameter("year") != null) {
		year = Integer.parseInt(request.getParameter("year"));
	}
	
	CashDao cashDao = new CashDao();
	ArrayList<HashMap<String, Object>> totalList = cashDao.totalAmount();
	ArrayList<HashMap<String, Object>> yearTotalList = cashDao.yearTotalAmount(year);
	ArrayList<HashMap<String, Object>> monthTotalList = cashDao.monthTotalAmount(year);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>수입/지출 통계</title>
		<style>
			body {
				font-family: Arial, sans-serif;
				background-color: #f7f9fc;
				margin: 0;
				padding: 20px;
				display: flex;
				flex-direction: column;
				align-items: center;
				color: #333;
			}
	
			h1 {
				font-size: 28px;
				margin-bottom: 20px;
			}
	
			form {
				margin-bottom: 20px;
				display: flex;
				align-items: center;
				gap: 10px;
			}
	
			select, button {
				padding: 8px 12px;
				font-size: 16px;
				border-radius: 4px;
				border: 1px solid #ccc;
			}
	
			button {
				background-color: transparent;
				color: #4CAF50;
				border: 1px solid #4CAF50;
				cursor: pointer;
				transition: background-color 0.3s, color 0.3s;
			}
	
			button:hover {
				background-color: #4CAF50;
				color: #fff;
			}
	
			.table-wrapper {
				width: 80%;
				max-width: 1000px;
				margin-bottom: 30px;
			}
	
			table {
				width: 100%;
				border-collapse: collapse;
				margin-bottom: 20px;
				text-align: center;
			}
	
			th, td {
				padding: 10px;
				border: 1px solid #ccc;
			}
	
			th {
				background-color: #4CAF50;
				color: white;
			}
	
			tr:nth-child(even) {
				background-color: #f2f2f2;
			}
	
			tr:hover {
				background-color: #e9e9e9;
			}
	
			.monthly-section {
				display: flex;
				justify-content: space-between;
				gap: 20px;
				width: 100%;
				flex-wrap: nowrap; /* 한 줄에 고정 */
			}
	
			.monthly-table {
				width: 48%; /* 가로로 2개가 나란히 놓일 수 있도록 */
				min-width: 300px;
			}
		</style>
	</head>
	<body>
		<h1>수입/지출 통계</h1>
		<form action="/cashbook/statistics.jsp" method="post">
			<span>연도</span>
			<select name="year">
				<option value="2021" <%if(year == 2021){%> selected <%}%>>2021</option>
				<option value="2022" <%if(year == 2022){%> selected <%}%>>2022</option>
				<option value="2023" <%if(year == 2023){%> selected <%}%>>2023</option>
				<option value="2024" <%if(year == 2024){%> selected <%}%>>2024</option>
				<option value="2025" <%if(year == 2025){%> selected <%}%>>2025</option>
			</select>
			<button type="submit">선택</button>
		</form>
		
		<div class="table-wrapper">
			<table>
				<tr>
					<th colspan="3">전체 수입/지출 통계</th>
				</tr>
				<tr>
					<th>종류</th>
					<th>건수</th>
					<th>총액</th>
				</tr>
				<%
					for (HashMap<String, Object> map : totalList) {
				%>
						<tr>
							<td><%=map.get("kind")%></td>
							<td><%=map.get("count")%></td>
							<td><%=map.get("sum")%>원</td>
						</tr>
				<%
					}
				%>
			</table>
		</div>
		
		<div class="monthly-section">
			<table class="monthly-table">
				<tr>
					<th colspan="3"><%=year%>년 월별 수입 통계
				</tr>
				<tr>
					<th>월</th>
					<th>건수</th>
					<th>총액</th>
				</tr>
				<%
					for (HashMap<String, Object> map : monthTotalList) {
						if (map.get("kind").equals("수입")) {
				%>
							<tr>
								<td><%=map.get("month")%></td>
								<td><%=map.get("count")%></td>
								<td><%=map.get("sum")%>원</td>
							</tr>
				<%			
						}
					}
				%>
			</table>
			<table class="monthly-table">
				<tr>
					<th colspan="3"><%=year%>년 월별 지출 통계
				</tr>
				<tr>
					<th>월</th>
					<th>건수</th>
					<th>총액</th>
				</tr>
				<%
					for (HashMap<String, Object> map : monthTotalList) {
						if (map.get("kind").equals("지출")) {
				%>
							<tr>
								<td><%=map.get("month")%></td>
								<td><%=map.get("count")%></td>
								<td><%=map.get("sum")%>원</td>
							</tr>
				<%			
						}
					}
				%>
			</table>
		</div>

		<div class="table-wrapper">
			<table>
				<tr>
					<th colspan="3"><%=year%>년 수입/지출 통계
				</tr>
				<tr>
					<th>종류</th>
					<th>건수</th>
					<th>총액</th>
				</tr>
				<%
					for (HashMap<String, Object> map : yearTotalList) {
				%>
						<tr>
							<td><%=map.get("kind")%></td>
							<td><%=map.get("count")%></td>
							<td><%=map.get("sum")%>원</td>
						</tr>
				<%
					}
				%>
			</table>
		</div>
		
	</body>
</html>