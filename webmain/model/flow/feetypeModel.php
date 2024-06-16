<?php
//客户收付款单
class flow_feetypeClassModel extends flowModel
{
	
	
	
	protected function flowbillwhere($uid, $lx)
	{
		$key	= $this->rock->post('key');
		$where 	= '';
		if($key!=''){
			$where.=" and `feename` like '%$key%'";
		}

		return array(
			'where' => $where,
			'order' => '`id` desc'
		);
	}
}