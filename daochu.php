<?php session_start();

if(function_exists('date_default_timezone_set'))date_default_timezone_set('Asia/Shanghai');

 include_once(dirname(__FILE__).'/include/PHPExcel.php');

 include(dirname(__FILE__) . "/config/conpass.php");
	 
  $con = mysql_connect($server,$dbuser,$dbpass);
  mysql_query("set names utf8");
  mysql_select_db($db_base, $con);





$objPHPExcel = new PHPExcel();

//设置文件的一些属性，在xls文件——>属性——>详细信息里可以看到这些值，xml表格里是没有这些值的

$objPHPExcel

      ->getProperties()  //获得文件属性对象，给下文提供设置资源

      ->setCreator( "MaartenBalliauw")             //设置文件的创建者

      ->setLastModifiedBy( "MaartenBalliauw")       //设置最后修改者

      ->setTitle( "Office2007 XLSX Test Document" )    //设置标题

      ->setSubject( "Office2007 XLSX Test Document" )  //设置主题

      ->setDescription( "Test document for Office2007 XLSX, generated using PHP classes.") //设置备注

      ->setKeywords( "office 2007 openxmlphp")        //设置标记

      ->setCategory( "Test resultfile");                //设置类别

// 位置aaa *为下文代码位置提供锚

 $dao=isset($_REQUEST['dao'])?$_REQUEST['dao']:"";  //exit($dao);

$key=isset($_REQUEST['key'])?$_REQUEST['key']:"";
$start_day=isset($_REQUEST['start_day'])?$_REQUEST['start_day']:"";
$end_day=isset($_REQUEST['end_day'])?$_REQUEST['end_day']:"";
//给表格添加数据

 $sheet=$objPHPExcel->setActiveSheetIndex(0);            //设置第一个内置表（一个xls文件里可以有多个表）为活动的


/*
	$objPHPExcel->setActiveSheetIndex(0)             //设置第一个内置表（一个xls文件里可以有多个表）为活动的

           ->setCellValue( 'A1', 'Hello' )       //给表的单元格设置数据

           ->setCellValue( 'B2', 'world!' )      //数据格式可以为字符串

           ->setCellValue( 'C1',12)            //数字型

           ->setCellValue( 'D2',12)            //

           ->setCellValue( 'D3', true )           //布尔型

           ->setCellValue( 'D4', '=SUM(C1:D2)' );//公式
		   
		  

*/

 $sql="";

 switch($dao)
 {
	 
	 //营业汇总表
	 case 'one':
		 
		 $cond="";
		 if(isset($start_day) && $start_day!=""  )
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
			 
			 
			 
		 
		 
		
	 break;
		 
		 
	 //每月明细	 
	 case 'two':
		 
		 		 
 $sql=" select  c.num , c.custname, IFNULL(c.money,0) as htmoney , 
 s.money as yishou,c.signdt as dayt ,c.content as beizhu ,
 
 
 IFNULL(c.money,0) +
 ( select IFNULL(sum(money),0) from xinhu_custfinaa where type=0 and htid=c.id )
 - ( select IFNULL(sum(money),0) from xinhu_custfinaa where type=1 and htid=c.id ) 
 -
 (select ifnull(sum(money),0) from  xinhu_custfina where htid=c.id and type='0' and ispay=1 )
  as daishou 
 
 from xinhu_custract c left join xinhu_custfina s on c.id=s.htid 
 
 where 1=1 and s.type='0' and s.ispay=1 and    c.comid='". $_SESSION['xinhu_companyid']."' "; 
	 
	   $tosql=" select  count( DISTINCT c.id) as nums  from  xinhu_custract c left join xinhu_custfina s on c.id=s.htid 
 
 where 1=1 and s.type='0' and s.ispay=1 and   c.comid='". $_SESSION['xinhu_companyid']."'";

			 
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
		 
		 
			 
		$sql.=" order by c.signdt desc ";
			 
		
		 
		 // 营业额合计	 
		 $sqlc=" select  IFNULL(sum(c.money),0) as htmoney

from xinhu_custract c left join (select distinct htid ,type from xinhu_custfina where type=0 and comid='".$_SESSION['xinhu_companyid']."') a 

on c.id=a.htid where c.type=0 and c.comid='".$_SESSION['xinhu_companyid']."' and a.type=0 "; 
		 
		 
		
			 
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
			 
		 
			 
		 
	 break;	 
		 
		 
	  //合同成本	 
	  case 'three':	  
		 
		 $sql="select c.id, c.num ,	u.name as custname, c.signdt as dayt ,IFNULL(c.money,0) as htmoney , c.optname as agent,
 
 ( select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=0 and htid=c.id) - ( select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=1 and htid=c.id) as dzjer , 
 
 IFNULL(( select ifnull(money,0) from xinhu_custfina where paytype=2 and ispay=1 and type=1 and htid=c.id),0) as wai ,
 
 ( select IFNULL(sum(money),0) from xinhu_custfee where htid=c.id ) as cost ,
 
 ( select IFNULL(sum(money),0) from xinhu_custfina where paytype=0 and type=0 and ispay=1 and htid=c.id ) as yis,
 
 (case when ( select count(id) from xinhu_fininfom where num in (c.num)  )>0 then 
 
 convert(
 
( select  sum(f.money * v.felv)  as fapiao from xinhu_fininfom f left join xinhu_feelv v on f.paytype=v.id

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
 
( select  sum(f.money * v.felv)  as fapiao from xinhu_fininfom f left join xinhu_feelv v on f.paytype=v.id

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
 
( select  sum(f.money * v.felv)  as fapiao from xinhu_fininfom f left join xinhu_feelv v on f.paytype=v.id

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
		  
		 }


	  if(isset($start_day) && $start_day!="" && $end_day==""  )
		 {	
			$sql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")>='$start_day' ";
		   
		 }	 
			 
		 if( $start_day!="" && $end_day!=""  )
		 {	
			$sql.=" and DATE_FORMAT(c.signdt,\"%Y-%m-%d\") >='$start_day' and DATE_FORMAT(c.signdt,\"%Y-%m-%d\")<='$end_day' ";		     
		 }	 
		 //file_put_contents("sql.txt",$sql);	
		 
	
		 
		 break;
		 
		 //利润表 
		 case 'four':
		 
// 营业额
  $sql=" select  IFNULL(sum(c.money),0) as htjer

from xinhu_custract c left join (select distinct htid ,type from xinhu_custfina where type=0 and comid='". $_SESSION['xinhu_companyid']."') a 

on c.id=a.htid where c.type=0 and c.comid='". $_SESSION['xinhu_companyid']."' and a.type=0 "; 
		 

 $sqqt="select id from xinhu_custract c where 1=1 and c.comid='". $_SESSION['xinhu_companyid']."' ";		 
			 
  $sqnum="select num from xinhu_custract c where 1=1 and c.comid='". $_SESSION['xinhu_companyid']."' ";				 
		 
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
			 	
		 
		 //exit($sql);	 
			 
		 $res=mysql_query($sql);
		 $arr=mysql_fetch_array($res);

		 $htjer=$arr[0]; // 合同金额
		


		// 调账条件:
			 
		$whe="";	 
		
		
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
(select   IFNULL(sum(money),0)  from xinhu_custfinaa c  where 1=1 $whe and type=0 and paytype=0 and comid='". $_SESSION['xinhu_companyid']."')
- 
( select   IFNULL(sum(money),0)  from xinhu_custfinaa c  where 1=1 $whe and type=1 and paytype=0  and   comid='". $_SESSION['xinhu_companyid']."'  )  as dzje"; 
			 
		 
		 
			 
		$res=mysql_query($sql);
		$arr=mysql_fetch_array($res);
		$dzje=$arr[0];
			 
			
		// 其他收入

 $sql="select IFNULL(sum(money),0) as qtsr  from xinhu_custfina c  where 1=1 $whe and  paytype=3 and ispay=1  and type=0 and   comid='". $_SESSION['xinhu_companyid']."' ";  // exit($sql);
		 $res=mysql_query($sql);
		 $arr=mysql_fetch_array($res);	
		 $qtsr=$arr[0];	

			 			 
//采购支出
 $sql="select IFNULL(sum(money),0) from  xinhu_custfina c where 1=1 $whe and  type=1 and ispay=1 and paytype=1 and  comid='". $_SESSION['xinhu_companyid']."' ";  // exit($sql);
		 $res=mysql_query($sql);
		 $arr=mysql_fetch_array($res);
		 $ckzc=$arr[0];


// 外协支出
 $sql="select IFNULL(sum(money),0) from  xinhu_custfina c where 1=1 $whe and  type=1 and ispay=1 and paytype=2 and  comid='". $_SESSION['xinhu_companyid']."' ";    //exit($sql);
		 
		 $res=mysql_query($sql);
		 $arr=mysql_fetch_array($res);
		 $wxzc=$arr[0];




	 // 采购调账:0.00

$sql="select ( (select IFNULL(sum(money),0) from  xinhu_custfinaa c where 1=1 $whe and  paytype=1 and type=0 and  comid='". $_SESSION['xinhu_companyid']."'  ) - (select IFNULL(sum(money),0) from  xinhu_custfinaa c where 1=1 $whe and  paytype=1 and type=1 and  comid='". $_SESSION['xinhu_companyid']."'  )  )  as  cgtz";
		 
		 
		 $res=mysql_query($sql);
		 $arr=mysql_fetch_array($res);
		$cgtz=$arr[0];



	// 外协调账:0.00

$sql="select ( (select IFNULL(sum(money),0) from  xinhu_custfinaa c where 1=1 $whe and paytype=2 and type=0 and  comid='". $_SESSION['xinhu_companyid']."'  ) - (select IFNULL(sum(money),0) from  xinhu_custfinaa c where 1=1 $whe and paytype=2 and type=1 and  comid='". $_SESSION['xinhu_companyid']."'  )  )  as  wxtz";
 
			 
		$res=mysql_query($sql);
		$arr=mysql_fetch_array($res);
		$wxtz=$arr[0];



		// 合同费用  "s11"

	$sql="select IFNULL(sum(money),0) from  xinhu_custfee c where  1=1 and htid in ($sqqt) ";  //exit($sql);
	$res=mysql_query($sql);
	if($res)
	  $arr=mysql_fetch_array($res);

	$qtzc=$arr[0];
		 

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
 
$res=mysql_query($sql);
$arr=mysql_fetch_array($res);
$baoxiao=$arr[0];
		 
	
		 
	 
			 
$shsq="select f.money* v.felv as shui from xinhu_fininfom f left join xinhu_feelv v on f.paytype=v.id where  inorout=0  and f.type=5  and f.comid='".$_SESSION['xinhu_companyid']."' and f.num in";
			 
$shsq.="($sqnum)";

$shui=0;			 
$ress=mysql_query($shsq);
			 
while($rowsh=mysql_fetch_array($ress))
{
   $shui+=$rowsh['shui']; 	
	 
	
}
		 



	// 收入小计= 合同金额 + 调账金额 + 其他收入
	$srxj =$htjer+$dzje+$qtsr;


// 支出小计= 合同费用 + 税费 + 采购支出  +  外协支出  +公司日常
$zcxj =$qtzc+ $shui + $ckzc+ $wxzc  +$baoxiao;

 //echo $qtzc.' '.$shui.' '.$ckzc.' '.$wxzc.' '.$cgtz.' '.$wxtz.' '.$baoxiao;exit("wtf");
		
// 利润	 	
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
		 
$sql=" select DISTINCT c.num as htbh,   c.signdt  as qdrq , 	c.custname as khmc,  c.money as htje , c.optname as agent,
(select  IFNULL(sum(money),0) from  xinhu_custfina where ispay=1 and  type=0 and htid=c.id) as back ,  
c.money + ((select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=0 and htid=c.id ) - 
 ( select IFNULL(sum(money),0) from xinhu_custfinaa where paytype=0 and type=1 and htid=c.id ) ) - (select  IFNULL(sum(money),0) from  xinhu_custfina where ispay=1 and  type=0 and htid=c.id) as ysje ,
(select   IFNULL(sum(money),0)  from xinhu_custfinaa  where paytype=0 and type=0  and htid=c.id ) - 
( select   IFNULL(sum(money),0)  from xinhu_custfinaa  where paytype=0 and type=1 and htid=c.id  )  as tzje
from  xinhu_custract  c left join xinhu_custfina s on c.id=s.htid
 where  c.type=0 and c.comid='". $_SESSION['xinhu_companyid']."'  and c.ispay=0"; 
			 
			  
			 	 
		
		  $tosql="select  count(c.id) from  xinhu_custract  c  where  c.comid='". $_SESSION['xinhu_companyid']."' and ispay=0";
			 
			 
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
			from  xinhu_custfina c  where c.ispay=1 and c.type=0 and  c.paytype=0 and c.comid='". $_SESSION['xinhu_companyid']."'";
		 
			 
	 $tosql=" select count(c.id) from  xinhu_custfina c  where c.ispay=1 and c.type=0 and  c.paytype=0 and c.comid='". $_SESSION['xinhu_companyid']."'";	 
			 
			 
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
			 
        $sql="  select c.num ,c.signdt, c.custname, c.money, c.optname,  c.explain ,

( (select IFNULL(sum(money),0) from xinhu_custfinaa where paytype<>0 and htid=c.id and type=0) - (select IFNULL(sum(money),0)  from xinhu_custfinaa where paytype<>0 and htid=c.id and type=1))as tiao ,

( select IFNULL(sum(money),0) from xinhu_custfina where type=1 and htid=c.id and ispay=1  ) as yifu,

c.money + ( (select IFNULL(sum(money),0) from xinhu_custfinaa where paytype<>0 and htid=c.id and type=0) - (select IFNULL(sum(money),0)  from xinhu_custfinaa where paytype<>0 and htid=c.id and type=1))- ( select IFNULL(sum(money),0) from xinhu_custfina where type=1 and htid=c.id and ispay=1  )     as qiank

from xinhu_custract c where 1=1 and type=1 and c.comid='". $_SESSION['xinhu_companyid']."'  ";
			 
			 
		$tosql="select count(id) from xinhu_custract c where c.type=1  and  c.comid='". $_SESSION['xinhu_companyid']."'"; 
			 			 
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









  switch($dao)
  {
		  
	  case 'one':
           $sheet->setCellValue( 'A1', '月份' )       

           ->setCellValue( 'C1', '收入' )     

           ->setCellValue( 'E1','已收金额')           

           ->setCellValue( 'F1',"应收金额")		   
			   
		   ->setCellValue('B2','合同金额')	   
			   
		   ->setCellValue('C2','调账金额') 
			          
		   ->setCellValue('D2','合同+调账');       
			   
			   
		 $objPHPExcel->getActiveSheet()->mergeCells( 'A1:A2'); 	   
			   
		 $objPHPExcel->getActiveSheet()->mergeCells( 'E1:E2');	
		  
		 $objPHPExcel->getActiveSheet()->mergeCells( 'F1:F2'); 
		  
		 $sheet->getColumnDimension('A')->setWidth(20);   
		  
		 $sheet->getColumnDimension('B')->setWidth(20);  
		 $sheet->getColumnDimension('C')->setWidth(20);  
		 $sheet->getColumnDimension('D')->setWidth(20);  
		 $sheet->getColumnDimension('E')->setWidth(20);  
		 $sheet->getColumnDimension('F')->setWidth(20);   
		  
		  
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'C1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐 
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'C1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	
		  
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐 
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'A1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	
		  
		  
 $objPHPExcel->getActiveSheet()->getStyle( 'E1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐 
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'E1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	
		  
 $objPHPExcel->getActiveSheet()->getStyle( 'F1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐 
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'F1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	
		  
		  
	          $htmnyall=0;	
			  $tiao=0;
			  $htiao=0;
			  $yishou=0;
			  $daishou=0;

			 
			   $res=mysql_query($sql);
		      
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
					  $daishou=$row['daishou'];
				  }	
				
		  
		  		$i=3;
		  
				//写进 excel 表行
				foreach($arr as $ky=>$row)
				{
					/*
					 $str="<tr>";

					$str.="<td ><p>".$row['mon']."</p></td>";		 
					$str.="<td ><p>".$row['htmoney']."</p></td>";   
					$str.="<td ><p>".$row['tiao']."</p></td>"; 
					$str.="<td ><p>".$row['htiao']."</p></td>"; 
					$str.="<td ><p>".$row['yishou']."</p></td>";
					$str.="<td ><p>".$row['daishou']."</p></td>";

					$str.="</tr>";
					
					*/
					
					 $sheet->setCellValue( 'A'.$i, $row['mon'] )
						   ->setCellValue( 'B'.$i, $row['htmoney'] )
					 	   ->setCellValue( 'C'.$i, $row['tiao'] )
						   ->setCellValue( 'D'.$i, $row['htiao'] )
						   ->setCellValue( 'E'.$i, $row['yishou'] )
 						   ->setCellValue( 'F'.$i, $row['daishou'] );
					
					
					$i++;
				}
		  
		 // exit($i.' ');
		  
		 
		   $sheet->setCellValue( 'A'.($i), "汇总" )
						   ->setCellValue( 'B'.($i), $htmnyall )
					 	   ->setCellValue( 'C'.($i), $tiao )
						   ->setCellValue( 'D'.($i), $htiao )
						   ->setCellValue( 'E'.($i), $yishou )
 						   ->setCellValue( 'F'.($i), $daishou ); 
		  
	    	  
		    $objPHPExcel->getActiveSheet()->getStyle( 'A'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT); 
		  
         
		    $filename="yyhz_".date("Ymd",time()).".xls";
	  break;
		  
	  case 'two':
		  
	 // 日期	合同编号	客户名称	合同金额	已收	应收	备注
		  
		  $res=mysql_query($sql);	
		  
		  
		  $sheet->setCellValue( 'A2', '日期' )       

           ->setCellValue( 'B2', '合同编号' )     

           ->setCellValue( 'C2','客户名称')           

           ->setCellValue( 'D2',"合同金额")		   
			   
		   ->setCellValue('E2','已收')	   
			   
		   ->setCellValue('F2','应收') 
			          
		   ->setCellValue('G2','备注');        
		  
		  
		 $sheet->getColumnDimension('A')->setWidth(20);	  
		 $sheet->getColumnDimension('B')->setWidth(20);  
		 $sheet->getColumnDimension('C')->setWidth(20);  
		 $sheet->getColumnDimension('D')->setWidth(20);  
		 $sheet->getColumnDimension('E')->setWidth(20);  
		 $sheet->getColumnDimension('F')->setWidth(20);   
		 $sheet->getColumnDimension('G')->setWidth(20); 
		  
		  
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'A2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'A2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'B2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'B2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		  		  
  $objPHPExcel->getActiveSheet()->getStyle( 'C2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'C2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	
  
  $objPHPExcel->getActiveSheet()->getStyle( 'D2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'D2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 		  		  

  $objPHPExcel->getActiveSheet()->getStyle( 'E2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'E2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 		  		  
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'F2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'F2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 		  		  		  
  $objPHPExcel->getActiveSheet()->getStyle( 'G2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'G2')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 		  		  		  
		  	  
		  
		    $i=3;
		  
				//写进 excel 表行
				while($row=mysql_fetch_array($res))
				{					
					
					 $sheet->setCellValue( 'A'.$i, $row['dayt'] )
						   ->setCellValue( 'B'.$i, $row['num'] )
					 	   ->setCellValue( 'C'.$i, $row['custname'] )
						   ->setCellValue( 'D'.$i, $row['htmoney'] )
						   ->setCellValue( 'E'.$i, $row['yishou'] )
 						   ->setCellValue( 'F'.$i, $row['daishou'] ) 
						   ->setCellValue( 'G'.$i, $row['beizhu'] );
					
					$i++;
					 
				}
		  
		  
		  
			
			 // 本期营业额合计 
		  	 $resc=mysql_query($sqlc);			 
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
			 
		
		
		  
		   $restwo=mysql_query($tosql);			 
		   $count_two=mysql_fetch_array($restwo);		
		  
		  
			
		  
		   $sheet->setCellValue('A1', '本期营业额合计')
						   ->setCellValue( 'B1', $hthj )
					 	   ->setCellValue( 'C1', '已收合计')
						   ->setCellValue( 'D1', $yshj )
						   ->setCellValue( 'E1', '应收合计')
 						   ->setCellValue( 'F1', $dshj ) 
						   ->setCellValue( 'G1', '合同数量')
			   	           ->setCellValue( 'H1',  $count_two[0]);
		  
		  
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'A1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'B1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'B1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		  		  
  $objPHPExcel->getActiveSheet()->getStyle( 'C1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'C1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	
  
  $objPHPExcel->getActiveSheet()->getStyle( 'D1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'D1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 		  		  

  $objPHPExcel->getActiveSheet()->getStyle( 'E1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'E1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 		  		  
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'F1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'F1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 		  		  		  
  $objPHPExcel->getActiveSheet()->getStyle( 'G1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'G1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		  
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'H1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'H1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 		  
		     
		  
		     $filename="mymx_".date("Ymd",time()).".xls";
		  
	  break;
		  
		  
	  case 'three':	 
		  
		   $res=mysql_query($sql);	
		  
		   $sheet->setCellValue('A1','客户名称')
           ->setCellValue('B1', '签订日期')
           ->setCellValue('C1','合同编号')
           ->setCellValue('D2',"合同金额")	
		   ->setCellValue('D1',"收入") 	   
		   ->setCellValue('E2','已调账')
		   ->setCellValue('F1','支出')	   
		   ->setCellValue('F2','外协')		          
		   ->setCellValue('G2','费用')		   
		   ->setCellValue('H2','纳税')				 
		   ->setCellValue('I1','毛利')				 
		   ->setCellValue('J1','毛利率%')
		   ->setCellValue('K1','已收金额')
		   ->setCellValue('L1','应收金额')
		   ->setCellValue('M1','客户经理');	 
		  
		  
		  $objPHPExcel->getActiveSheet()->mergeCells('A1:A2'); 		  
		  $objPHPExcel->getActiveSheet()->mergeCells('B1:B2'); 
		  $objPHPExcel->getActiveSheet()->mergeCells('C1:C2');   
		  
		  $objPHPExcel->getActiveSheet()->mergeCells('I1:I2'); 
		  $objPHPExcel->getActiveSheet()->mergeCells('J1:J2'); 
		  $objPHPExcel->getActiveSheet()->mergeCells('K1:K2'); 
		  $objPHPExcel->getActiveSheet()->mergeCells('L1:L2');
		  $objPHPExcel->getActiveSheet()->mergeCells('M1:M2'); 
		  
		  
		 $objPHPExcel->getActiveSheet()->mergeCells( 'D1:E1'); 	   
			   
		 $objPHPExcel->getActiveSheet()->mergeCells( 'F1:H1');	
		  
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'D1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'D1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'F1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'F1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
  
		  
   $objPHPExcel->getActiveSheet()->getStyle( 'A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'A1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		 		  
   $objPHPExcel->getActiveSheet()->getStyle( 'B1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'B1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		 	  
  $objPHPExcel->getActiveSheet()->getStyle( 'C1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐 
  $objPHPExcel->getActiveSheet()->getStyle( 'C1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		 	   
 
   $objPHPExcel->getActiveSheet()->getStyle( 'I1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'I1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		 		  
  $objPHPExcel->getActiveSheet()->getStyle( 'J1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'J1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		 		  
		  
 $objPHPExcel->getActiveSheet()->getStyle( 'K1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'K1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		 		  
  $objPHPExcel->getActiveSheet()->getStyle( 'L1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'L1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		 
  $objPHPExcel->getActiveSheet()->getStyle( 'M1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'M1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		 		  
		  
		  
		    $i=3;
	 
				//写进 excel 表行
				while($row=mysql_fetch_array($res))
				{					
					
					 $sheet->setCellValue( 'A'.$i, $row['custname'] )
						   ->setCellValue( 'B'.$i, $row['dayt'] )
					 	   ->setCellValue( 'C'.$i, $row['num'] )
						   ->setCellValue( 'D'.$i, $row['htmoney'] )
						   ->setCellValue( 'E'.$i, $row['dzjer'] )
 						   ->setCellValue( 'F'.$i, $row['wai']) 
						   ->setCellValue( 'G'.$i, $row['cost'])
					       ->setCellValue( 'H'.$i, $row['shui'])
						   ->setCellValue( 'I'.$i, $row['maoli'])
					       ->setCellValue( 'J'.$i, $row['maolilv'])
						   ->setCellValue( 'K'.$i, $row['yis'])
						   ->setCellValue( 'L'.$i, $row['ying'])
						   ->setCellValue( 'M'.$i, $row['agent']);
					
					 
					
					$i++;
					 
				}
		  
		  
		  
		  
		  
		  
		   $filename="htcb_".date("Ymd",time()).".xls";
		  
		  
	  break;
		  
		  
	  	  
	  case 'four':
		  
		  
		   $res=mysql_query($sql);	
		  
		   $sheet->setCellValue('A1','利润 :'.$lrun)
           ->setCellValue('B1', '利润率 :'.$feelv)
		   ->setCellValue('A2','收入小计 :'.$srxj)
		   ->setCellValue('B2','支出小计 :'.$zcxj);
         
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'A1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 		  
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'B1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'B1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 
		  		  
		  
		 $sheet->getColumnDimension('A')->setWidth(30);	  
		 $sheet->getColumnDimension('B')->setWidth(30);  		  
		  
		  
		 $objPHPExcel->getActiveSheet()->mergeCells('A3:A6'); 	
		  $objPHPExcel->getActiveSheet()->mergeCells('A7:A8');   
		  
		 $sheet->setCellValue('A3','营业额 :'.$htjer)
			   ->setCellValue('B3','合同费用:'.$qtzc)
		       ->setCellValue('B4','纳税费用:'.$shui)
		       ->setCellValue('B5','采购支出:'.$ckzc)
			   ->setCellValue('B6','外协支出:'.$wxzc)
			   ->setCellValue('B7','采购调账:'.$cgtz)
			   ->setCellValue('B8','外协调账:'.$wxtz)
			   ->setCellValue('B9','公司常用支出:'.$baoxiao);
		  
 
		  
		  
		  $sheet->setCellValue('A7','合同调账: '.$dzje)	
		        ->setCellValue('A9','其他收入 :'.$qtsr);	
		        
		  
		  
		  
		  if($start_day!="" && $end_day=="")
		   $sheet->setCellValue('A11','从 :'.$start_day.'开始');	  
		  elseif($start_day!="" && $end_day!="")
			$sheet->setCellValue('A11','数据从 :'.$start_day."至".$end_day);  
		  
		  
		   $filename="lirun_".date("Ymd",time()).".xls";
	
	  break;	  
		  
	
	  case 'five':
		  
		    $res=mysql_query($sql);	
		    
		   
		  
		       $qkhj=0;	
			 
		 // 合同编号	签订日期	客户名称	合同金额	已 收	   调 账	  客户经理	   应 收
		     $sheet->setCellValue('A2','合同编号')
           		   ->setCellValue('B2','签订日期')
                   ->setCellValue('C2','客户名称')
                   ->setCellValue('D2','合同金额')
		  	       ->setCellValue('E2','已 收')
			       ->setCellValue('F2','调 账')
		           ->setCellValue('G2','客户经理') 
		           ->setCellValue('H2','应 收');
			 
		   $qkhj=0;
		   $count=0;
		  $i=3;
		   while($row=mysql_fetch_array($res))
		   {		
			   $sheet->setCellValue( 'A'.$i, $row['htbh'] )
						   ->setCellValue( 'B'.$i, $row['qdrq'] )
					 	   ->setCellValue( 'C'.$i, $row['khmc'] )
						   ->setCellValue( 'D'.$i, $row['htje'] )
						   ->setCellValue( 'E'.$i, $row['back'] )
 						   ->setCellValue( 'F'.$i, $row['tzje']) 
						   ->setCellValue( 'G'.$i, $row['agent'])
					       ->setCellValue( 'H'.$i, $row['ysje']);
			   
			   
			   		  
  $objPHPExcel->getActiveSheet()->getStyle( 'A'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'A'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 		  
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'B'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'B'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 

  $objPHPExcel->getActiveSheet()->getStyle( 'C'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'C'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 	
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'D'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'D'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 	
			   
			   
			   
			   
			    $i++;
			    $qkhj+=$row['ysje'];
			    $count++;			   		
		   }
		  
		   
		    
		       $sheet->setCellValue('A1','合同单数')
           		   ->setCellValue('B1',$count)
                   ->setCellValue('C1','应收合计')
                   ->setCellValue('D1',$qkhj);
		  
		  
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'A1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 		  
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'B1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'B1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 

  $objPHPExcel->getActiveSheet()->getStyle( 'C1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'C1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 	
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'D1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'D1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	
		  
		  
		  
		 $sheet->getColumnDimension('A')->setWidth(20);	  
		 $sheet->getColumnDimension('B')->setWidth(20);  		  
		 $sheet->getColumnDimension('C')->setWidth(30);  
		 $sheet->getColumnDimension('D')->setWidth(20);	  
		 $sheet->getColumnDimension('E')->setWidth(20);  
		 $sheet->getColumnDimension('F')->setWidth(20);	  
		 $sheet->getColumnDimension('G')->setWidth(20);  
		 $sheet->getColumnDimension('H')->setWidth(20);	  
 
		  
		    
		  
		    $filename="htys_".date("Ymd",time()).".xls";
		  
	  break;
		  
		  
		  
	  case 'six':
		  
		    $res=mysql_query($sql);	
		  
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
		  
		  
		  
		  
		  
		     $sheet->setCellValue('A2','回款日期')
           		   ->setCellValue('B2','合同编号')
                   ->setCellValue('C2','客户名称')
                   ->setCellValue('D2','回款金额')
		  	       ->setCellValue('E2','客户经理');
		  
		  
		   $count=0;
		   $i=3;
		  
		   while($row=mysql_fetch_array($res))
		   {		
			   $sheet->setCellValue( 'A'.$i, $row['hkday'] )
						   ->setCellValue( 'B'.$i, $row['htbh'] )
					 	   ->setCellValue( 'C'.$i, $row['khnam'] )
						   ->setCellValue( 'D'.$i, $row['hkmny'] )
						   ->setCellValue( 'E'.$i, $row['agent'] );
 			 
			   
			   		  
  $objPHPExcel->getActiveSheet()->getStyle( 'A'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'A'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 		  
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'B'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'B'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 

  $objPHPExcel->getActiveSheet()->getStyle( 'C'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'C'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 	
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'D'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'D'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 	
			   
  $objPHPExcel->getActiveSheet()->getStyle( 'E'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'E'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 	
			   			   
			   
			   
			    $i++;			    
			    $count++;			   		
		   }
		     
		  
		 $sheet->getColumnDimension('A')->setWidth(20);	  
		 $sheet->getColumnDimension('B')->setWidth(20);  		  
		 $sheet->getColumnDimension('C')->setWidth(30);  
		 $sheet->getColumnDimension('D')->setWidth(20);	  
		 $sheet->getColumnDimension('E')->setWidth(20);  
		  
		  
		    
		    $sheet->setCellValue('A1','回款笔数')
           		   ->setCellValue('B1',$count)
                   ->setCellValue('C1','回款合计')
                   ->setCellValue('D1',$hkhj);
		  	      
		  
		  
		  
		  
		  
		   $filename="hthk_".date("Ymd",time()).".xls"; 
		  
	  break;
		  
		  
		  
	  case 'seven':
		  
		   $res=mysql_query($sql);	
		  
		  
		   $sheet->setCellValue('A3','合同编号')
           		 ->setCellValue('B3','签订日期')
                 ->setCellValue('C3','客户名称')
                 ->setCellValue('D3','合同金额')
		  	     ->setCellValue('E3','已 付')
			     ->setCellValue('F3','调 账')
			     ->setCellValue('G3','欠 款')
			     ->setCellValue('H3','经办人')
		         ->setCellValue('I3','备 注');
		  
		  
		  
		  
		   $qiank=0;
		   $count=0;
		   $i=4;
		  
		   while($row=mysql_fetch_array($res))
		   {		
			   $sheet->setCellValue( 'A'.$i, $row['num'] )
						   ->setCellValue( 'B'.$i, $row['signdt'] )
					 	   ->setCellValue( 'C'.$i, $row['custname'] )
						   ->setCellValue( 'D'.$i, $row['money'] )
						   ->setCellValue( 'E'.$i, $row['yifu'] )
 						   ->setCellValue( 'F'.$i, $row['tiao']) 
						   ->setCellValue( 'G'.$i, $row['qiank'])
					       ->setCellValue( 'H'.$i, $row['optname'])
			               ->setCellValue( 'I'.$i, $row['explain']);
			   
			   		  
  $objPHPExcel->getActiveSheet()->getStyle( 'A'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'A'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 		  
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'B'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'B'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 

  $objPHPExcel->getActiveSheet()->getStyle( 'C'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐   
  $objPHPExcel->getActiveSheet()->getStyle( 'C'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 	
		  
  $objPHPExcel->getActiveSheet()->getStyle( 'D'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐 
  $objPHPExcel->getActiveSheet()->getStyle( 'D'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	 	
			   
  $objPHPExcel->getActiveSheet()->getStyle( 'E'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐 
  $objPHPExcel->getActiveSheet()->getStyle( 'E'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	
			   
  $objPHPExcel->getActiveSheet()->getStyle( 'F'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐 
  $objPHPExcel->getActiveSheet()->getStyle( 'F'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	
			   
  $objPHPExcel->getActiveSheet()->getStyle( 'G'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐 
  $objPHPExcel->getActiveSheet()->getStyle( 'G'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);	
			   
  $objPHPExcel->getActiveSheet()->getStyle( 'H'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐 
  $objPHPExcel->getActiveSheet()->getStyle( 'H'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);				   
  			   
  $objPHPExcel->getActiveSheet()->getStyle( 'I'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);    //水平方向上对齐 
  $objPHPExcel->getActiveSheet()->getStyle( 'I'.$i)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);					   
			   
			    $i++;
			    $qiank+=$row['qiank'];
			    $count++;			   		
		   }
		  
		  
		  
		  
		  
		   $sheet->setCellValue('A1','合同单数')
           		   ->setCellValue('B1',$count)
                   ->setCellValue('C1','欠款合计')
                   ->setCellValue('D1',$qiank);
		  
		  
		 $sheet->getColumnDimension('A')->setWidth(20);	  
		 $sheet->getColumnDimension('B')->setWidth(20);  		  
		 $sheet->getColumnDimension('C')->setWidth(30);  
		 $sheet->getColumnDimension('D')->setWidth(20);	  
		 $sheet->getColumnDimension('E')->setWidth(20);  
		 $sheet->getColumnDimension('F')->setWidth(20);  
		 $sheet->getColumnDimension('G')->setWidth(20);   
		 $sheet->getColumnDimension('H')->setWidth(20);   
		 $sheet->getColumnDimension('I')->setWidth(20);  
		  
		  
		  $stylBorderOutline= array(

		   'borders' => array (

				 'outline' => array (

					   'style' =>PHPExcel_Style_Border::BORDER_THIN,   //设置border样式
					   //'style' =>PHPExcel_Style_Border::BORDER_THICK, 另一种样式
					   'color' => array ('argb' => '555654'),       //设置border颜色

				),

		  ),

	    );
		  
		$objPHPExcel->getActiveSheet()->getStyle('A1:D1')->applyFromArray($stylBorderOutline);  
		  
		 $objPHPExcel->getActiveSheet()->getStyle( 'A1:D1')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID); 
		  
		 $objPHPExcel->getActiveSheet()->getStyle( 'A1:D1')->getFill()->getStartColor()->setARGB('EAEBE8'); 
		  
		   $filename="htyf_".date("Ymd",time()).".xls"; 
		  
	  break;
		  
		  
 
		  
  }


 

//得到当前活动的表,注意下文教程中会经常用到$objActSheet

$objActSheet =$objPHPExcel->getActiveSheet();

// 位置bbb *为下文代码位置提供锚

//给当前活动的表设置名称

 switch($dao)
  {
		  
	  case 'one':
		 $objActSheet->setTitle('营业汇总表');
	  break;
		 
  }



//生成2003excel格式的xls文件

header('Content-Type:application/vnd.ms-excel');

header('Content-Disposition:attachment;filename="'.$filename.'"');

header('Cache-Control:max-age=0');

 

$objWriter =PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');

$objWriter->save('php://output');



?>