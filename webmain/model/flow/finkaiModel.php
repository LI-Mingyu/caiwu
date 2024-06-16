<?php
//发票管理
class flow_finkaiClassModel extends flowModel
{
	
	 
	
	public function flowrsreplace($rs, $lx=0)
	{
		
		$fid=$rs['paytype'];
		
		$ors= $this->db->getone('[Q]feelv','id='.$fid.'','fpname');
		
		$rs['paytype']=$ors['fpname'];
		
		
		switch($rs['inorout'])
		{
			case 0:
			  $rs['inorout']="开出去的";
			  break;
			case 1:
			  $rs['inorout']="收到的";
			  break;	
				
		}
		
		return $rs;
	}
	

	 
	
}