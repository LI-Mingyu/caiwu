<?php 

class worcClassAction extends apiAction
{
	
	public function getdataAction()
	{
		$barr = m('word')->getdata();
		
		$this->showreturn($barr);
	}
}