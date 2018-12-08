<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>寄发快递</title>
<link rel="stylesheet" href="css/cityselect.css">
<style type="text/css">
.demo {
	width: 670px;
	margin: 100px auto;
	
}

.demo input {
	padding: 12px 18px;
}
</style>

</head>
<body style="background-image: url(image/background.jpg);-moz-background-size:100% 100%; background-size:100% 100%;">
	<div style="background-color: rgba(246,246,246,0.9);">
	<h3 style="text-align: center; margin-top: 15px;">请认真填写快递单：</h3>
	<form id="fm1" action="addorder.do" method="post">
	<div class="demo">
		<!-- 在输入框加入id -->
		<input type="hidden" name="fromlocation" id="rfromlocation">
		<label for="fromlocation">寄发城市</label> 
		<input type="text"
			class="cityinput"  id="fromlocation"
			placeholder="请输入寄发地"> <label for="fromlocation">寄发详细地址</label>
		<input type="text" class="cityinput" name="fromdetal" id="fromdetal"
			style="width: 300px;" placeholder="请输入详细地址"><br><span id="fromlabel" style="color: red;"></span>
		<br><span id="fromlabel1" style="color: red;"></span>
		<br> <label for="fromlocation">寄发人</label> 
		<input type="text"
			class="cityinput" name="fromname" id="fromname" placeholder="请输入寄发人"> <label
			for="fromlocation">寄发人电话</label> 
			<input type="text" class="cityinput"
			name="phone" id="fromphone" style="width: 300px;" placeholder="请输入寄发人电话">
	</div>
	<div class="demo" style="text-align: center;">
		<span style="">寄<br>
		<br>收
		</span>
	</div>
	<div class="demo">
		<!-- 在输入框加入id -->
		<input type="hidden" name="tolocation" id="rtolocation">
		<label for="tolocation">收件城市</label> <input type="text"
			class="cityinput" id="tolocation"
			placeholder="请输入目的地"> <label for="fromlocation">收件人详细地址</label>
		<input type="text" class="cityinput" name="todetal" id="todetal"
			style="width: 300px;" placeholder="请输入详细地址"><br><span id="tolabel" style="color: red;"></span>
		<br><span id="tolabel1" style="color: red;"></span>
		<br> <label for="fromlocation">收件人</label> <input type="text"
			class="cityinput" name="toname" id="toname" placeholder="请输入收件人"> <label
			for="fromlocation">收件人电话</label> <input type="text" class="cityinput"
			name="tophone" id="tophone" style="width: 300px;" placeholder="请输入收件人电话">
	</div>
	</form>
	<div class="demo">
		<center>
			<button onclick="fmsub()"
				style="color: #fff; background-color: #4B95FF; border-color: #2a75fe; border-radius: 5px; height: 45px; width: 100%">发送快递</button>
		</center>
	</div>
	</div>
	<br><br><br><br><br>
	<script type="text/javascript" src="js/cityselect.js"></script>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		var test1 = new Vcity.CitySelector({
			input : 'fromlocation'
		});
		var test = new Vcity.CitySelector({
			input : 'tolocation'
		});
		function fmsub(){
			var fromlocation = $('#fromlocation').val();
			var fromdetal = $("#fromdetal").val();
			var fromname = $("#fromname").val();
			var fromphone = $("#fromphone").val();
			var tolocation = $("#tolocation").val();
			var todetal = $("#todetal").val();
			var toname = $("#toname").val();
			var tophone = $("#tophone").val();
			if(fromlocation==""||fromdetal==""){
				$("#fromlabel").html("寄发地或寄发详细地址不能为空");
				return;
			}
			$("#fromlabel").html("");
			if(fromname==""||fromphone==""){
				$("#fromlabel1").html("寄发人或寄发人手机号不能为空");
				return;
			}$("#fromlabel1").html("");
			if(tolocation==""||todetal==""){
				$("#tolabel").html("收货地或收货详细地址不能为空");
				return;
			}$("#tolabel").html("");
			if(toname==""||tophone==""){
				$("#tolabel1").html("收货人或收货人手机号不能为空");
				return;
			}$("#tolabel1").html("");
			var rfromlocation = fromlocation+fromdetal+fromname;
			$("#rfromlocation").val(rfromlocation);
			var rtolocation = tolocation+todetal+toname+"收"+tophone;
			$("#rtolocation").val(rtolocation);
			$("#fm1").submit();
		}
	</script>

	<div style="text-align: center;"></div>

</body>
</html>