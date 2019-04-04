<!DOCTYPE html>
<html lang="en-us" id="lock-page">
	<head>
		<meta charset="utf-8">
		<title>激活</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		
		<!-- #CSS Links -->
		<!-- Basic Styles -->
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/font-awesome.min.css">

		<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-skins.min.css">

		<!-- SmartAdmin RTL Support -->
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-rtl.min.css"> 

		<!-- We recommend you use "your_style.css" to override SmartAdmin
		     specific styles this will also ensure you retrain your customization with each SmartAdmin update.
		<link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

		<!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/demo.min.css">

		<!-- page related CSS -->
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/lockscreen.min.css">

		<!-- #FAVICONS -->
		<link rel="shortcut icon" href="${springMacroRequestContext.contextPath}/assets/img/fav.png" type="image/x-icon">
		<link rel="icon" href="${springMacroRequestContext.contextPath}/assets/img/fav.png" type="image/x-icon">

		<!-- #GOOGLE FONT -->
		<link rel="stylesheet" type="text/css" href="${springMacroRequestContext.contextPath}/assets/css/googlefonts.css">

		<!-- #APP SCREEN / ICONS -->
		<!-- Specifying a Webpage Icon for Web Clip 
			 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
		<link rel="apple-touch-icon" href="${springMacroRequestContext.contextPath}/assets/img/splash/sptouch-icon-iphone.png">
		<link rel="apple-touch-icon" sizes="76x76" href="${springMacroRequestContext.contextPath}/assets/img/splash/touch-icon-ipad.png">
		<link rel="apple-touch-icon" sizes="120x120" href="${springMacroRequestContext.contextPath}/assets/img/splash/touch-icon-iphone-retina.png">
		<link rel="apple-touch-icon" sizes="152x152" href="${springMacroRequestContext.contextPath}/assets/img/splash/touch-icon-ipad-retina.png">
		
		<!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		
		<!-- Startup image for web apps -->
		<link rel="apple-touch-startup-image" href="${springMacroRequestContext.contextPath}/assets/img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
		<link rel="apple-touch-startup-image" href="${springMacroRequestContext.contextPath}/assets/img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
		<link rel="apple-touch-startup-image" href="${springMacroRequestContext.contextPath}/assets/img/splash/iphone.png" media="screen and (max-device-width: 320px)">

		<script src="${springMacroRequestContext.contextPath}/assets/js/libs/jquery-2.1.1.min.js"></script>
		<script src="${springMacroRequestContext.contextPath}/assets/js/libs/jquery-ui-1.10.3.min.js"></script>
		<script src="${springMacroRequestContext.contextPath}/assets/js/plugin/bootstrapvalidator/bootstrapValidator.min.js"></script>
	</head>
	<body class="breadcrumb">
		<div class="row">
		<div id="main" role="main">

			<!-- MAIN CONTENT -->

			<form class="lockscreen animated flipInY" action="javascript:void(0);">
				<div class="row">
					<img src="${springMacroRequestContext.contextPath}/assets/img/logo_big2.png" alt="" />		
				</div>
				
				<div class="row">
					
						<h1>${productName!""}&nbsp;
							<small>${productVersion!""}&nbsp;&nbsp;&nbsp;&nbsp;
							</small>ID:${id!""}&nbsp;&nbsp;&nbsp;&nbsp;
							<i id="checkIcon" class="fa fa-lock text-danger">未激活</i>
						</h1>
						<div id="applyResult">
							
						</div>
						
						<p class="font-xs margin-top-5">
							<button id="activate" class="btn btn-primary btn-block" type="submit">
								<i class="fa fa-key fa-lg"></i>
							</button>
						</p>
						<p class="font-xs margin-top-5 text-muted">
							上海睿声软件技术有限公司&nbsp;&nbsp;<a href="http://www.rssoft.cc">http://www.rssoft.cc</a>&nbsp;&nbsp;电话:(021)60172133
						</p>
						<p class="font-xs margin-top-5">
						   序列号：${serialNumber!''}
						</p>
				</div>

			</form>
		
		</div>
		</div>
		
				
		<script type="text/javascript">
			$(document).ready(function(){
			  	
			  	var pagefunction = function() {
					$("#activate").click(function(){
						$.post("${springMacroRequestContext.contextPath}/activate",{},function(data){
							
							if(data.success == "valid_license"){
								//图标的显示
								$("#checkIcon").removeClass("fa-lock text-danger");
								$("#checkIcon").addClass("fa-check text-success");
								$("#checkIcon").text("已激活");
								$("#activate").attr("disabled",true);
								
				 				//如果已经获取到了合法授权的licensebase64String，则重新请求登录方法跳转到登录界面toLogin.ftl
								$("#applyResult").empty();
								$("#applyResult").append("<div class='font-xs margin-top-5 text-success'>恭喜您，激活成功！  <code id='times'></code>秒钟之后将跳转到登录界面。</div>"
				        		);
								
								var i = 5; //倒计时的秒数
								var intervalid;//函数的摧毁
								
								var fun = function(){
									if (i == 0) { 
										window.location.reload();
										clearInterval(intervalid);
									} 
									document.getElementById("times").innerHTML = i; 
									i--; 
								}
								fun();
								intervalid = setInterval(fun, 1000); 
									
								
				        	}else if(data.success == "invalid_license"){
								
				        		$("#applyResult").empty();
				        		$("#applyResult").append("<div class='font-xs margin-top-5 text-muted'><code>抱歉，您购买的授权码失效了，请联系相关人员解决。</code></div>"
				        		);

				        	}else{
								
				        		$("#applyResult").empty();
				        		$("#applyResult").append("<div class='font-xs margin-top-5 text-muted'><code>抱歉，您安装的系统还未授权，请购买获取授权码。</code></div>"
				        		);
				        	}
							
							
			 			},"json");
						
					});
					
				};
		 		
		 		pagefunction();
		 		
		})		
		</script> 		
	</body>
</html>	
