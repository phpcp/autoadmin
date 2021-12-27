<li>
    <a href="javascript:;" onclick="openQr();">
      <i class="fa fa-qrcode"></i>
      扫码连接
    </a>
</li>
<script type="text/javascript">
var ws = null;
var sockUrl = '';
var qrcodeUrl = '<?php echo route(config('admin.route.prefix') . '.qrcode');?>';
function openQr(){
	layer.open({
		type: 2,
		area: ['336px', '450px'],
		title: '请使用手机端APP扫码',
		content: qrcodeUrl
	});
}
setTimeout(function(){
	layer.closeAll();
}, 180000);
// connectWS();
// function connectWS(){
// 	if(ws == null){
// 		var indd = layer.load(2);
// 		var wsobj = new WebSocket(sockUrl);
// 		wsobj.onopen = function(){
// 			ws = wsobj;
// 			layer.msg('连接成功!');
// 			layer.close(indd);
// 		}
// 		wsobj.onclose = function(){
// 			ws = null;
// 			layer.open({
// 				title:'错误信息',
// 				content: '后台服务被关闭!'
// 			});
// 			$('#version').attr('onclick', 'connectWS()').text('重连');
// 		}
// 		wsobj.onerror = function(){
// 			layer.close(indd);
// 			ws = null;
// 			layer.open({
// 				title:'错误信息',
// 				content: '连接错误!'
// 			});
// 			$('#version').attr('onclick', 'connectWS()').text('重连');
// 		}
// 		wsobj.onmessage = function(dt){
// 			layer.close(indd);
// 			if(dt == 'pong'){
// 				return;
// 			}
// 			if(!dt){
// 				layer.msg('数据格式错误!');
// 				return;
// 			}
// 			data 	= JSON.parse(dt.data);
// 			// if(data['code'] != 200){
// 			// 	layer.msg(data['msg']);
// 			// 	return;
// 			// }
// 			if(typeof(data['type']) != 'string'){
// 				layer.msg('数据错误!');
// 				return;
// 			}
// 			if(data['type'] == 'version'){
// 				$('#version').removeAttr('onclick').html(data['data']['version']);
// 			}else{
// 				message(data);
// 			}
// 			// fun 	= eval(data.type);
// 			// fun(data.data, data.id);
// 		}
// 	}else{
// 		layer.msg('链接正常,无需重连...');
// 	}
// }
</script>