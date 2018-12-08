<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员查看</title>
</head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<body><table class="table">
<thead>
					<tr>
						<th>
							快递单号
						</th>
						<th>
							寄发地
						</th>
						<th>
							收件地
						</th>
						<th>
							当前状态
						</th>
						<th>
							下单时间
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${orderList }" var="order">
					<tr class="warning">
						<td>
							${order.id }
						</td>
						<td>
							${order.fromlocation }
						</td>
						<td>
							${order.tolocation }
						</td>
						<td>
							${order.type }
						</td>
						<td>
							<fmt:formatDate value="${order.posttime }"
					pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td>
							<a class="btn btn-danger delete" style="background-color: red;" href="showexp.do?expid=${order.id }" target="_blank">产看详情</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table> 
</body>
</html>