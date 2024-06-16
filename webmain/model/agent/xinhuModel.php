<?php
/**
*	中投团队应用
*/
class agent_xinhuClassModel extends agentModel
{
	protected function agentdata($uid, $lx)
	{
		$rows[] = array(
			'title' => '欢迎使用中投OA系统',
			'cont'	=> '官网：<a href="http://ds.cicqeg.com" target="_blank">ds.cicqeg.com</a><br>版本：'.VERSION.'',
			'statuscolor' => 'green',
			'statustext'  => '官网'
		);
		
		
		$arr['rows'] 	= $rows;
		return $arr;
	}
}