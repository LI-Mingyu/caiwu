<?php
/**
*	此文件是流程模块【finkai.开票申请】对应控制器接口文件。
*/ 
class mode_finshouClassAction extends inputAction{
	
	
	protected function savebefore($table, $arr, $id, $addbo){
		$rows['type'] = '5';//一定要是5，不能去掉
		
		// [num] => [201912002]国贸物业有限公司
		
		//print_r($arr);exit('wtf');
		
			$str_arr= explode(']',$arr['num']);

			$str_num=$str_arr[0];

			$str_num=str_replace('[','',$str_num);
		
		$rows['num'] =$str_num;
		
		
		//print_r($arr);exit("wtf1");
		
		return array(
			'rows'=>$rows
		);
	}
	
		
	protected function saveafter($table, $arr, $id, $addbo){
		 
		$db=$GLOBALS['db'];
		
		/*
			optname
		    optdt
			optid
			custid
			
		
		    类型	      type	 
			发票类型	 ptype	 
			开票日期	 opendt	 
			销售方名称	custname

			购买方名称	maicustname	 
			金额	      money	 
			购买方Id	 maicustid	 
		   
		                status						
						comid						
						optid		   
		    			kainame
						
						
						optname
		
		
		*/
		
		
		$comid=$arr['comid'];
		
		$sqsal="select name from xinhu_company where id='".$comid."'";
		
		$cmarr=$db->getAll($sqsal);
		
		$sale=$cmarr[0]['name'];
		
		
		$admid=$_SESSION['xinhu_adminid'];
		
		$adname=$_SESSION['xinhu_adminuser'];
		
		
		 
		
		
		$type=$arr['inorout'];
		$ptype=$arr['paytype'];
		$opendt=$arr['optdt'];
		$custname=$sale;
		
		$maicustname=$arr['fullname'];
		$money=$arr['money'];
		$maicustid=$arr['custid'];
		
		$explain=$arr['explain']; 
		
		$darr=explode(' ',$opendt);
		
		$optdt2=$darr[0];
		
		 $sql="insert into xinhu_finpiao (type,ptype,optdt,opendt,optname,custname,maicustname,money,maicustid,comid,optid,kainame,`status`,`explain`) values ('$type','$ptype','$opendt','$optdt2','$adname','$custname','$maicustname','$money','$maicustid','$comid','$admid','$adname','1','$explain')";
		
		 $db->query($sql);
		  
		
		
	}
	
	
	public function selecfapiao()
	{
		$rows = m('crm')->getfapiao();
		return $rows;
	}
	
	
	
	public function selectcust()
	{
		$rows = m('crm')->getmycust($this->adminid, $this->rock->arrvalue($this->rs, 'custid'));
		return $rows;
	}
	
	public function getotherAjax()
	{
		$id = (int)$this->get('id','0');
		$rs = m('customer')->getone($id, 'id,shibieid,openbank,cardid,address,tel');
		return $rs;
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
			$cars 	= m('custract')->getone($htid, 'id,custid,custname,money,type,num,signdt,fpid');
			$omoney	= m('crm')->getmoneys($htid);
			$cars['money'] = $cars['money']-$omoney;
		}
		$this->returnjson($cars);
	}
	
	
	
	
	
}	
			