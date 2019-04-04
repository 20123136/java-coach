
<!-- the first row -->
<div class="row">

	<!-- col -->
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

		<a href="dept/showSave" data-toggle="modal" data-target="#remoteModalSubPage"
			class="btn btn-primary pull-left"
			style="margin-bottom: 5px; margin-right: 5px;"> <i
			class="fa fa-plus"></i> 添加
		</a> <a href="dept/showDeleteModal" id="batchDeleteBtn"
			data-toggle="modal" data-target="#remoteModalSubPage"
			class="btn btn-danger pull-left"
			style="margin-bottom: 5px; margin-right: 5px;"> <i
			class="fa fa-trash-o"></i> 删除
		</a>

		<div id="remoteModalSubPage" data-backdrop="static"  data-keyboard=false class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="remoteModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content"></div>
			</div>
		</div>

	</div>
	<!-- end col -->
</div>
<!-- the end first row -->

<!-- the second row -->
<div class="row">

	<!-- NEW WIDGET START -->
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

		<!-- Widget ID (each widget will need unique ID)-->
		<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-0"
			data-widget-editbutton="false" data-widget-colorbutton="false">

			<header>
				<span class="widget-icon"> <i class="fa fa-table"></i>
				</span>
				<h2>部门管理</h2>
			</header>

			<!-- widget div-->
			<div>

				<!-- widget edit box -->
				<div class="jarviswidget-editbox">
					<!-- This area used as dropdown edit box -->

				</div>
				<!-- end widget edit box -->

				<!-- widget content -->
				<div class="widget-body no-padding">

					<div class="dt-toolbar">
						<form action="javascript:void(0);" id="validForm"
							style="margin-bottom: 40px">
							<div class="col col-xs-12 col-sm-12">
							<div class="col col-xs-12 col-sm-2 smart-form">
								<div id="datatable_tabletools_filter">
									<label class="input">
									<input type="text" class="form-control" id="id" value=""
									name="id" placeholder="部门ID" /> </label>
								</div>
							</div>

							<div class="col col-xs-12 col-sm-2">
								<div id="datatable_tabletools_filter" class="smart-form">
								<label class="input"> <select id="deptName"
									name="deptName" class="form-control">
										<option value="" selected="selected">--所有部门名称--</option> <#list deptList as d>
										<option value="${d.uuid}">${d.deptName}</option> </#list>
								</select>
								</label>
								</div>
							</div>

							<div class="col col-xs-12 col-sm-2">
								<div id="datatable_tabletools_filter" class="smart-form">
								<label class="input"> <select id="parentName"
									name="parentName" class="form-control">
										<option value="" selected="selected">--所有上级部门--</option>
										<#list deptParentLists as d>
										<option value="${d.uuid}">${d.deptName}</option> </#list>
								</select>
								</label>
							</div>
							</div>

							<div class="col-xs-12 col-sm-2">
								<div id="datatable_tabletools_filter" class="smart-form">
									<button type="submit" class="btn btn-sm btn-primary"
									id="toSearch"><i class="fa fa-search" onclick="$('#toSearch').click();"></i>&nbsp;查询</button>
								</div>
							</div>
							</div>
	
						</form>
						

					</div>

					<table id="dt_basic"
						class="table table-bordered table-striped table-condensed table-hover has-tickbox">
						<thead>
							<tr>
								<th>
									<div class="btn-group"  style="margin-left:0.3em;"> <!-- 为了让居中对齐 -->
										<a href="javascript:void(0);"
											class="btn btn-primary btn-xs dropdown-toggle"
											data-toggle="dropdown"><i class="fa fa-check"></i></a>
										<ul class="dropdown-menu">
											<li><a href="javascript:void(0);"
												onclick="docheckall();">全选所有</a></li>
											<li><a href="javascript:void(0);"
												onclick="docheckallpage();">全选本页</a></li>
											<li><a href="javascript:void(0);"
												onclick="docancelAll();">取消所有</a></li>
										</ul>
									</div>
								</th>
								<th>ID</th>
								<th>部门名称</th>
								<th>上级部门</th>
								<th>操作</th>
							</tr>
						</thead>

					</table>
				</div>
			</div>
			<!-- end widget content -->
		</div>

		<!-- end widget div -->

	</article>
</div>
<!-- the end second row -->

<!-- 该css用于select2的样式，如果缺少了该css，那么select2中的文字就会紧紧挨着左边框而没有任何空隙 -->
<link rel="stylesheet" type="text/css" media="screen" href="${springMacroRequestContext.contextPath}/assets/css/smartadmin-production-plugins.min.css">
<script type="text/javascript">

	pageSetUp();
	
    var myTable;

    // pagefunction
    var pagefunction = function() {
	    
	    /* select2 样式，必不可少 */
	    $("#deptName,#parentName").select2({
	          width:"100%",
	    });
	    
        /* validForm, 引入bootstrapValidator.min.js */
        $('#validForm').bootstrapValidator({
             feedbackIcons : {
                  valid : 'glyphicon glyphicon-ok',
                  invalid : 'glyphicon glyphicon-remove',
                  validating : 'glyphicon glyphicon-refresh'
             },
             
             // bootstrap校验属性参考网址：http://formvalidation.io/validators/
             fields : {

            	 id : {
                        group : '.input',
                        validators : {
                        	integer : {
                        		message : ' ID 只能是整数'
                        	},
                        	stringLength: {
         	                    max: 20,  
         	                    message: '长度不能超过20位'  
         	                        },
                        }
                  },
                  deptName : {
                        group : '.input',
                        validators : {
                             
                        }
                  },
                  parentName : {
                        group : '.input',
                        validators : {
                             
                        }
                  }

             }//end fields
        })
        .on("success.form.bv",function(e){
	         e.preventDefault();
	         docancelAll();
	         myTable.ajax.reload(null,true);

        });
        /* validForm 结束 */
	    
    	var responsiveHelper_dt_basic = undefined;

       	var breakpointDefinition = {
            tablet : 1024,
            phone : 480
        };

        myTable = $('#dt_basic').DataTable({
        	"pageLength" : 20,
         "lengthMenu" : [ 10, 20, 50, 100 ],
        	"aaSorting": [[1,'desc']],//排序

            "serverSide": true,

            "ajax":{
                /* 请求数据的路径 */
                "url" : "dept/getData",
                "type":"POST",
                "data" :function(param){
                      var json = {};
                      json.id = $("#id").val();
                      json.uuid = $("#deptName").val();
                      json.parent = $("#parentName").val();
							////////////////////////传参给后端///////////////////////
                      json.dataTableJsonParams = JSON.stringify(param);//key=jsonParams是固定的不可更换，否则后端接收不到数据
                      return json;
                }
            },

            "columns": [
	              {"data": "id"},
	              {"data": "id"},
	              {"data": "deptName"},
	              {"data": "parentName"},
	              {"data": "id"}
            ],

            "columnDefs": [
	              {
		               "targets": [0],
		               "sortable" : false,
		               "name":"id",
	                   "render" : function(data, type, full) {
	                        if(checkList[full.id]) {
	                             return '<label class="checkbox-inline" style="margin-left:0.5em; margin-top: -0.5em;">'+//这里的style是为了让input框居中，smart-form影响整行字段不居中对齐。
									  '<input type="checkbox" class="checkbox style-0" checked="checked" id="ck'+ 
									  full.id+ 
									  '" onclick="checkSingle(\''+full.id+'\')"  ><span></span>'+
								'</label>';
	                        } else {
	                             return '<label class="checkbox-inline" style="margin-left:0.5em; margin-top: -0.5em;">'+//这里的style是为了让input框居中，smart-form影响整行字段不居中对齐。
								  '<input type="checkbox" class="checkbox style-0" id="ck'+ 
								  full.id+ 
								  '" onclick="checkSingle(\''+full.id+'\')"  ><span></span>'+
								'</label>';
	                        }
	                   },
	              },
	              {
	            	  "targets": [1],
	            	  "name":"id",
	              },
                  {
	            	  "targets": [2],
	            	  "name":"deptName",
	              },
	              {
	            	  "targets": [3],
	            	  "name":"parent",
	              },
	              {
		                "targets": [4],
		                "sortable" : false,
		                "name":"id",
		                "render": function(data, type, full) {
		                  	return '<a href="dept/showUpdate?id='+ data +'"'
		      		        +'data-toggle="modal" data-target="#remoteModalSubPage">'
		      				+'<i title= "编辑" class="fa  fa-lg fa-fw  fa-edit"></i></a>';
		                }
	              }
            ],

            "sDom": "t<'dt-toolbar-footer'<'col-sm-4 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-5'p><'col-sm-3 col-xs-12 hidden-xs'l>r>",
            
            "oLanguage": {
                "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>',
                "sLengthMenu": "每页显示 _MENU_ 条记录",
            },

            "autoWidth" : false,

            "preDrawCallback" : function() {
                // Initialize the responsive datatables helper once.
                if (!responsiveHelper_dt_basic) {
                    responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#dt_basic'), breakpointDefinition);
                }
            },

            "rowCallback" : function(nRow) {
                responsiveHelper_dt_basic.createExpandIcon(nRow);
            },

            "drawCallback" : function(oSettings) {
                responsiveHelper_dt_basic.respond();
            },

            "infoCallback":function(settings, start, end, max, total, pre){
                return "显示第   " + start + " 至    " + end + "项，共 " + total + " 项 ，已选中 " + showCheckedCount() + " 项";
            },
            
            "fnDrawCallback": function (oSettings) {
				//回调回来做的操作
		    	$("#toSearch").attr("disabled",false);
	        },
            
         });
        
 
     };
    
    $(".icon-append.fa.fa-times").click(function() {
 		$(this).next().val("");
 	});

    /*勾选  全部，单页，取消勾选*/
    var checkList = {};

     /* 给可查询的参数赋值  */
     var getConditions = function(){
         var condition = {
              id : $("#id").val(),
              uuid : $("#deptName").val(),
              parent : $("#parentName").val(),
         }
         return condition;
     }

     /* 全选所有 */
     var docheckall = function(){
         checkList = {};
         var url = '${springMacroRequestContext.contextPath}/dept/checkAll';
         var condition = getConditions();
         var count = 0;
         $.post(url,condition,function(data){
          	 count = data.ids.length;
             for(var i in data.ids){
                checkList[data.ids[i]]=true;
             }
             $("[id^='ck']").each(function(){
                   if(!$(this).is(':checked')){
                       $(this).click();
                   }
               });
          $("#checkInfo").text(count);
         },"json");
     }

     /* 全选本页 */
     var docheckallpage = function(){
           docancelAll();
           $("[id^='ck']").each(function(){
             if(!$(this).is(':checked')){
                 $(this).click();
             }
         });
     }

     /* 取消所有 */
     var docancelAll = function(){
         $("[id^='ck']").each(function(){
             if($(this).is(':checked')){
                 $(this).click();
             }
         });
         checkList={};
           $("#checkInfo").text(0);
     }

     /* 手动单选checkbox */
     var checkSingle = function(id){
           var count = getCheckedCount();
           if($("#ck"+id).is(':checked')){
             checkList[id]=true;
             count++;
         }else{
             checkList[id]=false;
             count--;
         }
         $("#checkInfo").text(count);
     }

     /* 获取被勾选的checkbox的数量 */
     var getCheckedCount = function(){
           var count = 0;
           for(var i in checkList) {
                if(checkList[i]==true){
                     count++;
                }
           }
           return count;
     }

     /* 用于显示表格左下角的“已选中？项” */
     var showCheckedCount = function(){
           var count = getCheckedCount();
           return "<span id='checkInfo'>" + count + "</span>";
     }

     /* 批量删除 */
     var idListOfDelete;
     $("#batchDeleteBtn").click(function() {
     	var list = [];
         for(var i in checkList) {
              if(checkList[i]==true){
                   list.push(i);
              }
         }

         if(list.length == 0){
              $.smallBox({
                   title : "未选中",
                   content : "请选择需要删除的选项",
                   color : "${c.yellow}",
                   timeout: 3000,
                   icon : "fa fa-bell"
              });
              return false;
         }else{
         	idListOfDelete = list;
         }

	 });
    

     var pagedestroy = function() {

 		$('#validForm').bootstrapValidator('destroy');
 		$('button[data-toggle]').off();
 		
 		if (debugState) {
 			root.console.log("✔ Bootstrap validator destroyed");
 		}

 	}
     
     // load related plugins
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



