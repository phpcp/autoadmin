<script type="text/javascript" src="{{ asset('layer/layer.js') }}"></script>
<link rel="stylesheet" type="text/css" href="{{ asset('layui/css/layui.css') }}">

<table class="layui-table">
	<thead>
		<tr>
			<th>ID</th>
			<th>视频</th>
			<th>内容</th>
			<th>创建时间</th>
			<th>发布时间</th>
			<th>状态</th>
			<th>操作</th>
		</tr> 
	</thead>
	<tbody>
		@if(count($list) < 1)
		<tr>
			<td colspan="7" style="text-align: center;height: 200px;" rowspan="10">没有视频</td>
		</tr>
		@else
			@foreach($list as $item)
		<tr>
			<td>{{ $item->id }}</td>
			<td>{{ $item->url }}</td>
			<td>{{ $item->content }}</td>
			<td>{{ $item->created_at }}</td>
			<td>{{ $item->send_time }}</td>
			<td class="status">
				@if($item->status == 1)
				<span class="layui-bg-blue">发布成功</span>
				@elseif($item->status == 0)
				<span class="layui-bg-green">等待发布</span>
				@elseif($item->status == -1)
				<span class="layui-bg-green">发布失败</span>
				@else

				@endif
			</td>
			<td><span class="layui-icon layui-icon-delete"></span></td>
		</tr>
			@endforeach
		@endif
	</tbody>
</table>

<script type="text/javascript">
	
</script>
<style type="text/css">
.status > span{
	display: inline-block;
	padding: 2px 5px;
	border-radius: 2px;
}
</style>