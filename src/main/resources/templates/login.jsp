<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0, initial-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>涞源麻将-运营管理平台</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico?t=${.now?long}"/>
<link rel="stylesheet" href="/css/layui.css">
<link rel="stylesheet" href="/css/login.css">
<script src="/js/jquery.min.js"></script>
<script src="/layui.js"></script>

<script language="javascript">
	if((window.frameElement && window.frameElement.id || '') != ""){
		top.location.href = "/login.html" ;
	}
	function submitappweb() {
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		$.ajax({
			url: '/appWebLogin',
			type: 'POST',
			data: {
				username:username,
				password:password
			},
			async: false,
			cache: false,
			success: function (data) {
			},
			error: function (req) {
				alert("error method 任务执行失败 textStatus:");
			}
		});
	}
	layui.use('layer', function(){
	  var layer = layui.layer;
	  <#if msg?? && msg == '0'>
		layer.alert('用户名或密码错误，请重新填写', {icon: 2});
	  <#elseif msg?? && msg == '1'>
		layer.alert('用户注册成功，请使用用户名和密码登陆', {icon: 1}); 
	  </#if>
	});   
	layui.use('form', function(){
		var form = layui.form;
	});
</script>
</head>

<body>
	<div class="login-box">
		<div class="login-logo">
			<a> <img src="images/logo.png" style="height:60px;">
			</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">账号密码登陆</p>
			<form id="loginForm" action="/appWebLogin" method="post"
				class="loginFormWrapper" >
				<#if referer??>
				<input type="hidden" name="referer" value="${referer!''}"/>
				</#if>
				<div class="form-group has-feedback">
					<span class="layui-icon form-control-feedback">&#xe612;</span> 
					<input name="username" id="username" autofocus required lay-verify="required"  
						class="form-control required" value="" placeholder="用户名/邮件/手机号">
				</div>
				<div class="form-group has-feedback" style="margin-bottom:10px;">
					<span class="kfont form-control-feedback">&#xe618;</span>
					<input type="password" name="password" id="password" required lay-verify="required"
						class="form-control required" value="" placeholder="密码">
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="checkbox">
							<!-- 
							<label> <input type="checkbox" name="sla" value="1"
								checked="checked">七天内自动登录
							</label>
							 -->
						</div>
					</div>
				</div>

				<div class="row" style="margin-bottom:20px;">
					<div class="col-md-6"></div>
				</div>
				<div class="row">

					<!-- /.col -->
					<div class="col-xs-12">
						<input type="submit" class="btn btn-block btn-primary btn-lg" style="margin-top:10px;" value="用户登陆"></input>
					</div>
					<!-- /.col -->
				</div>
			</form>
			<div class="social-auth-links text-center">
				<div class="networks"></div>
			</div>
		</div>
		<!-- /.login-box-body -->
	</div>
</body>

</html>