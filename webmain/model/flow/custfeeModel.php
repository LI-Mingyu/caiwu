<?php
//客户收付款单
class flow_custfeeClassModel extends flowModel
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
		
		
		
		
		$table="feetype";
		$db	   = m($table);
		
		$arr=$db->getone($rs['type']);
		
	 	$rs['type']= $arr['feename'];
		
		
		$table="account";
		$db	   = m($table);
		
		$arr=$db->getone($rs['accid']);
		
	 	$rs['accid']= $arr['acc_name'];
		
		
	 
		
		switch($rs['paymtd'])
		{
			// 付款方式 1 现金 2 支票 3 转账
				
			case 1:
			  $rs['paymtd']="现金";				 
			  break;	
			case 2:
			  $rs['paymtd']="支票";				 
			  break;		
		  	case 3:
			  $rs['paymtd']="转账";				 
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