

<script src="js/WdatePicker.js"></script>





<script>

//	5 合同应收表
	
function searchbtn_5(page)	
{
	
	//var url="webmain/flow/page/rock_page_mymx.php";  //alert(url);
	var url="index.php";
	var key=$("#key_5").val();
	var start_day=$("#start_day_5").val();
	var end_day= $("#end_day_5").val();
	
	var das={'search':'five','key':key,'start_day':start_day,'end_day':end_day,'page':page};
	
	 $.post(url,das,function(res){
		 
		  // alert(res)
		 
		 $("#ying_tab").find('tr').each(			 
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
		 
	   $("#top_y").after(tarr[0]);
		 
	   $("#count_y").html(tarr[2]);
		 
	   $("#qkhj").html(tarr[1]);	 
		 
	   $("#pager_y").html(tarr[3]);
		 
	  
	 //  
	   
	 
	 });
	
}
	
$(function(){
	
	searchbtn_5(1);
	
})	
	

function clear_txt5()
{
	
	$("#start_day_5").val("");
	$("#end_day_5").val("");
	$("#key_5").val("");
	
}
	
	
function daochu5()	
{
	
	var url="daochu.php";  
	var key=$("#key_5").val();
	var start_day=$("#start_day_5").val();
	var end_day=$("#end_day_5").val();
	
    url=url+"?dao=five&start_day="+start_day+"&end_day="+end_day;	
	
	
	window.location=url;
	
	
}	
		
		
	
</script>


 

<table class="table table-striped table-bordered table-hover" style="width:100%" >
	<tr>
		 
		<td width="13%" >
			<input class="form-control" style="width:160px" id="key_5" placeholder="客户名称">
			
			
			
		</td>
		
		<td width="9%" align="right">起始日期</td>
		
		<td width="16%">
			  
		 <input type="text" id="start_day_5" name="start_day_5" style="width:160px"   autocomplete="off"
                       onClick="WdatePicker({dateFmt: 'yyyy-MM-dd'})" class="form-control" />
		 </td>
		
	 
		<td width="6%" align="center">结束日期</td>
		 <td width="13%"><input type="text" id="end_day_5" name="end_day_5"   autocomplete="off"
                       onClick="WdatePicker({dateFmt: 'yyyy-MM-dd'})" style="width:160px" class="form-control"/></td>
		 
		
		<td colspan="3"  >
			<div style="white-space:nowrap">
			
				<button style="border-right:0;border-top-right-radius:0;border-bottom-right-radius:0" class="btn btn-default" onclick="searchbtn_5(1)" type="button">搜索</button>
				
				
				
				<button style="border-right:0;border-top-right-radius:0;border-bottom-right-radius:0" class="btn btn-default" onclick="clear_txt5()" type="button">清空</button>
				
				
				<button class="btn btn-default"   id="daobtn"  onclick="daochu5()" type="button">导出 <i class="icon-angle-down"></i></button>
				
	
			</div>
		</td>
		 
	
		 
	</tr>
	<tr>
	  <td align="right" >合同单数</td>
	  <td id="count_y">  </td>
	  <td align="right">应收合计</td>
	  <td id="qkhj" colspan="3">  </td>
	 
	   
   </tr>
	</table>


<div style="margin-bottom:5px;">
<table class="table table-striped table-bordered table-hover" id="ying_tab"  >
   	
	<tr id="top_y">  

   <td>合同编号</td> 
   <td>签订日期</td>
   <td>客户名称</td>	
   <td>合同金额</td>	
   <td>已 收</td>	

   <td>调 账</td>     
   <td>客户经理</td> 
   <td>应 收</td> 

	</tr>

	
	
	
	
	

 	
 
</table>
</div>




<div style="text-align: center;" id="pager_y">
</div>

