<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>快递信息</title>
</head>
<style type="text/css">
	.demo{width:800px;margin: auto;padding: 50px 50px 50px 50px; background-color: white;}
</style>
<body style="background-color: #f6f6f6;">
<div class="demo">
<c:if test="${expressList==null }">
<h1>已经成功投递！<br>您的快递单号为：${expid }!<br>请牢记快递单号以便查询</h1>
<a href="index.do">点此返回首页</a>
</c:if>
<c:if test="${expressList!=null }">
   <table>
   <tr>
   <td width="300"><h1>快递单号</h1></td>
   <td width="500"><h1>快递状态</h1></td>
   <td width="300"><h1>详情</h1></td>
   </tr>
   <c:forEach items="${expressList }" var="express">
   <tr>
   <td><h3>${express.id }</h3></td>
   <td><h3>${express.type}</h3></td>
   <td><a href="showexp.do?expid=${express.id }">查看信息</a></td>
   </tr>
   
   
   </c:forEach>
   
   </table>
</c:if>
</div>
</body>
</html>