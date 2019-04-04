<div class="modal-body no-padding">
	
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="hideModalDiv('remoteModalSubPage');">
			&times;
		</button>
		<h4 class="modal-title"> 编辑部门  </h4>
	</div>
	
	<form action="javascript:void(0);" id="updateForm">
		<div class="modal-body">
			<div class="smart-form">
				<fieldset>
					
					<section>
						<div class="row">
							<label class="label col col-2" style="text-align:right;">部门名称</label>
							<div class="col col-10">
								<label class="input">
									<input type="text" class="form-control" id="update_deptName" value="${dept.deptName}" name="update_deptName" placeholder="部门名称" />
								</label>
							</div>
						</div>
					</section>
					
					<section>
						<div class="row">
							<label class="label col col-2" style="text-align:right;">上级部门</label>
							<div class="col col-10">
								<label class="input">
									<select id="update_parentName" name="update_parentName" class="form-control" >
	                                    <option value="" selected="selected">---- 上级部门----</option>
										
										<#if (dept.parent)??>
											<#if deptList?? >
												<#list deptList as d>
													<#if (d.uuid==dept.parent)>
														<option selected="selected" value="${d.uuid}">${d.deptName}</option>
													<#else>
														<option value="${d.uuid}">${d.deptName}</option>
													</#if>
												</#list>
											</#if>
										<#else>
											<#list deptList as d>
												<option value="${d.uuid}">${d.deptName}</option>
											</#list>
										</#if>
										
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
				<button id="updateCancel" onclick="hideModalDiv('remoteModalSubPage');" type="button" class="btn btn-default" data-dismiss="modal">
					取消
				</button>
				<button  id="updateSubmitBtn" type="submit" class="btn btn-primary">
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
	  		
	  		$("#update_parentName").select2({
	              width:"100%",
	        });
	  		
	  		$('#updateForm').bootstrapValidator({
				
	  			feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				
				fields : {
					update_deptName : {
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
	            					id : function(){
	            						return ${dept.id};
	            					},
	            					deptName : function(){
	            						return $("#update_deptName").val();
	            					}
		            			}
		        			} 
						}
					},
					update_parentName : {
						group : '.col-10',
						validators : {
							notEmpty : {
								message : '上级部门不能为空'
							}
						}
					}
					
					
				}//end fields
			})
			.on("success.form.bv",function(e){
				
				// Prevent form submission
	            e.preventDefault();
	            
				var id = ${dept.id};
				var deptName = $("#update_deptName").val();
	            var parent = $("#update_parentName").val();
				
	            $("#updateSubmitBtn").attr("disabled",true);
				
				$.post("${springMacroRequestContext.contextPath}/dept/update",{"id":id,"deptName":deptName,"parent":parent},function(data){	
					if(data.errCode=="0"){
		                $.smallBox({
		                          title : "操作成功",
		                          content : "<i class='fa fa-clock-o'></i> "+data.errMsg+"...",
		                          color : "${c.green}",
		                          iconSmall : "fa fa-check fa-2x fadeInRight animated",
		                          timeout : 4000
		                     });
		                
		                $('#updateCancel').click();
		                myTable.ajax.reload(null,false);
			                     
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

 			$('#updateForm').bootstrapValidator('destroy');
 			$('button[data-toggle]').off();
 			if (debugState) {
 				root.console.log("✔ Bootstrap validator destroyed");
 			}

 		}
 		// end destroy

 		// run pagefunction
 		loadScript("${springMacroRequestContext.contextPath}/assets/js/plugin/bootstrapvalidator/bootstrapValidator.min.js", pagefunction);
 		
</script> 