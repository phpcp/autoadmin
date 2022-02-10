<li>
    <a href="javascript:;" onclick="openDownload();">
      <i class="fa fa-cloud-download"></i>
      资源下载
    </a>
</li>
<script type="text/javascript">
var url 	= '<?php echo route("resours"); ?>';
function openDownload(){
	layer.open({
		type: 2,
		area: ['336px', '450px'],
		title: '手机App下载',
		content: url
	});
}
</script>
<style type="text/css">
	
</style>