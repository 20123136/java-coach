<!DOCTYPE html>
<html lang="en-us" id="lock-page">

<head>
		<meta charset="utf-8">
		<title>配置项</title>
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

        <!-- DEV links : turn this on when you like to develop directly -->
        <!--<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/Source_UNMINIFIED_CSS/smartadmin-production.css">-->
        <!--<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/Source_UNMINIFIED_CSS/smartadmin-skins.css">-->

        <!-- SmartAdmin RTL Support -->
        <link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-rtl.min.css"> 

        <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update.
        <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->
        

        <!-- #FAVICONS -->
        <link rel="shortcut icon" href="${springMacroRequestContext.contextPath}/assets/img/favicon.ico" type="image/x-icon">
        <link rel="icon" href="${springMacroRequestContext.contextPath}/assets/img/favicon.ico" type="image/x-icon">

        <!-- #GOOGLE FONT -->
<!--         <link rel="stylesheet" type="text/css" href="${springMacroRequestContext.contextPath}/assets/css/googlefonts.css"> -->

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
	
	<!--================================================== -->

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>-->


        <!-- #PLUGINS -->
        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/libs/jquery-2.1.1.min.js"></script>

        <script src="${springMacroRequestContext.contextPath}/assets/js/libs/jquery-ui-1.10.3.min.js"></script>

        <!-- IMPORTANT: APP CONFIG -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/app.config.js"></script>

        <!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
        <script src="${springMacroRequestContext.contextPath}/assets/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

        <!-- BOOTSTRAP JS -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/bootstrap/bootstrap.min.js"></script>

        <!-- CUSTOM NOTIFICATION -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/notification/SmartNotification.min.js"></script>

        <!-- JARVIS WIDGETS -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/smartwidgets/jarvis.widget.min.js"></script>

        <!-- EASY PIE CHARTS -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

        <!-- SPARKLINES -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/plugin/sparkline/jquery.sparkline.min.js"></script>

        <!-- JQUERY VALIDATE -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY MASKED INPUT -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/plugin/masked-input/jquery.maskedinput.min.js"></script>

        <!-- JQUERY SELabout:cehomeECT2 INPUT -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/plugin/select2/select2.min.js"></script>

        <!-- JQUERY UI + Bootstrap Slider -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

        <!-- browser msie issue fix -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

        <!-- FastClick: For mobile devices: you can disable this in app.js -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/plugin/fastclick/fastclick.min.js"></script>

        <!--[if IE 8]>
            <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
        <![endif]-->


        <!-- MAIN APP JS FILE -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/app.min.js"></script>

        <!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
        <!-- Voice command : plugin -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/speech/voicecommand.min.js"></script>

        <!-- SmartChat UI : plugin -->
        <script src="${springMacroRequestContext.contextPath}/assets/js/smart-chat-ui/smart.chat.ui.min.js"></script>
        <script src="${springMacroRequestContext.contextPath}/assets/js/smart-chat-ui/smart.chat.manager.min.js"></script>
	
	</head>
	
<!-- 灰色背景class="breadcrumb" -->
<body class="breadcrumb container">

		<div class="row">
			<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
				<h1 class="page-title txt-color-blueDark">
		
				</h1>
			</div>
			<div class="col-xs-12 col-sm-5 col-md-5 col-lg-8">
		
			</div>
		</div>

<!-- widget grid -->
	<!-- row -->
	<div class="row" style="margin-left: 0.5em;margin-right: 0.5em;">
		<!-- NEW WIDGET START -->
		<article class="col-sm-12 col-md-12 col-lg-12">

								<img src="${springMacroRequestContext.contextPath}/assets/img/logo_big.png" />
								<span style="font-size: 25px;">${productName!''} ${(productVersion)!''}</span>
								<div class="pull-right">
					                <!-- logout button -->
					                <div id="logout" class="btn-header transparent pull-right"  style="margin-top: 1em;">
					                    <span> <a href="logout" title="退出"><i class="fa fa-sign-out"></i></a> </span>
					                </div>
					                <!-- end logout button -->
					            </div>

		</article>
		<!-- WIDGET END -->
    </div>


	
	<!-- widget grid -->
	<!-- row -->
	<div class="row" style="margin-left: 0.5em;margin-right: 0.5em;">
	
		<!-- NEW WIDGET START -->
		<article class="col-sm-12 col-md-12 col-lg-12">

			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget" id="wid-id-0" data-widget-deletebutton="false" data-widget-togglebutton="false" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-gears"></i> </span>
					<h2>配置项</h2>
				</header>

				<!-- widget div-->
				<div>

					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->

					</div>
					<!-- end widget edit box -->

					<!-- widget content -->
					<div class="widget-body">
                        <form id="productForm" class="form-horizontal" method="post" action="javascript:void(0);">
                        
							<fieldset class="col col-6">
								<legend>功能限制</legend>
								<#if productFunctionLimitViewList??>
									<#assign json=productAllowFunctionLimitList?eval />
									<#list productFunctionLimitViewList as plvs>
											<div class="form-group">
												<label class="col-md-4 control-label functionLimit">${plvs.description!""}</label>
												<div class="col-md-4">
								                      <span class="onoffswitch">
								                      	  <#if (plvs.value)?? && plvs.value=='true'>
								                             <input type="checkbox" id="${plvs.keyy!''}" name="${plvs.keyy!''}" class="onoffswitch-checkbox" checked="checked">
								                          <#else>
								                          	 <#if json[plvs.keyy]?? && json[plvs.keyy]=='true'>
								                             <input type="checkbox" id="${plvs.keyy!''}" name="${plvs.keyy!''}" class="onoffswitch-checkbox">
								                             <#else>
								                             <input type="checkbox" id="${plvs.keyy!''}" name="${plvs.keyy!''}" class="onoffswitch-checkbox" disabled="disabled">
								                             </#if>
								                          </#if>
								                          <label class="onoffswitch-label" for="${plvs.keyy}"> 
								                              <span class="onoffswitch-inner" data-swchon-text="启用" data-swchoff-text="禁用"></span> 
								                              <span class="onoffswitch-switch"></span> 
								                          </label> 
								                      </span>
												</div>
											</div>
									</#list>
								</#if>
							</fieldset>
							
							<fieldset class="col col-6">
								<legend>资源限制</legend>
								<#if productResourceLimitViewList??>
									<#list productResourceLimitViewList as plvs>
										<div class="form-group">
											<label class="col-md-4 control-label resourceLimit">${plvs.description!""}</label>
											<div class="col-md-4">
						                         <input class="form-control" placeholder="" type="text" name="${plvs.keyy!''}" id="${plvs.keyy!''}" value="${plvs.value!''}"/>
											</div>
										</div>
									</#list>
								</#if>
							</fieldset>
							
							<div class="form-actions">
								<div class="row">
									<div class="col-md-12">
										<button id="productSubmit" class="btn btn-primary" type="submit">
												<i class="fa fa-save" onclick="$('#productSubmit').click();"></i> 保存
										</button>
									</div>
								</div>
							</div>

						</form>

					</div>
					<!-- end widget content -->

				</div>
				<!-- end widget div -->

			</div>
			<!-- end widget -->

		</article>
		<!-- WIDGET END -->
    </div>
    
    
    <!-- widget grid -->
		<!-- row -->
		<div class="row" style="margin-left: 0.5em;margin-right: 0.5em;">
		
		<!-- NEW WIDGET START -->
		<article class="col-sm-6 col-md-6 col-lg-6">

			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget" id="wid-id-0" data-widget-deletebutton="false" data-widget-togglebutton="false" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-key"></i> </span>
					<h2>修改superAdmin密码</h2>
				</header>

				<!-- widget div-->
				<div>

					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->

					</div>
					<!-- end widget edit box -->

					<!-- widget content -->
					<div class="widget-body">
                        <form id="passwordForm" class="form-horizontal" method="post" action="javascript:void(0);">
                        
							<fieldset>
								<div class="form-group">
									<label class="col-md-4 control-label">密码</label>
									<div class="col-md-6">
										<input class="form-control" placeholder="输入原密码" type="password" name="oldpassword" id="oldpassword"
										/>
									</div>
								</div>
							</fieldset>

							<fieldset>
								<div class="form-group">
									<label class="col-md-4 control-label">新密码</label>
									<div class="col-md-6">
										<input class="form-control" placeholder="输入新密码" type="password" name="newpassword" id="newpassword"
										/>
									</div>
								</div>
							</fieldset>
							
							
							<fieldset>
								<div class="form-group" >
									<label class="col-md-4 control-label">再次输入新密码</label>
									<div class="col-md-6">
										<input class="form-control" placeholder="再次输入新密码" type="password" name="confirmPassword" id="confirmPassword"
										/>
									</div>
								</div>
							</fieldset>
							
							<div class="form-actions">
								<div class="row">
									<div class="col-md-12">
										<button id="passwordSubmit" class="btn btn-primary" type="submit">
												<i class="fa fa-save" onclick="$('#passwordSubmit').click();"></i> 保存
										</button>
									</div>
								</div>
							</div>

						</form>

					</div>
					<!-- end widget content -->

				</div>
				<!-- end widget div -->

			</div>
			<!-- end widget -->

		</article>
		<!-- WIDGET END -->

<!-- WIDGET END -->
		<!-- NEW WIDGET START -->
		<article class="col-sm-6 col-md-6 col-lg-6">

			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget" id="wid-id-0" data-widget-deletebutton="false" data-widget-togglebutton="false" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-fullscreenbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-key"></i> </span>
					<h2>修改admin密码</h2>
				</header>

				<!-- widget div-->
				<div>

					<!-- widget edit box -->
					<div class="jarviswidget-editbox">
						<!-- This area used as dropdown edit box -->

					</div>
					<!-- end widget edit box -->

					<!-- widget content -->
					<div class="widget-body">
                        <form id="adminPasswordForm" class="form-horizontal" method="post" action="javascript:void(0);">
                        
							<fieldset>
								<div class="form-group">
									<label class="col-md-4 control-label">新密码</label>
									<div class="col-md-6">
										<input class="form-control" placeholder="输入新密码" type="password" name="adminnewpassword" id="adminnewpassword"
										/>
									</div>
								</div>
							</fieldset>
							
							
							<fieldset>
								<div class="form-group" >
									<label class="col-md-4 control-label">再次输入新密码</label>
									<div class="col-md-6">
										<input class="form-control" placeholder="再次输入新密码" type="password" name="adminconfirmPassword" id="adminconfirmPassword"
										/>
									</div>
								</div>
							</fieldset>
							
							<div class="form-actions">
								<div class="row">
									<div class="col-md-12">
										<button id="adminpasswordSubmit" class="btn btn-primary" type="submit">
												<i class="fa fa-save" onclick="$('#adminpasswordSubmit').click();"></i> 保存
										</button>
									</div>
								</div>
							</div>

						</form>

					</div>
					<!-- end widget content -->

				</div>
				<!-- end widget div -->

			</div>
			<!-- end widget -->

		</article>
		<!-- WIDGET END -->
    </div>
    
</body>
<script type="text/javascript">
	  	pageSetUp();
	  	var pagefunction = function() {
			// registForm
			$('#passwordForm').bootstrapValidator({
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					oldpassword : {
						validators : {
							notEmpty : {
								message : '请输入您的密码'
							}
						}
					},
					newpassword : {
						validators : {
							notEmpty : {
								message : '请输入您的新密码'
							},
							identical:{
								field: 'confirmPassword',
								message : '两次密码不一致'
							}
						}
					},
					
					confirmPassword : {
						validators : {
							notEmpty : {
								message : '请再次输入您的新密码'
							},
							identical:{
								field: 'newpassword',
								message : '两次密码不一致'
							}
						}
					}
					
					
				}//end fields
			})
			.on("success.form.bv",function(e){
				// Prevent form submission就是点击提交之后摁钮变灰
	            e.preventDefault();
	            $("#passwordSubmit").attr("disabled",true);
				var oldpassword =$("#oldpassword").val();
				var newpassword =$("#newpassword").val();
				$.post("${springMacroRequestContext.contextPath}/superAdmin/savepwd",{"oldpassword":oldpassword,"newpassword":newpassword},function(data){
					if(data.errCode=="0"){
		                $.smallBox({
		                          title : "操作成功",
		                          content : "<i class='fa fa-clock-o'></i> "+data.errMsg+"...",
		                          color : "${c.green}",
		                          iconSmall : "fa fa-check fa-2x fadeInRight animated",
		                          timeout : 4000
		                     });
		           }else{
		                $.smallBox({
		                  title : "错误码 : "+data.errCode,
		                  content : "<i class='fa fa-clock-o'></i> "+data.errMsg+"...",
		                  color : "${c.red}",
		                  iconSmall : "fa fa-times fa-2x fadeInRight animated"
		              });
		           };
				},"json");
			});
			// registForm
			$('#adminPasswordForm').bootstrapValidator({
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					adminnewpassword : {
						validators : {
							notEmpty : {
								message : '请输入您的新密码'
							},
							identical:{
								field: 'adminconfirmPassword',
								message : '两次密码不一致'
							}
						}
					},
					
					adminconfirmPassword : {
						validators : {
							notEmpty : {
								message : '请再次输入您的新密码'
							},
							identical:{
								field: 'adminnewpassword',
								message : '两次密码不一致'
							}
						}
					}
					
					
				}//end fields
			})
			.on("success.form.bv",function(e){
				// Prevent form submission就是点击提交之后摁钮变灰
	            e.preventDefault();
	            $("#adminpasswordSubmit").attr("disabled",true);
				var adminnewpassword =$("#adminnewpassword").val();
				$.post("${springMacroRequestContext.contextPath}/superAdmin/resetAdminPwd",{"password":adminnewpassword},function(data){
					if(data.errCode=="0"){
		                $.smallBox({
		                          title : "操作成功",
		                          content : "<i class='fa fa-clock-o'></i> "+data.errMsg+"...",
		                          color : "${c.green}",
		                          iconSmall : "fa fa-check fa-2x fadeInRight animated",
		                          timeout : 4000
		                     });
		           }else{
		                $.smallBox({
		                  title : "错误码 : "+data.errCode,
		                  content : "<i class='fa fa-clock-o'></i> "+data.errMsg+"...",
		                  color : "${c.red}",
		                  iconSmall : "fa fa-times fa-2x fadeInRight animated"
		              });
		           };
				},"json");
			});
			
			// registForm
			$('#productForm').bootstrapValidator({
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					oldpassword : {
						validators : {
							notEmpty : {
								message : '请输入您的密码'
							}
						}
					}
				}//end fields
			})
			.on("success.form.bv",function(e){
				// Prevent form submission就是点击提交之后摁钮变灰
	            e.preventDefault();
	            $("#productSubmit").attr("disabled",true);
	            
	            var jsonFuncLimit = {};
				 $(".functionLimit").each(function(){
				     var keyy = $(this).next().find("input").attr("id");
				     var states = $(this).next().find("input").prop("checked");
				     jsonFuncLimit[keyy] = states;
				 });
				 var jsonResoLimit = {}; 
				 $(".resourceLimit").each(function(){
				     var keyy = $(this).next().find("input").attr("id");
				     var states = $(this).next().find("input").val();
				     jsonResoLimit[keyy] = states;
				 });
				 
				var funcLimit = JSON.stringify(jsonFuncLimit);
				var resoLimit = JSON.stringify(jsonResoLimit);
	            
				$.post("${springMacroRequestContext.contextPath}/superAdmin/saveSuperAdminConfig",{
					"functionLimitTemplate":funcLimit,
					"resourceLimitTemplate":resoLimit
					},function(data){
			        	$("#productSubmit").attr("disabled",false);
			        	if(data.errCode=="0"){
			                $.smallBox({
			                          title : "操作成功",
			                          content : "<i class='fa fa-clock-o'></i> "+data.errMsg+"...",
			                          color : "${c.green}",
			                          iconSmall : "fa fa-check fa-2x fadeInRight animated",
			                          timeout : 4000
			                     });
			           }else{
			                $.smallBox({
			                  title : "错误码 : "+data.errCode,
			                  content : "<i class='fa fa-clock-o'></i> "+data.errMsg+"...",
			                  color : "${c.red}",
			                  iconSmall : "fa fa-times fa-2x fadeInRight animated"
			              });
			           };
				},"json");
			});
			
		};
 		
 		var pagedestroy = function() {

 			$('#passwordForm').bootstrapValidator('destroy');
 			$('#productForm').bootstrapValidator('destroy');
 			$('button[data-toggle]').off();
 			if (debugState) {
 				root.console.log("✔ Bootstrap validator destroyed");
 			}

 		}
 		// end destroy

 		// run pagefunction
 		loadScript("${springMacroRequestContext.contextPath}/assets/js/plugin/bootstrapvalidator/bootstrapValidator.min.js", pagefunction);
</script> 
</html>	
