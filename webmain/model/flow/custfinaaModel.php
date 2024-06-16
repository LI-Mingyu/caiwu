<?php
//客户收付款单
class flow_custfinaaClassModel extends flowModel
{
	
	public function initModel(){
	//	$this->statearrs		= c('array')->strtoarray('未收款|red,已收款|green');
	//	$this->statearrf		= c('array')->strtoarray('未付款|red,已付款|green');
	}
	
	public function flowrsreplace($rs)
	{
	 
		
		$table="customer";
		$db	   = m($table);
		
		$cust=$db->getone($rs['custid']);
		
	 	$rs['custid']= $cust['name'];
		
		if($rs['type'])
		{
			$rs['type']="<font color='green'>调账减少</font>";
		}
		else
		  $rs['type']="<font color='red'>调账增加</font>";	
		
		switch($rs['paytype'])
		{
			// 0 合同调账  1 采购调账 , 2 外协调账
				
			case 0:
			  $rs['paytype']="合同调账";				 
			  break;	
			case 1:
			  $rs['paytype']="采购调账";				 
			  break;		
		  	case 2:
			  $rs['paytype']="外协调账";				 
			  break;		
				
		}
		
		
		
	// print_r($rs);exit("wtf");
		
		return $rs;
	}
	
	//操作菜单操作
	protected function flowoptmenu($ors, $arr)
	{
		//标识已付款处理
		/*
		if($ors['num']=='pay'){
			$ispay = 0;
			$paydt = arrvalue($arr,'fields_paydt', $this->rock->now);
			if(!isempt($paydt))$ispay = 1;
			$this->update("`ispay`='$ispay',`paydt`='$paydt'", $this->id);
			m('crm')->ractmoney($this->rs['htid']);
		} */
	}
	
	protected function flowbillwhere($uid, $lx)
	{	/*
		$month	= $this->rock->post('month');
		$where 	= '';
		if($month!=''){
			$where.=" and `dt` like '$month%'";
		}

		return array(
			'where' => $where,
			'order' => '`optdt` desc'
		); */
	}
}