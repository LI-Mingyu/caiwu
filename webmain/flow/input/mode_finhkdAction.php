<?php

class mode_finhkdClassAction extends inputAction{
	

	protected function savebefore($table, $arr, $id, $addbo){
		$uid 	= $arr['uid'];
		$money  = floatval($arr['money']);
		$to 	= m('fina')->totaljie($uid, $id);
	 //	if($money > $to)return '还款金额超过需还金额';
		
		$rows['type'] = '3';//一定要是3，不能去掉
		return array(
			'rows'=>$rows
		);
	}
	
	
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
	
	
	
	// by andy.ma 2019/10/11 获取收付款账户
	public function selectacct2()
	{
		 //exit("wtf");
		 $rows = m('crm')->getmyacct2();
			
		return $rows;
		
	}
	
	
	public function selectacct()
	{
		 //exit("wtf");
		 $rows = m('crm')->getmyacct();
			
		return $rows;
		
	}
	
	
	
	
	
	public function jiekuantongs()
	{
		$mid 	= (int)$this->get('mid');
		$moenky	= m('fina')->totaljie($this->adminid, $mid);
		return ''.$moenky.'元';
	}
	
	public function getlastAjax()
	{
		$rs = m('fininfom')->getone("`uid`='$this->adminid' and `type`=3 order by `optdt` desc",'paytype,cardid,openbank,fullname');
		if(!$rs)$rs='';
		$this->returnjson($rs);
	}
}	
			