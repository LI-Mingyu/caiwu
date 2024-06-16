<?php
/**
*	此文件是流程模块【account.账户维护】对应控制器接口文件。
*/ 
class mode_accountClassAction extends inputAction{
	
	/**
	*	重写函数：保存前处理，主要用于判断是否可以保存
	*	$table String 对应表名
	*	$arr Array 表单参数
	*	$id Int 对应表上记录Id 0添加时，大于0修改时
	*	$addbo Boolean 是否添加时
	*	return array('msg'=>'错误提示内容','rows'=> array()) 可返回空字符串，或者数组 rows 是可同时保存到数据库上数组
	*/
		protected function savebefore($table, $arr, $id, $addbo){
		
		//print_r($arr);exit;
		 
		$narr	= array();
		
		$narr['acc_name']=$arr['acc_name'];
		
		$narr['acc_num']=$arr['acc_num'];
		$narr['bank']=$arr['bank'];
		$narr['saving']=0;
		$narr['acc_type']=$arr['acc_type'];
		
	//	$narr['uid']=$arr['uid'];
		
		
		

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
		
	}
	protected function storeafter ($table, $rows){
		$saving = 0;
		if ($rows){
			foreach($rows as $k1=>$rs1){
				$saving+=floatval($rs1['saving']);
			}
			$carr['saving'] = $saving;
			$carr['acc_name'] = '合计';
			$carr['acc_type'] = 4;
			$rows[] = $carr;
		}
		return array ('rows' => $rows);
	}
}	
			