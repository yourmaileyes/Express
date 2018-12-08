<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工登录</title>
</head>
<body style=" background-image: url(image/background.jpg);-moz-background-size:100% 100%;background-size:100% 100%;">
<div align="center" style="padding-top: 50px;">
		<form action="login.do" method="post" >
		<table  width="740" height="500" style=" background-color: rgba(246,246,246,0.5);" >
			<tr height="200"></tr>
			<tr height="30" style="margin-top:200px;">
				<td width="20%"></td>
				<td width="20%">员工号：</td>
				<td><input type="text" value="${userName }" name="username" id="userName"/></td>
				<td width="40%"></td>
			</tr>
			<tr height="30">
				<td width="40%"></td>
				<td width="10%">密  码：</td>
				<td><input type="password" value="${password }" name="password" id="password"/></td>
				<td width="30%"></td>
			</tr>
			<tr height="30">
				<td width="40%"></td>
				<td width="10%"><input type="submit" value="登录"/></td>
				<td><input type="button" value="重置" onclick="resetValue()"/></td>
				<td width="30%"></td>
			</tr>
			<tr height="10">
				<td width="40%"></td>
				<td colspan="3">
					<font color="red">${error }</font>
				</td>
			</tr>
			<tr >
				<td></td>
			</tr>
		</table>
		</form>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>