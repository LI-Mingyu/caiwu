//流程模块【finjishou.记账收入】下录入页面自定义js页面,初始函数
function initbodys(){
	
}
js.changeuser_after=function(na,o,sna,sid){
	if(na=='xgname' && form('xgdeptname')){
		js.ajax(geturlact('getuinfo'),{uid:sid}, function(ret){
			form('xgdeptname').value = ret.deptname;
		},'get,json');
	}
}