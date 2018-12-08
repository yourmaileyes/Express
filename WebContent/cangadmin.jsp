<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${loginUser.type }</title>
</head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<br><h1>您所在的仓库:${ loginUser.type}</h1><br>
		</div>
	</div>
	<div class="row clearfix">
		
		<div class="col-md-3 column">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						${ user.type}
					</h3>
				</div>
				<div class="panel-body">
					<a href="allorder.do" target="right">快递接收与发送</a>
				</div>
				<div class="panel-body">
					<a href="newstaff.jsp" target="right">新建员工</a>
				</div>
				<div class="panel-body">
					<a href="showstaff.do" target="right">员工查看</a>
				</div>
			</div>
		</div>
		<div class="col-md-8 column">
		<iframe name="right" src="allorder.do" width="100%" height="800px" frameborder="0" scrolling="auto"></iframe>
			
				
		</div>
		<div class="col-md-1 column">
		</div>
	</div>
</div>
</body>
</html>