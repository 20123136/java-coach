<!DOCTYPE html>
<html lang="en-us" id="lock-page">
	<head>
		<meta charset="utf-8">
		<title>登录</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/font-awesome.min.css">
		<!--<link rel="stylesheet" type="text/css" href="${springMacroRequestContext.contextPath}/assets/css/font-awesome.min.css" /> -->

		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-skins.min.css">


		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-rtl.min.css"> 

		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/demo.min.css">

		<!-- page related CSS -->
		<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/lockscreen.min.css">

 		<!-- #FAVICONS -->
        <link rel="shortcut icon" href="${springMacroRequestContext.contextPath}/assets/img/fav.png" type="image/x-icon">
        <link rel="icon" href="${springMacroRequestContext.contextPath}/assets/img/fav.png" type="image/x-icon">

		<!-- #FAVICONS -->
		<link rel="apple-touch-icon" href="${springMacroRequestContext.contextPath}/assets/img/splash/sptouch-icon-iphone.png">
		<link rel="apple-touch-icon" sizes="76x76" href="${springMacroRequestContext.contextPath}/assets/img/splash/touch-icon-ipad.png">
		<link rel="apple-touch-icon" sizes="120x120" href="${springMacroRequestContext.contextPath}/assets/img/splash/touch-icon-iphone-retina.png">
		<link rel="apple-touch-icon" sizes="152x152" href="${springMacroRequestContext.contextPath}/assets/img/splash/touch-icon-ipad-retina.png">
		
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		
		<link rel="apple-touch-startup-image" href="${springMacroRequestContext.contextPath}/assets/img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
		<link rel="apple-touch-startup-image" href="${springMacroRequestContext.contextPath}/assets/img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
		<link rel="apple-touch-startup-image" href="${springMacroRequestContext.contextPath}/assets/img/splash/iphone.png" media="screen and (max-device-width: 320px)">
		
		 <!-- #PLUGINS -->
        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/libs/jquery-2.1.1.min.js"></script>

        <script src="${springMacroRequestContext.contextPath}/assets/js/libs/jquery-ui-1.10.3.min.js"></script>
        <script src="${springMacroRequestContext.contextPath}/assets/js/plugin/bootstrapvalidator/bootstrapValidator.min.js"></script>
        
		</head>
	<body>
		
		 <div id="main" role="main">
			<form class="lockscreen animated flipInY smart-form" action="${springMacroRequestContext.contextPath}/login" method="post" id="login-form" style="top: 40%;">
					
				<div style="padding-left: 10px;" class="row">
					<div class="col-sm-12 col-md-6 col-lg-6"><img src="${springMacroRequestContext.contextPath}/assets/img/logo_big.png" /></div>
					<div class="col-sm-12 col-md-6 col-lg-6"><h2 class="semi-bold" style="margin-top:35px;"><span>${productName!''} ${(productVersion)!''}</span></h2></div>
				</div>
					
				<div class="logo" style="padding: 0px;"></div>
				<div>
					<input type="hidden" name="unregisterOk" id="unregisterOk">
					<fieldset style="padding-top: 15px;">
						
						<section>
							<label class="label">登录名</label>
							<label class="input">
								<i class="icon-prepend fa fa-user"></i>
								<input type="text" id="loginName" name="loginName" value="${(loginuser.loginName)!''}">
								<b class="tooltip tooltip-top-right">
									<i class="fa fa-user txt-color-teal"></i> 
									请输入您的登录名
								</b>
							</label>
						</section>
						<section>
							<label class="label" >密码</label>
							<label class="input">
								<i class="icon-prepend fa fa-lock"></i>
								<input type="password" name="password" value="${(loginuser.password)!''}">
								<b class="tooltip tooltip-top-right">
									<i class="fa fa-lock txt-color-teal"></i> 
									请输入您的登录密码
								</b>
							</label>
							<div class="note" align="right">
								<font color="red" size="2" id="errorAgentFont">${errorAgentFont!''}</font>
							</div>
						</section>
						<p id="ppp" style="color:red;" >${(msg)!''}</p>
					</fieldset>
					<footer style="padding: 0px;border: 0px;background: white;">
						<button type="submit" class="btn btn-primary" id="agentSubmit" name="agentSubmit">登录</button>
					</footer>
				</div>
				<div>
					<p class="font-xs margin-top-5">
					    上海睿声软件技术有限公司&nbsp;<a href="http://www.rssoft.cc">http://www.rssoft.cc</a>
					</p>
					<p class="font-xs margin-top-5">
					   序列号：${serialNumber!''}
					</p>
				</div>
			 </form>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#ppp').show().delay(3000).hide(0);//3000毫秒后自动隐藏P标签
				// registForm
				$('#login-form').bootstrapValidator({
					feedbackIcons : {
						valid : 'glyphicon glyphicon-ok',
						invalid : 'glyphicon glyphicon-remove',
						validating : 'glyphicon glyphicon-refresh'
					},
					fields : {
						loginName : {
							group : '.input',
							validators : {
								notEmpty : {
									message : '登录名不能为空'
								},
								stringLength: {
		                            max: 64,  
		                            message: '长度不能超过64位'  
		                        },
							}
						},
						password : {
							group : '.input',
							validators : {
								notEmpty : {
									message : '密码不能为空'
								},
								stringLength: {
		                            max: 64,  
		                            message: '长度不能超过64位'  
		                        },
							}
						}
						
						
					}//end fields
				});
			});
			
			$('#forgetpwd').click(function(){
				$.post("${springMacroRequestContext.contextPath}/forgetpwd",function(data){
					$("#main").append(data);
				});
			});
			/*验证码功能*/
			function changeImg(){     
			    var imgSrc = $("#imgObj");     
			    var src = imgSrc.attr("src");
			    imgSrc.attr("src",chgUrl(src));     
			}     
			//时间戳     
			//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳     
			function chgUrl(url){  
			    var timestamp = (new Date()).valueOf();     
			    urlurl = url.substring(0,17);     
			    if((url.indexOf("&")>=0)){     
			        urlurl = url + "×tamp=" + timestamp;     
			    }else{     
			        urlurl = url + "?timestamp=" + timestamp;     
			    }    
			    return urlurl;     
			}
			
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
</html>