<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>系统管理员登录</title>
	<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
	<link rel="stylesheet" href="${initParam.resUrl}/system/css/login.css">
	<script type="text/javascript" src="${initParam.resUrl}/system/js/login.js"></script>
</head>
<body>
<div class="system-bg">
		<div class="system-div">
			<!-- top -->
			<div class="system-bar"></div>
			<!-- bottom -->
			<div class="system-con">
				<span class="system-title">系统管理员登录</span>
				<form action="#" method="POST" class="system-form" id="loginForm">
					<div class="system-name">
						<input type="text" name="username"/>
					</div>
					<div class="system-psw">
						<input type="password" name="password"/>
					</div>
					<select>
						<option value="system" selected="selected">系统</option>
						<option value="admin">管理员</option>
					</select>
					<div class="system-login">
						<input type="submit" value="Login In"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>