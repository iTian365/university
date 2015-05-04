<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${initParam.resUrl}/system/css/userlist.css">
	<link  rel="stylesheet" href="${initParam.resUrl}/common/css/public.css"/>
	<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="${initParam.resUrl}/system/js/userlist.js"></script>
<title>用户</title>
</head>
<body>
	
	<c:import url="/WEB-INF/common/systemheader.jsp" />
	
	<div class="sh-system-search">
		<form action="http://localhost:8080/sh/system/userlist" method="post">
			用户名:&nbsp;<input type="text" name= "userName" value="">&nbsp;&nbsp;
			状态:&nbsp;<input type="text" name= "alive" value="">&nbsp;&nbsp;
			<input type="submit" value="搜索">
		</form>
		<a href="/sh/system/center">中心<img src="${initParam.resUrl}/common/img/back.png" alt="返回"></a>
	</div>
	<div class="container">
		<table id="userlist" class="table">
			<tr>
				<th>用户名</th>
				<th>email</th>
				<th>tel</th>
				<th>qq</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
			<c:forEach var="user" items="${requestScope.pageModel.list}">
			<tr>
				<td>${user.userName}</td>
				<td>${user.email}</td>
				<td>${user.tel}</td>
				<td>${user.qq}</td>
				<c:choose>
					<c:when test="${user.alive == 1}">
						<td><a href="${user.userId}" tostatus = "C">禁用</a></td>
					</c:when>
					<c:otherwise>
						<td><a href="${user.userId}" tostatus = "A">开启</a></td>
					</c:otherwise>
				</c:choose>
				<td><a href="${user.userId}" class="del">删除</a></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<c:import url="/WEB-INF/common/page.jsp" />
	
</body>
</html>