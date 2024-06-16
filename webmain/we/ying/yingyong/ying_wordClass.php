<?php 


class ying_wordClass extends yingClassAction{
	private $mobj;
	
	private $searchtool 	= true; //需要搜索拦

	
	public function initYing($mobj)
	{
		$this->mobj = $mobj;
		
		//获取分区
		$worcarr	= m('worc')->getmywroc();
		
		$this->mobj->assign('worcarr', $worcarr);
		$this->mobj->assign('searchtool', $this->searchtool);
		$this->mobj->assign('searchmsg', '文件名/文件夹');
	}
}