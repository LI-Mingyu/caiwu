//流程模块【custfee.费用单】下录入页面自定义js页面,初始函数
function initbodys(){
	$(form('custid')).change(function(){
		var val = this.value,txt='';
		if(val!=''){
			txt = this.options[this.selectedIndex].text;
		}
		form('custname').value=txt;
		form('htid').value = '';
	});
	
	c.onselectdata['custname']=function(){
		form('htid').value = '';
	}
	
	
	
 	c.onselectdata['htnum']=function(){
		
		
		
		htid=$("input[name='htid']").val();	// 获取 合同 id 触发表单数据更改	
	 
		//console.log("htid="+htid);
			
		 salechange(htid);
		
		
		
	}
	
	
	
	
	$(form('htid')).change(function(){   
		var val = this.value,txt='';
		salechange(val);
	});
	
 	var defe = js.request('def_htid');
	if(defe && defe<0)salechange(defe);
}


function salechange(v){
	if(v==''){
		form('custid').value='';
		return;
	}
	
	js.ajax(geturlact('ractchange'),{ractid:v},function(a){
		
	  //console.log(a);
	 form('custid').value=a.custid;
	 form('custname').value=a.custname;	 
	 form('htnum').value=a.num;
		
	},'get,json');
	
}