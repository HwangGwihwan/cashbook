<%@ page import="model.*"%>
<%@ page import="dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String login = (String)(session.getAttribute("login"));
	
	if (login == null) { // 로그아웃 상태
		response.sendRedirect("/cashbook/loginForm.jsp");
		return;
	}
	
	String kind = request.getParameter("kind");
	String title = request.getParameter("title");
	
	System.out.println("insertCategoryAction#kind: " + kind);
	System.out.println("insertCategoryAction#title: " + title);
	
	Category c = new Category();
	c.setKind(kind);
	c.setTitle(title);
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.insertCategory(c);
	
	response.sendRedirect("/cashbook/categoryList.jsp");
%>