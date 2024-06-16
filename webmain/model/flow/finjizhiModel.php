<?php
/**
*	模块.记账支出
*/
class flow_finjizhiClassModel extends flowModel
{
	private $getatypesbo=false;
	private $zhangarr = array();
	private $haoarr = array();
	private function getatypes(){
		if($this->getatypesbo)return;
		$rows = m('finzhang')->getall('1=1');
		foreach($rows as $k=>$rs)$this->zhangarr[$rs['id']] = $rs['name'];
		$rows = m('finount')->getall('1=1');
		foreach($rows as $k=>$rs)$this->haoarr[$rs['id']] = $rs['name'];
	}
	
	private function getatypename(){
		if($this->getatypesbo)return;
		$rows = m('finzhang')->getall('1=1');
		foreach($rows as $k=>$rs)$this->zhangarr[$rs['name']] = $rs['id'];
		$rows = m('finount')->getall('1=1');
		foreach($rows as $k=>$rs)$this->haoarr[$rs['name']] = $rs['id'];
	}
	
	
	//展示是替换一下
	public function flowrsreplace($rs, $lx=0)
	{
		if(!isset($rs['id']))return $rs;
		$this->getatypes();
		$rs['zhangid'] = arrvalue($this->zhangarr, $rs['zhangid']);
		$rs['accountid'] = arrvalue($this->haoarr, $rs['accountid']);

		return $rs;
	}
	
	
	protected function flowbillwhere($uid, $lx)
	{
		$where 	= '';
		$zhangid	= (int)$this->rock->post('zhangid','0');
		if($zhangid>0)$where=" and `zhangid`='$zhangid'";
		$accountid	= (int)$this->rock->post('accountid','0');
		if($accountid>0)$where=" and `accountid`='$accountid'";
		
		return array(
			'where' => $where
		);
	}
	
	//导入数据的测试显示
	public function flowdaorutestdata()
	{
		return array(
			'zhangid' 		=> '第一个账套',
			'accountid' 		=> '库存现金',
			'applydt' 		=> $this->rock->date,
			'jtype' 	=> '支出类型',
			'money' 	=> '50.23',
			'custname' 	=> '客户名称',
			'optname' 	=> $this->adminname,
		);
	}
	
	
	public function flowdaorubefore($rows)
	{
		//$inarr	= array();
		$this->getatypename();
		foreach($rows as $k=>&$rs){
			if(isset($rs['zhangid'])){
				$rs['zhangid'] = arrvalue($this->zhangarr, $rs['zhangid']);
				if(isempt($rs['zhangid']))return '找不到对应账套“'.$rows[$k]['zhangid'].'”';
			}
			if(isset($rs['accountid'])){
				$rs['accountid'] = arrvalue($this->haoarr, $rs['accountid']);
				if(isempt($rs['accountid']))return '找不到对应帐号“'.$rows[$k]['accountid'].'”';
			}
			$rs['type'] = '1';
			$rs['money'] = 0-abs($rs['money']);
		}
		
		return $rows;
	}
}