<?php
/**
*	此文件是流程模块【custfinaa.调账单】对应控制器接口文件。
*/ 
class mode_custfinaaClassAction extends inputAction{
	
	/**
	*	重写函数：保存前处理，主要用于判断是否可以保存
	*	$table String 对应表名
	*	$arr Array 表单参数
	*	$id Int 对应表上记录Id 0添加时，大于0修改时
	*	$addbo Boolean 是否添加时
	*	return array('msg'=>'错误提示内容','rows'=> array()) 可返回空字符串，或者数组 rows 是可同时保存到数据库上数组
	*/
	protected function savebefore($table, $arr, $id, $addbo){
		
		
		$narr	= array();
		$htid 	= (int)$arr['htid'];
		
		
		if(empty($htid)){
		
			$str_arr= explode(']',$arr['htnum']);

			$str_num=$str_arr[0];

			$str_num=str_replace('[','',$str_num);

		 

			$sql_m="select id from xinhu_custract where num='$str_num'";

			$rem = $this->db->getall($sql_m);	


			 $htid=$rem[0]['id'];
			
		}
		else
		{
			
			$str_arr= explode(']',$arr['htnum']);

			$str_num=$str_arr[0];

			$str_num=str_replace('[','',$str_num);
			
			
		}
		
		
		 
		
		
		
		$narr['htnum'] = $str_num;   //print_r($narr);exit("wtf");
		return array('rows'=> $narr);
		
		
		
	}
	
	/**
	*	重写函数：保存后处理，主要保存其他表数据
	*	$table String 对应表名
	*	$arr Array 表单参数
	*	$id Int 对应表上记录Id
	*	$addbo Boolean 是否添加时
	*/	
	protected function saveafter($table, $arr, $id, $addbo){
		
		$htid=$arr['htid'];
		
		$sql="update xinhu_custract set ispay=2,isover=0 where id='$htid' "; // 修改调账后对应合同收付状态
		
		// exit($sql);   
		 
		 $this->db->query($sql);
		
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
		$rows = m('crm')->getmyract($this->adminid, $htid);
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
	
	
	
}	
			