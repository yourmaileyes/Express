<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Express物流查询</title>
<link rel="stylesheet" href="css/cityselect.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<style type="text/css">
	.demo{width:220px;margin:50px auto;}
	.demo input{padding: 12px 18px;}
</style>

</head>
<body style="background-image: url(image/background.jpg);-moz-background-size:100% 100%; background-size:100% 100%;">
<div style="background-color: rgba(246,246,246,0.7);" >
<div style="text-align: center;margin:200px auto auto 20px;"><h2>新闻热点</h2><br>
<a href="http://www.sohu.com/a/217719788_466964" target="_blank">头条 | 热烈欢迎山西农业大学软件学院到京实训！</a><br>
<a href="http://www.sohu.com/a/274938542_260616?_f=index_chan08news_1" target="_blank">生态环境部通报：京津冀地区和汾渭平原将出现大气重污染过程</a><br>
<a href="http://www.sohu.com/picture/274945213?_f=index_chan08focus_0" target="_blank">“复兴号”首设快递专用车厢</a><br>
<a href="new1.htm" target="_blank">“双十一”后快递激增 南京各高校“快递山”模式开启</a><br><br><br>
<h3 >在下面的输入框中输入所查询的物流单号：</h3>
</div>
<div class="demo" style="background-color: #f6f6f6;">
	<!-- 在输入框加入id -->
	<form id="form0" action="showexp.do" method="post">
	<input id="expid" name="expid" type="text" placeholder="请输入物流单号" style="width: 220px"><br>
	</form>
	<font color="red" id="msg">${msg}</font>
</div>
<div class="demo">
		<center>
			<button onclick="fmsub()"
				style="color: #fff; background-color: #4B95FF; border-color: #2a75fe; border-radius: 5px; height: 45px; width: 100%">查询快递</button>
		</center>
	</div>
	<div class="demo">
		<center>
			<button onclick="javascript:window.location='addorder.jsp'"
				style="color: #fff; background-color: #4B95FF; border-color: #2a75fe; border-radius: 5px; height: 45px; width: 100%">我要发快递</button>
		</center>
	</div>
	</div>
<div style="text-align:center;">
<br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>

<script type="text/javascript">
function fmsub(){
	var expid = $("#expid").val();
	if(expid==''){
		$("#msg").html("物流单号不能为空");
		return;
	}
	$("#form0").submit();
}
</script>

</body>
</html>