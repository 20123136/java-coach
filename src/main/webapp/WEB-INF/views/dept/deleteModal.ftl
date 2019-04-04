<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="hideModalDiv('remoteModalSubPage');">
		&times;
	</button>
	<h4 class="modal-title" id="myModalLabel">删除提示</h4>
</div>

<div class="modal-body">
	<div class="row">
		<div class="col-md-12">
			<h3>此操作不可恢复，您真的确定删除数据吗？！</h3>
		</div>
	</div>

</div>

<div class="modal-footer">
	<button type="button" id="deleteCancel" onclick="hideModalDiv('remoteModalSubPage');" class="btn btn-default" data-dismiss="modal">
		取消
	</button>
	<button type="submit" id="deleteSureBtn" class="btn btn-primary">
		确定
	</button>
</div>


<script type="text/javascript">
	
	pageSetUp();
	var idList = idListOfDelete.join(',');
	var url = "${url}";
	$("#deleteSureBtn").click(function() {
		//另提交按钮变成灰色
	      $("#deleteSureBtn").attr("disabled",true);
		$.post(url,{"idList" : idList},function(data){
			if(data.errCode=="0"){
                $.smallBox({
                          title : "操作成功",
                          content : "<i class='fa fa-clock-o'></i> "+data.errMsg+"...",
                          color : "${c.green}",
                          iconSmall : "fa fa-check fa-2x fadeInRight animated",
                          timeout : 4000
                     });
                for(var i in idListOfDelete){
                	checkList[idListOfDelete[i]]=false;
                }
                $('#deleteCancel').click();
                myTable.ajax.reload(null,false);
	                     
           }else{
                $.smallBox({
                  title : "错误码 : "+data.errCode,
                  content : "<i class='fa fa-clock-o'></i> "+data.errMsg+"...",
                  color : "${c.red}",
                  iconSmall : "fa fa-times fa-2x fadeInRight animated"
              });
           };
		},"json").error(function(){
            $.smallBox({
                title : "操作异常",
                content : "<i class='fa fa-clock-o'></i> <i style='font-size: 15px;'>操作异常...</i>",
                color : "#C46A69",
                iconSmall : "fa fa-times fa-2x fadeInRight animated"
            });
        });
	});
	
</script>












