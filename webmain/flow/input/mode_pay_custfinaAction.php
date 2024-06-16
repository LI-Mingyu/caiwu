<?php
/**
*	客户.收付款单
*/
class mode_pay_custfinaClassAction extends inputAction{
	

	protected function savebefore($table, $arr, $id, $addbo){
		 
		$narr	= array();
		$htid 	= (int)$arr['htid'];
		$money 	= floatval($arr['money']);
		if($money<=0)return '金额必须大于0';
		
	
		 
		
		// 转换 num 为 id by andy.ma
		
		if(empty($htid)){
		
		$str_arr= explode(']',$arr['htnum']);
		
		$str_num=$str_arr[0];
		
		$str_num=str_replace('[','',$str_num);
		
		//exit($str_num);
		
		$sql_m="select id from xinhu_custract where num='$str_num'";
		
		$rem = $this->db->getall($sql_m);	
		
		
	     $htid=$rem[0]['id'];
			
		}
		
		
		
		
		
		//从合同读取
		if($htid>0){
			$htrs = m('custract')->getone($htid);
			$narr['htnum'] 		= $htrs['num'];
			$narr['custid'] 	= $htrs['custid'];
		 	$narr['type'] 		= $arr['type'];
			$narr['custname'] 	= $htrs['custname'];
			
			$narr['dt']			= date("Y-m-d",time());
			
			
			
			$zmoney				= floatval($htrs['money']);  // 合同总金额
			
			
			$sqt=" select  (select IFNULL(sum(money),0) from xinhu_custfinaa where htid='$htid' and type=0) - (select IFNULL(sum(money),0) from xinhu_custfinaa where htid='$htid' and type=1) as tiao ";  //exit($sqt);
		
		   $tiao = $this->db->getall($sqt);			
		   $mtiao=$tiao[0]['tiao'];	
			
			$zmoney	+=$mtiao;  // by andy.ma  加入调账金额  2019/12/19
			
			//exit($zmoney);
			
			
			$omoney	= m('crm')->getmoneys($htid, $id);  
			
			
			 
			//$omoney-=2200;//测试用，后面删除
			
			
			$sqn="select ifnull(sum(money),0) as zhi from xinhu_custfina where htid='$htid' and type=1 ";
			
			$zhiarr= $this->db->getall($sqn);	
			
			$zhichu=0;
			if($zhiarr)
			  $zhichu=$zhiarr[0]['zhi'];
			
			$omoney-=$zhichu; // 减去支出的
			
			//$omoney+=$mtiao; 
			
			//exit($omoney.' wtf ');
			// $omoney 欠的多少   $money 输入的money   $zmoney 合同金额
			
			$chaojg	= $omoney + $money - $zmoney;
			
			//   money: 5500 omoney: 5000 mtiao: 500.00 zmoney:10500   wtf  
			 //echo 'money: '.$money.' omoney: '.$omoney.' mtiao: '.$mtiao.' zmoney:'.$zmoney; exit("wtf");
			
			//if($chaojg>0 && $tiao==0  )
			//print_r($narr);exit("wtf");
		
			
			if( ( ($money+$omoney) - $zmoney>0 ) && $arr['type']==0  )
				return '金额已超过合同上金额'.$zmoney.'';
			
		}
		
		//从销售单读取
		if($htid<0){
			$htrs = m('goodm')->getone('`id`='.(0-$htid).'');
			$narr['htnum'] 		= $htrs['num'];
			$narr['custid'] 	= $htrs['custid'];
			//$narr['type'] 		= '0';
			$narr['custname'] 	= $htrs['custname'];
			$zmoney				= floatval($htrs['money']);
			$omoney	= m('crm')->getmoneys($htid, $id);
			$chaojg	= $omoney + $money - $zmoney;
			//if($chaojg>0)return '金额已超过销售单上金额'.$zmoney.'';
		}
		$narr['htid'] = $htid;
		return array('rows'=> $narr);
	}
	
		
	protected function saveafter($table, $arr, $id, $addbo){
		$htid 	= (int)$arr['htid'];
		
		if($htid>0)m('crm')->ractmoney($htid); //exit("wtf3");
		
		if($htid<0){
			$htrs = m('goodm')->getone('`id`='.(0-$htid).'');
			m('crm')->xiaozhuantai($htrs,1);
		}
		
		//print_r($arr);exit("wtf");
		
		//========== 加入修改银行账户资金   by andy.ma  2019/12/200   =======================
		
		$accid=$arr['accid'];
		
		$income=$arr['money'];		
			 
		
		//exit($squp);
		
		$dbs 	= m('account');
		
	  if($arr['type']==0)	
		$dbs->update('`saving`=saving+'.$income, "`id`='$accid'");
	  else
		$dbs->update('`saving`=saving-'.$income, "`id`='$accid'");  
		
		//==============================================================================
		
		
	}
	
	public function selectcust()
	{
		$rows = m('crm')->getmycust($this->adminid, $this->rock->arrvalue($this->rs, 'custid'));
		return $rows;
	}
	
	
	
	public function hetongdata()
	{
		$htid = 0;
		$mid  = (int)$this->get('mid','0');
		if($mid>0){
			$htid = (int)$this->flow->getmou('htid', $mid); //当前记录也要显示合同ID
		}
		$rows = m('crm')->getmyract($this->adminid, $htid);  //print_r($rows);exit("wtf");
		$arr  = array();
		foreach($rows as $k=>$rs){
			$arr[] = array(
				'value' => $rs['id'],
				'optgroup'=>'合同',
				'name' 	=> '['.$rs['num'].']'.$rs['custname'],
			);
		}
		
		//读取我的销售单
		$rows = m('goodm')->getall('`uid`='.$this->adminid.' and `type`=2 and `status`=1 and `custractid`=0 and (`ispay`=0 or `id`='.(0-$htid).')');
		foreach($rows as $k=>$rs){
			$arr[] = array(
				'value' => '-'.$rs['id'],
				'optgroup'=>'销售单',
				'name' 	=> '['.$rs['num'].']'.$rs['custname'],
			);
		}
		
		return $arr;
	}
	
	
	
	public function ractchangeAjax()
	{
		$htid 	= (int)$this->get('ractid');
		$cars['type'] = '0';
		//销售单
		if($htid<0){
			$xrs = m('goodm')->getone('`id`='.(0-$htid).'');
			$cars['custid'] = $xrs['custid'];
			$cars['custname'] = $xrs['custname'];
			$cars['num'] = $xrs['num'];
			$cars['signdt'] = $xrs['applydt'];
			$cars['money'] = m('crm')->xiaozhuantai($xrs,1);
		}else{
			$cars 	= m('custract')->getone($htid, 'id,custid,custname,money,type,num,signdt');
			$omoney	= m('crm')->getmoneys($htid);
			$cars['money'] = $cars['money']-$omoney;
		}
		$this->returnjson($cars);
	}
	
	
	
	// by andy.ma 2019/10/11 获取收付款账户
	public function selectacct()
	{
		 //exit("wtf");
		 $rows = m('crm')->getmyacct();
			
		return $rows;
		
	}
	
	
	 
	
	
}	
			