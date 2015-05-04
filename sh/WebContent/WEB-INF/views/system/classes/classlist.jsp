<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${initParam.resUrl}/system/css/classlist.css">
	<link  rel="stylesheet" href="${initParam.resUrl}/common/css/public.css"/>
	<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
	<script type="text/javascript" src="${initParam.resUrl}/system/js/classlist.js"></script>
<title>班级列表</title>
</head>
<body>
	<c:import url="/WEB-INF/common/systemheader.jsp" />
	<div class="sh-system-search">
		<form action="http://localhost:8080/sh/system/adminclass/allclass" method="post">
			班级名称&nbsp;&nbsp;<input type="text" name="className" value="">&nbsp;&nbsp;
			<input type="submit" value="搜索">
		</form>
		<a href="http://localhost:8080/sh/system/center">中心<img src="${initParam.resUrl}/common/img/back.png" alt="返回"></a>
	</div>
	<div class="container">
		<table id="classlist" class="table">	
			<tr>
				<th>班级名称</th>
				<th>班级人数</th>
				<th>管理员</th>
				<th>操作</th>
				<th>操作</th>
				<th>操作</th>
			</tr>
			<c:forEach var="adminClass" items="${requestScope.pageModel.list}">
			<tr>
				<td>${adminClass.adminClassName}</td>
				<td>${adminClass.adminClassNum}</td>
				<c:choose>
					<c:when test="${!empty adminClass.admin.administratorName}">
						<td>${adminClass.admin.administratorName}</td>
					</c:when>
					<c:otherwise>
						<td><a href="${adminClass.adminClassId}" class="addadmin">添加</a></td>
					</c:otherwise>
				</c:choose>
				<td><a href="${adminClass.adminClassId}" class="addstudent">添加学生</a></td>
				<td><a href="http://localhost:8080/sh/system/classmanage/${adminClass.adminClassId}">进入班级</a></td>
				<td><a href="${adminClass.adminClassId}" class="del">删除</a></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<c:import url="/WEB-INF/common/page.jsp" />
	
	<div id="addadmin" class="add">
		<form action="#" method="post">
			<input type="hidden" name="classId" value="">
			<label>添加管理员<p><img src="${initParam.resUrl}/common/img/close.png" alt="关闭"></p></label>
			<span>姓名&nbsp;<input type="text" name="adminName" value=""></span>
			<span>密码&nbsp;<input type="text" name="adminPassword" value=""></span>
			<span><input type="submit" value="提交"></span> 
		</form>
	</div>
	
	<div id="addstudent" class="add">
		<form action="#" method="post">
			<input type="hidden" name="classId" value="">
			<label>添加学生<p><img src="${initParam.resUrl}/common/img/close.png" alt="关闭"></p></label>
			<span>学号&nbsp;<input type="text" name="code" value=""></span>
			<span>真实姓名&nbsp;<input type="text" name="realName" value=""></span>
			<span>性别&nbsp;
				<select name="gender">
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</span>
			<span><input type="submit" value="添加"></span>
		</form>
	</div>
	<div id="error">error</div>
</body>
</html>