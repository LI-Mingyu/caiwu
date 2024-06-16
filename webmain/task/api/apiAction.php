<?php


$origin = getheader('Origin');
if(!isempt($origin) && !contain($origin, HOST)){
	header('Access-Control-Allow-Origin:*');
	header('Access-Control-Allow-Headers:X-Requested-With');
	header('Access-Control-Allow-Credentials:true');
	if(arrvalue($_SERVER,'REQUEST_METHOD')=='OPTIONS'){
		showreturn('ok');
	}
}	

class apiAction extends ActionNot
{

	public $userrs;
	public $cfrom		= '';
	public $token		= '';
	
	public function initAction()
	{
		$this->display= false;
		$time 		= time();
		$this->cfrom= $this->request('cfrom');
		$this->token= $this->request('token', $this->admintoken);
		$this->adminid 	 = (int)$this->request('adminid', $this->adminid);
		$this->adminname = '';
		$boss = (M == 'login|api');
		if(!$boss){
			if($this->isempt($this->token))$this->showreturn('','token invalid', 199);
			$lodb = m('login');
			$onto = $lodb->getone("`uid`='$this->adminid' and `token`='$this->token' and `online`=1");
			if(!$onto)$this->showreturn('','登录失效，请重新登录', 199);
			$lodb->update("`moddt`='{$this->rock->now}'", $onto['id']);
		}
		$this->userrs = m('admin')->getone("`id`='$this->adminid' and `status`=1", '`name`,`user`,`id`,`ranking`,`deptname`,`deptid`');
		if(!$this->userrs && !$boss){
			$this->showreturn('', '用户已经不存在了，请重新登录', 199);
		}
		
		$this->adminname 		= $this->userrs['name'];
		$this->rock->adminid	= $this->adminid;
		$this->rock->adminname 	= $this->adminname;
		$this->admintoken 		= $this->token;
	}
	
	public function getvals($nae, $dev='')
	{
		$sv = $this->rock->jm->base64decode($this->post($nae));
		if($this->isempt($sv))$sv=$dev;
		return $sv;
	}
	
	public function getpostdata()
	{
		$postdata = '';
		if(isset($GLOBALS['HTTP_RAW_POST_DATA']))$postdata = $GLOBALS['HTTP_RAW_POST_DATA'];
		if($postdata=='')$postdata = trim(file_get_contents('php://input'));
		return $postdata;
	}
}