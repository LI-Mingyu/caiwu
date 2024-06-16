<?php
/**
*	此文件是流程模块【finjizhi.记账支出】对应控制器接口文件。
*/ 
class mode_finjizhiClassAction extends inputAction{
	
	
	protected function savebefore($table, $arr, $id, $addbo){
		
		$rows['type']  = '1';
		$rows['money'] = 0-abs($arr['money']);
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
		return array(
			'zhangarr' => m('fina')->getzhangtao(1),
			'accountarr' => m('fina')->getaccount(),
			'rows' => $rows
		);
	}
	
	
}	
			