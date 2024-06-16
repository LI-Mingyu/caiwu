<?php

/**

*	mode_feetypeClassAction

*/

class mode_feetypeClassAction extends inputAction{

	
	
	protected function savebefore($table, $arr, $id, $addbo){
		
		//print_r($arr);exit;
		//  [acc_name] => 大宗大 [acc_num] => 2546659878 [bank] => 光大银行 [acc_type] => 0 [uid] => 1 [comid] => 1
		$narr	= array();
		
		$narr['feename']=$arr['feename'];
		
		$narr['seq']=$arr['seq'];	
		
		$narr['uid']=$arr['uid'];
		
		
		

		return array('rows'=> $narr); 
		
	}
	
	


}	

			