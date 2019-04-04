<<<<<<< HEAD
<!DOCTYPE html>
<html lang="en-us" id="lock-page">
	<head>
		<meta charset="utf-8">
		<title>登录超级管理员</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		
		<!-- #CSS Links -->
		<!-- Basic Styles -->
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/font-awesome.min.css">

		<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-skins.min.css">

		<!-- SmartAdmin RTL Support -->
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-rtl.min.css"> 

		<!-- We recommend you use "your_style.css" to override SmartAdmin
		     specific styles this will also ensure you retrain your customization with each SmartAdmin update.
		<link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

		<!-- page related CSS -->
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/lockscreen.min.css">

		<!-- #FAVICONS -->
		<link rel="shortcut icon" href="${springMacroRequestContext.contextPath}/assets/img/fav.png" type="image/x-icon">
		<link rel="icon" href="${springMacroRequestContext.contextPath}/assets/img/fav.png" type="image/x-icon">

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

	</head>
	
	<body>

		<div id="main" role="main">

			<!-- MAIN CONTENT -->

			<form class="lockscreen animated flipInY" id="login-form" action="${springMacroRequestContext.contextPath}/superAdmin/login" method="post">
				<div class="row">
					<div class="col-sm-12 col-md-6 col-lg-6"><img src="${springMacroRequestContext.contextPath}/assets/img/logo_big.png" /></div>
					<div class="col-sm-12 col-md-6 col-lg-6"><h2 class="semi-bold" style="margin-top:35px;"><span>${productName!''} ${(productVersion)!''}</span></h2></div>
				</div>
					

				<div>
					
					<div>
						<h1><small><i class="fa fa-lock text-muted"></i>&nbsp;超级管理员登录</small></h1>

						<div class="input input-group">
							<input id="adminpassword" name="adminpassword" class="form-control" type="password" placeholder="请输入超级管理员密码">
							<div class="input-group-btn">
								<button class="btn btn-primary" type="submit" id="agentSubmit" name="agentSubmit">
									<i class="fa fa-key"></i>
								</button>
							</div>
						</div>
						<p id="ppp" style="color:red;" >${(msg)!''}</p>
						<p class="no-margin margin-top-5">&nbsp;</p>
					</div>

				</div>
				<p class="font-xs margin-top-5">
				    上海睿声软件技术有限公司&nbsp;<a href="http://www.rssoft.cc">http://www.rssoft.cc</a>
				</p>
				<p class="font-xs margin-top-5">
				   序列号：${serialNumber!''}
				</p>
			</form>

		</div>

		<!--================================================== -->	

	    <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/libs/jquery-2.1.1.min.js"></script>

	    <!--<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script> if (!window.jQuery.ui) { document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');} </script>-->

		<!-- IMPORTANT: APP CONFIG -->
		<script src="${springMacroRequestContext.contextPath}/assets/js/app.config.seed.js"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events 		
		<script src="/assets/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

		<!-- BOOTSTRAP JS -->		
		<script src="${springMacroRequestContext.contextPath}/assets/js/bootstrap/bootstrap.min.js"></script>
		
		<!--[if IE 8]>
			
			<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
			
		<![endif]-->

		<!-- MAIN APP JS FILE -->
		<script src="${springMacroRequestContext.contextPath}/assets/js/app.seed.js"></script>

		<script type="text/javascript">
			$(document).ready(function() {
				$('#ppp').show().delay(3000).hide(0);//3000毫秒后自动隐藏P标签
			});
			
			//按下回车自动搜索
			$(function() {
				document.onkeydown = function(e) {
					var ev = document.all ? window.event : e;
					if (ev.keyCode == 13) {
						$("#agentSubmit").click();
					}
				}
			});
		</script>	

	</body>

=======
<!DOCTYPE html>
<html lang="en-us" id="lock-page">
	<head>
		<meta charset="utf-8">
		<title>登录超级管理员</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		
		<!-- #CSS Links -->
		<!-- Basic Styles -->
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/font-awesome.min.css">

		<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-skins.min.css">

		<!-- SmartAdmin RTL Support -->
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-rtl.min.css"> 

		<!-- We recommend you use "your_style.css" to override SmartAdmin
		     specific styles this will also ensure you retrain your customization with each SmartAdmin update.
		<link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

		<!-- page related CSS -->
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/lockscreen.min.css">

		<!-- #FAVICONS -->
		<link rel="shortcut icon" href="${springMacroRequestContext.contextPath}/assets/img/fav.png" type="image/x-icon">
		<link rel="icon" href="${springMacroRequestContext.contextPath}/assets/img/fav.png" type="image/x-icon">

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

	</head>
	
	<body>

		<div id="main" role="main">

			<!-- MAIN CONTENT -->

			<form class="lockscreen animated flipInY" id="login-form" action="${springMacroRequestContext.contextPath}/superAdmin/login" method="post">
				<div class="row">
					<div class="col-sm-12 col-md-6 col-lg-6"><img src="${springMacroRequestContext.contextPath}/assets/img/logo_big.png" /></div>
					<div class="col-sm-12 col-md-6 col-lg-6"><h2 class="semi-bold" style="margin-top:35px;"><span>${productName!''} ${(productVersion)!''}</span></h2></div>
				</div>
					

				<div>
					
					<div>
						<h1><small><i class="fa fa-lock text-muted"></i>&nbsp;超级管理员登录</small></h1>

						<div class="input input-group">
							<input id="adminpassword" name="adminpassword" class="form-control" type="password" placeholder="请输入超级管理员密码">
							<div class="input-group-btn">
								<button class="btn btn-primary" type="submit" id="agentSubmit" name="agentSubmit">
									<i class="fa fa-key"></i>
								</button>
							</div>
						</div>
						<p id="ppp" style="color:red;" >${(msg)!''}</p>
						<p class="no-margin margin-top-5">&nbsp;</p>
					</div>

				</div>
				<p class="font-xs margin-top-5">
				    上海睿声软件技术有限公司&nbsp;<a href="http://www.rssoft.cc">http://www.rssoft.cc</a>
				</p>
				<p class="font-xs margin-top-5">
				   序列号：${serialNumber!''}
				</p>
			</form>

		</div>

		<!--================================================== -->	

	    <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/libs/jquery-2.1.1.min.js"></script>

	    <!--<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script> if (!window.jQuery.ui) { document.write('<script src="js/libs/jquery-ui-1.10.3.min.js"><\/script>');} </script>-->

		<!-- IMPORTANT: APP CONFIG -->
		<script src="${springMacroRequestContext.contextPath}/assets/js/app.config.seed.js"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events 		
		<script src="/assets/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

		<!-- BOOTSTRAP JS -->		
		<script src="${springMacroRequestContext.contextPath}/assets/js/bootstrap/bootstrap.min.js"></script>
		
		<!--[if IE 8]>
			
			<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
			
		<![endif]-->

		<!-- MAIN APP JS FILE -->
		<script src="${springMacroRequestContext.contextPath}/assets/js/app.seed.js"></script>

		<script type="text/javascript">
			$(document).ready(function() {
				$('#ppp').show().delay(3000).hide(0);//3000毫秒后自动隐藏P标签
			});
			
			//按下回车自动搜索
			$(function() {
				document.onkeydown = function(e) {
					var ev = document.all ? window.event : e;
					if (ev.keyCode == 13) {
						$("#agentSubmit").click();
					}
				}
			});
		</script>	

	</body>

>>>>>>> a9759ee0e32a4b688d70ced3ee97d27d44c09167
</html>