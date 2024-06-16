<?php
//客户收付款单
class flow_custfinaClassModel extends flowModel
{
	
	public function initModel(){
		$this->statearrs		= c('array')->strtoarray('未收款|red,已收款|green');
		$this->statearrf		= c('array')->strtoarray('未付款|red,已付款|green');
	}
	
	public function flowrsreplace($rs)
	{
		$starrr			= array('收','付');
		$rs['paystatus']	= $rs['ispay'];
		$ispay 			= '<font color=red>未'.$starrr[$rs['type']].'款</font>';
		if($rs['ispay']==1)$ispay = '<font color=green>已'.$starrr[$rs['type']].'款</font>';
		$rs['ispay']	 = $ispay;
		$rs['type']	 	 = ''.$starrr[$rs['type']].'款单';
		
		
		
		$res  	= $this->db->getone('[Q]account','id='.$rs['accid'].'','acc_name');
		
		$rs['accid']=$res["acc_name"];
		
		
		switch($rs['paytype'])
		{
		  // 0.合同 ，1.采购付款， 2 外协付款  3.未定义（其他收入/支出）
			case 0:
			 $rs['paytype']="合同";
			break;
			
			case 1:
			 $rs['paytype']="采购付款";
			break;	
				
			
			case 2:
			 $rs['paytype']="外协付款";
			break;
				
				
			case 3:
			 $rs['paytype']="其他";
			break;	
				
		}
		
		switch($rs['paymtd'])
		{
		
		/// 付款方式 1 现金 2 支票 3 转账   by andy.ma
				
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
		
		
		return $rs;
	}
	
	//操作菜单操作
	protected function flowoptmenu($ors, $arr)
	{
		//标识已付款处理
		if($ors['num']=='pay'){
			$ispay = 0;
			$paydt = arrvalue($arr,'fields_paydt', $this->rock->now);
			if(!isempt($paydt))$ispay = 1;
			$this->update("`ispay`='$ispay',`paydt`='$paydt'", $this->id);
			m('crm')->ractmoney($this->rs['htid']);
		}
	}
	
	protected function flowbillwhere($uid, $lx)
	{
		$month	= $this->rock->post('month');
		$where 	= '';
		if($month!=''){
			$where.=" and `dt` like '$month%'";
		}

		return array(
			'where' => $where,
			'order' => '`optdt` desc'
		);
	}
}