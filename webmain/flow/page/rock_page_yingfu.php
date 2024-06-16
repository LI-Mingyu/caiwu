

<script src="js/WdatePicker.js"></script>

 

<script>

//	7 合同应付款
	
function searchbtn_6(page)	
{
	
	//var url="webmain/flow/page/rock_page_mymx.php";  //alert(url);
	var url="index.php";
	var key=$("#key_7").val();
	var start_day=$("#start_day_7").val();
	var end_day= $("#end_day_7").val();
	
	var das={'search':'seven','key':key,'start_day':start_day,'end_day':end_day,'page':page};
	
	 $.post(url,das,function(res){
		 
		  // alert(res)
		 
		 $("#yingfu_tab").find('tr').each(			 
			 function(){				 
				if($(this).attr('id')==null)				 
				 {
					 $(this).remove();
				 }				 
			 }		 
		 );	 
		 
		 
		 tarr=res.split("$");
		 
		// alert(tarr[0]);
		 
		// alert(tarr[1]);		 
		 
	   $("#top_yf").after(tarr[0]);
		 
	   $("#count_yf").html(tarr[1]);
		 
	   $("#qkhj_yf").html(tarr[2]);	 
		 
	   $("#pager_yf").html(tarr[3]);
		 
	  
	 //  
	   
	 
	 });
	
}
	
$(function(){
	
	searchbtn_6(1);
	
})	



function clear_txt7()
{
	
	$("#start_day_7").val("");
	$("#end_day_7").val("");
	$("#key_7").val("");
	
}	
	
	
function daochu7()	
{
	
	var url="daochu.php";  
	var key=$("#key_7").val();
	var start_day=$("#start_day_7").val();
	var end_day=$("#end_day_7").val();
	
    url=url+"?dao=seven&start_day="+start_day+"&end_day="+end_day;	
	
	
	window.location=url;
	
	
}		
		
	
	
</script>


 

<table class="table table-striped table-bordered table-hover" style="width:100%" >
	<tr>
		 
		<td width="13%" >
			<input class="form-control" style="width:160px" id="key_7" placeholder="客户名称">			
		</td>
		
		<td width="9%" align="right">起始日期</td>
		
		<td width="16%">
			
		 <input type="text" id="start_day_7" name="start_day_7" style="width:160px"    autocomplete="off"
                       onClick="WdatePicker({dateFmt: 'yyyy-MM-dd'})" class="form-control" />
		 </td>
		
	 
		<td width="6%" align="center">结束日期</td>
		 <td width="13%"><input type="text" id="end_day_7" name="end_day_7"      autocomplete="off"
                       onClick="WdatePicker({dateFmt: 'yyyy-MM-dd'})" style="width:160px" class="form-control"/></td>
		 
		
		<td colspan="3"  >
			<div style="white-space:nowrap">
			
				<button style="border-right:0;border-top-right-radius:0;border-bottom-right-radius:0" class="btn btn-default" onclick="searchbtn_6(1)" type="button">搜索</button>
				
				<button class="btn btn-default"   id="daobtn"  onclick="daochu7()" type="button">导出 <i class="icon-angle-down"></i></button>
				
				<button style="border-right:0;border-top-right-radius:0;border-bottom-right-radius:0" class="btn btn-default" onclick="clear_txt7()" type="button">清空</button>
				
	
			</div>
		</td>
		 
	
		 
	</tr>
	<tr>
	  <td align="right" >合同单数</td>
	  <td id="count_yf">  </td>
	  <td align="right">欠款合计</td>
	  <td id="qkhj_yf" colspan="3">  </td>
	 
	   
   </tr>
	</table>


<div style="margin-bottom:5px;">
	
<table class="table table-striped table-bordered table-hover" id="yingfu_tab"  >
	
	<!-- 合同编号	签订日期	出租方	总额	已付	调账	欠款	经办人	备注  -->
   	
	<tr id="top_yf">  

   <td>合同编号</td> 
   <td>签订日期</td>
   <td>客户名称</td>	
   <td>合同金额</td>	
   <td>已 付</td>	

   <td>调 账</td>  
   <td>欠 款</td>  
   <td>经办人</td> 
   <td>备 注</td> 

	</tr>
 	
 
</table>
</div>




<div style="text-align: center;" id="pager_yf">
</div>

