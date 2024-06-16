<?php
/**
*	此文件是流程模块【finjishou.记账收入】对应控制器接口文件。
*/ 
class mode_finjishouClassAction extends inputAction{
	
	
	protected function savebefore($table, $arr, $id, $addbo){
		
		$rows['type']  = '0';
		$rows['money'] = abs($arr['money']);
		return array(
			'rows' => $rows
		);
	}
	
	
	protected function saveafter($table, $arr, $id, $addbo){
		m('fina')->updatemoney(arrvalue($arr,'accountid'));
	}
	
	protected function storeafter($table, $rows)
	{
		$money = 0;
		if($rows){
			foreach($rows as $k1=>$rs1){
				$money+=floatval($rs1['money']);
			}
			$carr['money'] 	= $money; 
			$carr['zhangid'] 	= '合计'; 
			$rows[] = $carr;
		}
		if($this->loadci>1)return array(
			'rows' => $rows
		);
		$zhangarr = m('fina')->getzhangtao(1);
		foreach($zhangarr as $k=>&$rs){
			$rs['name'].='('.$rs['subname'].')';
		}
		return array(
			'zhangarr' => $zhangarr,
			'accountarr' => m('fina')->getaccount(),
			'rows' => $rows
		);
	}
	
	public function getjichatsAjax()
	{
		return $this->storeafter('1',null);
	}
	
	public function addpiliangAjax()
	{
		$rows[] = array(
			'id' => '1'
		);
		$rows[] = array(
			'id' => '2'
		);
		$rows[] = array(
			'id' => '3'
		);
		$rows[] = array(
			'id' => '4'
		);
		$rows[] = array(
			'id' => '5'
		);
		
		$barr['rows'] = $rows;
		$barr['zhangarr'] = m('fina')->getzhangtao();
		$barr['accountarr'] = m('fina')->getaccount();
		$type = $this->get('type','0');
		$jtype = 'finjishoutype';
		if($type=='1')$jtype='finjizhitype';
		$barr['jtypearr'] = $this->option->getselectdata($jtype, true);
		
		return $barr;
	}
	
	//保存批量录入
	public function savepiliangAjax()
	{
		$stotal = (int)$this->post('stotal','0');
		$type 	= (int)$this->post('type','0');
		$zhangid = (int)$this->post('zhangid','0');
		$uarr['optid'] = $this->adminid;
		$uarr['optname'] = $this->adminname;
		$uarr['optdt'] = $this->rock->now;
		$uarr['status'] = '1';
		$uarr['comid'] = m('admin')->getcompanyid();
		for($i=1;$i<=$stotal;$i++){
			$uarr['zhangid'] = $zhangid;
			$uarr['type'] = $type;
			$money  = abs($this->post('money_'.$i.''));
			if($type==1)$money = 0-$money;
			$uarr['money'] = $money;
			$uarr['custname'] = $this->post('custname_'.$i.'');
			
			if($i>1){
				if($this->post('accountid_'.$i.'')>0)$accountid 	= $this->post('accountid_'.$i.'');
				if($this->post('applydt_'.$i.'')!='同上')$applydt 	= $this->post('applydt_'.$i.'');
				if($this->post('jtype_'.$i.'')!='同上')$jtype 	= $this->post('jtype_'.$i.'');
			}else{
				$accountid 	= $this->post('accountid_'.$i.'');
				$applydt 	= $this->post('applydt_'.$i.'');
				$jtype 		= $this->post('jtype_'.$i.'');
			}
			$uarr['accountid'] = $accountid;
			$uarr['applydt'] = $applydt;
			$uarr['jtype'] = $jtype;
			$uarr['custname'] = $this->post('custname_'.$i.'');
			$uarr['custid'] = $this->post('custid_'.$i.'');
			$uarr['xgname'] = $this->post('xgname_'.$i.'');
			$uarr['xguid'] = $this->post('xguid_'.$i.'');
			$uarr['xgdeptname'] = $this->post('xgdeptname_'.$i.'');
			$uarr['explain'] 	= $this->post('explain_'.$i.'');
			m('finjibook')->insert($uarr);
		}
		m('fina')->updatemoney();
		return '保存成功'.$stotal.'条';
	}
	
	//报表统计
	public function jichatsAjax()
	{
		$rows = array();
		$zhangid 	= (int)$this->post('zhangid','0');
		$accountid 	= (int)$this->post('accountid','0');
		$dt1 	= $this->post('dt1');
		$dt2 	= $this->post('dt2');
		$type 	= (int)$this->post('tongtype','0');
		
		$where	= '1=1 '.m('admin')->getcompanywhere(3);
		if($zhangid>0)$where.=" and `zhangid`='$zhangid'";
		if($accountid>0)$where.=" and `accountid`='$accountid'";
		if(!isempt($dt1))$where.=" and `applydt`>='$dt1'";
		if(!isempt($dt2))$where.=" and `applydt`<='$dt2'";
		$groupa = array('SUBSTR(applydt,1,4)','applydt','jtype');
		$group	= $groupa[$type];
		$sql 	= "select sum(money)value,".$group." as name from `[Q]finjibook` where $where and `status`=1 group by $group";
		$rows 	= $this->db->getall($sql);
		
		return array(
			'rows' => $rows
		);
	}
}	
			