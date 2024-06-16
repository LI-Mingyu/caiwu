<?php 

class hwpushChajian extends Chajian{
	
	//华为推送的设置【自己编译app】以下2个必须设置
	private $appid 	 	= '';
	private $appsecret 	= '';
	
	
	/**
     * 相关域名定义
     */
    private $tokenurl 	= 'https://login.cloud.huawei.com/oauth2/v2/token';
    private $pushurl	= 'https://push-api.cloud.huawei.com/v1/{appid}/messages:send';

	
	/**
	*	获取token
	*/
	public function gettoken(){
		if($this->appid=='' || $this->appsecret=='')return '';
		$token 	= c('cache')->get('hwtoken');
		if(isempt($token)){
			$result = c('curl')->postcurl($this->tokenurl, array( 
				"grant_type" => "client_credentials",
				"client_secret" => $this->appsecret,
				"client_id" => $this->appid, 
			));
			if($result){
				$barr 	= json_decode($result, true);
				$token 	= $barr['access_token'];
				c('cache')->set('hwtoken',$token, $barr['expires_in']-1);
			}
		}
		return $token;
    }
	
	/**
	*	安卓推送通知
	*/
	public function androidsend($alias, $title, $cont)
	{
		$url 	= str_replace('{appid}',$this->appid, $this->pushurl);
		$token 	= $this->gettoken();
		if(!$token)return '';
		$data = '{"validate_only": false, "message": {"android": { "notification": { "title": "'.$title.'", "body": "'.$cont.'", "click_action": { "type": 1, "intent": "#Intent;compo=com.rvr/.Activity;S.W=U;end" } } }, "token": '.json_encode($alias).' }}';
		$result = c('curl')->postcurl($url, $data, 0, array(
			"Content-Type" => 'application/json',
             "Authorization" => "Bearer {$token}"
		));
		
		return $result;
	}
}