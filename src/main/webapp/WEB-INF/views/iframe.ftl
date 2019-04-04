<!DOCTYPE HTML>

<!-- onclick方法是为了右键tab点击iframe隐藏右键菜单的，点击右键菜单所在的内容来隐藏 -->
<html  onclick="$('#tabs2', parent.document).click();" lang="en-us">

	<head>
		<meta charset="utf-8">
		<#include "importcss.ftl">
	</head>

<!-- 这里的style是为了显示iframe页面下面不出滚动条 -->
<body style="width:99%;">

<#include "importjs.ftl">
<#include iframecontent+'.ftl'>

<script type="text/javascript">
	//关闭bootstrap modal时，清理掉modal容器div中上一次的内容
	var hideModalDiv = function(remoteModalId){
	    $("#"+remoteModalId).find("div.modal-content").children("div").addClass("hide");
	}
</script>

</body>

</html>