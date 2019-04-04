<div class="modal-body no-padding">
	
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="hideModalDiv('remoteModalSubPage');">
			&times;
		</button>
		<h4 class="modal-title"> 部门添加  </h4>
	</div>
	
	<form action="javascript:void(0);" id="saveForm">
		<div class="modal-body">
			<div class="smart-form">
				<fieldset>
		            
		            <section>
						<div class="row">
							<label class="label col col-2" style="text-align:right;">部门名称</label>
							<div class="col col-10">
								<label class="input">
									<input type="text" class="form-control" id="save_deptName" value="" name="save_deptName" placeholder="部门名称" />
								</label>
							</div>
						</div>
					</section>
					
					<section>
						<div class="row">
							<label class="label col col-2" style="text-align:right;">上级部门</label>
							<div class="col col-10">
								<label class="input">
									<select id="save_parentName" name="save_parentName" class="form-control" >
	                                    <option value="" selected="selected">---- 上级部门----</option>
			                            <#list deptList as d>
											<option value="${d.uuid}">${d.deptName}</option>
										</#list>
	                                </select>
								</label>
							</div>
						</div>
					</section>
					
				</fieldset>
			</div>
		</div>
			
		<div class="modal-footer">
			<footer>
				<button id="saveCancel" onclick="hideModalDiv('remoteModalSubPage');" type="button" class="btn btn-default" data-dismiss="modal">
					取消
				</button>
				<button  id="saveSubmitBtn" type="submit" class="btn btn-primary">
					保存
				</button>
			</footer>
		</div>
	</form>
</div>

<script type="text/javascript">

	  	pageSetUp();
	  	
	  //获取焦点,select和brap冲突，这个获取焦点才能解决，select获取不到焦点问题。
  		$.fn.modal.Constructor.prototype.enforceFocus = function() {};
	  	
	  	var pagefunction = function() {
	  		
	  		/* select2 样式，必不可少 */
		    $("#save_parentName").select2({
		          width:"100%",
		    });

	  		$('#saveForm').bootstrapValidator({
				
	  			feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				
				fields : {
					
					save_deptName : {
						group : '.col-10',
						validators : {
							notEmpty : {
								message : '部门名称不能为空'
							},
							stringLength: {
 	                    max: 64,  
 	                    message: '长度不能超过64位'  
 	                        },
							remote : {
		        				url:"${springMacroRequestContext.contextPath}/dept/isDeptNameExist",
		        				message: '该部门名称已存在',
		        				data:{
	            					deptName : function(){
	            						return $("#save_deptName").val();
	            					}
		            			}
		        			} 
						}
					}
					
					
				}//end fields
			})
			.on("success.form.bv",function(e){
				
				// Prevent form submission 即阻止表单提交数据
	            e.preventDefault();
				
				//另提交按钮变成灰色
	            $("#saveSubmitBtn").attr("disabled",true);
	            
				var deptName = $("#save_deptName").val();
				
				//添加新部门时，可选的上级部门即为数据库中所有的部门
				var uuid = $("#save_parentName").val();
				
				$.post("${springMacroRequestContext.contextPath}/dept/save",{"deptName":deptName,"uuid":uuid},function(data){
					
					if(data.errCode=="0"){
		                $.smallBox({
		                          title : "操作成功",
		                          content : "<i class='fa fa-clock-o'></i> "+data.errMsg+"...",
		                          color : "${c.green}",
		                          iconSmall : "fa fa-check fa-2x fadeInRight animated",
		                          timeout : 4000
		                     });
		                
		                $('#saveCancel').click();
		                myTable.ajax.reload(null,true);
			                     
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

 			$('#saveForm').bootstrapValidator('destroy');
 			$('button[data-toggle]').off();
 			if (debugState) {
 				root.console.log("✔ Bootstrap validator destroyed");
 			}

 		}
 		// end destroy

 		// run pagefunction
 		loadScript("${springMacroRequestContext.contextPath}/assets/js/plugin/bootstrapvalidator/bootstrapValidator.min.js", pagefunction);
 		
</script> 