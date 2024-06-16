<?php 


//phpinfo();exit;


include_once('config/config.php');
$_uurl 		= $rock->get('rewriteurl');
$d 			= '';
$m 			= 'index';
$a 			= 'default';
if($_uurl != ''){
	unset($_GET['m']);unset($_GET['d']);unset($_GET['a']);
	$m		= $_uurl;
	$_uurla = explode('_', $_uurl);
	if(isset($_uurla[1])){$d = $_uurla[0];$m = $_uurla[1];}
	if(isset($_uurla[2])){$d = $_uurla[0];$m = $_uurla[1];$a = $_uurla[2];}
	$_uurla = explode('?',$_SERVER['REQUEST_URI']);
	if(isset($_uurla[1])){
		$_uurla = explode('&', $_uurla[1]);foreach($_uurla as $_uurlas){
			$_uurlasa = explode('=', $_uurlas);
			if(isset($_uurlasa[1]))$_GET[$_uurlasa[0]]=$_uurlasa[1];
		}
	}
}else{
	$m			= $rock->jm->gettoken('m', 'index');
	$d			= $rock->jm->gettoken('d');
	$a			= $rock->jm->gettoken('a', 'default');
}
$ajaxbool	= $rock->jm->gettoken('ajaxbool', 'false');
$mode		= $rock->get('m', $m);
if(!$config['install'] && $mode != 'install')$rock->location('?m=install');


// print_r($_SESSION);exit;  // xinhu_companyid



 $search=isset($_POST['search'])?$_POST['search']:"";

 $daochu=isset($_POST['daochu'])?$_POST['daochu']:""; //exit($daochu);




 function my_export($expTitle,$expCellName,$expTableData){
      $xlsTitle = iconv('utf-8', 'gb2312', $expTitle);//文件名称
      $fileName = $expTitle.date('_YmdHis');//or $xlsTitle 文件名称可根据自己情况设定
      $cellNum = count($expCellName);
      $dataNum = count($expTableData);

	  include_once(dirname(__FILE__).'/include/PHPExcel.php');      
      $objPHPExcel = new PHPExcel();
      $cellName = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT','AU','AV','AW','AX','AY','AZ');

      $objPHPExcel->getActiveSheet(0)->mergeCells('A1:'.$cellName[$cellNum-1].'1');//合并单元格
      $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A1', $expTitle.'  Export time:'.date('Y-m-d H:i:s'));
      for($i=0;$i<$cellNum;$i++){
          $objPHPExcel->setActiveSheetIndex(0)->setCellValue($cellName[$i].'2', $expCellName[$i][1]);
      }
      // Miscellaneous glyphs, UTF-8
      for($i=0;$i<$dataNum;$i++){
          for($j=0;$j<$cellNum;$j++){
              $objPHPExcel->getActiveSheet(0)->setCellValue($cellName[$j].($i+3), $expTableData[$i][$expCellName[$j][0]]);
          }
      }
      header('pragma:public');
      header('Content-type:application/vnd.ms-excel;charset=utf-8;name="'.$xlsTitle.'.xls"');
      header("Content-Disposition:attachment;filename=$fileName.xls");//attachment新窗口打印inline本窗口打印
      $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
      $objWriter->save('php://output');
      exit;
  }	


  

   function export()
   {
              $xlsName  = "用户列表";
              $xlsCell  = array(
                  array('name','姓名'),
                  array('age','年龄'),
        		 );
	   
              $lists = [
                      ['name' => '李白', 'age' => 10],
                      ['name' => '张三', 'age' => 20],
                      ['name' => '李四', 'age' => 30]
              ];
	   
        foreach ($lists as $key => $val) {
          $lists[$key]['name'] = $val['name'];
          $lists[$key]['age'] = $val['age'];
        }

        ob_clean();
        $rs = my_export($xlsName,$xlsCell,$lists);
	   
        return "export_OK";

    }







   
	 if(isset($daochu) && $daochu!=""){
		 
	 		 
		 
		 switch($daochu)
		 {
			 case 'one':
				 
		 	 $res=export();				 
				 
				 exit($res);
				 
			 break;
				 
				 
				 
			 default:	 
			  //exit('daochu');
				 
		 }

		 
		 
		 
	 
	 
	 
	 }
	 




 // by 马东杰 andy.ma 2019/11/19
 if(isset($search) && $search!="" ){
	 
	 
	  include(dirname(__FILE__) . "/config/conpass.php");
	  $con = mysql_connect($server,$dbuser,$dbpass);
	 mysql_query("set names utf8");
      mysql_select_db($db_base, $con);

	 
	 
	$key=isset($_POST['key'])?$_POST['key']:"";
	
	$start_day=isset($_POST['start_day'])?$_POST['start_day']:"";	

    $end_day=isset($_POST['end_day'])?$_POST['end_day']:"";
	 
	 
	// 2019-11-01 00:00:00
	 
	$dat_arr_start=explode(" ",$start_day);	 
	$start_day=$dat_arr_start[0]; 
	 
	
	$dat_arr_end=explode(" ",$end_day);	 
	$end_day=$dat_arr_end[0];  
	 
	 
	
    $page=isset($_POST['page'])?$_POST['page']:1;
	 
	$pagesize=20;
      
	$start=($page-1) * $pagesize;
	 	 
	 
	 
	 
	 
	 
	// =============================================================================================================== 
	// 搜索 switch ====================================================================================================
	 switch($search)
	 {
			 
		 case 'one':
			 
		 $cond="";
			 
			 
	 
	 
			 
			 
		 if(isset($start_day) && $start_day!="" && $end_day==""  )
		 {	
			$cond.=" and date_format(c.signdt,'%Y') ='$start_day' ";
		 }
		else{
			 
			 
			$cond.=" and date_format(c.signdt,'%Y') ='".date("Y",time())."' "; 
		 }
			 	 
	 	 
			 
			 
		 $sql="  
 select sum(htmoney) as htmoney,  sum(tiao) as tiao, sum(htiao) as htiao, sum(yishou) as yishou , sum(daishou) as daishou ,   mon from (

select  IFNULL(sum(c.money),0) as htmoney ,  

date_format(c.signdt,'%m') as mon   ,

( select IFNULL(sum(money),0)  from xinhu_custfinaa where paytype=0 and type=0  and htid=c.id   )

- ( select IFNULL(sum(money),0)  from xinhu_custfinaa where paytype=0 and type=1   and htid=c.id     )

as tiao  ,

 IFNULL(sum(c.money),0) +  ( select IFNULL(sum(money),0)  from xinhu_custfinaa where type=0  and htid=c.id   )

- ( select IFNULL(sum(money),0)  from xinhu_custfinaa where type=1   and htid=c.id     )
 as htiao,
 
 (select IFNULL(sum(money),0) from xinhu_custfina where  type=0 and  ispay=1       and htid=c.id   ) as yishou ,
 
 
  IFNULL(sum(c.money),0) +  ( select IFNULL(sum(money),0)  from xinhu_custfinaa where type=0  and htid=c.id   )

- ( select IFNULL(sum(money),0)  from xinhu_custfinaa where type=1   and htid=c.id     ) -  (select IFNULL(sum(money),0) from xinhu_custfina where  type=0 and  ispay=1       and htid=c.id   )  as daishou 
 

from xinhu_custract c  where 1=1 $cond   and  c.type=0  and  c.comid='". $_SESSION['xinhu_companyid']."' GROUP BY  id 

) ";   
			 
	    $sql.=" as a GROUP BY a.mon  ";     //exit($sql);
			 
			 
			 
		$tosql="select count(*) from  xinhu_custract  c   where  c.comid='". $_SESSION['xinhu_companyid']."'  ";
			 
		
		break;
			 
			 
			 
		 case "two":
			 
	  $sql=" 
	  
	  select c.num , c.custname, IFNULL(c.money,0) as htmoney , 

 (select IFNULL(sum(money),0) from xinhu_custfina where ispay=1 and type=0 and htid=c.id)  as yishou,


c.signdt as dayt ,c.content as beizhu , 
 
 IFNULL(c.money,0) +
 ( select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=0 and htid=c.id )
 - ( select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=1 and htid=c.id ) 
 -
 (select ifnull(sum(money),0) from xinhu_custfina where htid=c.id and type='0' and ispay=1 )
 as daishou 
 
 from xinhu_custract c 
 
 where 1=1   and     c.comid='". $_SESSION['xinhu_companyid']."' "; 
	 
			 
	$tosql=" select  count( DISTINCT c.id)  from  xinhu_custract c left join xinhu_custfina s on c.id=s.htid 
 
 where 1=1 and s.type='0' and s.ispay=1 and   c.comid='". $_SESSION['xinhu_companyid']."'";   //  exit($tosql);
			 
		
			  
	  if(isset($key) && $key!="" )
		 {	
			$sql.=" and c.custname like '%$key%' ";
		    $tosql.=" and c.custname like '%$key%' ";
		 }


	  if(isset($start_day) && $start_day!="" && $end_day==""  )
		 {	
			$sql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' ";
		     $tosql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' ";
		 }
			 
		
			 
		if( $start_day!="" && $end_day!=""  )
		 {	
			 $sql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")<='".$end_day."'";
		     $tosql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")<='".$end_day."'";
		 }	 
		 
			 
		$sql.=" order by c.signdt desc ,c.id desc";
			 
		 
			 
	   break;
			 
			 
			 
			 
		case  'three':		 
			 
			 
		$sql="select c.id, c.num ,	u.name as custname, c.signdt as dayt ,IFNULL(c.money,0) as htmoney , c.optname as agent,
 
 ( select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=0 and htid=c.id) - ( select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=1 and htid=c.id) as dzjer , 
 
 IFNULL(( select ifnull(money,0) from xinhu_custfina where paytype=2 and ispay=1 and type=1 and htid=c.id),0) as wai ,
 
 ( select IFNULL(sum(money),0) from xinhu_custfee where htid=c.id ) as cost ,
 
 ( select IFNULL(sum(money),0) from xinhu_custfina where paytype=0 and type=0 and ispay=1 and htid=c.id ) as yis,
 
 (case when ( select count(id) from xinhu_fininfom where num in (c.num)  )>0 then 
 
 convert(
 
( select  sum(ifnull(f.money,0) * ifnull(v.felv,0))  as fapiao from xinhu_fininfom f left join xinhu_feelv v on f.paytype=v.id

where f.num in (c.num) )
 
 ,decimal(12,2)
 
 
 ) 
 
 else 
 0 
 end ) as shui,
 
 IFNULL(c.money,0) +
 ( select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=0 and htid=c.id) - ( select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=1 and htid=c.id)-
 ( select IFNULL(sum(money),0) from xinhu_custfina where type=0 and ispay=1 and paytype=0 and htid=c.id ) as ying,
 
 
 IFNULL(c.money,0) +
 
 ((select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=0 and htid=c.id) - ( select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=1 and htid=c.id) )
 -
 ( select IFNULL(sum(money),0) from xinhu_custfina where paytype=2 and ispay=1 and type=1 and htid=c.id) 
 -
 ( select IFNULL(sum(money),0) from xinhu_custfee where htid=c.id )
 
 - (case when (select count(id) from xinhu_fininfom where num in (c.num) )>0 then 
 
( select  sum(ifnull(f.money,0) * ifnull(v.felv,0))  as fapiao from xinhu_fininfom f left join xinhu_feelv v on f.paytype=v.id

where f.num in (c.num) )
 
 else 
 0 
 end ) 
 
 as maoli ,
 
 (select felv from xinhu_feelv where id=(select fpid from xinhu_custract where id=c.id) ) as shuilv,
 
 
 format( (( 
 
 ( IFNULL(c.money,0) +
 
 (select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=0 and htid=c.id) - ( select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=1 and htid=c.id) 
 -
 ( select IFNULL(sum(money),0) from xinhu_custfina where paytype=2 and ispay=1 and type=1 and htid=c.id) 
 -
 ( select IFNULL(sum(money),0) from xinhu_custfee where htid=c.id )
 
 - 
 (case when ( select count(id) from xinhu_fininfom where num in (c.num) )>0 then 
 
 convert( 
 
( select  sum(ifnull(f.money,0) * ifnull(v.felv,0))  as fapiao from xinhu_fininfom f left join xinhu_feelv v on f.paytype=v.id

where f.num in (c.num) )
 
 ,decimal(12,2))
 
 else 0
 
 end)
 
 ) 
 
 / ( IFNULL(c.money,0) +
 (select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=0 and htid=c.id) - ( select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=1 and htid=c.id) 
 )
 
 ) * 100 ),2) 
 
 as maolilv ,
 
 
 
 ( IFNULL(c.money,0) +
 (select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=0 and htid=c.id) - ( select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=1 and htid=c.id) 
 )
 
 as htongdzj
 
 
 from xinhu_custract c left join xinhu_customer u on c.custid=u.id where c.type=0 and    c.comid='". $_SESSION['xinhu_companyid']."'  ";	 
			 
		
			 
		$tosql=" select  count(c.id) as nums from  xinhu_custract  c  left join xinhu_customer u on c.uid=u.id  where c.comid='". $_SESSION['xinhu_companyid']."'";	
			 
			 
		if(isset($key) && $key!="" )
		 {	
			$sql.=" and c.custname like '%$key%' ";
		    $tosql.=" and c.custname like '%$key%' ";
		 }


	  if(isset($start_day) && $start_day!="" && $end_day==""  )
		 {	
			$sql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")>='$start_day' ";
		     $tosql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' ";
		 }	 
			 
		 if( $start_day!="" && $end_day!=""  )
		 {	
			$sql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")<='$end_day' ";
		     $tosql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") <='$end_day' ";
		 }	 
		 //file_put_contents("sql.txt",$sql);	 
		
	     
	  
			 
	    break;
			 
			 
			 
		 case "four":   
			 
		 /* 
		 利润    "s0"
		 利润率  "s1"
		 
		 收入小计 "s2"
		 支出小计 "s3"
		 
		 营业额   "s4"
		 其他收入 "s5"
		 
		 调账:    "s6"
		 采购支出: "s7"
		 外协支出: "s8"
		 
		 采购调账: "s9"
		 外协调账: "s10"
		 
		 合同费用: "s11"
		 公司常用支出 "s12" 
		 
		 税费      "s13"
		 
		 
   $lrun.'$'.$feelv.'$'.$srxj.'$'.$zcxj.'$'.$htjer.'$'.$qtsr.'$'.$dzje.'$'.$ckzc.'$'.$wxzc.'$'.$cgtz.'$'.$wxtz.'$'. $qtzc .'$'.$baoxiao  
		 
		*/ 
			 
		 
$whe="";		
 
 // 营业额
  $sql=" select  IFNULL(sum(c.money),0) as htjer

from xinhu_custract c left join (select distinct htid ,type from xinhu_custfina where type=0 and comid='". $_SESSION['xinhu_companyid']."') a 

on c.id=a.htid where c.type=0 and c.comid='". $_SESSION['xinhu_companyid']."' and a.type=0 ";  

 		 
			 
 $sqqt="select id from xinhu_custract c where 1=1 and c.comid='". $_SESSION['xinhu_companyid']."' ";
			 
  $sqnum="select num from xinhu_custract c where 1=1 and c.comid='". $_SESSION['xinhu_companyid']."' ";				 
			 
  $tosql="select count(id) from xinhu_custract c where 1=1 and c.comid='". $_SESSION['xinhu_companyid']."' ";			 
 $htjer=0;
			 
      if(isset($start_day) && $start_day!="" && $end_day==""  )
		 {	
			$sql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' ";
			 $sqqt.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' ";
		     $sqnum.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' ";
		     $tosql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' ";
		 }	
			 
		  if( $start_day!="" && $end_day!=""  )
		 {	
			$sql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")<='$end_day' ";
			  $sqqt.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")<='$end_day' ";
			 $sqnum.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")<='$end_day' "; 
		     $tosql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") <='$end_day' ";
		 }	 			 
			  
	 
    $res=mysql_query($sql);  //print_r($res); //exit("wtf");

			 
	while($arr=mysql_fetch_array($res))
	{
		//print_r($arr);
	  $htjer+=$arr['htjer'];
	}
			 
			 
   // 合同费用  "s11"

	$sql="select IFNULL(sum(money),0) from  xinhu_custfee c where  1=1 and htid in ($sqqt) ";  //exit($sql);

	$res=mysql_query($sql);
	if($res)
	  $arr=mysql_fetch_array($res);

	$qtzc=$arr[0];

			
			 
			 
  //调账条件
	if(isset($start_day) && $start_day!="" && $end_day==""  )
		 {	
			$whe=" and DATE_FORMAT(c.paydt,\"%Y-%m-%d\") >='$start_day' ";
		     
		 }
			 
		 if( $start_day!="" && $end_day!=""  )
		 {	
			$whe=" and DATE_FORMAT(c.paydt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.paydt,\"%Y-%m-%d\")<='$end_day' ";
		     
		 }				 
			 
			 
// 调账:

$sql="select 
(select   IFNULL(sum(money),0)  from xinhu_custfinaa c  where 1=1 $whe and type=0 and paytype=0 and comid='". $_SESSION['xinhu_companyid']."'  )
- 
( select   IFNULL(sum(money),0)  from xinhu_custfinaa c  where 1=1 $whe and type=1 and paytype=0  and   comid='". $_SESSION['xinhu_companyid']."'  )  as dzje"; //exit($sql);
			 
 
			 
$res=mysql_query($sql);
if($res)
$arr=mysql_fetch_array($res);
$dzje=$arr[0];

 // 其他收入

 $sql="select IFNULL(sum(money),0) as qtsr  from xinhu_custfina c  where 1=1 $whe and  paytype=3 and ispay=1  and type=0 and   comid='". $_SESSION['xinhu_companyid']."' "; //exit($sql);	 
  
 $res=mysql_query($sql);
if($res)
 $arr=mysql_fetch_array($res);	
 $qtsr=$arr[0];	


 //采购支出
 $sql="select IFNULL(sum(money),0) from  xinhu_custfina c where 1=1 $whe and  type=1 and ispay=1 and paytype=1 and  comid='". $_SESSION['xinhu_companyid']."' "; 
			 
 $res=mysql_query($sql);
if($res) 
 $arr=mysql_fetch_array($res);
 $ckzc=$arr[0];
	 
	 
 // 外协支出
 $sql="select IFNULL(sum(money),0) from  xinhu_custfina c where 1=1 $whe and  type=1 and ispay=1 and paytype=2 and  comid='". $_SESSION['xinhu_companyid']."' ";  

	 
$res=mysql_query($sql);
if($res) 
 $arr=mysql_fetch_array($res);
 $wxzc=$arr[0];

 


 // 采购调账:0.00

$sql="select ( (select IFNULL(sum(money),0) from  xinhu_custfinaa c where 1=1 $whe and  paytype=1 and type=0 and  comid='". $_SESSION['xinhu_companyid']."'  ) - (select IFNULL(sum(money),0) from  xinhu_custfinaa c where 1=1 $whe and  paytype=1 and type=1 and  comid='". $_SESSION['xinhu_companyid']."'  )  )  as  cgtz";
			 

 $res=mysql_query($sql);
if($res)
 $arr=mysql_fetch_array($res);
$cgtz=$arr[0];



// 外协调账:0.00

$sql="select ( (select IFNULL(sum(money),0) from  xinhu_custfinaa c where 1=1 $whe and paytype=2 and type=0 and  comid='". $_SESSION['xinhu_companyid']."'  ) - (select IFNULL(sum(money),0) from  xinhu_custfinaa c where 1=1 $whe and paytype=2 and type=1 and  comid='". $_SESSION['xinhu_companyid']."'  )  )  as  wxtz";

//exit($sql);			 
			 
$res=mysql_query($sql);
if($res)
$arr=mysql_fetch_array($res);
$wxtz=$arr[0];



 

//公司报销费用：
$whebao="";	
			 
if(isset($start_day) && $start_day!="" && $end_day==""  )
		 {	
			$whebao=" and DATE_FORMAT(optdt,\"%Y-%m-%d\") >='$start_day' ";
		     
		 }
			 
		 if( $start_day!="" && $end_day!=""  )
		 {	
			$whebao=" and DATE_FORMAT(optdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(optdt,\"%Y-%m-%d\")<='$end_day' ";
		     
		 }				 

$sql="select ifnull(sum(money),0) as baoxiao from xinhu_fininfom where 1=1 $whebao  and comid='".$_SESSION['xinhu_companyid']."' and type in (0,1)";

			 
//exit($sql);
$res=mysql_query($sql);
$arr=mysql_fetch_array($res);
$baoxiao=$arr[0];


// 收入小计= 合同金额 + 调账金额 + 其他收入
// $srxj =$htjer+$dzje+$qtsr;

// 2020年05月30日14:16:37
// 收入小计= 合同金额 + 其他收入
$srxj =$htjer+$qtsr;
$srxj =1000;

// echo ($htjer.' '.$dzje.' '.$qtsr);exit('wtf');
 
	 
			 
$shsq="select f.money* v.felv as shui from xinhu_fininfom f left join xinhu_feelv v on f.paytype=v.id where  inorout=0  and f.type=5  and f.comid='".$_SESSION['xinhu_companyid']."' and f.num in";
			 
$shsq.="($sqnum)";

$shui=0;			 
$ress=mysql_query($shsq);
			 
while($rowsh=mysql_fetch_array($ress))
{
   $shui+=$rowsh['shui']; 	
	 
	
}

// 支出小计= 合同费用 + 税费 + 采购支出  +  外协支出  +公司日常
$zcxj =$qtzc+ $shui + $ckzc+ $wxzc  +$baoxiao;



$lrun=$srxj-$zcxj;

 //print_r($res);exit;
if($srxj!=0)
$feelv=$lrun/$srxj;
else
$feelv=0;
 

$feelv=number_format($feelv*100,2);
			 
$feelv.="%";			 
			 
		 
			 
		 break;
			 
		 
		
			 
		 case "five":
			 // 0待,1已完成,2部分
		  
$sql=" select DISTINCT c.num as htbh,   c.signdt  as qdrq , 	c.custname as khmc,  c.money as htje , c.manager as agent,
(select  IFNULL(sum(money),0) from  xinhu_custfina where ispay=1 and  type=0 and htid=c.id) as back ,  
c.money + ((select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=0 and htid=c.id ) - 
 ( select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=1 and htid=c.id ) ) - (select  IFNULL(sum(money),0) from  xinhu_custfina where ispay=1 and  type=0 and htid=c.id) as ysje ,
(select   IFNULL(sum(money),0)  from xinhu_custfinaa  where paytype=0 and type=0  and htid=c.id ) - 
( select   IFNULL(sum(money),0)  from xinhu_custfinaa  where paytype=0 and type=1 and htid=c.id  )  as tzje
from  xinhu_custract  c left join xinhu_custfina s on c.id=s.htid
 where  c.type=0 and c.comid='". $_SESSION['xinhu_companyid']."'  and  c.ispay in (0,2) and ((c.managerid in(select id from xinhu_admin where instr(deptpath,'". $_SESSION['xinhu_deptid']."')>0  and deptid!='". $_SESSION['xinhu_deptid']."')) or c.managerid='". $_SESSION['xinhu_adminid']."')";
			 
	 // exit($sql); 
			 	 

	$tosql="select  count(c.id) from  xinhu_custract  c  where  c.type=0 and c.comid='". $_SESSION['xinhu_companyid']."'  and  c.ispay in (0,2) and ((c.managerid in(select id from xinhu_admin where instr(deptpath,'". $_SESSION['xinhu_deptid']."')>0  and deptid!='". $_SESSION['xinhu_deptid']."')) or c.managerid='". $_SESSION['xinhu_adminid']."')";
			 
			if(isset($key) && $key!="" )
			 {	
				$sql.=" and c.custname like '%$key%' ";
				$tosql.=" and c.custname like '%$key%' ";
			 }


		  if(isset($start_day) && $start_day!="" && $end_day==""  )
			 {	
				$sql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' ";
				 $tosql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' ";
			 } 
			 
			  if( $start_day!="" && $end_day!=""  )
		 {	
			$sql.=" and  DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")<='$end_day' ";
		     $tosql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") <='$end_day' ";
		 }	 
			 
			 
		// exit($sql);
			 
			 
		 break;
			 
			 
			 
		 case "six":
			 
	 $sql=" select c.paydt as hkday, c.htnum as htbh,  c.custname as khnam , money as hkmny, optname as agent  
			from  xinhu_custfina c  where c.ispay=1 and c.type=0 and  c.paytype=0 and c.comid='". $_SESSION['xinhu_companyid']."' and ((c.optnameid in(select id from xinhu_admin where instr(deptpath,'". $_SESSION['xinhu_deptid']."')>0  and deptid!='". $_SESSION['xinhu_deptid']."')) or c.optnameid='". $_SESSION['xinhu_adminid']."')";
			 
			 
	 $tosql=" select count(c.id) from  xinhu_custfina c  where c.ispay=1 and c.type=0 and  c.paytype=0 and c.comid='". $_SESSION['xinhu_companyid']."' and ((c.optnameid in(select id from xinhu_admin where instr(deptpath,'". $_SESSION['xinhu_deptid']."')>0  and deptid!='". $_SESSION['xinhu_deptid']."')) or c.optnameid='". $_SESSION['xinhu_adminid']."')";	 
		 
			 
			 if(isset($key) && $key!="" )
			 {	
				$sql.=" and c.custname like '%$key%' ";
				$tosql.=" and c.custname like '%$key%' ";
			 }


		  if( $start_day!="" && $end_day==""  )
			 {	
				$sql.=" and DATE_FORMAT(c.paydt,\"%Y-%m-%d\") >='$start_day' ";
				 $tosql.=" and DATE_FORMAT(c.paydt,\"%Y-%m-%d\") >='$start_day' ";
			 }
			 
			 
	  if( $start_day!="" && $end_day!=""  )
		 {	
			$sql.=" and DATE_FORMAT(c.paydt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.paydt,\"%Y-%m-%d\")<='$end_day' ";
		     $tosql.=" and DATE_FORMAT(c.paydt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.paydt,\"%Y-%m-%d\")<='$end_day' ";
		 }	 
			 
			//exit($sql);
			 
		 break;	 
			 
			 
			 
		 case 'seven':
			 
 $sql="  		 
  select c.num ,c.signdt, c.custname, c.money, c.optname, c.explain , 
 ( 
 
 (select IFNULL(sum(money),0) from xinhu_custfinaa where htid=c.id and type=0) - 
 (select IFNULL(sum(money),0) from xinhu_custfinaa where htid=c.id and type=1))as tiao , 
 
 ( select IFNULL(sum(money),0) from xinhu_custfina where type=1 and htid=c.id and ispay=1 ) as yifu, 
 
 c.money + ( 
 (select IFNULL(sum(money),0) from xinhu_custfinaa where htid=c.id and type=0) - 
 (select IFNULL(sum(money),0) from xinhu_custfinaa where htid=c.id and type=1)
 )
 - 
 ( select IFNULL(sum(money),0) from xinhu_custfina where type=1 and htid=c.id and ispay=1  ) as qiank 
 
 from xinhu_custract c where 1=1 and c.comid='".$_SESSION['xinhu_companyid']."' and c.ispay in (0,2) and c.type=1 ";	 
	 
			// exit($sql);
			 
		$tosql="select count(id) from xinhu_custract c where c.type=1  and  c.comid='". $_SESSION['xinhu_companyid']."' and  c.ispay in (0,2)  "; 
			 			 
		  if(isset($key) && $key!="" )
			 {	
				$sql.=" and c.custname like '%$key%' ";
				$tosql.=" and c.custname like '%$key%' ";
			 }

		 
		 if(isset($start_day) && $start_day!="" && $end_day==""  )
		 {	
			$sql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' ";
		     $tosql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' ";
		 }
			 
		
			 
		if( $start_day!="" && $end_day!=""  )
		 {	
			 $sql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")<='".$end_day."'";
		     $tosql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")<='".$end_day."'";
		 }	 
			 
			 
			 
		break;	
	 
		 
	 }
	
	// ==================================================================================================================== 
	// 搜索 switch  END ====================================================================================================
	
	 
	 
	
	/* 分页列表   by andy.ma 马东杰  2019/11/21 */
	$res_to=mysql_query($tosql);    // exit($tosql);
	$row=mysql_fetch_array($res_to);  
	$count=$row[0]; 
	 
	$to_pages=ceil($count/$pagesize);  // 总页数
	 
	
	  switch($search)
	 {
		  case "two" :
			  
			 $hthj=0; // 合同总额 
			 
			 $yshj=0; // 已收合计 
			  
			 $dshj=0; // 待收合计
			  
			 $count=0; //合同总数
			  
			  
			 $res=mysql_query($sql); 
			 
			  while($row=mysql_fetch_array($res))
			  {	

				  $hthj+=$row['htmoney'];
				  $yshj+=$row['yishou'];
				  $dshj+=$row['daishou'];				  
				  
				  $count++;
			   } 
			  	
			
			  
			  
			  //  $str_all.="$".$hthj."$".$yshj."$".$dshj."$".$count;
			  
			  
		  break;
			  
		  
		  	case "seven":
			  
			  $fkhj=0;	 
			  $res=mysql_query($sql); 
			 
			  while($row=mysql_fetch_array($res))
			  {	

				  $fkhj+=($row['money']+$row['tiao'])-$row['yifu'];
				  
			   }	
			 
			  
			break;
			  
			  
	 }
	 
	 
	 
	 

    $sql.=" limit ".$start .",$pagesize "; //分页SQL实现
    //  exit($sql);
	$res=mysql_query($sql); 
	
	 
	 
	 
	 $str_all="";// 列表内容	 
	 $pstr='$<ul class="pagination">'; // 分页列表
	 
	 
	 
	if($page<=1){
		// echo "<a href='".$_SERVER['PHP_SELF']."?p=1'>上一页</a>";
	  $pstr.="<li class=\"prev disabled\"><span>«</span></li>";
    }else{
    //	echo "<a href='".$_SERVER['PHP_SELF']."?p=".($page-1)."'>上一页</a>";		
	  $pstr.="<li class=\"prev\"><span onclick=\"searchbtn(".($page-1).")\"><a href='javascript:void(0)'>«</a></span></li>";	
	}
	 
	 
	if ($page<$to_pages){
	//	echo "<a href='".$_SERVER['PHP_SELF']."?p=".($page+1)."'>下一页</a>";
       $pstr.="<li class=\"next\"><span onclick=\"searchbtn(".($page+1).")\"><a href='javascript:void(0)'>»</a></span></li>";	
		
	}else{
	 //	echo "<a href='".$_SERVER['PHP_SELF']."?p=".($to_pages)."'>下一页</a>";
	   $pstr.="<li class=\"next disabled\"><span>»</span></li>";	
	  	
	}

	 $pstr.="</ul>";
	 
	 
	 
	 
	 
	 
	 
	   	   
	 switch($search)
	 {
			 
			 case "one":

			   $pstr="";

			  $htmnyall=0;	
			  $tiao=0;
			  $htiao=0;
			  $yishou=0;
			  $daishou=0;

			 
			 
             $now=date("m",time());

          
		
				for($i=1;$i<=12;$i++)	
				 {
					 $arr[$i]['mon']=$i;
					 $arr[$i]['htmoney']=0;
					 $arr[$i]['tiao']=0;
					 $arr[$i]['htiao']=0;
					 $arr[$i]['yishou']=0;
					 $arr[$i]['daishou']=0;

				 }

				 
				  while($row=mysql_fetch_array($res)){

					  for($k=1;$k<=count($arr);$k++)
					  {
						  if($row['mon']==$k)
						  {
							 $arr[$k]['htmoney']=$row['htmoney'];
							 $arr[$k]['tiao']=$row['tiao'];
							 $arr[$k]['htiao']=$row['htiao'];
							 $arr[$k]['yishou']=$row['yishou'];
							 $arr[$k]['daishou']=$row['daishou'];

						  }

					  }

					  $htmnyall+=$row['htmoney'];
					  $tiao+=$row['tiao'];
					  $htiao+=$row['htiao'];
					  $yishou+=$row['yishou'];
					  $daishou+=$row['daishou'];
				  }	
				
				
				foreach($arr as $ky=>$row)
				{
					
					$str="<tr>";

					$str.="<td ><p>".$row['mon']."</p></td>";		 
					$str.="<td ><p>".$row['htmoney']."</p></td>";   
					$str.="<td ><p>".$row['tiao']."</p></td>"; 
					$str.="<td ><p>".$row['htiao']."</p></td>"; 
					$str.="<td ><p>".$row['yishou']."</p></td>";
					$str.="<td ><p>".$row['daishou']."</p></td>";

					$str.="</tr>";
					
					
					$str_all.=$str;	 	
				}  
				
			
			 
			 $htmnyall=number_format($htmnyall,2);
			 $tiao=number_format($tiao,2);
			 $htiao=number_format($htiao,2);
			 $yishou=number_format($yishou,2);
			 $daishou=number_format($daishou,2);
			 
			 			 
			$str_all.='$'.$htmnyall.'$'.$tiao .'$'. $htiao .'$'. $yishou .'$'. $daishou;
			//file_put_contents("str_all.txt",$str_all);
		 
	     break;
			 
		 case "two":  

			 /*
			 
		 // 营业额合计	 
		 $sqlc=" select  IFNULL(sum(c.money),0) as htmoney

from xinhu_custract c left join (select distinct htid ,type from xinhu_custfina where type=0 and comid='".$_SESSION['xinhu_companyid']."') a 

on c.id=a.htid where c.type=0 and c.comid='".$_SESSION['xinhu_companyid']."' and a.type=0 "; 
		 	 
			 //file_put_contents("sqlc.txt",$sqlc);
			 
		  // 已收
	     $sqlys="select ifnull(sum(s.money),0) from xinhu_custfina s where   s.type='0' and s.ispay='1' and  s.comid='".$_SESSION['xinhu_companyid']."'";	 
			 			 
			 
		 	 
		 // 合同数量合计	 $count
			 
			  $wht="";
			 
			if(isset($key) && $key!="" )
			 {	
				$sqlc.=" and c.custname  like '%$key%'  ";	
				$sqlys.=" and s.custname like '%$key%' ";	
				$wht= " and c.custname  like '%$key%' ";
				
				
			 }

			

		   if(isset($start_day) && $start_day!="" && $end_day==""  )
			 {	
				$sqlc.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' ";	
			    $sqlys.=" and DATE_FORMAT(s.paydt,\"%Y-%m-%d\") >='$start_day' ";
			    $wht="and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day'";
			   
			 }	 
			 
			 
			  if(isset($start_day) && $start_day!="" && isset($end_day) && $end_day!=""  )
			 {	
				$sqlc.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")<='$end_day' ";	
			    $sqlys.=" and DATE_FORMAT(s.paydt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(s.paydt,\"%Y-%m-%d\")<='$end_day' ";
			    $wht=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")<='$end_day' ";	
			 }	 	 
			 
		 	//exit($sqlys);
			 
			 
	     //调账
			 
			
		 $sqtiao=" select 
		 ( select ifnull(sum(t.money),0) as tadd from xinhu_custract c left join xinhu_custfinaa t on c.id=t.htid where 1=1 $wht and paytype=0 and c.type='0' and c.comid='".$_SESSION['xinhu_companyid']."' and t.type=0)
		 - 
		 (select  ifnull(sum(t.money),0) as tdre from xinhu_custract c left join xinhu_custfinaa t on c.id=t.htid where 1=1 $wht and paytype=0 and c.type='0' and c.comid='".$_SESSION['xinhu_companyid']."' and t.type=1) as tiao";
			 
			 
			// exit($sqtiao);
		
		  
			 
		
			 
			 
			 //exit($sqlc);
			
			 
			 // 本期营业额合计 
		  	 $resc=mysql_query($sqlc);	//exit($sqlc);		 
			 $count_arr=mysql_fetch_array($resc);			 
			 $hthj=$count_arr[0];	
			 
			 //调账金额
			 $rest=mysql_query($sqtiao);	// exit($sqtiao);
			 $count_arr=mysql_fetch_array($rest);			 
			 $htdzj=$count_arr[0];	
			 
			 $hthj=$hthj+$htdzj;
			 
			 //exit($sqlys);
			 //已收合计
			 $resc=mysql_query($sqlys);			 
			 $count_arr=mysql_fetch_array($resc);
			 $yshj=$count_arr[0];
			 
			 //应收合计
			 
			// echo $yshj . ' '. $hthj; exit("wtf");
			 
			 $dshj=$hthj-$yshj;
			 
			 // 成本= 外协+成本+税费 			 
			 // 合同金额+调账-(成本) / (合同金额+调账)
			 
			 */
		 	 	   
			 
	 
		  while($row=mysql_fetch_array($res))
			{
				$str="<tr>";
				$str.="<td style='width:12%'>".$row['dayt']."</td>";

				$str.="<td style='width:12%'>".$row['num']."</td>";
				$str.="<td style='width:12%'>".$row['custname']."</td>";
				$str.="<td style='width:12%'>".$row['htmoney']."</td>";
				$str.="<td style='width:12%'>".$row['yishou']."</td>";
				$str.="<td style='width:12%'>".$row['daishou']."</td>";
				$str.="<td style='width:12%'>".$row['beizhu']."</td>";

				$str.="</tr>";

				$str_all.=$str;	
			}
	   
			 $str_all.="$".$hthj."$".$yshj."$".$dshj."$".$count;
			 
	      break;
			 
			 
		 case "three":
			 
		
	   while($row=mysql_fetch_array($res))
		{
			 
		$str="<tr>";
		$str.="<td width=\"10%\" valign=\"middle\"><p>".$row['custname']."</p></td>";
		$str.="<td width=\"10%\" valign=\"middle\"><p>".$row['dayt']."</p></td>";
		$str.="<td  valign=\"middle\"><p>".$row['num']."</p></td>";
		$str.="<td  valign=\"middle\"><p>".$row['htmoney']."</p></td>";

		$str.="<td width=\"5%\"  valign=\"middle\"><p>".$row['dzjer']."</p></td>";
		$str.="<td width=\"5%\"  valign=\"middle\"><p>".$row['wai']."</p></td>";
		$str.="<td width=\"5%\"  valign=\"middle\"><p>".$row['cost']."</p></td>";
		   
	
		   
		   
		$str.="<td width=\"5%\"  valign=\"middle\"><p>".$row['shui']."</p></td>";
		   
		$url="webmain/flow/page/rock_page_htdt.php?cid=".$row['id'];
		   
		$str.="<td  valign=\"middle\"><p><a href='#' onclick=\"javascript:window.open('$url','','width=721,height=800')\"  >".number_format($row['maoli'],2)."</a></p></td>";

		$str.="<td  valign=\"middle\"><p>".$row['maolilv']."%</p></td>";
		$str.="<td  valign=\"middle\"><p>".$row['yis']."</p></td>";
		$str.="<td  valign=\"middle\"><p>".$row['ying']."</p></td>";
		$str.="<td width=\"8%\"  valign=\"middle\"><p>".$row['agent']."</p></td>";
		$str.="</tr>";
		   
		   $str_all.=$str;	
	   
	    }
		 
	   
	     break;
			 
			 
		 case "four":
			
			// $str_all.=$lrun.'$'.$feelv.'$'.$srxj.'$'.$zcxj.'$'.$htjer.'$'.$qtsr.'$'.$dzje.'$'.$ckzc.'$'.$wxzc.'$'.$cgtz.'$'.$wxtz.'$'.$qtzc; 
			 
   $str_all.=$lrun.'$'.$feelv.'$'.$srxj.'$'.$zcxj.'$'.$htjer.'$'.$qtsr.'$'.$dzje.'$'.$ckzc.'$'.$wxzc.'$'.$cgtz.'$'.$wxtz.'$'. $qtzc .'$'.$baoxiao.'$'.$shui;
			
			file_put_contents("str_all.txt",$str_all); 
		
		
		 break;
			 
			 
		 case "five":
			 
	
		$sqlc="  select  IFNULL(sum(money),0)   as htjer   from xinhu_custract c where  c.type=0    and  c.ispay in (0,2) and c.comid='".$_SESSION['xinhu_companyid']."'  ";
			
		 
			 
			  
			if(isset($key) && $key!="" )
			 {	
				$sqlc.=" and c.custname  like '%$key%'  ";	
			 
				 
			 }

			 

		   if(isset($start_day) && $start_day!="" && $end_day==""  )
			 {	
				$sqlc.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' ";	
			   
			   
			 }	 
			 
			 
			  if(isset($start_day) && $start_day!="" && isset($end_day) && $end_day!=""  )
			 {	
				$sqlc.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")<='$end_day' ";	
			    	
			    
			 }	 
			
			 
		 
			 
			// exit($sqyto);
		 
			 
		  $qkhj=0;	
			 
		 
			 
	   while($row=mysql_fetch_array($res))
	   {
		
		   
		   $str="<tr>";    
		   $str.="<td>".$row['htbh']."</td>";
		   $str.="<td>".$row['qdrq']."</td>";
		   $str.="<td>".$row['khmc']."</td>";
		   $str.="<td>".$row['htje']."</td>";
		   $str.="<td>".$row['back']."</td>";

		   $str.="<td>".$row['tzje']."</td>";		
		   $str.="<td>".$row['agent']."</td>";
		   $str.="<td>".$row['ysje']."</td>";

 		   $str.="</tr>"; 
		   
		   $qkhj+=$row['ysje'];
		   
		   $str_all.=$str;	
		   
		   
	   }
		
		 $str_all.="$".$qkhj."$".$count;
			 
		 break;
			 
			 
		 case "six":
			 
		
		$sqhk="select IFNULL(sum(money),0) as hkhj from  xinhu_custfina c  where c.ispay=1 and c.type=0 and  c.paytype=0 and c.comid='". $_SESSION['xinhu_companyid']."'";
			 
		
			if(isset($key) && $key!="" )
			 {	
				$sqhk.=" and c.custname like '%$key%' ";
				$tosql.=" and c.custname like '%$key%' ";
			 }

		 
		   if( $start_day!="" && $end_day==""  )
			 {	
				$sqhk.=" and DATE_FORMAT(c.paydt,\"%Y-%m-%d\") >='$start_day' ";
				 $tosql.=" and DATE_FORMAT(c.paydt,\"%Y-%m-%d\") >='$start_day' ";
			 }
			 
			 
	  if( $start_day!="" && $end_day!=""  )
		 {	
			$sqhk.=" and DATE_FORMAT(c.paydt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.paydt,\"%Y-%m-%d\")<='$end_day' ";
		     $tosql.=" and DATE_FORMAT(c.paydt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.paydt,\"%Y-%m-%d\")<='$end_day' ";
		 }	 
			 
			 
			 
			 
	     $resc=mysql_query($sqhk);			 
		 $count_arr=mysql_fetch_array($resc);
		 $hkhj=$count_arr[0];
			 
			 
			 
			 
	
			 
			 
			 
			 
	   while($row=mysql_fetch_array($res))
	  {		 
		 $str="<tr>";    
		 $str.="<td style=\"width:18%\">".$row['hkday']."</td>";
		 $str.="<td style=\"width:18%\">".$row['htbh']."</td>";
		 $str.="<td style=\"width:18%\">".$row['khnam']."</td>";
		 $str.="<td style=\"width:18%\">".$row['hkmny']."</td>";	
		 $str.="<td style=\"width:18%\">".$row['agent']."</td>";		
		 $str.="</tr>"; 
		  
		  $str_all.=$str;	  
	   }	
			 
		  $str_all.="$".$hkhj."$".$count;	 
			 
		 break;
			 
			 
			 
		 case "seven":
			 
			 
/*		
$sqlf="select IFNULL(sum(money),0) +
 ( (select IFNULL(sum(money),0) from xinhu_custfinaa where htid=c.id and type=0) - (select IFNULL(sum(money),0)  from xinhu_custfinaa where htid=c.id and type=1))- 
( select  IFNULL(sum(money),0) from  xinhu_custfina where ispay=1 and  type=1 and htid  in (select id from xinhu_custract where type=1  and comid='".$_SESSION['xinhu_companyid']."')  ) as yingfu from xinhu_custract c  where c.type=1 and c.comid='".$_SESSION['xinhu_companyid']."'
and c.ispay in (0,2) "; 
			 
  $sqlf="select
ifnull(sum(money),0) 
-( select IFNULL(sum(money),0) from xinhu_custfina where ispay=1 and type=1  and comid='".$_SESSION['xinhu_companyid']."' and htid in (c.id )  )
-  (   
 (select IFNULL(sum(money),0) from xinhu_custfinaa where htid=9 and type=0 and paytype=0) - 
 (select IFNULL(sum(money),0) from xinhu_custfinaa where htid=9 and type=1 and paytype=0) 
 ) 
as yingfu from  xinhu_custract c 
where c.type=1 and c.comid='".$_SESSION['xinhu_companyid']."'  and c.ispay in (0,2)";
			
 
			 
		  $resf=mysql_query($sqlf);	
		  $fkhj=0;	
			 
		 if($resf){
		   $count_aff=mysql_fetch_array($resf);
		 $fkhj=$count_aff[0];	//欠款合计 
		 }
			 */	 
			 
		 
			 
      while($row=mysql_fetch_array($res))
	  {		 
		 $str="<tr>";    
	 
		 $str.="<td style=\"width:10%\">".$row['num']."</td>";
		 $str.="<td style=\"width:10%\">".$row['signdt']."</td>";
		 $str.="<td style=\"width:18%\">".$row['custname']."</td>";
		 $str.="<td style=\"width:10%\">".$row['money']."</td>";
		 $str.="<td style=\"width:10%\">".$row['yifu']."</td>";
		 $str.="<td style=\"width:10%\">".$row['tiao']."</td>";
		 
		 $str.="<td style=\"width:10%\">".$row['qiank']."</td>"; 
		 $str.="<td style=\"width:12%\">".$row['optname']."</td>";	 
	 	 $str.="<td style=\"width:20%\">".$row['explain']."</td>";
	  
		 $str.="</tr>"; 
		  
		
		  
		  $str_all.=$str;	  
	   }	
			 
		  $str_all.="$".$count."$".$fkhj;
			 
			 
		break;		 
			 
		 
	 }
	
	 if($search!="one" && $search!="four")
	  $str_all.=$pstr;
	  
	   
	  exit($str_all);
	   

   }
 




include_once('include/View.php');