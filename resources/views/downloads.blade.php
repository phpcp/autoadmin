<li>
    <a href="javascript:;" onclick="openDownload();">
      <i class="fa fa-cloud-download"></i>
      脚本下载
    </a>
</li>
<script type="text/javascript">
var url 	= '<?php echo route("resours"); ?>';
function openDownload(){
	layer.open({
		type: 2,
		area: ['336px', '450px'],
		title: '最新版脚本下载',
		content: url,
		shadeClose: true
	});
}
</script>
<style type="text/css">
	
</style>