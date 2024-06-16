<?php 

class scheduleClassAction extends apiAction
{
	public function getlistAction()
	{
		$startdt 	= $this->post('startdt');
		$enddt 		= $this->post('enddt');
		$arr 		= m('schedule')->getlistdata($this->adminid, $startdt, $enddt);
		$this->showreturn($arr);
	}
}