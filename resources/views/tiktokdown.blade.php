<li>
    <a href="javascript:;" onclick="openDownTK();">
      <i class="fa fa-music"></i>
      Tiktok下载
    </a>
</li>
<script type="text/javascript">
var url 	= '<?php echo route("resours"); ?>';
function openDownTK(){
	layer.open({
		type: 2,
		area: ['336px', '450px'],
		title: '最新版 TikTok 下载',
		content: url + '?tt=tk',
		shadeClose: true
	});
}
</script>
<style type="text/css">
	
</style>