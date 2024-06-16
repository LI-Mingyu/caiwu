
 


<script src="js/WdatePicker.js"></script>


<?php 

// exit(realpath(dirname(__FILE__).'/../../'));

 $base=realpath(dirname(__FILE__).'/../../../'); 
 include($base . "/config/conpass.php");		
 $conn = mysql_connect($server,$dbuser,$dbpass); // exit("od");

 mysql_select_db($db_base, $conn);

 
 

$sql="  
select sum(htmoney) as htmoney,  sum(tiao) as tiao, sum(htiao) as htiao, sum(yishou) as yishou , sum(daishou) as daishou ,   mon from (

select  IFNULL(sum(c.money),0) as htmoney ,  

date_format(c.signdt,'%m') as mon   ,

( select IFNULL(sum(money),0)  from xinhu_custfinaa where paytype=0 and type=0  and htid=c.id   )

- ( select IFNULL(sum(money),0)  from xinhu_custfinaa where paytype=0 and type=1   and htid=c.id     )

as tiao  ,

 IFNULL(sum(c.money),0) +  ( select IFNULL(sum(money),0)  from xinhu_custfinaa where paytype=0 and type=0  and htid=c.id   )

- ( select IFNULL(sum(money),0)  from xinhu_custfinaa where paytype=0 and type=1   and htid=c.id     )
 as htiao,
 
 (select IFNULL(sum(money),0) from xinhu_custfina where  type=0 and  ispay=1       and htid=c.id   ) as yishou ,
 
 
  IFNULL(sum(c.money),0) +  ( select IFNULL(sum(money),0)  from xinhu_custfinaa where paytype=0 and type=0  and htid=c.id   )

- ( select IFNULL(sum(money),0)  from xinhu_custfinaa where paytype=0 and type=1   and htid=c.id     ) -  (select IFNULL(sum(money),0) from xinhu_custfina where  type=0 and  ispay=1       and htid=c.id   )  as daishou 
 

from xinhu_custract c  where  c.type=0  and date_format(c.signdt,'%Y')= date_format(now(),'%Y') and  c.comid='". $_SESSION['xinhu_companyid']."' GROUP BY  id 

) as a GROUP BY a.mon ";


 $res=mysql_query($sql);  // exit($sql);

 //print_r($res);exit;


?>



<script>

//	1.合同汇总表
	
function searchbtn_1()	
{
	
	 
	
	var url="index.php";  //alert(url);
	var key_1=$("#key_1").val();
	var start_day_1=$("#start_day_1").val();
	var end_day_1=$("#end_day_1").val();
	
	var das={'search':'one','key':key_1,'start_day':start_day_1,'end_day':end_day_1};
	
	 $.post(url,das,function(res){
		 
		 // alert(res)
		 
		 $("#hzontbl").find('tr').each(
			 
			 function(){
				 
				if($(this).attr('id')==null)				 
				 {
					 $(this).remove();
				 }
				 
			 }
		 
		 );
		 
		 
		 $("#trhz").find("td").each(function(){
			  
			  if($(this).attr('id')==null)
			  {
				  
				 $(this).find('p').html("");
			  }
			  
			  
		  });
		 
		 tarr=res.split("$");
		 
		 $("#top2").after(tarr[0]);
		 
		 $("#htmnyall").html(tarr[1]);
		 $("#tiao").html(tarr[2]);
		 $("#htiao").html(tarr[3]);
		 $("#yishou").html(tarr[4]);
		 $("#daishou").html(tarr[5]);
		  
	 
	 });
	
}
	
function daochu()	
{
	
	var url="daochu.php";  //alert(url);
	//var key_1=$("#key_1").val();
	var start_day_1=$("#start_day_1").val();
	//var end_day_1=$("#end_day_1").val();
	
    url=url+"?dao=one&start_day="+start_day_1;
	
	
	
	window.location=url;
	
	
	
	
}
 

function clear_txt()
{
	 
	
	$("#start_day_1").val("");
	 
	 
	
}
	
</script>

<style>
 
	.big{
	 font-size: 14px;
	 font-weight: bold;	 	
	 text-align: center;
	}	
	
</style>

<div style="margin-bottom:5px;">
	<table width="100%">
	<tr>
		<td width="4%"  align="right" style="padding-left:10px">年份</td>
		
		<td  style="padding-left:10px;width:165px;">
			
			  <input type="text" id="start_day_1" name="start_day_1" style="width:160px" autocomplete="off"
                       onClick="WdatePicker({dateFmt: 'yyyy'})" class="form-control" />
			
	
			
		</td>
		<td width="3%" style="padding-left:10px" >
			
			<button style="border-right:0;border-top-right-radius:0;border-bottom-right-radius:0" class="btn btn-default" onclick="clear_txt()" type="button">清空</button>
		
		
		</td>
		
		
		<td width="4%"  style="padding-left:10px"><button style="border-right:0;border-top-right-radius:0;border-bottom-right-radius:0" class="btn btn-default" onclick="searchbtn_1()" type="button">搜索</button></td>
		
						
	  <td width="62%"   style="padding-left:10px">&nbsp;</td>
	
		<td width="15%"  align="right" nowrap id="tdright_{rand}">
			<button class="btn btn-default"   id="daobtn"  onclick="daochu()" type="button">导出 <i class="icon-angle-down"></i></button> 
		</td>
		
		
		
	</tr>
	</table>
</div>




<table width="100%" class="table table-striped table-bordered table-hover" id="hzontbl" >
  
	<tr style="background: #f5f5f4; " id="top1">
    <td width="323"  rowspan="2" align="center" class="big" style="padding-top:40px;" ><p>月份</p></td>
    <td height="39" colspan="3" align="center" class="big" style="width:50px;padding-top:15px;"><p> 收入 </p></td>
    <td  width="219" rowspan="2" align="center" class="big" style="padding-top:40px;"><p>已收金额</p></td>
    <td  width="169" rowspan="2" align="center" class="big" style="padding-top:40px;"><p>应收金额</p></td>
   </tr>

  <tr id="top2">
    <td width="245"  valign="middle"   class="big"><p>合同金额</p></td>
    <td width="246"  valign="middle" class="big"  ><p>调账金额</p></td>
    <td width="219"  valign="middle" class="big"  ><p>合同+调账</p></td>
  </tr>



<?php 

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
	  
	
	
  for($k=1;$k<=count($arr);$k++){	
?>
  <tr >
    <td  valign="middle"><p><?=$arr[$k]['mon']?></p></td>
    <td  valign="middle"><p><?=$arr[$k]['htmoney']?></p></td>
   
    <td  valign="middle"><p><?=$arr[$k]['tiao']?></p></td>
    <td  valign="middle"><p><?=$arr[$k]['htiao']?></p></td>
    <td  valign="middle"><p><?=$arr[$k]['yishou']?></p> </td>
    <td style="width:12%" valign="middle"><p><?=$arr[$k]['daishou']?></p></td>
  </tr>
<?php }?>	
 

	<tr id="trhz"  >
		<td  id="hz" valign="middle"><p>汇总:</p></td>
		<td  valign="middle"><p id="htmnyall"><?=number_format($htmnyall,2)?></p></td>

		<td  valign="middle"><p id="tiao"><?=number_format($tiao,2)?></p></td>
		<td  valign="middle"><p id="htiao"><?=number_format($htiao,2)?></p></td>
		<td  valign="middle"><p id="yishou"><?=number_format($yishou,2)?></p></td>
		<td style="width:12%" valign="middle"><p id="daishou"><?=number_format($daishou,2)?></p></td>
	  </tr>

 
</table>
 
 

