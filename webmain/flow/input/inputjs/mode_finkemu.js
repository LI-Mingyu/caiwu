//流程模块【finkemu.会计科目】下录入页面自定义js页面,初始函数
function initbodys(){
	
	if(mid==0){
		var dnum = js.request('def_num');
		if(dnum)createnums(dnum);
	}
}

//创建下级的科目编号
function createnums(bh){
	js.ajax(geturlact('createnums'),{bh:bh},function(ret){
		form('num').value=ret;
	});
}