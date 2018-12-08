<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工操作</title>
</head>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<style type="text/css">
	.demo{width:220px;margin:50px auto;}
	.demo input{padding: 12px 18px;}
</style>
<body>
<h3 style="text-align: center;margin-top:200px;" >在下面的输入框中输入所操作的物流单号：</h3>
<div class="demo" >
	<!-- 在输入框加入id -->
	<form id="form1" action="orderin.do" method="post">
	<input type="text" id="expid" name="expid" placeholder="请输入物流单号" style="width: 220px">
	</form>
	<font color="red" id="msg">${msg}</font>
</div>
<div class="demo">
		<center>
			<button onclick="fmsub()"
				style="color: #fff; background-color: #4B95FF; border-color: #2a75fe; border-radius: 5px; height: 45px; width: 100%">确认收入/签收</button>
		</center>
	</div>
	<div class="demo">
		<center>
			<button onclick="fmsub1()"
				style="color: #fff; background-color: #4B95FF; border-color: #2a75fe; border-radius: 5px; height: 45px; width: 100%">确认出库/派件</button>
		</center>
	</div>
</body>
<script type="text/javascript">
function fmsub(){
	var expid = $("#expid").val();
	if(expid==''){
		$("#msg").html("物流单号不能为空");
		return;
	}
	$("#form1").attr("action","orderin.do");
	$("#form1").submit();
}
function fmsub1(){
	var expid = $("#expid").val();
	if(expid==''){
		$("#msg").html("物流单号不能为空");
		return;
	}
	$("#form1").attr("action","orderout.do");
	$("#form1").submit();
}
</script>
</html>