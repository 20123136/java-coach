<!DOCTYPE html>
<html lang="en-us">    
	<head>
	    <meta charset="utf-8">
	    <title>睿声软件</title>
	    <meta name="description" content="">
	    <meta name="author" content="">
	    
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	    
	    <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
		 <link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/demo.min.css">
		 <link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/buttons.css">
    
	    <#include "importcss.ftl">
	</head>

  	<body class="fixed-page-footer">

       <!-- #HEADER -->
		<header id="header">
          <div id="logo-group">

              <!-- PLACE YOUR LOGO HERE -->
              <span id="logo" style="margin-top:5px;"> <img src="${springMacroRequestContext.contextPath}/assets/img/logo_big2.png" alt="SmartAdmin" style="width:90%;"> </span>
              <!-- END LOGO PLACEHOLDER -->

          </div>

          <!-- #TOGGLE LAYOUT BUTTONS -->
          <!-- pulled right: nav area -->
          <div class="pull-right">
              <!-- logout button -->
              <div id="logout" class="btn-header transparent pull-right">
                  <span> <a href="logout" title="退出" data-action="userLogout" data-logout-msg="该操作将会退出本应用，确定退出?">
                  <i class="fa fa-sign-out"></i></a> </span>
              </div>
              <div id="update-sign" class="btn-header transparent pull-right">
                  <span> <a href="javascript:void(0);"><i id="webSocketSignal" title="断开链接" class="fa fa-unlink"></i></a> </span>
              </div>
              <!-- end logout button -->
              <div id="update-pwd" class="btn-header transparent pull-right">
                  <span>
                   <a href="personalConfig" title="修改个人配置" data-toggle="modal"  data-action="toggleShortcut" data-target="#remoteModal">
                         <i class="fa fa-user"></i>
                   </a>
                  </span>
              </div>

          </div>
          <!-- end pulled right: nav area -->

      </header>
      <!-- END HEADER -->

      <aside id="left-panel">
      
          <!-- User info -->
          <div class="login-info">
              <span> <!-- User image size is adjusted inside CSS, it should stay as is --> 
                  
                  <a href="javascript:void(0);" id="show-shortcut" data-action="toggleShortcut">
                      <img src="assets/avatars/male.png" alt="me" class="online" /> 
                      <span>
                          &nbsp;${user.nickName}
                      </span>
<!--                        <i class="fa fa-angle-down"></i> -->
                  </a> 
                  
              </span>
          </div>
          <!-- end user info -->
                  
          <nav>

              <ul>
              <!-- 递归  宏定义 -->
                  <#macro bpTree menus>
                  <#if menus?? && menus?size gt 0>
                  <#list menus as a>
                      <#if a.subMenuTree?? && a.subMenuTree?size gt 0>
                      
                      <li>

                          <a  id="${a.currentMenuNode.menuKey}"
                              <#if a.currentMenuNode.menuUrl??>
                                     href="${a.currentMenuNode.menuUrl}" title="${a.currentMenuNode.menuName}"
                                </#if>
                          >
                                  <#if a.currentMenuNode.menuIcon?? && a.currentMenuNode.menuIcon!=''>
                              <i
                                     class="fa fa-lg fa-fw  ${a.currentMenuNode.menuIcon}"
                              >
                              </i>
                                  </#if>
                              <span class="menu-item-parent">${a.currentMenuNode.menuName}</span>
                          </a>
                          <ul>
                              <@bpTree menus=a.subMenuTree />
                          </ul>
                      </li>   
                      <#else>
                          <li>
                          <a id="${a.currentMenuNode.menuKey}"
                              <#if a.currentMenuNode.menuUrl??>
                                    onclick="addTab('${a.currentMenuNode.menuKey}','${a.currentMenuNode.menuName}','${a.currentMenuNode.menuUrl}')" href="" title="${a.currentMenuNode.menuName}"
                                </#if>
                          >
                                  <#if a.currentMenuNode.menuIcon??  && a.currentMenuNode.menuIcon!=''>
                              <i
                                     class="fa fa-lg fa-fw  ${a.currentMenuNode.menuIcon}"
                              >
                              </i>
                                  </#if>
                              <span class="menu-item-parent">${a.currentMenuNode.menuName}</span>
                          </a>
                         </li>
                      </#if>
                  </#list>
                  </#if>
                  </#macro>
                 <!-- 调用宏 生成递归树 -->
                 <@bpTree menus=ViewMenus/>
              </ul>
          </nav>

          <span class="minifyme" data-action="minifyMenu"> <i class="fa fa-arrow-circle-left hit"></i> </span>

      </aside>
      <!-- END NAVIGATION -->
      
      <!-- #MAIN PANEL -->
      <div id="main">
         <!-- class="no-padding" 模板没有为了处理tab顶端对齐和左边对齐 -->
         <div id="tabs2" class="no-padding">
             <ul class="no-padding">
             </ul>
         </div>
          
          <!-- END #MAIN CONTENT -->
           <!-- 必不可少，这个段代码是控制显示右上角modal的个人设置的 -->
		<div id="remoteModal" class="modal fade" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">
		     <div class="modal-dialog">
		          <div class="modal-content"></div>
		     </div>
		</div>
		
		<div class="demo margin-bottom-10 padding-top-0" style="width:220px;background:#E0EEEE;"> 
			<span id="demo-setting" style="background:#5b835b;height:60px;"><i class="fa fa-phone txt-color-blueDark"></i>10</span>
			<form action="javascript:void(0);" id="indexValidForm" class="form-horizontal">
	        	<div id="beforeBind" class="padding-top-10">
		        	<fieldset>
		        		<div class="form-group">
		        			<div class="col-md-12">
								<input type="text" class="form-control" id="bindSipPhoneInput" name="bindSipPhoneInput" value="" placeholder="分机号"/>
							</div>
			        	</div>
			        	
			        	<div class="form-group">
							<div class="col-md-12">
								<button type="button" onclick="clickBind();" class="btn btn-xs btn-block btn-success"> 绑定 </button>
							</div>
			        	</div>
		        	</fieldset>
	        	</div>
	        	
	        	<div id="afterBind" class="hide">
					<div class="row padding-top-10" style="margin-left:-10px;background:#87CEFF; height:50px;">
		       		<div class="col-md-5">
							<h4 class="semi-bold" id="sipPhoneNameText">分机号</h4>	                
						</div>
						<div class="col-md-7">
							<div class="btn-group pull-right" id="pauseOrUnpause" style="width:100%;">
								<button class="btn btn-block btn-success" id="pauseOrUnpauseBtn" style="width:75%;" onclick="pauseOrUnpause();">
									置 闲
								</button>
								<button class="btn btn-default dropdown-toggle" style="width:25%;" data-toggle="dropdown" aria-expanded="false">
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li>
										<a href="javascript:void(0);" onclick="clickPauseReason('reasontext');">吃饭</a>
									</li>
									<li>
										<a href="javascript:void(0);">上厕所</a>
									</li>
									<li>
										<a href="javascript:void(0);">午休</a>
									</li>
									<li class="divider"></li>
									<li>
										<a href="javascript:void(0);" onclick="clickUnbind()">解绑</a>
									</li>
								</ul>
							</div>
						</div>
		        </div>
		        
		        <br>
	        		
	        		<fieldset>
		        		
<!-- 						<div class="form-group"> -->
<!-- 		        			<div class="col-md-12"> -->
<!-- 								<div class="btn-group btn-group-justified"> -->
<!-- 									<a href="javascript:void(0);" id="dialBtn" class="btn btn-default" style="background:#87CEFF;">拨号盘</a> -->
<!-- 									<a href="javascript:void(0);" id="historyCallsBtn" class="btn btn-default">历史通话</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 			        	</div> -->
	        		
			        	<div id="dial">
			        	
				        	<div class="form-group">
			        			<div class="col-md-12">
									<input type="text" class="form-control" id="phoneNumber" name="title" value="" placeholder="电话号码"/>
								</div>
				        	</div>
				        	
				        	<div class="form-group">
			        			<div class="col-md-4">
									<button type="button" id="one" onclick="clickPhoneNumber(1);" class="btn btn-xs btn-block btn-default"> 1 </button>
								</div>
								<div class="col-md-4">
									<button type="button" id="two" onclick="clickPhoneNumber(2);" class="btn btn-xs btn-block btn-default"> 2 </button>
								</div>
								<div class="col-md-4">
									<button type="button" id="three" onclick="clickPhoneNumber(3);" class="btn btn-xs btn-block btn-default"> 3 </button>
								</div>
				        	</div>
				        	
				        	<div class="form-group">
			        			<div class="col-md-4">
									<button type="button" id="four" onclick="clickPhoneNumber(4);" class="btn btn-xs btn-block btn-default"> 4 </button>
								</div>
								<div class="col-md-4">
									<button type="button" id="five" onclick="clickPhoneNumber(5);" class="btn btn-xs btn-block btn-default"> 5 </button>
								</div>
								<div class="col-md-4">
									<button type="button" id="six" onclick="clickPhoneNumber(6);" class="btn btn-xs btn-block btn-default"> 6 </button>
								</div>
				        	</div>
				        	
				        	<div class="form-group">
			        			<div class="col-md-4">
									<button type="button" id="seven" onclick="clickPhoneNumber(7);" class="btn btn-xs btn-block btn-default"> 7 </button>
								</div>
								<div class="col-md-4">
									<button type="button" id="eight" onclick="clickPhoneNumber(8);" class="btn btn-xs btn-block btn-default"> 8 </button>
								</div>
								<div class="col-md-4">
									<button type="button" id="nine" onclick="clickPhoneNumber(9);" class="btn btn-xs btn-block btn-default"> 9 </button>
								</div>
				        	</div>
				        	
				        	<div class="form-group">
			        			<div class="col-md-4">
									<button type="button" id="asterisk" onclick="clickPhoneNumber(10);" class="btn btn-xs btn-block btn-default"> * </button>
								</div>
								<div class="col-md-4">
									<button type="button" id="zero" onclick="clickPhoneNumber(0);" class="btn btn-xs btn-block btn-default"> 0 </button>
								</div>
								<div class="col-md-4">
									<button type="button" id="poundSign" onclick="clickPhoneNumber(11);" class="btn btn-xs btn-block btn-default"> # </button>
								</div>
				        	</div>
				        	
				        	<div class="form-group">
								<div class="col-md-6">
									<button type="button" id="holdOrUnhold" onclick="holdOrUnhold();" hold="true" class="btn btn-xs btn-block btn-default">Hold</button>
								</div>
								<div class="col-md-6">
<!-- 									<button type="button" id="redircet" onclick="redircet();" class="btn btn-xs btn-block btn-default">转接</button> -->
									<a href="javascript:void(0);"
										id="redircet" class="btn btn-xs btn-block btn-default" rel="popover" data-placement="top" data-original-title="<i class='fa fa-fw fa-pencil'></i>转接到" 
										data-content="
											<form action='javascript:void(0)' style='min-width:170px;'>
												<div class='checkbox'>
													<label>
														<input type='checkbox' class='checkbox style-0'>
														<span>Execute</span>
													</label>
												</div>
												
												<select id='sipPhoneSelect2' name='sipPhoneSelect2' class='form-control select2'>
													 <#if sipPhoneList??>
														 <#list sipPhoneList as obj>
															 <option value='${obj.name}'>${obj.name}</option>
														 </#list>
													 </#if>
												</select>
												
												<div class='form-actions'>
													<div class='row'>
														<div class='col-md-12'>
															<button class='btn btn-primary btn-sm' type='submit'>	确认 </button>
														</div>
													</div>
												</div>
											</form>" data-html="true" aria-describedby="popover50245">转 接
									</a>
								</div>
				        	</div>
				        	
				        	<div class="form-group">
			        			<div class="col-md-12">
									<button type="button" id="originateOrHangupBtn" originate="true" onclick="originateOrHangup();" style="background: #43CD80;" class="button button-pill button-primary btn-block">呼 叫</button>
								</div>
				        	</div>
				        	
				        	<div>
				        		<legend class="no-padding margin-bottom-10">技能组排队数</legend>
				        	</div>
				        	<table class="table table-bordered">
								<tbody>
									<tr>
										<td>技能组1</td>
										<td>1</td>
									</tr>
									<tr>
										<td>技能组2</td>
										<td>2</td>
									</tr>
									<tr>
										<td>技能组3</td>
										<td>3</td>
									</tr>
									<tr>
										<td>技能<br>.组4</td>
										<td>4</td>
									</tr>
								</tbody>
							</table>
			        	</div>
			        	
			        	<div id="historyCalls" class="hide">
			        		<table id="demobox_dt_basic" class="table table-striped table-bordered table-hover" width="100%">
								<thead>			                
									<tr>
										<th>历史</th>
										<th>客户</th>
										<th>时间</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>技能组1</td>
										<td>1</td>
										<td>1</td>
									</tr>
									<tr>
										<td>技能组2</td>
										<td>2</td>
										<td>1</td>
									</tr>
									<tr>
										<td>技能组3</td>
										<td>3</td>
										<td>1</td>
									</tr>
									<tr>
										<td>技能<br>.组4</td>
										<td>4</td>
										<td>1</td>
									</tr>
								</tbody>
							</table>
			        	</div>
			        	
	           </fieldset>
	        	
	        	</div>	
			</form>
		</div>
		
     </div>
     <!-- END #MAIN PANEL -->

      <!-- #PAGE FOOTER -->
      <div class="page-footer">
         <div class="row">
            <div class="col-xs-6 col-sm-6">
                    <span class="txt-color-white">上海睿声软件技术有限公司<span class="hidden-xs"> - <a href="http://www.rssoft.cc" target="_blank">http://www.rssoft.cc</a> </span></span>
            </div>
            
            <div class="col-xs-6 col-sm-6" style="text-align: right;">
                    <span id="serverTime" class="txt-color-white" >服务器时间</span>
            </div>
         </div>
         <!-- end row -->
      </div>
      <!-- END FOOTER -->

      <#include "importjs.ftl">

        <!-- 全局要使用的js代码，比如websocket -->
		<script type="text/javascript">
		  	
			$("#demo-setting").click(function() {
			    $(".demo").toggleClass("activate");
			});
			
			function clickBind(){
		  		var bindSipPhoneVal = $("#bindSipPhoneInput").val();
				if(bindSipPhoneVal != ''){
					window.localStorage.setItem("bindedSipPhoneName",bindSipPhoneVal);
					$("#beforeBind").addClass("hide");
					$("#afterBind").removeClass("hide");
					$("#sipPhoneNameText").text(bindSipPhoneVal);
				}else{
					$.smallBox({
                     title : "警告",
                     content : "<i class='fa fa-clock-o'></i>分机号不能为空",
                     color : "#C79121",
                     iconSmall : "fa fa-check fa-2x fadeInRight animated",
                     timeout : 1000
                   });
				  return;
				}
			}
		  	function clickUnbind() {
		  		window.localStorage.removeItem("bindedSipPhoneName");
		  		$("#afterBind").addClass("hide");
		  		$("#beforeBind").removeClass("hide");
			}
		  	
		 	var reason = "";
		  	function pauseOrUnpause() {
		  		var url = '${springMacroRequestContext.contextPath}/dial/pauseOrUnpause';
		  		var pause = false;
		  		if($("#pauseOrUnpauseBtn").hasClass("btn-success")){
		  			pause = true;
		  		}
		  		var sipPhoneName = window.localStorage.getItem("bindedSipPhoneName");
		 		$.post(url, {"pause":pause,"sipPhoneName":sipPhoneName,"reason":reason}, function(data) {
		 			if(data.errCode=="0"){
		            $.smallBox({
                      title : "操作成功",
                      content : "<i class='fa fa-clock-o'></i> "+data.errMsg+"...",
                      color : "${c.green}",
                      iconSmall : "fa fa-check fa-2x fadeInRight animated",
                      timeout : 2000
	                    });
		            if(pause){
		            	if(reason == ""){
		            		$("#pauseOrUnpauseBtn").text("置 忙");
		            	}else{
		            		$("#pauseOrUnpauseBtn").text(reason);
		            		}
	            		$("#pauseOrUnpauseBtn").removeClass("btn-success");
	            		$("#pauseOrUnpauseBtn").addClass("btn-warning");
							$("#demo-setting")[0].style.background = "#c79121";
		            }else{
		            	$("#pauseOrUnpauseBtn").text("置 闲");
	            		$("#pauseOrUnpauseBtn").removeClass("btn-warning");
		            	$("#pauseOrUnpauseBtn").addClass("btn-success");
	            		$("#demo-setting")[0].style.background = "#5b835b";
		            	}
					}else{
	               $.smallBox({
	                  title : "错误码 : "+data.errCode,
	                  content : "<i class='fa fa-clock-o'></i> "+data.errMsg+"...",
	                  color : "${c.red}",
	                  iconSmall : "fa fa-times fa-2x fadeInRight animated"
		               });
		           };
		 		}, "json").error(function(){
                    $.smallBox({
                        title : "操作异常",
                        content : "<i class='fa fa-clock-o'></i> <i style='font-size: 15px;'>操作异常...</i>",
                        color : "${c.red}",
                        iconSmall : "fa fa-times fa-2x fadeInRight animated"
                    	  });
                });
			}
		  	
		  	function	clickPauseReason(obj){
		  		reason = obj;
		  	}
		  	
		  	function	clickPhoneNumber(obj){
		  		if(obj == '10'){
		  			obj = '*';
		  		}else if(obj == '11'){
		  			obj = '#';
		  		}
		  		var oldPhoneNumber = $("#phoneNumber").val();
		  		$("#phoneNumber").val(oldPhoneNumber + obj);
		  	}
		  	
		  	function holdOrUnhold() {
		  		var url = '${springMacroRequestContext.contextPath}/dial/holdOrUnhold';
		  		var sipPhoneName = window.localStorage.getItem("bindedSipPhoneName");
		 		var hold = true;
		 		if($("#holdOrUnhold")[0].getAttribute("hold") == "false"){
		 			hold = false;
		  		}
		 		$.post(url, {"hold":hold,"sipPhoneName":sipPhoneName}, function(data) {
		 			if(data.errCode=="0"){
			            if(hold){
			            	$("#holdOrUnhold").text("Unhold");
								$("#holdOrUnhold")[0].setAttribute("hold","false");
			            }else{
			            	$("#holdOrUnhold").text("Hold");
		            		$("#holdOrUnhold")[0].setAttribute("hold","true");
			            	}
					}else{
	               $.smallBox({
	                  title : "错误码 : "+data.errCode,
	                  content : "<i class='fa fa-clock-o'></i> "+data.errMsg+"...",
	                  color : "${c.red}",
	                  iconSmall : "fa fa-times fa-2x fadeInRight animated"
		               });
		           };
		 		}, "json").error(function(){
                    $.smallBox({
                        title : "操作异常",
                        content : "<i class='fa fa-clock-o'></i> <i style='font-size: 15px;'>操作异常...</i>",
                        color : "${c.red}",
                        iconSmall : "fa fa-times fa-2x fadeInRight animated"
                    	  });
                });
			}
		  	
		  	function redircet() {
		  		
		  		var url = '${springMacroRequestContext.contextPath}/dial/redircet';
		  		var sipPhoneName = window.localStorage.getItem("bindedSipPhoneName");
		  		$.post(url, {"sipPhoneName":sipPhoneName}, function(data) {
		 			
		 		}, "json").error(function(){
                    $.smallBox({
                        title : "操作异常",
                        content : "<i class='fa fa-clock-o'></i> <i style='font-size: 15px;'>操作异常...</i>",
                        color : "${c.red}",
                        iconSmall : "fa fa-times fa-2x fadeInRight animated"
                    	  });
                });
			}
		  	
		  	function originateOrHangup() {
		  		var url = '${springMacroRequestContext.contextPath}/dial/originateOrHangup';
		  		var sipPhoneName = window.localStorage.getItem("bindedSipPhoneName");
		  		var originate = true;
		  		
		  		if($("#originateOrHangupBtn")[0].getAttribute("originate") == "false"){
		  			originate = false;
		  		}
		 		$.post(url, {"sipPhoneName":sipPhoneName}, function(data) {
		 			if(data.errCode=="0"){
			            if(originate){
			            	$("#originateOrHangupBtn").text("挂 断");
								$("#originateOrHangupBtn")[0].style.background = "#F08080";
								$("#originateOrHangupBtn")[0].setAttribute("originate","false");
			            }else{
			            	$("#originateOrHangupBtn").text("呼 叫");
		            		$("#originateOrHangupBtn")[0].style.background = "#43CD80";
		            		$("#originateOrHangupBtn")[0].setAttribute("originate","true");
			            	}
					}else{
	               $.smallBox({
	                  title : "错误码 : "+data.errCode,
	                  content : "<i class='fa fa-clock-o'></i> "+data.errMsg+"...",
	                  color : "${c.red}",
	                  iconSmall : "fa fa-times fa-2x fadeInRight animated"
		               });
		           };
		 		}, "json").error(function(){
                    $.smallBox({
                        title : "操作异常",
                        content : "<i class='fa fa-clock-o'></i> <i style='font-size: 15px;'>操作异常...</i>",
                        color : "${c.red}",
                        iconSmall : "fa fa-times fa-2x fadeInRight animated"
                    	  });
                });
			}

		  	
// 		  	$("#dialBtn").click(function(){
// 		  		$("#historyCalls").addClass("hide");
// 		  		$("#dial").removeClass("hide");
// 		  		$("#dialBtn")[0].style.background = "#87CEFF";
// 		  		$("#historyCallsBtn")[0].style.background = "white";
// 		  	});
		  	
// 			$("#historyCallsBtn").click(function(){
// 				$("#dial").addClass("hide");
// 				$("#historyCalls").removeClass("hide");
// 				$("#historyCallsBtn")[0].style.background = "#87CEFF";
// 				$("#dialBtn")[0].style.background = "white";
// 		  	});
			
        	//回现之前选中的菜单
         $(document).ready(function(){
				var sipPhoneName = window.localStorage.getItem("bindedSipPhoneName");
				if((sipPhoneName != null) && (sipPhoneName != undefined)){
					$("#beforeBind").addClass("hide");
					$("#afterBind").removeClass("hide");
					$("#sipPhoneNameText").text(sipPhoneName);
					if($("#pauseOrUnpauseBtn").hasClass("btn-success")){
						$("#demo-setting")[0].style.background = "#5b835b";
					}else{
						$("#demo-setting")[0].style.background = "#c79121";
					}
				}
        	 
                //后端记录打开的tab
            var url = "${springMacroRequestContext.contextPath}/getOpenTab";
            $.post(url,{},function(data){
                    

                    //注意这里的key是tab的key，菜单和tab的key关系  tab的key tabkey="tabs_"+menuKey
                    var tabKeyAndOpenStates = JSON.parse(data);//转json
                    var activeTabKey = "";
                    
                    //这里点击的是菜单
                    for(var tabkey in tabKeyAndOpenStates){
                        var tabStatesJson = tabKeyAndOpenStates[tabkey];
                        var menuName = tabStatesJson.menuName;
                        var menuUrl =  tabStatesJson.menuUrl;
                        var menuKey = tabStatesJson.menuKey;
                        var active = tabStatesJson.active;
                        //活跃
                        if(active){
                            activeTabKey = tabkey;
                        }
                        
                        //画tab
                        addTabNoData(menuKey,menuName,menuUrl);
                    }
                    //如果没有菜单打开默认设置
                    if(activeTabKey!=""){
                        //获取tab数据
                        $("a[href='#"+activeTabKey+"']").click();
                    }else{
                        $("a[id='mod_menu_dashboard']").click();
                    }

                    
                }).error(function(){
                     $.smallBox({
                       title : "请求异常tab",
                       content : "<i class='fa fa-clock-o'></i> 请求异常",
                       color : "${c.red}",
                       iconSmall : "fa fa-times fa-2x fadeInRight animated",
                       timeout : 8000
                });
            });
            
        });
        
        /////////////////////////////////////////////////////////////////////////////
        //获取所有的tab的唯一标识，这里主要使用来判断打开的tab
        function getAllTabKey(){
            var tabKeyArr = [];
            $("#tabs2 ul.ui-tabs-nav li").each(function(){
                var tabKey = $(this).attr("aria-controls");
                tabKeyArr.push(tabKey);
            });
            return tabKeyArr;
        }
        
        //处理返回给后端的数据,{tabKey:{active:true,menuKey:menuKey},}，这里是专门拼装成指定格式给后端使用
        function getAllTabMessageToSession(){
                var tabJson = {};
                $("#tabs2 ul.ui-tabs-nav li").each(function(){
                    
                    var json = {};
                    
                    var tabindex = $(this).attr("tabindex");
                    
                    var menuKey = $(this).attr("menuKey");
                    json.menuKey = menuKey;
                    
                    var menuName = $(this).attr("menuName");
                    json.menuName = menuName;
                    
                    var menuUrl = $(this).attr("menuUrl");
                    json.menuUrl = menuUrl;
                    
                    //0表示当前活跃
                    if(tabindex=="0"){
                        json.active = true;
                        //菜单选中变白
                        $("#left-panel").find("a[href!='#']").parent("li").removeClass("active");//取消子菜单选中的
                        $("#"+menuKey).parent("li").addClass("active");
                    }else{
                        json.active = false;
                    }
                    
                    
                    var tabKey = $(this).attr("aria-controls");
                    tabJson[tabKey] = json;
                 });
                
                return tabJson;
            }
            
            ///////////////////////////////弹屏需要的记录的变量和方法//////////////////////////////////////////////
        
        	//弹屏需要的记录的变量和方法
         var autoOpenNext =  false;//默认不打开
            
            ///////////////////////////////////////////////////////////////////////////
            
            //初始化
            var tabs = $("#tabs2").tabs();
            
            //tab打开信息传到后端
           var reloadOpenTab =  function(){
            	
                //所有的tabkey信息，key=tabKey value=“menuKey,menuName,menuUrl，active组成的json”
                var tabKeyJson = getAllTabMessageToSession();
                
                //后端记录打开的tab
                var url = "${springMacroRequestContext.contextPath}/reloadOpenTab";
                $.post(url,{"tabKeyAndOpenStates":JSON.stringify(tabKeyJson)},function(data){
                }).error(function(){
                     $.smallBox({
                       title : "请求异常",
                       content : "<i class='fa fa-clock-o'></i> 请求异常reloadOpenTab",
                       color : "${c.red}",
                       iconSmall : "fa fa-times fa-2x fadeInRight animated",
                       timeout : 8000
                   });
                });
            }
            
			///////////////////////////////弹屏需要的记录的变量和方法//////////////////////////////////////////////
            
            
            
            //打开tab页面
            function getTabData(menuKey,menuName,menuUrl){
                //注意这里的ID 需要 和a href #后面的内容保持一直
                //请求的url，例如这里请求的是接入号的controller会转到iframe的页面
                var url = "${springMacroRequestContext.contextPath}/"+menuUrl.split("_")[1];
                tabs.find("div#tabs_"+menuKey).remove();
                tabs.append("<div style='background-image: url(${springMacroRequestContext.contextPath}/assets/img/mybg.png);' id='tabs_" + menuKey + "'><iframe id='iframe_"+menuKey+"'  src='"+url+"' id='abc_"+menuKey+"' name='abc_"+menuKey+"'  style='height:80em;' width='100%' frameborder='0'  scrolling='auto' scrolling-x='hidden'  marginheight='0' marginwidth='0'></iframe></div>");
                tabs.tabs("refresh");
                //创新加载打开的窗口信息记录到session
                reloadOpenTab();
            }
            

            //重新激活打开的窗口
            function reActiveOpenTab(menuKey,menuName,menuUrl){
                //菜单选中变白
                $("#left-panel").find("a[href!='#']").parent("li").removeClass("active");//取消子菜单选中的
                $("#"+menuKey).parent("li").addClass("active");
                
                //判断是否打开,如果打开就不重新加载数据，如果不存在就重新加载数据
                if($("#iframe_"+menuKey).length>0){
                    reloadOpenTab();
                }else{
                    //激活获取数据
                    getTabData(menuKey,menuName,menuUrl);
                }
            }

            // 右键菜单的内容,每个方法实现的不一样的，实在想不到怎么抽出来了。
            var menuData = 
                [
                 [{
                    text: "关闭",
                    func: function() {
                        var panelId = $(this).closest("li").remove().attr("aria-controls");
                            $("#" + panelId).remove();
                            tabs.tabs("refresh");
                            //关闭重新加载tab打开信息
                            reloadOpenTab();
                    }
                  },{
                    text: "关闭全部",
                    func: function() {
                        $("#tabs2 ul.ui-tabs-nav span").each(function(){
                            var panelId = $(this).closest("li").remove().attr("aria-controls");
                            $("#" + panelId).remove();
                        });
                        tabs.tabs("refresh");
                        //关闭重新加载tab打开信息
                        reloadOpenTab();
                    }
                  },{
                    text: "关闭其他",
                    func: function() {
                        $(this).siblings().find("span").each(function(){
                            var panelId = $(this).closest("li").remove().attr("aria-controls");
                            $("#" + panelId).remove();
                        });
                        tabs.tabs("refresh");
                        //关闭重新加载tab打开信息
                        reloadOpenTab();
                    }
                 }],
                 [
                  {
                    text: "关闭右侧标签",
                    func: function() {
                        $(this).nextAll().find("span").each(function(){
                            var panelId = $(this).closest("li").remove().attr("aria-controls");
                            $("#" + panelId).remove();
                        });
                        tabs.tabs("refresh");
                        //关闭重新加载tab打开信息
                        reloadOpenTab();
                    }
                  },{
                    text: "关闭左侧标签",
                    func: function() {
                        $(this).prevAll().find("span").each(function(){
                            var panelId = $(this).closest("li").remove().attr("aria-controls");
                            $("#" + panelId).remove();
                        });
                        tabs.tabs("refresh");
                        //关闭重新加载tab打开信息
                        reloadOpenTab();
                    }
                  }
                 ]
                ];
            
            //打开tab页面
            function addTabNoData(menuKey,menuName,menuUrl){
                //菜单选中变白
                $("#left-panel").find("a[href!='#']").parent("li").removeClass("active");//取消子菜单选中的
                $("#"+menuKey).parent("li").addClass("active");
                
                //判断是否打开过,如果打开过就变活跃，否则新打开tab
                var tabKeyArr = getAllTabKey();
                var tabKey = "tabs_" + menuKey;
                
                //-1表示不在数组中
                if(tabKeyArr.indexOf(tabKey)==-1){
                    // Dynamic tabs
                    //注意：这里的onclick事件是为了切换tab的时候更新后台session里面的tab打开和选中情况，加载方式采用页面重新加载的方法，可以预防统计不准确。
                    //padding-bottom: 0px;这个属性不是模板里面的，是解决点击tab会顶出下一层菜单的问题
                    //margin-top:0px;这个属性不是模板里面的，是解决点击tab会顶出下一层菜单的问题
                    //menuKey menuName menuUrl主要是回现上面回现打开的菜单，需要，因为只是请求当前页面的数据需要拼接url和name
                    var li = 
                    "<li  onclick='reActiveOpenTab(\""+menuKey+"\",\""+menuName+"\",\""+menuUrl+"\");' menuKey='"+menuKey+"' menuName='"+menuName+"' menuUrl='"+menuUrl+"' style='position:relative;padding-bottom: 0px;margin-top:0px;'>"
                        +"<span class='air air-top-left delete-tab' style='top:7px; left:7px;'>"
                            +"<button class='btn btn-xs font-xs btn-default hover-transparent'>"
                                +"<i class='fa fa-times'></i>"
                            +"</button>"
                        +"</span>"
                        +"<a class='forclick' href='#"+tabKey+"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+menuName+"</a>"
                    +"</li>";   
                    tabs.find(".ui-tabs-nav").append(li);
                    tabs.find(".ui-tabs-nav").append("<div style='background-image: url(${springMacroRequestContext.contextPath}/assets/img/mybg.png);' id='tabs_" + menuKey + "'></div>");
                    tabs.tabs("refresh");
                    ////////////////////////////绑定右键事件////////////////////////////////////
                    $("#tabs2 ul.ui-tabs-nav li").smartMenu(menuData);
                    ///////////////////////////////////////////////////////////////////
                }
                
            }
        
         // actual addTab function: adds new tab using the input from the form above
            // 这里是画tab的
         function addTab(menuKey,menuName,menuUrl) {
                //画tab
            addTabNoData(menuKey,menuName,menuUrl);
                //获取tab数据
            var tabKey = "tabs_" + menuKey;
            $("a[href='#"+tabKey+"']").click();
            }
            
           // 关闭tab及对应内容，用于点击叉叉关闭
        $("#tabs2").on("click", 'span.delete-tab', function() {
            var panelId = $(this).closest("li").remove().attr("aria-controls");
            $("#" + panelId).remove();
            tabs.tabs("refresh");
                //关闭重新加载tab打开信息
            reloadOpenTab();
            });
        
         // ----------------------------  Websocket -------------------------------
         var host = window.location.host;
         var userid = "${user.id}";
         var url = "";
         var serverTime = 0;//服务器毫秒数
         var func = "";//时间函数
            
         if (window.location.protocol == 'http:') {
             url = 'ws://' + host + '/qqd/websocket/' + userid + '';
         } else {
             url = 'wss://' + host + '/qqd/websocket/' + userid + '';
            }
            
         function timeAdd(){
             var date = new Date(serverTime+=1000);
             $("#serverTime").text(date.Format("yyyy年MM月dd日 hh:mm:ss"));
            }
            
         function onOpen(event) {
                //点亮“信号灯”
            $("#update-sign i").css("color", "green").attr("title", "信号状态：已连接").removeClass("fa-unlink").addClass("fa-link");
                //设置服务器时间
            $.post("${springMacroRequestContext.contextPath}/getServerTime",{},function(data){
               serverTime = parseInt(data);
               var date = new Date(serverTime);
               $("#serverTime").text(date.Format("yyyy年MM月dd日 hh:mm:ss"));
            	func = setInterval(timeAdd,1000);
                })
            };
    
         function onClose(event) {
                //1）关闭“信号灯”
            $("#update-sign i").css("color", "gray").attr("title", "信号状态：连接断开").removeClass("fa-link").addClass("fa-unlink");
                //清除服务器时间
            clearInterval(func);
            $("#serverTime").text("");
                //2）重连
            myWebsocket.connect(url);
			};
    
         function onError(event) { };
            
         var myWebsocket = new RsWebsocket(onOpen,onClose,onError);
         myWebsocket.connect(url);
         // ----------------------------  Websocket -------------------------------
          
            //弹屏方法
			// ----------------------------  Websocket 具体业务回调函数-------------------------------
	    	function popScreenEventhandler(obj) {
				var tabKey = obj.tabKey;
				var tabName = obj.tabName;
				var tabUrl = obj.tabUrl;
				addTab(tabKey,tabName,tabUrl);
	    	};
   	
	    	//注册方法，类似接口
	    	myWebsocket.registHandler("popScreen",popScreenEventhandler);
    	
         function logoutEventhandler(obj) {
              window.location.href="login";
          	};
          
         myWebsocket.registHandler("logout",logoutEventhandler);
         // ----------------------------  Websocket 具体业务回调函数-------------------------------

        
            //防止菜单被拖动
         $(document).on("dragstart","a",function(){return false;});
            
       		//关闭bootstrap modal时，清理掉modal容器div中上一次的内容
         var hideModalDiv = function(remoteModalId){
             $("#"+remoteModalId).find("div.modal-content").children("div").addClass("hide");
         	}
       		
         var pagefunction = function() {
            var index_responsiveHelper_dt_basic = undefined;
	 			var index_breakpointDefinition = {
	 				tablet : 1024,
	 				phone : 480
	 			};
	          $('#demobox_dt_basic').dataTable({
// 	        	  "columns":[
	        		  
// 	        	   ],
	        	  "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f>>t",
					"oLanguage": {
						"sSearch": ''
					},
	 				"autoWidth" : true,
	 				"preDrawCallback" : function() {
	 					// Initialize the responsive datatables helper once.
	 					if (!index_responsiveHelper_dt_basic) {
	 						index_responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#demobox_dt_basic'), index_breakpointDefinition);
	 					}
	 				},
	 				"rowCallback" : function(nRow) {
	 					index_responsiveHelper_dt_basic.createExpandIcon(nRow);
	 				},
	 				"drawCallback" : function(oSettings) {
	 					index_responsiveHelper_dt_basic.respond();
	 				}
	 			});
            }
         loadScript("${springMacroRequestContext.contextPath}/assets/js/plugin/bootstrapvalidator/bootstrapValidator.min.js", function(){
             loadScript("${springMacroRequestContext.contextPath}/assets/js/plugin/datatables/jquery.dataTables.min.js", function(){
                   loadScript("${springMacroRequestContext.contextPath}/assets/js/plugin/datatables/dataTables.colVis.min.js", function(){
                        loadScript("${springMacroRequestContext.contextPath}/assets/js/plugin/datatables/dataTables.tableTools.min.js", function(){
                             loadScript("${springMacroRequestContext.contextPath}/assets/js/plugin/datatables/dataTables.bootstrap.min.js", function(){
                                   loadScript("${springMacroRequestContext.contextPath}/assets/js/plugin/datatable-responsive/datatables.responsive.min.js", pagefunction)
	                              });
	                        });
	                   });
	             });
	      });
         
		</script>
	</body>
</html>