<?php
/**
*	客户.合同管理
*/
class mode_custractClassAction extends inputAction{
	
	
	public function selectcust()
	{
		$rows = m('crm')->getmycust($this->adminid, $this->rock->arrvalue($this->rs, 'custid'));
		return $rows;
	}
	
	
	
	
	
	
	// 选择调账  by andy.ma 
	public function selectiao()
	{
		
		$sqt=" select 
( c.money+( (select sum(money)  from xinhu_custfinaa where htid='".$rs['id']."' and type=0) - (select sum(money)  from xinhu_custfinaa where htid='".$rs['id']."' and type=1) ) )

- (select IFNULL(sum(money),0)  from xinhu_custfina  where  type=0 and ispay=1 and htid=".$rs['id'].")

as allmoney from   xinhu_custract c  where c.id=".$rs['id'];
		
		$rows = $this->db->getall($sqt);
		
		
		return $rows;
		
		
	}
	
	
	
	
	
	
	
	
	
	public function selectsale()
	{
		$rows = m('crm')->getmysale($this->adminid, (int)$this->get('mid'));
		$arr  = array();
		foreach($rows as $k=>$rs){
			$arr[] = array(
				'value' => $rs['id'],
				'name' 	=> '['.$rs['laiyuan'].']'.$rs['custname'],
			);
		}
		return $arr;
	}
	
	public function salechangeAjax()
	{
		$saleid = (int)$this->get('saleid');
		$cars 	= m('custsale')->getone($saleid, 'id,custid,custname,money,laiyuan');
		$this->returnjson($cars);
	}
	
	protected function savebefore($table, $arr, $id, $addbo){
		
			
		
		//判断是不是关联了销售单，金额就不能随便改了
		$rows = array();
		if($id>0){
			$xiaoid = (int)arrvalue($this->rs, 'xiaoid','0');
			if($xiaoid>0){
				$onrs = m('goodm')->getone('`id`='.$xiaoid.' and `status`<>5');
				if(!$onrs){
					$xiaoid = '0';
				}else{
					if($arr['type']!='0')return '此合同关联了销售单合同类型必须是“收款合同”';
					if(floatval($arr['money']) != floatval($onrs['money']))return '此合同关联了销售单，金额必须和销售单一致,合同金额('.$arr['money'].')，销售单金额('.$onrs['money'].')';
				}
			}
			$rows['xiaoid'] = $xiaoid;
		}
		
		//print_r($arr); exit('wtf2');
		
		return array(
			'rows' => $rows
		);
	}
	
	
	protected function saveafter($table, $arr, $id, $addbo){
		m('crm')->ractmoney($id); //计算未收/付款
		$saleid = (int)arrvalue($arr, 'saleid', '0');
		$dbs 	= m('custsale');
		$dbs->update('htid=0', "`htid`='$id'");
		if($saleid > 0){
			$dbs->update('`htid`='.$id.',`state`=1', "`id`='$saleid'");
			$jhrs = $dbs->getone($saleid);
			m($table)->update(array(
				'custid' => $jhrs['custid'],
				'custname' => $jhrs['custname'],
			), $id);
		}
		
		
		//同步更新收款单合同编号
		$htnum = arrvalue($arr,'num');
		m('custfina')->update("`htnum`='$htnum'", "`htid`='$id'");
		
		//更新对应的合同 yisid  by andy.ma 2019/12/26
		m('custract')->update("`yisid`='$id'", "`id`='$id'");
	}
	
	public function remoneyAjax()
	{
		m('crm')->custractupzt();
	}
	
	
 
	protected function storeafter($table,$rows)
	{
		// print_r($rows);exit('wtf');
		
		/*
		
		 ( 
		 
		 [id] => 5 
		 [uid] => 1 
		 [num] => 2019-12-005 
		 [optdt] => 2019-12-20 15:35:39 
		 [optname] => 管理员 
		 [applydt] => 2019-12-20 
		 [explain] => 航拍+室内全景拍摄 		 
		 [status] => 1 
		 [custid] => 3 
		 [custname] => 宜兴广告公司 
		 [linkman] => 
		 [money] => 18000.00 
		 [moneys] => 18000.00 
		 [startdt] => 2019-12-20 
		 [enddt] => 2019-12-21 
		 [content] => VR720全景拍摄 
		 [saleid] => 
		 [isturn] => 1 
		 [signdt] => 2019-12-20 
		 [type] => 0 
		 [ispay] => 0 
		 [isover] => 0 
		 [createname] => 管理员 
		 [createid] => 1 
		 [xiaoid] => 0 
		 [comid] => 1 
		 [fenlei] => 
		 [fpid] => 2 
		 [optid] => 1 
		 ) 
		 
		 
		合同编号	 num_str
		 
		客户名称	 cust_str
		 
		拥有者	      optnm_str
		 
		生效日期	 applydt_str
		   
		合同类型     content_str
				 
		待收/付金额	moneys_str
		
		创建人      optname_str 

		 
		[soufields_signdt_start] => 
		[soufields_signdt_end] => 
		[soufields_num] => 
		[soufields_custname] => 
		[soufields_content] => 
		[soufields_startdt_start] => 
		[soufields_startdt_end] => 
		[soufields_moneys] => 
		[soufields_manager] => 
		[soufields_createname] => 小李 
		[key] => 
		[search_value] => 
		 
		 
		
		*/
				
		
		//print_r($_REQUEST);exit("wtf");
		
		
		
		if($rows){
		
			
			
			$carr['zongji']=1;
			
			
			$ids="";
			$nums="";
			$counts=0;
			foreach($rows as $k=>$v)
			{
				if( $v['type']==0 )  // $v['isover']==0 &&  只有收款的
				{
				 $ids.=$v['id'].",";
				 $nums.="'".$v['num']."'".",";
				 
				}
				$counts++;	
			}
			
			if(!empty($ids))
			{
			$ids=substr($ids,0,strlen($ids)-1);
			$nums=substr($nums,0,strlen($nums)-1);
			}
		
		
			$carr['money']=0;
			
			
			
			//总数
			$carr['counts']=$counts;
			
			
			//总金额			
			$sqlz="select IFNULL(sum(money),0) as zong from xinhu_custract where  id in ($ids) ";  //exit($sqlz);
			
			$zong=0;
			$arr=$this->db->getall($sqlz);	
			if($arr)
			 $zong=$arr[0]['zong'];					
			
				
			
			
			//调账
			$sqt="select  ( select   IFNULL(sum(money),0) from xinhu_custfinaa  where paytype=0 and type=0 and htid in ($ids) ) - ( select  IFNULL(sum(money),0) from xinhu_custfinaa  where  paytype=0 and type=1   and htid in ($ids) ) as dzjer ";   //exit($sqt);
			
			$arrt=$this->db->getall($sqt);	
			$dzjer=0;
			if($arrt){
				$dzjer=$arrt[0]['dzjer'];							
			}
			
			$carr['dzjer'] =$dzjer;
			
			$zong+=$dzjer; 
			
			$carr['money'] =$zong;
			
			
			//已收
			$sqys="select IFNULL(sum(money),0) as yishou from xinhu_custfina  where  type=0 and ispay=1  and htid in ($ids) ";
			
			$arys=$this->db->getall($sqys);
			$yishou=0;
			if($arys){
				$yishou=$arys[0]['yishou'];						
			}
			
			$carr['yishou'] =$yishou;   
			
			//未收			
			$carr['weishou']=$zong-$yishou;
			
			
			//开票
			$sqkai="select IFNULL(sum(money),0) as kaipiao  from xinhu_fininfom where num in ($nums)"; 
			$arkp=$this->db->getall($sqkai);  // exit($sqkai);
			
			$kaipiao=0;
			if($arkp){
				$kaipiao=$arkp[0]['kaipiao'];				
			}
			
			$carr['kaipiao']=$kaipiao;
			
			//未开
			$carr['weikai']=$zong-$kaipiao;
			
			
			$lv=0;
			
			//回款率
			
			 
			
			 if($zong!=0){ 
			   $lv=($yishou/$zong)*100;			 
			   $lv=number_format($lv,1);
			 }
			$carr['lv']=$lv;
			
			
			
			
			
			$carr['id']=$rows[0]['id'];
			$carr['type']=$rows[0]['type'];
			$carr['startdt']=$rows[0]['startdt'];
			$carr['enddt']=$rows[0]['enddt'];
			
			 $carr['ispay']=$rows[0]['ispay'];
			
			$carr['fpid']=$rows[0]['fpid'];
	 		$carr['moneys']="";
			$carr['isover']=$rows[0]['isover'];		
			$carr['num']=$rows[0]['num'];
			
			
			
			 
			$rows[]=$carr; 
		}
	 
		 
		
		///print_r($rows);exit;
		
		return array('rows'=>$rows);
		
	}
 

	
	
	
	
	
	
	
	
	
	public function selecfapiao()
	{
		$rows = m('crm')->getfapiao();
		return $rows;
	}
	
	
	
}	
			