
<style>

	.ttt{
   
   display: block; 
   background: #5bc0de; 
   width:100%;
   height: 30px;
   text-align: center;
   font-size: 18px;
   color: #fff;
   margin:0 auto 10px auto;
    
    padding-top: 2px;
    padding-bottom: 2px;


   border-top:1px solid #ccc;
   border-bottom: 1px solid #ccc;


}

</style>

 
<script src="js/WdatePicker.js"></script>


<?php 

 $base=realpath(dirname(__FILE__).'/../../../'); 
 include($base . "/config/conpass.php");		
 $conn = mysql_connect($server,$dbuser,$dbpass);	

 mysql_select_db($db_base, $conn);

 
 // 营业额
 $sql=" select  IFNULL(sum(c.money),0) as htjer

from xinhu_custract c left join (select distinct htid ,type from xinhu_custfina where type=0 and comid='". $_SESSION['xinhu_companyid']."') a 

on c.id=a.htid where c.type=0 and c.comid='". $_SESSION['xinhu_companyid']."' and a.type=0 ";  //exit($sql);
 
 $sqqt="select id from xinhu_custract c where 1=1 and c.comid='". $_SESSION['xinhu_companyid']."' ";	 
 
  $htjer=0;
 $res=mysql_query($sql);  //print_r($res); //exit("wtf");

	while($arr=mysql_fetch_array($res))
	{
		//print_r($arr);
	  $htjer+=$arr['htjer'];
	}


// 调账:

$sql="select 
(select   IFNULL(sum(money),0)  from xinhu_custfinaa  where type=0 and paytype=0 and   comid='". $_SESSION['xinhu_companyid']."'  )
- 
( select   IFNULL(sum(money),0)  from xinhu_custfinaa  where type=1 and paytype=0  and   comid='". $_SESSION['xinhu_companyid']."'  )  as dzje"; 
$res=mysql_query($sql);
if($res)
$arr=mysql_fetch_array($res);
$dzje=$arr[0];

 // 其他收入

 $sql="select IFNULL(sum(money),0) as qtsr  from xinhu_custfina where paytype=3 and ispay=1  and type=0 and   comid='". $_SESSION['xinhu_companyid']."' "; 

 $res=mysql_query($sql);
if($res)
 $arr=mysql_fetch_array($res);	
 $qtsr=$arr[0];	


 //采购支出
 $sql="select IFNULL(sum(money),0) from  xinhu_custfina where type=1 and ispay=1 and paytype=1 and  comid='". $_SESSION['xinhu_companyid']."' ";
 $res=mysql_query($sql);
if($res) 
 $arr=mysql_fetch_array($res);
 $ckzc=$arr[0];
	 
	 
 // 外协支出
 $sql="select IFNULL(sum(money),0) from  xinhu_custfina where type=1 and ispay=1 and paytype=2 and  comid='". $_SESSION['xinhu_companyid']."' ";
$res=mysql_query($sql);
if($res) 
 $arr=mysql_fetch_array($res);
 $wxzc=$arr[0];

 


 // 采购调账:0.00

$sql="select ( (select IFNULL(sum(money),0) from  xinhu_custfinaa where paytype=1 and type=0 and  comid='". $_SESSION['xinhu_companyid']."'  ) - (select IFNULL(sum(money),0) from  xinhu_custfinaa where paytype=1 and type=1 and  comid='". $_SESSION['xinhu_companyid']."'  )  )  as  cgtz";
//exit($sql);
 $res=mysql_query($sql);
if($res)
 $arr=mysql_fetch_array($res);
$cgtz=$arr[0];



// 外协调账:0.00

$sql="select ( (select IFNULL(sum(money),0) from  xinhu_custfinaa where paytype=2 and type=0 and  comid='". $_SESSION['xinhu_companyid']."'  ) - (select IFNULL(sum(money),0) from  xinhu_custfinaa where paytype=2 and type=1 and  comid='". $_SESSION['xinhu_companyid']."'  )  )  as  wxtz";

$res=mysql_query($sql);
if($res)
$arr=mysql_fetch_array($res);
$wxtz=$arr[0];



// 合同费用 : 

$sql="select IFNULL(sum(money),0) from  xinhu_custfee c where  1=1 and htid in ($sqqt) "; //exit($sql);

$res=mysql_query($sql);
if($res)
$arr=mysql_fetch_array($res);

$qtzc=$arr[0];


//公司报销费用：

$sql="select ifnull(sum(money),0) as baoxiao from xinhu_fininfom where comid='".$_SESSION['xinhu_companyid']."' and `status` = 1 and type in (0,1)  order by id desc";
$res=mysql_query($sql);
$arr=mysql_fetch_array($res);
$baoxiao=$arr[0];




$shui=0;

$sqshui="  select f.money* v.felv as shui from xinhu_fininfom f left join xinhu_feelv v on f.paytype=v.id

where f.type=5 and inorout=0 and f.comid='". $_SESSION['xinhu_companyid']."'  ";


//exit($sqshui);


 $ress=mysql_query($sqshui);

 
 while($shar=mysql_fetch_array($ress))
 {
	 $shui+=$shar['shui'];
	 
 }

//echo $shui; exit('wtf');


// 收入小计= 合同金额 + 调账金额 + 其他收入
// $srxj =$htjer+$dzje+$qtsr;

// 2020年05月30日14:16:37
// 收入小计= 合同金额 + 其他收入
$srxj =$htjer+$qtsr;

// echo ($htjer.' '.$dzje.' '.$qtsr);exit('wtf');
 
// 支出小计= 合同费用  + 采购支出  +  外协支出  + 税  + 公司日常 
$zcxj =$qtzc+ $ckzc+ $wxzc + $shui + $baoxiao ;


$lrun=$srxj-$zcxj;

 //print_r($res);exit;
if($srxj!=0)
$feelv=$lrun/$srxj;
else
$feelv=0;

//echo $feelv; exit("wtf");

// $feelv=substr($feelv,0,4);

$feelv=number_format($feelv,2);


?>





<script>

//	4.利润表
	
function searchbtn_4()	
{
	
	 
	
	var url="index.php";  //alert(url);
 
	var start_day=$("#start_day_4").val();
	var end_day=$("#end_day_4").val();
	
	var das={'search':'four','start_day':start_day,'end_day':end_day};
	
	
	 $.post(url,das,function(res){
		 
		 
		 
		 
		 tarr=res.split("$");
		 
		 
		 
		 $("#s0").html(tarr[0]);
		 $("#s1").html(tarr[1]);
		 
		 $("#s2").html(tarr[2]);
		 $("#s3").html(tarr[3]);
		 
		 $("#s4").html(tarr[4]);
		 $("#s5").html(tarr[5]);
		 
		 $("#s6").html(tarr[6]);
		 $("#s7").html(tarr[7]);
		 
		 $("#s8").html(tarr[8]);
		 $("#s9").html(tarr[9]);
		 
		 $("#s10").html(tarr[10]);
		 $("#s11").html(tarr[11]);
		 $("#s12").html(tarr[12]);
		  $("#s13").html(tarr[13]);
		 
		// alert(tarr[12]);
	     
	 
	 });
	
}
	
	
	
function clear_txt4()
{
	 
	
	$("#start_day_4").val("");
	$("#end_day_4").val("");
	 
	
}	

	
function daochu4()	
{
	
	var url="daochu.php";  
	
	var start_day=$("#start_day_4").val();
	var end_day=$("#end_day_4").val();
	
    url=url+"?dao=four&start_day="+start_day+"&end_day="+end_day;	
	
	
	window.location=url;
	
	
}	
	
	
	
	
</script>

<style>

 .ttt .hzu li {
  display:inline;
  margin-left:10px;
  padding:5px;
 

}
	
</style>


<div style="margin-bottom:5px;">
	<table width="100%">
	<tr>
		<td width="6%" nowrap id="tdleft" style="padding-right:10px;">开始日期</td>
		
		<td width="12%" style="padding-left:10px">
	
	  <input type="text" id="start_day_4" name="start_day_4" style="width:160px"  autocomplete="off"
                       onClick="WdatePicker({dateFmt: 'yyyy-MM-dd'})" class="form-control" />
		</td>
		
		<td width="6%" nowrap id="tdleft" style="padding-left:10px;">结束日期</td>
		<td width="12%" style="padding-left:10px">
			
	  <input type="text" id="end_day_4" name="end_day_4" style="width:160px"  autocomplete="off"
                       onClick="WdatePicker({dateFmt: 'yyyy-MM-dd'})" class="form-control" />
		</td>
		
		
		<td width="3%" style="padding-left:10px">
			<div style="white-space:nowrap">
			
				<button style="border-right:0;border-top-right-radius:0;border-bottom-right-radius:0" class="btn btn-default" onclick="searchbtn_4()" type="button">搜索</button>
				
	
			</div>
		</td>
		
		
		
		<td width="11%">
		<button style="border-right:0;border-top-right-radius:0;border-bottom-right-radius:0" class="btn btn-default" onclick="clear_txt4()" type="button">清空</button> <button class="btn btn-default"   id="daobtn"  onclick="daochu4()" type="button">导出 <i class="icon-angle-down"></i></button>			 
		</td>
		
		
		
		<td  width="50%" style="padding-left:10px">&nbsp;</td>
	
		<td width="0%" align="right" nowrap id="tdright_{rand}">
		
	  </td>
	</tr>
	</table>
</div>





   <table class="table table-striped table-bordered table-hover"  width=100%  id="contactTbl"  >
    
      <tr>
		  <th width="58%" style="width:35%"> <div class="ttt">利润 &nbsp; : &nbsp; <span id="s0"><?=$lrun?></span></div></th>       
	    <th width="42%" style="width:35%"> <div class="ttt"> 利润率&nbsp; : &nbsp;<span id="s1"><?=number_format($feelv*100,2)?>%</span> </div> </th>     
     </tr>
      <tr>
		  <th style="width:20%"> <div class="ttt">收入小计&nbsp; : &nbsp;<span id="s2"><?=$srxj?></span> </div></th> 
       <th style="width:40%"> <div class="ttt"> <ul class="hzu"><li>支出小计</li><li>:</li><li><span id="s3"><?=$zcxj?></span></li></ul> </div></th>  
      
      </tr>
       
    <tr>
       <td> 营业额
		   <span id='htmnyall'><span id="s4"><?=$htjer?></span></td> 
		<td><ul><li>合同费用:<span id="s11">
		  <?=$qtzc?>
		</span></li>
			
			<li>纳税费用:<span id="s13">
		      <?=$shui?>
		</span></li>
			
		  <li> 采购支出:<span id="s7"><?=$ckzc?></li>
	    <li>外协支出:<span id="s8"><?=$wxzc?></span></li></ul> </td>  
   
      </tr>
       
     <!--<tr>-->
     <!--  <td>合同调账: <span id="s6"> <?=$dzje?></td> -->
		  
     <!--  <td>-->
		   
		   <!--<ul>-->
			  <!-- <li>采购调账 :<span id="s9"><?=$cgtz?></span></li>-->
			  <!-- <li>外协调账 :<span id="s10"><?=$wxtz?></span></li>-->
			   <!-- 0|报销单,1|出差报销-->
			 
			   
		   <!--</ul> </td>  -->
   
     <!-- </tr>   -->
       
       
         <tr>
       <td>		    其他收入
	       <span id='htmnyall'><span id="s5">
		    <?=$qtsr?>
	       </span></span></td> 
			
			 
		 <td>公司常用支出 :<span id="s12">
		   <?=$baoxiao?>
		 </span></td>  
     
      </tr>
  
   </table>

 

