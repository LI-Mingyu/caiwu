<?php session_start();?>
<html>
<head>
<meta charset="utf-8">
<title></title>
	
 

<script src="/js/jquery-1.4.4.min.js"></script>	

<script language="javascript" src="/js/jquery.jqprint-0.3.js"></script>		
	
</head>



 

<body>





 

<?php 

  $cid=$_GET['cid'];

 $base=realpath(dirname(__FILE__).'/../../../'); 
 include($base . "/config/conpass.php");		
 $conn = mysql_connect($server,$dbuser,$dbpass);	
 mysql_query("set names utf8");
  mysql_select_db($db_base, $conn);

	 
 $sqlc="
  select c.id, c.num as htbh, c.custname as customer, c.signdt  as writeday, c.startdt as start_day , c.enddt as end_day , 
 
 (case when (c.type)=0  then  '收款合同'
  
			when(c.type)=1  then '付款合同'
 
 end ) as httype,
 
 (select fpname from xinhu_feelv where id=c.fpid) as purchasebill ,
 
  
 IFNULL(c.money,0) as htjer , c.optname as agent, 
 

( select   IFNULL(sum(money),0) from xinhu_custfinaa  where paytype=0 and type=0  and htid=c.id) - ( select  IFNULL(sum(money),0) from xinhu_custfinaa  where paytype=0 and type=1 and htid=c.id) as tiao  , 

IFNULL(( select   sum(money)  from xinhu_custfina  where paytype=2 and ispay=1 and type=1  and htid=c.id),0) as wai ,

IFNULL(( select  sum(money) from xinhu_custfee where htid=c.id ),0)  as cost ,

( select IFNULL(sum(money),0)  from xinhu_custfina  where paytype=0 and type=0 and ispay=1 and htid=c.id   ) as yis,

(case when ( select count(id) from xinhu_fininfom where num in (c.num))>0 then 

convert(  ( select  sum(f.money * v.felv)  as fapiao from xinhu_fininfom f left join xinhu_feelv v on f.paytype=v.id

where f.num in (c.num) ) ,decimal(12,2))   

else 
 0   
 end ) as shui,

IFNULL(c.money,0) +
( select   IFNULL(sum(money),0) from xinhu_custfinaa  where paytype=0 and type=0  and htid=c.id) - ( select  IFNULL(sum(money),0) from xinhu_custfinaa  where paytype=0 and type=1 and htid=c.id)-
  ( select IFNULL(sum(money),0)  from xinhu_custfina  where type=0 and ispay=1 and htid=c.id   )    as ying,


case when 1>0 then

IFNULL(c.money,0) +

(select   IFNULL(sum(money),0)  from xinhu_custfinaa  where paytype=0 and type=0  and htid=c.id) -
( select   IFNULL(sum(money),0)  from xinhu_custfinaa  where paytype=0 and type=1 and htid=c.id)

-
( select  IFNULL(sum(money),0) from xinhu_custfina  where paytype=2 and ispay=1 and type=1  and htid=c.id) 
-
 ( select IFNULL(sum(money),0) from xinhu_custfee where htid=c.id )

-  convert(( (case when ( select count(id) from xinhu_fininfom where num in (c.num))>0 then 

convert(  ( select  sum(f.money * v.felv)  as fapiao from xinhu_fininfom f left join xinhu_feelv v on f.paytype=v.id

where f.num in (c.num) ) ,decimal(12,2))   

else 
 0   
 end ) ),decimal(12,2))
 
else 

0

end 

as maoli ,

 
 case when 1>0 then
 
 format( (( 

( IFNULL(c.money,0) +

(select   IFNULL(sum(money),0)  from xinhu_custfinaa  where paytype=0 and type=0  and htid=c.id) - ( select   IFNULL(sum(money),0)  from xinhu_custfinaa  where paytype=0 and type=1 and htid=c.id)  
-
( select  IFNULL(sum(money),0) from xinhu_custfina  where paytype=2 and ispay=1 and type=1  and htid=c.id) 
-
 ( select IFNULL(sum(money),0) from xinhu_custfee where htid=c.id )

-  convert(( (case when ( select count(id) from xinhu_fininfom where num in (c.num))>0 then 

convert( ( select  sum(f.money * v.felv)  as fapiao from xinhu_fininfom f left join xinhu_feelv v on f.paytype=v.id

where f.num in (c.num) ) ,decimal(12,2))   

else 
 0   
 end ) ),decimal(12,2))
) 

/  (  IFNULL(c.money,0) +
(select   IFNULL(sum(money),0)  from xinhu_custfinaa  where paytype=0 and type=0  and htid=c.id) - ( select   IFNULL(sum(money),0)  from xinhu_custfinaa  where paytype=0 and type=1 and htid=c.id) 
 ) 
 ) * 100 ),2) 
 
else

0

end 

as maolilv from  xinhu_custract  c  where  c.id='$cid' ";	//  exit($sqlc);
			 
		
	$res_sour=mysql_query($sqlc);
    $res=mysql_fetch_array($res_sour);	
	
	
	//调账：
	$sqlt="select paydt as backday,htnum as title, paytype ,  type, money , optname, depart, `explain` 	
	from xinhu_custfinaa where paytype=0 and htid='$cid'"; //exit($sqlt);
	
	
	$res_tiao=mysql_query($sqlt);   
	
	
	$sqlw=" select paydt as backday ,  htnum as title ,  money as  cost ,  `explain`  as memo , optname as operator , depart from  xinhu_custfina where type=1 and ispay=1 and paytype=2  and htid='$cid'";
   
	$re_w=mysql_query($sqlw);
	
	
	
	
	$sqlf="  select  paydt as backday ,  htnum as title , money as  cost , `explain`  as memo ,   t.feename as feenm, optname as operator , createname from  xinhu_custfee f left join xinhu_feetype t on f.type=t.id  where f.htid='$cid'  ";
	
	
	$re_f=mysql_query($sqlf);
	
	
	// 日期  riqi   发票类型 fpname  发票金额 fpmoney  操作人 optname  部门: bumen  摘要 :  zhaiyao
	
	$sql_fp=" select f.applydt as riqi,  s.fpname as fpname , f.money as fpmoney, optname  , a.deptname as bumen ,
 
 f.fullname as zhaiyao  from xinhu_fininfom f left join xinhu_admin a on f.optid=a.id left join xinhu_feelv s 
 
 on s.id=f.paytype where f.type=5 and f.comid='".$_SESSION['xinhu_companyid']."' and f.num in ('".$res['htbh']."') ";
	
	
	$res_fap=mysql_query($sql_fp);
	
	
	
		 
			 
$shsq="select f.money* v.felv as shui from xinhu_fininfom f left join xinhu_feelv v on f.paytype=v.id where f.type=5 and f.comid='".$_SESSION['xinhu_companyid']."' and f.num in ('".$res['htbh']."') ";
			 
//exit($shsq); 

$shui=0;			 
$ress=mysql_query($shsq);
			 
while($rowsh=mysql_fetch_array($ress))
{
   $shui+=$rowsh['shui']; 	
	 
	
}
		
	
	
	// print_r($res);exit;
?>


	
 <table width="680" border="0" align="center" cellspacing="0" cellpadding="0" id="ddd">
	<tbody><tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
				<tbody><tr>
					<td valign="middle"><div align="center"><strong class="style4">合同成本表</strong></div></td>
				</tr>
		  </tbody></table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" class="ListTable">
				<tbody><tr class="ListTrPrint">
					<td class="FontSmall_Bold" width="50%">&nbsp;签订日期：<?=$res['writeday']?></td>
					<td class="FontSmall_Bold" width="50%" style="text-align:right">编号：<?=$res['htbh']?></td>
				</tr>
			</tbody></table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" class="ListTable">
				<tbody><tr class="ListTrPrint">
			      	<td class="FontSmall" width="30%">&nbsp;客户：<?=$res['customer']?></td>
					<td class="FontSmall">&nbsp;合同开始：</td>
					<td class="FontSmall"><?=$res['start_day']?></td>
					<td align="right" class="FontSmall">合同结束</td>
			      	<td width="21%" class="FontSmall">：<?=$res['end_day']?></td>
				</tr>
				<tr class="ListTrPrint">
			      	<td class="FontSmall">&nbsp;合同类型：<?=$res['httype']?></td>
			      	<td class="FontSmall">&nbsp;</td>
		      	  <td class="FontSmall">&nbsp;</td>
			      	<td align="right" class="FontSmall">开票类型</td>
			      	<td class="FontSmall">&nbsp;：			      	  <?=$res['purchasebill']?></td>
				</tr>
				<tr class="ListTrPrint">
			      	<td class="FontSmall">&nbsp;调账：<?=number_format($res['tiao'],2)?></td>
					<td width="16%" class="FontSmall">&nbsp;外协：<?=$res['wai']?></td>
					<td width="17%" class="FontSmall">&nbsp;费用：<?=$res['cost']?></td>
					<td width="16%" class="FontSmall">&nbsp;税费：<?=$res['shui']?></td>
					<td class="FontSmall">&nbsp;总金额：<?=$res['htjer']?></td>
				</tr>
				<tr class="ListTrPrint">
					<td class="FontSmall">&nbsp;成本合计：<?=$res['cost']+$res['wai']+$res['shui']?></td>
				  	<td colspan="3" class="FontSmall">&nbsp;毛利率：<?=$res['maolilv']?>%</td>
				  	<td class="FontSmall">&nbsp;毛利：<?=number_format($res['maoli'],2)?></td>
			    </tr>
		  </tbody></table>
		</td>
	</tr>
		
		
		
	<!-- 调账  -->	
   	<tr>
		<td>
			<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tbody><tr>
					<td class="FontSmall_Bold" height="30">调账项目（小计：<?=$res['tiao']?>）</td>
				</tr>
			</tbody></table>
		</td>
	</tr>


	<tr>
		<td>
			
			<table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" class="ListTable">
				<tbody>

				<tr class="ListTrPrint">
				   	<td class="FontSmall_Bold" align="center" width="10%">日期</td>
					<td class="FontSmall_Bold" align="center" width="16%">单号</td>
					<td class="FontSmall_Bold" align="center" width="14%">调账类型</td>
					<td class="FontSmall_Bold" align="center" width="10%">金额</td>
					<td class="FontSmall_Bold" align="center" width="25%">摘要</td>
					<td class="FontSmall_Bold" align="center" width="10%">经办人</td>
					<td class="FontSmall_Bold" align="center" width="15%">部门</td>
				</tr>
				
				<?php if(isset($res_tiao)){?>
				  <?php while($res_t =mysql_fetch_array($res_tiao)){ ?>	
					
				<tr class="ListTrPrint">
				   	<td class="FontSmall_Bold" align="center" width="15%"><?=explode(' ',$res_t['backday'])[0]?></td>
					<td class="FontSmall_Bold" align="center" width="16%"><?=$res_t['title']?></td>
				<!-- 0未定义（其他收入/支出/调账） ，  3 采购调账 ,  4 外协调账 -->
					<td class="FontSmall_Bold" align="center" width="14%">

					 <?php
						
					  switch($res_t['paytype'])
					  {
						  case 3:
							  echo "采购调账";
							break;
						  case 4:
							 echo "外协调账";
							break;
							  
						  case 0:
							 echo "其他";
							break;  
							  
					  }
						
						?>

					</td>


					<td class="FontSmall_Bold" align="center" width="10%">
						
					<?php 
						if($res_t['type']>0)
						{
							echo '-'. $res_t['money'];
						}
						else
						{
							echo '+'.$res_t['money'];	
						}
					?>	
						
					</td>
					<td class="FontSmall_Bold" align="center" width="25%"><?=$res_t['explain']?></td>
					<td class="FontSmall_Bold" align="center" width="10%"><?=$res_t['optname']?></td>
					<td class="FontSmall_Bold" align="center" width="15%"><?=$res_t['depart']?></td>
				</tr>

				  <?php }?>	 		
					
			    <?php } else {?>	
				<tr class="ListTrPrint">
					<td class="FontSmall" align="center" colspan="7">没有调账</td>
				</tr>			
				<?php }?>	

		  </tbody></table>	

		</td>
	</tr>		
	
	<!-- END OF 调账  -->	
	
		
		
		
	<!-- 外协  -->
  
	<tr>
		<td>
			<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tbody><tr>
					<td class="FontSmall_Bold" height="30">外协项目（小计：<?=$res['wai']?>）</td>
				</tr>
			</tbody></table>
		</td>
	</tr>



	<tr>
		<td>
			
			<table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" class="ListTable">
				<tbody>

				<tr class="ListTrPrint">
				   	<td class="FontSmall_Bold" align="center" width="10%">日期</td>
					<td class="FontSmall_Bold" align="center" width="16%">单号</td>
					<td class="FontSmall_Bold" align="center" width="14%">费用类型</td>
					<td class="FontSmall_Bold" align="center" width="10%">金额</td>
					<td class="FontSmall_Bold" align="center" width="25%">摘要</td>
					<td class="FontSmall_Bold" align="center" width="10%">经办人</td>
					<td class="FontSmall_Bold" align="center" width="15%">部门</td>
				</tr>


			<?php if(isset($re_w)){?>
			 <?php while($res_wai =mysql_fetch_array($re_w)){ ?>	
				<tr class="ListTrPrint">
				   	

				   <td class="FontSmall_Bold" align="center" width="15%"><?=explode(' ',$res_wai['backday'])[0]?></td>
					<td class="FontSmall_Bold" align="center" width="16%"><?=$res_wai['title']?></td>
			 
					<td class="FontSmall_Bold" align="center" width="14%">
						外协付款						
					</td>

					<td class="FontSmall_Bold" align="center" width="10%">						
					<?=$res_wai['cost']?>						
					</td>

					<td class="FontSmall_Bold" align="center" width="25%"><?=$res_wai['memo']?></td>
					<td class="FontSmall_Bold" align="center" width="10%"><?=$res_wai['operator']?></td>
					<td class="FontSmall_Bold" align="center" width="15%"><?=$res_wai['depart']?></td>

				</tr>

			 <?php }?>	 		
					
			    <?php } else {?>
				
				<tr class="ListTrPrint">
					<td class="FontSmall" align="center" colspan="7">没有外协</td>
				</tr>

			  <?php }?>	


				
		  </tbody></table>	

		</td>
	</tr>
	
	<!-- end of 外协 -->	
		
		
		
		
	<!--start of 费用  -->
		
		
		
	<tr>
		<td>
			<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tbody><tr>
					<td class="FontSmall_Bold" height="30">费用（小计：<?=$res['cost']?>）</td>
				</tr>
			</tbody></table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" class="ListTable">
				<tbody>
	

				
				<tr class="ListTrPrint">
				   	<td class="FontSmall_Bold" align="center" width="10%">日期</td>
					<td class="FontSmall_Bold" align="center" width="16%">单号</td>
					<td class="FontSmall_Bold" align="center" width="14%">费用类型</td>
					<td class="FontSmall_Bold" align="center" width="10%">金额</td>
					<td class="FontSmall_Bold" align="center" width="25%">摘要</td>
					<td class="FontSmall_Bold" align="center" width="10%">经办人</td>
					<td class="FontSmall_Bold" align="center" width="15%">报销人</td>
				</tr>			


				<?php if(isset($re_f) and count($re_f)>0 ){?>
				
				 <?php while($res_fee =mysql_fetch_array($re_f)){ ?>	

				<tr class="ListTrPrint">

				   <td class="FontSmall_Bold" align="center" width="15%"><?=explode(' ',$res_fee['backday'])[0]?></td>
					<td class="FontSmall_Bold" align="center" width="16%"><?=$res_fee['title']?></td>
			 
					<td class="FontSmall_Bold" align="center" width="14%">
						<?=$res_fee['feenm']?>
					</td>

					<td class="FontSmall_Bold" align="center" width="10%">						
					<?=$res_fee['cost']?>						
					</td>

					<td class="FontSmall_Bold" align="center" width="25%"><?=$res_fee['memo']?></td>
					<td class="FontSmall_Bold" align="center" width="10%"><?=$res_fee['operator']?></td>
					<td class="FontSmall_Bold" align="center" width="15%"><?=$res_fee['createname']?></td>


				</tr>
				

				<?php }?>	 		
			    <?php } else {?>

				<tr class="ListTrPrint">
					<td class="FontSmall" align="center" colspan="7">没有费用</td>
				</tr>

				  <?php }?>	


				
		  </tbody></table>
		</td>
	</tr>	
		
	<!-- end of 费用 -->
		
		
	<!--  开票 -->	
		
		
		
		<tr>
		<td>
			<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tbody><tr>
					<td class="FontSmall_Bold" height="30">纳税金额（小计：<?=$shui?>）</td>
				</tr>
			</tbody></table>
		</td>
	</tr>



	<tr>
		<td>
			
			<table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" class="ListTable">
				<tbody>

				<tr class="ListTrPrint">
				   	<td class="FontSmall_Bold" align="center" width="10%">日期</td>
					<td class="FontSmall_Bold" align="center" width="16%">单号</td>
					<td class="FontSmall_Bold" align="center" width="14%">税务类型</td>
					<td class="FontSmall_Bold" align="center" width="10%">开票金额</td>
					<td class="FontSmall_Bold" align="center" width="25%">摘要</td>
					<td class="FontSmall_Bold" align="center" width="10%">经办人</td>
					<td class="FontSmall_Bold" align="center" width="15%">部门</td>
				</tr>


			<?php if(isset($res_fap)){?>
			 <?php while($fprow =mysql_fetch_array($res_fap)){ ?>	
					
			 
					
				<tr class="ListTrPrint">
				   	
						<td class="FontSmall_Bold" align="center" width="10%"><?=$fprow['riqi']?></td>
					<td class="FontSmall_Bold" align="center" width="16%"><?=$res['htbh']?></td>
					<td class="FontSmall_Bold" align="center" width="14%"><?=$fprow['fpname']?></td>
					<td class="FontSmall_Bold" align="center" width="10%"><?=$fprow['fpmoney']?></td>
					<td class="FontSmall_Bold" align="center" width="25%"><?=$fprow['zhaiyao']?></td>
					<td class="FontSmall_Bold" align="center" width="10%"><?=$fprow['optname']?></td>
					<td class="FontSmall_Bold" align="center" width="15%"><?=$fprow['bumen']?></td>
				</tr>	
				 

				</tr>

			 <?php }?>	 		
					
			    <?php } else {?>
				
				<tr class="ListTrPrint">
					<td class="FontSmall" align="center" colspan="7">没有外协</td>
				</tr>

			  <?php }?>	


				
		  </tbody></table>	

		</td>
	</tr>
		
		
		
		
	<!-- end of 开票 -->	
		
		
	<tr>
		<td height="3"></td>
	</tr>
	<tr>
		<td align="center">
			<table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" class="ListTable">
				<tbody>
				<tr class="ListTrPrint">
			      	<td class="FontSmall_Bold">&nbsp;备注</td>
					<td class="FontSmall" height="80px">&nbsp;</td>
				</tr>
		  </tbody></table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" class="ListTable">
				<tbody><tr class="ListTrPrint">
			      	<td class="FontSmall" width="25%">领导审核：</td>
			      	<td class="FontSmall" width="25%">财务负责人：</td>
			      	<td class="FontSmall" width="25%">部门负责人：</td>
			      	<td class="FontSmall" width="25%">客户经理：</td>
				</tr>
			</tbody></table>
		</td>
	</tr>	
		
		
		
	
	<tr>
		<td height="3"></td>
	</tr>
	
</tbody>
	
</table>
	
	
	
	
	
<table width="680" border="0" align="center" cellspacing="0" cellpadding="0">
	<tr id="printTr">
		<td>
			<table width="98%" border="0" cellspacing="1" cellpadding="1" align="center">
				<tbody><tr>
					<td>
						<input type="button" id="printButton" class="Button" value="开始打印 " onclick="aa();">
						<input type="button" id="cancelButton" class="Button" value=" 退 出 " onclick="doCancel();">
					</td>
				</tr>
			</tbody></table>
		</td>
	</tr>
</table>	
	
<script language="javascript">

function aa(){
    $("#ddd").jqprint();
}
	
function doCancel()
{
	window.close();	
}
	
</script>	

</body>
</html>
