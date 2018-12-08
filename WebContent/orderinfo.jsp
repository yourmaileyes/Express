<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物流号${express.id }</title>
</head>
<style type="text/css">
	.demo{width:800px;margin: auto;padding: 50px 50px 50px 50px; background-color: white;}
</style>
<body style="background-color: #f6f6f6;">
<div class="demo">
    <h1>快递单号：${express.id } 物流详情如下</h1>
    <h2>当前状态:${express.type }</h2><c:if test="${express.type eq '已签收,请确认收货' }"><a href="confimorder.do?expid=${express.id }"><h2>确认收货</h2></a></c:if>
	<table>
		<tr>
			<td>时间</td>
			<td></td>
			<td>进度跟踪</td>
		</tr>
		<c:forEach items="${logList }" var="log">
		<tr>
			<td><fmt:formatDate value="${log.time }"
					pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<c:if test="${log.type eq '0' }">
			<td><img alt="" src="image/end.PNG"></td>
			</c:if>
			<c:if test="${log.type==null }">
			<td><img alt="" src="image/math.PNG"></td>
			</c:if>
			<td>${log.context }</td>
			</tr>
		</c:forEach>
		<tr>
			<td><fmt:formatDate value="${express.posttime }"
					pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td><img alt="" src="image/Start.PNG"></td>
			<td>快件正在等待揽收</td>
		</tr>
	</table>
	<a href="index.do">返回继续查询</a>
	</div>
</body>
</html>