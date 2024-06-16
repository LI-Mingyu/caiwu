<?php

class flow_pay_custractClassModel extends flowModel
{
	public function initModel(){
		$this->typearr		= array('收款合同','<font color="#0480F3">付款合同</font>');
		$this->typesarr		= array('收','付');
		$this->statearr		= c('array')->strtoarray('待生效|blue,生效中|green,已过期|#888888');
		$this->dtobj		= c('date');
		$this->crmobj		= m('crm');
		$this->goodmobj		= m('goodm');
		
		$this->wherejoin['custfina'] = 'htid';
	}
	
	//作废或删除时
	protected function flowzuofeibill($sm)
	{
		m('goodm')->update('`custractid`=0', "`custractid`='".$this->id."'");//销售单取消关联合同
		
		
		
		$xiaoid = (int)arrvalue($this->rs,'xiaoid','0');
	}
	
	public function flowrsreplace($rs, $lx=0){     
		$type 		= $rs['type'];
		$rs['type'] = $this->typearr[$type]; //print_r($rs['type']); exit('wtf2');
		$statetext	= '';
		$dt 		= $this->rock->date;
		$htstatus	= 0;
		if($rs['startdt']>$dt){
			$statetext='待生效';
		}else if($rs['startdt']<=$dt && $rs['enddt']>=$dt){
			$jg = $this->dtobj->datediff('d', $dt, $rs['enddt']);
			$statetext='<font color=green>生效中</font><br><font color=#888888>'.$jg.'天过期</font>';
			if($jg==0)$statetext='<font color=green>今日到期</font>';
			$htstatus = 1;
		}else if($rs['enddt']<$dt){
			$statetext='<font color=#888888>已过期</font>';
			$rs['ishui'] 	= 1;
			$htstatus = 2;
		}
		$rs['statetext']	= $statetext;
		// $nrss	 			= $this->crmobj->ractmoney($rs);   //这里会修改 合同状态
		
	//	print_r($rs);exit('wtf');		
		
		$ispay 				= $rs['ispay'];  // $nrss[0];
		$moneys 			= $rs['moneys'];// $nrss[1];
		$dsmoney			= '';
		$ts 				= $this->typesarr[$type];
		
		//if($rs['id']==15){ echo $moneys;exit("wtf"); }
	    	
		//抵消掉付款的钱  by andy.ma
		 if($ts=="收"){	
		$sqdi="select ifnull(sum(money),0) as di from xinhu_custfina where htid=".$rs['id']." and type=1";
		
		$di_arr =$this->db->getall($sqdi);  //if($rs['id']==9){ echo $sqdi;exit("wtf"); }	
		
		$dix=$di_arr[0]['di'];
		
		 $moneys+=$dix;    // if($rs['id']==15){ echo $moneys;exit("wtf"); }
		 }
		
		if($ispay==1){
		 
		 if($ts=="收")				
			$dsmoney		= '<font color=green>已全部'.$ts.'款</font>';
		 else
			$dsmoney		= '<font color="#0480F3">已全部'.$ts.'款</font>'; 
			
		}else{
			
		 if($ts=="收")
			$dsmoney		= '<font color=\'#FB060D\'>待'.$ts.' '.$moneys.'</font>';
		 else
			$dsmoney		= '<font color=\'#0480F3\'>待'.$ts.' '.$moneys.'</font>'; 
			
		}
		
		
	 
		
	   if($ts=='收'){		   
		  
		  	
		$sqall=" select 
( c.money+( (select ifnull(sum(money),0)  from xinhu_custfinaa where htid='".$rs['id']."' and paytype=0  and type=0) - (select ifnull(sum(money),0)  from xinhu_custfinaa where htid='".$rs['id']."'  and paytype=0  and type=1) ) )

- (select IFNULL(sum(money),0)  from xinhu_custfina  where     type=0 and ispay=1 and htid=".$rs['id'].")

as allmoney from   xinhu_custract c  where c.id=".$rs['id'];     // exit($sqall);
	  	
      $sqis="select ((select ifnull(sum(money),0) from xinhu_custfinaa where htid='".$rs['id']."' and paytype=0 and type=0) - 

(select ifnull(sum(money),0) from xinhu_custfinaa where htid='".$rs['id']."' and paytype=0 and type=1) )

as tiao";
		   
		   
		   
		
		 
	   }
	  else{  
		  
	 $sqall=" select ( (select sum(money) as monyall from xinhu_custract where id=".$rs['id'].")+

  ((select ifnull(sum(money),0) as tiao from xinhu_custfinaa where htid=".$rs['id']." and paytype=0 and type=0) -

(select ifnull(sum(money),0) as tiao from xinhu_custfinaa where htid=".$rs['id']." and paytype=0 and type=1)) )

- (select ifnull(sum(money),0) as yishou from xinhu_custfina where htid=".$rs['id']." and type=1 and ispay=1)   as allmoney ";  
		  
	  
		  
		  
		 // if($rs['id']==15){ exit($sqall); }
		  
		 // exit($sqall);  
		  
		$sqis="select ((select ifnull(sum(money),0) from xinhu_custfinaa where htid='".$rs['id']."' and type=0) - 

(select ifnull(sum(money),0) from xinhu_custfinaa where htid='".$rs['id']."'  and type=1) )

as tiao";  
		  
		  
		  
	  }	
		
		$allmony= $this->db->getall($sqall);	 
		$allm=$allmony[0]['allmoney']; // exit($allm.'wtf');
		
		$tiao =$this->db->getall($sqis);		
		$extiao=$tiao[0]['tiao']; 
		   
		   
		   
		 if($allm!=0 && $extiao!=0 )
		 {
			  // file_put_contents("mytiao.txt",$rs['id'].' : '. $mtiao. ' vs '. $rs['money']."\r\n",FILE_APPEND); 
			 
			    $nrss[0]=0; 
			
			  if($ts=='收')
			    $dsmoney = '有调账，待'.$ts.'<font color=#ff6600>'. $allm .'</font>'; 
			  else
				$dsmoney = '<font color=#0480F3>有调账，待'.$ts.''. $allm .'</font>';  
			 
		 }
		
		
		
		
		
		if(isset($rs['xiaoid']) && $rs['xiaoid']>0){
			$xiaors = $this->goodmobj->getone("`id`='".$rs['xiaoid']."' and `status`<>5");
			if($xiaors){
				if($lx==1){
					$dsmoney.='，销售单：<a href="'.$this->getxiangurl('custxiao',$rs['xiaoid'],'auto').'">'.$xiaors['num'].'</a>';
				}else{
					$dsmoney.='，销售单:<br>'.$xiaors['num'].'';
				}
			}else{
				$this->update('`xiaoid`=0', $rs['id']);
			}
		}
		$rs['moneys']		= $dsmoney;
		$rs['htstatus']		= $htstatus;
		
		
		
		//获取发票名字  by andy.ma 
		$where 	= "id='".$rs['fpid']."'";
		$rows 	= m('feelv')->getrows($where, 'fpname');		
		$rs['fpid']=$rows[0]['fpname'];
	
		
		if(isset($rs['zongji']) && $rs['zongji']==1)
		 {
			//print_r($_POST);exit();
			
			$rs['signdt']="合计汇总";
			$rs['num']="合计:<br>".$rs['money'];
			$rs['content']="";
			$rs['startdt']="";
			$rs['enddt']="";
			$rs['type']="";
			$rs['isover']="";
			$rs['ispay']="";			 
			$rs['statetext']="";
			$rs['moneys']="";
			$rs['custname']="";
			$rs['money']="";
			$rs['money']="";
			
			// $rs['content']="已收:<br>".$rs['yishou'];
			
			
			// $rs['startdt']="回款率：<br>".$rs['lv']."%";
			// $rs['enddt']="未收:<br>".number_format($rs['weishou'],2);
			
			// $rs['type']="开票：<br>".$rs['kaipiao'];
			
			// $rs['isover']="";
			
			 
			
			// $rs['ispay']="";			 
			// $rs['statetext']="";
			// $rs['moneys']="";
			
			//  $rs['custname']="调账：<br>".$rs['dzjer'];
			
			// $rs['enddt'].="<script>
			// $('#htnum').html('".$rs['counts']."');
			// $('#htcnt').html('".$rs['money']."');		
			// $('#tiao').html('".$rs['dzjer']."');			
			// $('#yish').html('".$rs['yishou']."');
			// $('#hklv').html('".$rs['lv']."%');
			// $('#weish').html('".$rs['weishou']."');
			// $('#kai').html('".$rs['kaipiao']."');
			// $('#weikai').html('".$rs['weikai']."');			
			// </script>";
			
			
			// $rs['money']=" 未开:<br>".number_format($rs['weikai'],2);
		}
		
		
		//对 已收 id 列进行替换  by andy.ma 2019/12/26
		
		
// 		echo "<script>console.log('Debug Objects: " . $type . "' );</script>";
		 if($type==1)
		{
			$yssq="select IFNULL(sum(money),0) as yishou from xinhu_custfina where paytype=1 and type=1 and ispay=1  and htid='".$rs['id']."'";
			
			 //exit($yssq);

			
			$arrys= $this->db->getall($yssq); // print_r($arrys);exit;
			
			$yishou=$arrys[0]['yishou'];
			
// 			echo "<script>console.log('Debug Objects: " . $yishou . "' );</script>";
			 
			  
			$sqtiao="select ( select IFNULL(sum(money),0) as tiao from xinhu_custfinaa where  paytype=0 and type=1 and htid='".$rs['id']." ' ) - ( select  IFNULL(sum(money),0) as tiao from xinhu_custfinaa where  paytype=0 and type=1 and htid='".$rs['id']."') as tiao  "; 
			 $arrht=$this->db->getall($sqtiao);
			 
			$htiaoz= $arrht[0]['tiao'];
			 
			
			$weishou=$rs['money']+$htiaoz-$yishou;
			 	/* if($rs['id']==12)
				  exit($rs['money'].' mmm '.$yishou.' : '.$weishou); */
			 
			 
			  
			 
			$rs['yisid']= number_format($yishou,0).'/'.$weishou;

			 
			 
			 
			$rs['tiaoid'] = $htiaoz;
			 
			 
			 
			
			 
			 $sqkai="select IFNULL(sum(money),0) as kai  from xinhu_fininfom where num like '%".$rs['num']."%'";
			 
			 
			 $arrkai=$this->db->getall($sqkai);
			 
			 $htkai=$arrkai[0]['kai'];
			 
			 
			 
			 $weikai=$yishou-$htkai;
			 
			 $rs['kaipid'] =  number_format($htkai,0).'/'.$weikai;
			 
			 
			  if(isset($rs['zongji']) && $rs['zongji']==1)
			  {
				 $rs['tiaoid'] =""; 
				 $rs['yisid']="";
				 $rs['kaipid'] =""; 
				  
			  }
			 
			 
		}
		else{
			
			
			
		}
	   
		
		
		
		return $rs;
	}
	
	
	
	
	
	
	protected function flowbillwhere($uid, $lx)
	{
		
		$month	= $this->rock->post('dt');
		$where 	= '';
		if($month!=''){
			$where =" and `signdt` like '$month%'";
		}
	
		
		return array(
			'where' => $where,
			'order' => '`optdt` desc',
			//'orlikefields' => 'custname'
		);
	}
	
	protected function flowoptmenu($ors, $arrs)
	{
		//创建待收付款单
		if($ors['num']=='cjdaishou'){
			$moneys 		= m('crm')->getmoneys($this->rs['id']);
			$money			= $this->rs['money'] - $moneys;
			if($money > 0){
				$arr['htid'] 	= $this->rs['id'];
				$arr['htnum'] 	= $this->rs['num'];
				$arr['uid'] 	= $this->rs['uid'];
				$arr['custid'] 	= $this->rs['custid'];
				$arr['custname']= $this->rs['custname'];
				$arr['dt']		= $this->rock->date;
				$arr['optdt'] 	= $this->rock->now;
				$arr['createdt']= $this->rock->now;
				$arr['optname'] = $this->adminname;
				$arr['createname']= $this->adminname;
				$arr['createid']  = $this->adminid;
				//$arr['optid'] 	= $this->adminid;
				$arr['type'] 	= $this->rs['type'];
				$arr['explain'] = $arrs['sm'];
				$arr['money'] 	= $money;
				m('custfina')->insert($arr);
			}
		}
	}
	
	
	/**
	*	客户合同到期提醒
	*/
	public function custractdaoqi()
	{
		$dt 	= $this->rock->date;
		$rows 	= $this->getall("status=1 and `enddt` is not null and `enddt`>='$dt'",'uid,num,custname,enddt','`uid`');
		$txlist = m('option')->getval('crmtodo','0,3,7,15,30');//提醒的时间
		$txarr 	= explode(',', $txlist);
		$dtobj 	= c('date');
		$txrows = array();
		foreach($rows as $k=>$rs){
			$jg = $dtobj->datediff('d', $dt, $rs['enddt']);
			$uid= $rs['uid'];
			if(in_array($jg, $txarr)){
				$strs = ''.$jg.'天后('.$rs['enddt'].')';
				if($jg==1)$strs='明天';
				if($jg==0)$strs='今天';
				if(!isset($txrows[$uid]))$txrows[$uid]='';
				$txrows[$uid] .= '客户['.$rs['custname'].']的[合同:'.$rs['num'].']将在'.$strs.'到期;';
			}
		}
		foreach($txrows as $uid=>$cont){
			$this->push($uid, '客户,CRM', $cont, '客户合同到期提醒');
		}
	}
}