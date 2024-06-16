<?php 	session_start(); 

date_default_timezone_set("Asia/Shanghai");
	$local="/webmain";
	//print_r($_SERVER);exit;
    $host=$_SERVER['HTTP_HOST'];
	$srvurl="/";
		
     include(dirname(__FILE__) . "/../config/conpass.php");		
	 
		$conn = mysql_connect($server,$dbuser,$dbpass);	
		mysql_query("set names utf8");
		mysql_select_db($db_base, $conn);  // exit("ggg");
		

    $sqlz="select id from xinhu_group where name='系统管理员组'";

	$gres=mysql_query($sqlz);	

    $garr=mysql_fetch_array($gres);

   $gid=$garr[0];  //exit($gid.'wtf');

   
    
?>
<!-- saved from url=(0057)#web/index.php?c=user&a=register& -->
<html lang="zh-cn">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<style type="text/css">[uib-typeahead-popup].dropdown-menu{display:block;}</style>
	
	
	<style type="text/css">.uib-time input{width:50px;}</style>
	
	<style type="text/css">[uib-tooltip-popup].tooltip.top-left > .tooltip-arrow,[uib-tooltip-popup].tooltip.top-right > .tooltip-arrow,[uib-tooltip-popup].tooltip.bottom-left > .tooltip-arrow,[uib-tooltip-popup].tooltip.bottom-right > .tooltip-arrow,[uib-tooltip-popup].tooltip.left-top > .tooltip-arrow,[uib-tooltip-popup].tooltip.left-bottom > .tooltip-arrow,[uib-tooltip-popup].tooltip.right-top > .tooltip-arrow,[uib-tooltip-popup].tooltip.right-bottom > .tooltip-arrow,[uib-tooltip-html-popup].tooltip.top-left > .tooltip-arrow,[uib-tooltip-html-popup].tooltip.top-right > .tooltip-arrow,[uib-tooltip-html-popup].tooltip.bottom-left > .tooltip-arrow,[uib-tooltip-html-popup].tooltip.bottom-right > .tooltip-arrow,[uib-tooltip-html-popup].tooltip.left-top > .tooltip-arrow,[uib-tooltip-html-popup].tooltip.left-bottom > .tooltip-arrow,[uib-tooltip-html-popup].tooltip.right-top > .tooltip-arrow,[uib-tooltip-html-popup].tooltip.right-bottom > .tooltip-arrow,[uib-tooltip-template-popup].tooltip.top-left > .tooltip-arrow,[uib-tooltip-template-popup].tooltip.top-right > .tooltip-arrow,[uib-tooltip-template-popup].tooltip.bottom-left > .tooltip-arrow,[uib-tooltip-template-popup].tooltip.bottom-right > .tooltip-arrow,[uib-tooltip-template-popup].tooltip.left-top > .tooltip-arrow,[uib-tooltip-template-popup].tooltip.left-bottom > .tooltip-arrow,[uib-tooltip-template-popup].tooltip.right-top > .tooltip-arrow,[uib-tooltip-template-popup].tooltip.right-bottom > .tooltip-arrow,[uib-popover-popup].popover.top-left > .arrow,[uib-popover-popup].popover.top-right > .arrow,[uib-popover-popup].popover.bottom-left > .arrow,[uib-popover-popup].popover.bottom-right > .arrow,[uib-popover-popup].popover.left-top > .arrow,[uib-popover-popup].popover.left-bottom > .arrow,[uib-popover-popup].popover.right-top > .arrow,[uib-popover-popup].popover.right-bottom > .arrow,[uib-popover-html-popup].popover.top-left > .arrow,[uib-popover-html-popup].popover.top-right > .arrow,[uib-popover-html-popup].popover.bottom-left > .arrow,[uib-popover-html-popup].popover.bottom-right > .arrow,[uib-popover-html-popup].popover.left-top > .arrow,[uib-popover-html-popup].popover.left-bottom > .arrow,[uib-popover-html-popup].popover.right-top > .arrow,[uib-popover-html-popup].popover.right-bottom > .arrow,[uib-popover-template-popup].popover.top-left > .arrow,[uib-popover-template-popup].popover.top-right > .arrow,[uib-popover-template-popup].popover.bottom-left > .arrow,[uib-popover-template-popup].popover.bottom-right > .arrow,[uib-popover-template-popup].popover.left-top > .arrow,[uib-popover-template-popup].popover.left-bottom > .arrow,[uib-popover-template-popup].popover.right-top > .arrow,[uib-popover-template-popup].popover.right-bottom > .arrow{top:auto;bottom:auto;left:auto;right:auto;margin:0;}[uib-popover-popup].popover,[uib-popover-html-popup].popover,[uib-popover-template-popup].popover{display:block !important;}</style>
	
	<style type="text/css">.uib-datepicker-popup.dropdown-menu{display:block;float:none;margin:0;}.uib-button-bar{padding:10px 9px 2px;}</style>
	
	<style type="text/css">.uib-position-measure{display:block !important;visibility:hidden !important;position:absolute !important;top:-9999px !important;left:-9999px !important;}.uib-position-scrollbar-measure{position:absolute !important;top:-9999px !important;width:50px !important;height:50px !important;overflow:scroll !important;}.uib-position-body-scrollbar-measure{overflow:scroll !important;}</style>
	
	
	<style type="text/css">.uib-datepicker .uib-title{width:100%;}.uib-day button,.uib-month button,.uib-year button{min-width:100%;}.uib-left,.uib-right{width:100%}</style>
	
	<style type="text/css">.ng-animate.item:not(.left):not(.right){-webkit-transition:0s ease-in-out left;transition:0s ease-in-out left}</style>
	
	<style type="text/css">@charset "UTF-8";[ng\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide:not(.ng-hide-animate){display:none !important;}ng\:form{display:block;}.ng-animate-shim{visibility:hidden;}.ng-anchor{position:absolute;}</style>
    		
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>注册新用户</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
	<link rel="shortcut icon" href="#web/resource/images/favicon.ico">
	
	<link href="/js/reg/bootstrap.min.css" rel="stylesheet">
	<link href="/js/reg/common.css" rel="stylesheet">
	
	
	<script type="text/javascript">
	if(navigator.appName == 'Microsoft Internet Explorer'){
		if(navigator.userAgent.indexOf("MSIE 5.0")>0 || navigator.userAgent.indexOf("MSIE 6.0")>0 || navigator.userAgent.indexOf("MSIE 7.0")>0) {
			alert('您使用的 IE 浏览器版本过低, 推荐使用 Chrome 浏览器或 IE8 及以上版本浏览器.');
		}
	}
 
	</script>
 
 
	<script type="text/javascript" src="/js/reg/jquery-1.11.1.min.js"></script>
	 
</head>
	
	
	
<?php 
	
/*

 [oaname] => 新超越科技 [user] => admin1 [password] => abc12345678 [repassword] => abc12345678 [city] => SZ [realname] => 阿达 [tel] => 0755-25110121 [code] => 2642 [submit] => 注册 [token] => e65921fa [owner_uid] => [register_type] => [do] => register

*/	
	

if(isset($_POST['do']) && $_POST['do']=='register')
{
	
    //print_r($_POST); exit("wtf");
	
	$oaname=$_POST['oaname'];
	$user=$_POST['user'];
	$pass=$_POST['password'];
	$pass=md5($pass);
	
	$city=$_POST['city'];
	$realname=$_POST['realname'];
	$tel=$_POST['tel'];
	
	//print_r($_POST);exit("wtf");
	
	//$postdata = file_get_contents("php://input");
	
	
	//var_dump($postdata);exit("fuck");
	
	//$dataObj = json_decode($postdata); 
	
	//print_r($dataObj); 
	
	//echo $_POST['code'];
	
	//exit;
	

	
	
	if(strtolower($_SESSION["code"]) != strtolower($_POST['code'])){   
		 $msg = '验证码不正确,点此返回';    
		 exit("<a href='".$srvurl."webmain/register.php'>".$msg."</a>");
	}else{
		 
	  // $con = mysql_connect("localhost","root","root");
      // mysql_select_db("xinhudb2", $con);	
		
		
	 
		
		
		$sql="select count(id) as num from xinhu_admin where user='$user'";
		
		$res=mysql_query($sql);		
		$exst=mysql_fetch_array($res);		
		$num=$exst[0]; //echo ($num);exit("wtf1");
		
		if($num>0)
		{
			exit("<a href='".$srvurl."webmain/register.php'>此用户名已存在！点此返回</a>");
			
		}
		
		
		$sql="select count(id) as num from xinhu_company where oaname='$oaname'";
		
		$res=mysql_query($sql);		
		$exst=mysql_fetch_array($res);		
		$num=$exst[0]; //echo ($num);exit("wtf1");
		
		
		
		if($num>0)
		{
			exit("<a href='".$srvurl."/webmain/register.php'>此公司名已存在！点此返回</a>");
			
		}
		
		
		
		$sql="select count(id) as num from xinhu_company where 1=1 ";
		
		$res=mysql_query($sql);		
		$exst=mysql_fetch_array($res);		
		$num=$exst[0];
		
		
		
		
		$bianhao="";		
		
		$nums_str="";
		 
		// 制造 单位编号  by andy.ma 2019/12/13
		$t=date("Ymd",time());
		
				
		 if(intval($num)==0)
		  {
			$num=1;
		  }
		  elseif(intval($num)<10)
		  {
			$nums_str='00'.$num;
		  }
		  elseif(intval($num)>10 && intval($num)<100 )
		  {
			$nums_str='0'.$num;
		  }
          else
		   $nums_str=$num;
		
		
		//echo $nums_str;exit("wtf");
		
		$bianhao=$t.$nums_str;
	 
		
		
		$sqlx="select count(id) as cc from xinhu_company where num='$bianhao' ";
		$resx=mysql_query($sqlx);
		
		$xxs=null;
		
		while($xxs=mysql_fetch_array($resx) && $xxs['cc']>0)
		{
			$num++;	
			
			
			 if(intval($num)==0)
		  {
			$num=1;
		  }
		  elseif(intval($num)<10)
		  {
			$nums_str='00'.$num;
		  }
		  elseif(intval($num)>10 && intval($num)<100 )
		  {
			$nums_str='0'.$num;
		  }
          else
		   $nums_str=$num;
			
			$bianhao=$t.$nums_str;
			 
		}
				
		
	
		
		
		
		//  公司表
		$regtime=date("Y-m-d H:i:s",time());	
		
		$exptime=date("Y-m-d",strtotime("+90 day")); //90天后过期
		
	    $sql="insert into xinhu_company (name,oaname,tel,city,regtime,num,exptime) values ('";		
	    $sql.="$oaname','$oaname','$tel','$city','$regtime','$bianhao','$exptime')";  // exit($sql);
		
			
		mysql_query($sql);		
		$cid=mysql_insert_id($conn);
		
		
		//写入部门表
		//$sqdpt="insert into xinhu_dept (pid,name,headman,companyid)  values ('1','$oaname','系统管理员','$cid')";		
		//mysql_query($sqdpt);	
		
		
		
		if($cid>0)
		{
			//echo "success";
			//  管理员 表
			$sql="insert into  xinhu_admin (user,name,pass,companyid,status,source) values ('";
			$sql.="$user','$realname','$pass','$cid','1','1')";   
			//exit($sql);
			mysql_query($sql);  
			$aid=mysql_insert_id($conn);
			
						
			
						
			if($aid>0)
			{				
				
				//将该用户写进对应权限组  权限表
				$sqls="insert into xinhu_sjoin (type,mid,sid,indate) values ('ug','$gid','$aid','".$regtime."')";  // exit($sql);
				mysql_query($sqls);
				
				
				
				
				//写进税率表  by andy.ma 20/01/10
				$sqlv1="insert into xinhu_feelv (fpname,felv,uid,comid) values ('公司收据','0.00','$aid','$cid')";	//exit($sqlv1);
				mysql_query($sqlv1);
				$sqlv2="insert into xinhu_feelv (fpname,felv,uid,comid) values ('增值税普票','0.03','$aid','$cid')";
				mysql_query($sqlv2);
				$sqlv3="insert into xinhu_feelv (fpname,felv,uid,comid) values ('增值税专票','0.06','$aid','$cid')";
				mysql_query($sqlv3);
				
				
				
				
				$sqg="select sid from xinhu_sjoin where mid='$gid' and type='gm'";
				
				$res=mysql_query($sqg); //根据 组包括的菜单权限 来定义 注册用户 权限
				
				while($row=mysql_fetch_array($res))
				{
					$sid=$row['sid'];
					
					$sqin="insert into xinhu_sjoin ( type,mid,sid,indate )  values ('mu','$sid','$aid','$regtime')";
 					//echo $sqin.'<br>';
					mysql_query($sqin);
					
				}
				
				
			 // 写进 所属部门 
             $sqdp="insert into xinhu_dept (pid,name,headman,companyid)  values ('1','$oaname','系统管理员','$cid')";				
			 mysql_query($sqdp);	
			 $dpid=mysql_insert_id($conn);	
				
            if($dpid>0)				
			  exit("注册成功！现在返回登录<meta http-equiv=\"Refresh\" content=\"1;url=/?m=login\" />");
			else	
			  exit("<a href='$srvurl/webmain/register.php'>数据操作失败，点此返回</a>");
				
				
			}
			else{
				exit("<a href='$srvurl/webmain/register.php'>数据操作失败，点此返回</a>");
				
			}
			
			
		}
	 	else
		{			
			
			exit("<a href='$srvurl/webmain/register.php'>数据操作失败，点此返回</a>");
			
		}
		   
		
	  
		
		
		
	}

    
	 
	
	
	
	
	
}
	
	 
	// mysql_query();
	
?>	
	
	
	
<body>
	<div class="loader" style="display:none">
		<div class="la-ball-clip-rotate">
			<div></div>
		</div>
	</div>
	
	
<div class="user-login">
	<div class="login-logo">
		<div class="container">
			<a href="#">
				<img src="/js/reg/login-logo.png" class="logo">
			</a>
		</div>
	</div>
	<div class="login-header">
		<div class="container">
			<h3>账号注册</h3>
			<div class="go">
				已有账号，<a href="/?m=login" class="color-default">去登录</a>
			</div>
		</div>
	</div>
	<div class="login-content">
		<ul class="login-tab clearfix">
						<li class="active">
				<a href="#">用户名密码</a>
			</li>
								</ul>
		<div class="clearfix"></div>
		
		<div class="login-form">
			
			
			<form action="?" class="we7-form register-mobile ng-pristine ng-scope ng-invalid ng-invalid-required" method="post" role="form" id="form1" >
				
				
				  <div class="form-group required">
							<label class="control-label col-sm-1 ">公司名称:</label>
														
						   <div class="col-sm-11">
					 
							   
							   <input name="oaname" type="text" class="form-control ng-pristine ng-empty ng-invalid ng-invalid-required ng-touched" placeholder="请输入公司名" ng-model="oaname"   required="" style="">
							   
							   
							</div>							
						</div>
				
				
				
				
				<div class="form-group required has-error has-feedback" ng-class="{true:&#39;has-error has-feedback&#39;,false:&#39;has-success has-feedback&#39;}[usernameErr]" style="">
					<label class="control-label col-sm-1">用户名:</label>
					
					<div class="col-sm-11">
						
						<input name="user" id="username" type="text" class="form-control ng-pristine ng-empty ng-invalid ng-invalid-required ng-touched" placeholder="请输入登录用户名" ng-model="username"   required="" style="">
						
						
					</div>
					
				</div>
				
				

				<div class="form-group required" ng-class="{true:&#39;has-error has-feedback&#39;,false:&#39;has-success has-feedback&#39;}[passwordErr]">
					<label class="control-label col-sm-1">设置密码:</label>
					<div class="col-sm-11">
						<input name="password" type="password" id="password" class="form-control col-sm-10 ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" placeholder="请输入6位数密码" maxlength="6" ng-model="password" ng-blur="checkPassword()" required="">
						<span ng-class="{true:&#39;fa fa-times form-control-feedback reg-system-valid&#39;,false:&#39;fa fa-check form-control-feedback reg-system-valid&#39;}[passwordErr]" aria-hidden="true"></span>
						<span ng-class="{true:&#39;color-red&#39;,false:&#39;sr-only&#39;}[passwordErr]" class="help-block ng-binding" ng-bind="passwordMsg"></span>
					</div>
				</div>
				
				

				<div class="form-group required" ng-class="{true:&#39;has-error has-feedback&#39;,false:&#39;has-success has-feedback&#39;}[repasswordErr]">
					<label class="control-label col-sm-1">确认密码:</label>
					<div class="col-sm-11">
						
						<input name="repassword" type="password" id="repassword" class="form-control col-sm-10 ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" placeholder="请再次输入6位数密码" maxlength="6" ng-blur="checkRepassword()" ng-model="repassword" required="">
												
						</span>
					</div>
				</div>

				<!--用户注册拓展字段 end -->
					


				       <div class="form-group required">
							<label class="control-label col-sm-1 ">所在城市:</label>							
																
						   <div class="col-sm-11">
								<input type="text" class="form-control" name="city" placeholder="某某市" maxlength="4" value="">	
							</div>							
						</div>
						
				
				      <div class="form-group required">
							<label class="control-label col-sm-1 ">真实姓名:</label>
						<div class="col-sm-11">
								<input type="text" class="form-control" name="realname"  placeholder="个人姓名" maxlength="4" value="">	
													
						</div>
					  </div>
					  
					
					<div class="form-group required ">

						<label class="control-label col-sm-1 ">联系电话:</label>

					  <div class="col-sm-11">
							<input type="text" class="form-control" placeholder="11位手机号"  name="tel" maxlength="11" min="0" onkeyup="value=value.replace(/[^0-9]/g,'')" value="">							
					  </div>
					</div>
									
								<div class="form-group required">
					<label class="control-label col-sm-1">验证码:</label>
					<div class="col-sm-11">
						<div class="input-group">
							
							<input name="code" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty" placeholder="请输入验证码" ng-blur="checkCode()" ng-model="code">
							
							
							<a href="javascript:;" class="input-group-btn imgverify" ng-click="changeVerify()">
								<!-- img ng-src="./index.php?c=utility&amp;a=code&amp;" style="height: 32px;" src="/js/reg/index.php" -->
								 <img src="captcha.php"  onclick="this.src='captcha.php?' + Math.random();" width="105" height="36">
							</a>
							
							
						</div>
						<span ng-class="{true:&#39;color-red&#39;,false:&#39;sr-only&#39;}[codeErr]" class="help-block ng-binding" ng-bind="codeMsg"></span>
					</div>
				</div>
												<div class="login-submit text-center">
			<input type="submit" name="submit" value="注册" class="btn btn-block btn-primary" ng-disabled="usernameInvalid || passwordInvalid || repasswordInvalid"  />
													
													
										<!-- <a href="./index.php?c=user&a=login&" class="btn btn-default">登录</a> -->
					<input name="token" value="e65921fa" type="hidden">
					<input name="owner_uid" value="" type="hidden">
					<input name="register_type" value="" type="hidden">
					<input name="do" value="register" type="hidden">
				</div>
			</form> 
					</div>
	</div>
</div>
 
	<script>
	
	$('#form1').submit(function(){ //alert("fuck");
		
		if ($.trim($(':text[name="user"]').val()) == '') {
			 
			return false;
		}
		if ($('#password').val() == '') {
			 alert("请输入不少于6位密码!");
			return false;
		}
		if ($('#password').val() != $('#repassword').val()) {
			 alert("两次输入密码不一致!");
			return false;
		}
		
		/* 						if (!$.trim($('[name="nickname"]').val())) {
		util.message('昵称为必填项，请返回修改！', '', 'error');
		return false;
		}
								if (!$.trim($('[name="realname"]').val())) {
		util.message('真实姓名为必填项，请返回修改！', '', 'error');
		return false;
		}
		
										*/
	 if ($.trim($(':text[name="code"]').val()) == '') {
			 
			return false;
		}
		
	});
	

	
</script>
	
	
	
	</body></html>