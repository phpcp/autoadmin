<?php
use Encore\Admin\Facades\Admin;
use App\Globals\Ens;

$token		= Ens::encrypt(json_encode(['id' => Admin::user()->id, 'time' => time()]));
?>
<li>
	<a href="javascript:;" id="aes" data-clipboard-text="{{$token}}">
		<i class="fa fa-unlock"></i> Token
	</a>
</li>
<script type="text/javascript" src="{{ asset('storage/js/clipboard.min.js') }}"></script>
<script type="text/javascript">
var clipboard = new ClipboardJS('#aes', {
	target: function () {
		return $('#aes')[0];
	},
});

clipboard.on('success', function (e) {
	layer.msg('复制成功!');
});

clipboard.on('error', function (e) {
	console.log(e);
});
</script>