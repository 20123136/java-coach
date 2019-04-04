<#assign yellow = "#C79121">
<#assign blue = "#5384AF">
<#assign red = "#C46A69">
<#assign green = "#659265">
<#assign usering_iframe = true>

<!-- 添加时间插件 -->
<!-- 
	timeWidget 添加引用的时候添加时间插件
	widgetId 控件的ID
	DateType 控件的时间格式化类型，如：
		 Date：YYYY-MM-DD
		 DateTime：YYYY-MM-DD HH:mm:ss
		 
	注意：
		1、添加的键注意区分大小写；
		2、如果需要添加新定义的时间类型 在变量中_date_type_添加需要的类型；
 -->
 <!-- ===========显示时间控件===========定义显示自定义字段的宏  -->
<#macro timeWidget widgetId DateType>
	<script type="text/javascript">
		$(document).ready(function() {
			/* 定义时间的类型 */
			var _date_type_ = {
					"Date":"YYYY-MM-DD",
					"DateTime":"YYYY-MM-DD HH:mm:ss",
				};
			$('#${widgetId}').daterangepicker({
				format: _date_type_['${DateType}'],
				timePicker: true,
				timePicker12Hour: false,
				showDropdowns: true,
                   locale: {
                       applyLabel: '确定',
                       cancelLabel: '清空',
                       fromLabel: '从',
                       toLabel: '到',
                       daysOfWeek: ['日', '一', '二', '三', '四', '五','六'],
                       monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
                       firstDay: 1
                   }
			},function(start, end, label) {
			}).on('cancel.daterangepicker',function(ev, picker){
				$('#${widgetId}').val('');
				getResult();
			}).on('apply.daterangepicker',function(ev, picker){
				getResult();
			});
		});
	</script>
</#macro>
