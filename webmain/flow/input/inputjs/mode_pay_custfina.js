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
		form('custid').value=a.custid;
		form('custname').value=a.custname;
		form('money').value=a.money;
		form('type').value=a.type;
		
 
		$(form('type')).attr("class","typ");
		
		form('htnum').value=a.num;
		 form('dt').value=a.signdt;
	},'get,json');
}