<?php 

class wxgzhClassAction extends apiAction{

	public function getsignAction()
	{
		$bo		= m('wxgzh:signjssdk');
		$appid 	= $bo->readwxset();
		if(isempt($appid)){
			$arr['appId'] = '';
		}else{
			$url = $this->getvals('url');
			$arr = $bo->getsignsdk($url);
		}
		$this->showreturn($arr);
	}
	
}

/**
*	微信公众号接口

*/