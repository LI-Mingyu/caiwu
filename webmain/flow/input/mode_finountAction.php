<?php
/**
*	此文件是流程模块【finount.财务帐号】对应控制器接口文件。
*/ 
class mode_finountClassAction extends inputAction{
	
	public function updatemoneyAjax()
	{
		m('fina')->updatemoney();
	}
}	
			