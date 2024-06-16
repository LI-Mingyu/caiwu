<?php
/**
*	模块.会计科目
*/
class flow_finkemuClassModel extends flowModel
{
	public $defaultorder	= 'sort,asc';
	protected $flowcompanyidfieds	= 'none'; //说明所有公司都可以用
	
	public function kemutype()
	{
		$barr[] = array('value'=>'0','name'=>'资产类');
		$barr[] = array('value'=>'1','name'=>'负债类');
		$barr[] = array('value'=>'2','name'=>'权益类');
		$barr[] = array('value'=>'3','name'=>'成本类');
		$barr[] = array('value'=>'4','name'=>'损益类');
		return $barr;
	}
	
	//展示是替换一下
	public function flowrsreplace($rs, $lx=0)
	{
		$utype = $this->kemutype();
		$rs['type'] = $utype[$rs['type']]['name'];

		return $rs;
	}
	
}