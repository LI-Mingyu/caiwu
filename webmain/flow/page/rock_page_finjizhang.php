<?php
defined('HOST') or die ('not access');
?>
<script>
$(document).ready(function(){
	{params}
	var date = js.now(),type = params.type;
	var accountarr=[],jtypearr=[],typename='收入';
	if(type==1)typename='支出';
	var a = $('#viewpl{rand}').bootstable({
		url:publicmodeurl('finjishou','addpiliang', {type:type}),
		columns:[{
			text:'财务帐号',dataIndex:'accountid',renderer:function(v,d,oi){
				var s = '<select style="width:150px" id="accountid{rand}_'+oi+'" class="form-control" >';
				if(d.id>1){
					s+='<option value="0">同上</option>';
				}
				for(var i=0;i<accountarr.length;i++)s+='<option value="'+accountarr[i].value+'">'+accountarr[i].name+'</option>';
				s+='</select>';
				return s;
			}
		},{
			text:'记账日期',dataIndex:'applydt',renderer:function(v,d,oi){
				var s1 = d.id>1 ? '同上' : date;
				return '<input style="width:110px" id="applydt{rand}_'+oi+'" value="'+s1+'" onclick="js.changedate(this)" readonly class="form-control datesss">';
			}
		},{
			text:'<font color=red>*</font>'+typename+'类型',dataIndex:'jtype',renderer:function(v,d,oi){
				var s = '<select style="width:110px" id="jtype{rand}_'+oi+'" class="form-control" >';
				if(d.id>1){
					s+='<option value="同上">同上</option>';
				}
				for(var i=0;i<jtypearr.length;i++)s+='<option value="'+jtypearr[i].name+'">'+jtypearr[i].name+'</option>';
				s+='</select>';
				return s;
			}
		},{
			text:'<font color=red>*</font>金额',dataIndex:'money',renderer:function(v,d,oi){
				return '<input style="width:90px" id="money{rand}_'+oi+'" name="money" value="0" min="0" type="number" class="form-control">';
			}
		},{
			text:'对应客户',dataIndex:'custname',renderer:function(v,d,oi){
				return '<div class="input-group" style="width:150px"><input name="custname" readonly class="form-control" id="custname{rand}_'+oi+'"><input type="hidden" name="custid" id="custid{rand}_'+oi+'"><span class="input-group-btn"><button onclick="xuan{rand}.xuancust('+oi+')" class="btn btn-default" type="button"><i class="icon-search"></i></span></div>';
			}
		},{
			text:'相关人',dataIndex:'xgname',renderer:function(v,d,oi){
				return '<div class="input-group" style="width:120px"><input name="xgname" readonly class="form-control" id="xgname{rand}_'+oi+'"><input type="hidden" name="xguid" id="xguid{rand}_'+oi+'"><span class="input-group-btn"><button onclick="xuan{rand}.getxgname('+oi+')" class="btn btn-default" type="button"><i class="icon-search"></i></span></div>';
			}
		},{
			text:'相关部门',dataIndex:'xgdeptname',renderer:function(v,d,oi){
				return '<input class="form-control" id="xgdeptname{rand}_'+oi+'">';
			}
		},{
			text:'说明',dataIndex:'explain',renderer:function(v,d,oi){
				return '<input class="form-control" id="explain{rand}_'+oi+'">';
			}
		}],
		loadbefore:function(d){
			accountarr = d.accountarr;
			jtypearr = d.jtypearr;
			js.setselectdata(get('zhangid_{rand}'), d.zhangarr,'value');
		}
	});
	var c = {
		custdata:[],
		xuancust:function(oi){
			$.selectdata({
				data:this.custdata,title:'选择客户',fid:oi,
				url:publicmodeurl('finjishou','getselectdata',{act:'crm:custdata','acttyle':'act'}),
				checked:false, nameobj:get('custname{rand}_'+oi+''),idobj:get('custid{rand}_'+oi+''),
				onloaddata:function(da){
					c.custdata = da;
				}
			});
		},
		getxgname:function(oi){
			js.getuser({
				type:'user',
				title:'相关人员',
				changevalue:'',
				callback:function(sna,sid, xarr){
					get('xgname{rand}_'+oi+'').value=sna;
					get('xguid{rand}_'+oi+'').value=sid;
					if(get('xgdeptname{rand}_'+oi+'') && xarr[0])get('xgdeptname{rand}_'+oi+'').value=xarr[0].deptname;
				}
			});
		},
		addrows:function(){
			a.insert({id:2});
		},
		save:function(o1){
			var moe = get('money{rand}_0').value;
			var vis = 'msgview_{rand}';
			js.setmsg('','', vis);
			if(!moe || moe<=0){
				js.setmsg('第1行金额不能为0','', vis);
				return;
			}
			var da = a.getData(),len=da.length,i,move;
			var d2 = {},oi=0;
			for(i=0;i<len;i++){
				move = get('money{rand}_'+i+'').value;
				if(move && move>0){
					oi++;
					d2['money_'+oi+''] = move;
					d2['accountid_'+oi+''] = get('accountid{rand}_'+i+'').value;
					d2['applydt_'+oi+''] = get('applydt{rand}_'+i+'').value;
					d2['jtype_'+oi+''] = get('jtype{rand}_'+i+'').value;
					d2['custname_'+oi+''] = get('custname{rand}_'+i+'').value;
					d2['custid_'+oi+''] = get('custid{rand}_'+i+'').value;
					d2['xgname_'+oi+''] = get('xgname{rand}_'+i+'').value;
					d2['xguid_'+oi+''] = get('xguid{rand}_'+i+'').value;
					d2['xgdeptname_'+oi+''] = get('xgdeptname{rand}_'+i+'').value;
					d2['explain_'+oi+''] = get('explain{rand}_'+i+'').value;
				}
			}
			d2['stotal'] = oi;
			d2['type'] = type;
			d2['zhangid'] = get('zhangid_{rand}').value;
			o1.disabled=true;
			js.setmsg('提交中...','', vis);
			js.ajax(publicmodeurl('finjishou','savepiliang'),d2, function(ret){
				js.setmsg(ret,'green', vis);
				try{parent.bootstableobj[params.mobh].reload();}catch(e){}
			},'post');
		}
	};
	
	xuan{rand} = c;
});
</script>
<table>
<tr>
<td style="padding-right:10px;"><select style="width:150px"  class="form-control" id="zhangid_{rand}" ></select></td>
</tr>
</table>
<div style="margin:10px 0px" id="viewpl{rand}"></div>

<div><a href="javascript:;" onclick="xuan{rand}.addrows()">新增一行</a>&nbsp;&nbsp;<button onclick="xuan{rand}.save(this)" class="btn btn-success" type="button"><i class="icon-save"></i>&nbsp;保存记账</button>&nbsp; <span id="msgview_{rand}"></span></div>