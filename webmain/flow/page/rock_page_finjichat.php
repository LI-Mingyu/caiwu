<?php
/**
*	记账报表
*/
defined('HOST') or die ('not access');
?>
<script>
$(document).ready(function(){

	var myChart = false;
	var a = $('#viewshow_{rand}').bootstable({
		tablename:'todo',url:publicmodeurl('finjishou','jichats'),autoLoad:false,
		columns:[{
			text:'名称',dataIndex:'name'
		},{
			text:'数值',dataIndex:'value'
		}],
		load:function(){
			c.loadcharts();
		}
	});
	
	var c = {
		init:function(){
			js.ajax(publicmodeurl('finjishou','getjichats'),{},function(d){
				js.setselectdata(get('zhangid_{rand}'), d.zhangarr,'value');
				js.setselectdata(get('accountid_{rand}'), d.accountarr,'value');
			},'get,json');
		},
		tongji:function(){
			var da={};
			da.zhangid = get('zhangid_{rand}').value;
			da.accountid= get('accountid_{rand}').value;
			da.dt1= get('dt1_{rand}').value;
			da.dt2= get('dt2_{rand}').value;
			da.tongtype= get('tongtype_{rand}').value;
			a.setparams(da, true);
		},
		loadcharts:function(){
			var rows = a.getData('rows'),i,len=rows.length,v;
			var xAxis=[],data=[];
			for(i=0;i<len;i++){
				xAxis.push(rows[i].name);
				v = rows[i].value;if(v=='')v=0;
				data.push({value:parseFloat(v),name:rows[i].name});
			}
			if(!myChart)myChart = echarts.init(get('main_show{rand}'));
			var tlx= get('chattype_{rand}').value;
			var option = {
				title: {
					text: '报表统计',
					left: 'center'
				},
				tooltip : {
					trigger: 'item',
					formatter: "{b} : {c}"
				},
				series: [{
					name: '数值',
					type: tlx,
					data: data
				}]
			};
			if(tlx!='pie'){
				option.xAxis={data: xAxis};
				option.yAxis={type : 'value'};
			}
			myChart.setOption(option);
		}
	};
	js.initbtn(c);
	c.init();
});
</script>
<table>
<tr>
<td style="padding-right:10px;"><select style="width:150px"  class="form-control" id="zhangid_{rand}" ><option value="0">-所有账套-</option></select></td>
<td style="padding-right:10px;"><select style="width:130px"  class="form-control" id="accountid_{rand}" ><option value="0">-所有帐号-</option></select></td>
<td nowrap>日期从&nbsp;</td>
<td nowrap>
	<input style="width:110px" onclick="js.changedate(this)" readonly class="form-control datesss" id="dt1_{rand}" >
</td>
<td nowrap>&nbsp;至&nbsp;</td>
<td nowrap>
	<input style="width:110px" onclick="js.changedate(this)" readonly class="form-control datesss" id="dt2_{rand}" >
</td>
<td style="padding-left:10px;"><select style="width:130px"  class="form-control" id="tongtype_{rand}" ><option value="0">按月份</option><option value="1">按日期</option><option value="2">按记账类型</option></select></td>
<td style="padding-left:10px">
		<select style="width:100px" id="chattype_{rand}" class="form-control" ><option value="bar">柱状图</option><option value="pie">饼图</option><option value="line">线图</option></select>
	</td>
<td  style="padding-left:10px">
	<button class="btn btn-default" click="tongji" type="button">统计</button>
</td>
</tr>
</table>
<div class="blank10"></div>
<table width="100%">
<tr valign="top">
	
	
	<td width="80%">
		<div id="main_show{rand}" style="width:100%;height:480px"></div>
	</td>
	<td>
		<div style="width:350px" id="viewshow_{rand}"></div>
	</td>
</tr>
</table>