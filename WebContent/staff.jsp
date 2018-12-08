<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<body><table class="table">
<thead>
					<tr>
						<th>
							员工号
						</th>
						<th>
							姓名
						</th>
						<th>
							登录密码
						</th>
						<th>
							手机号
						</th>
						<th>
							部门
						</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${staffList }" var="staff">
					<tr class="warning">
						<td>
							${staff.id }
						</td>
						<td>
							${staff.name }
						</td>
						<td>
							${staff.password }
						</td>
						<td>
							${staff.phone }
						</td>
						<td>
							${staff.pt }
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table> 
</body>
</html>