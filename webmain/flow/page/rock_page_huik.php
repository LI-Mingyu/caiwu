

<script src="js/WdatePicker.js"></script>




<script>

//	6. 合同回款一览表
	
function searchbtn(page)	
{
	
	//var url="webmain/flow/page/rock_page_mymx.php";  //alert(url);
	var url="index.php";
	var key=$("#key_6").val();
	var start_day=$("#start_day_6").val();
	var end_day= $("#end_day_6").val();
	
	var das={'search':'six','key':key,'start_day':start_day,'end_day':end_day,'page':page};
	
	 $.post(url,das,function(res){
		 
		  // alert(res)
		 
		 $("#tab_hk").find('tr').each(			 
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
		 
	   $("#top_hk").after(tarr[0]);
	  
	   $("#hkhj").html(tarr[1]);	  
		 
	   $("#count_hk").html(tarr[2]);	
	 	 
	   $("#pager_hk").html(tarr[3]);
		 
	  
	 //  
	   
	 
	 });
	
}
	
$(function(){
	
	searchbtn(1);
	
})	
	
	

function clear_txt6()
{
	
	$("#start_day_6").val("");
	$("#end_day_6").val("");
	$("#key_6").val("");
	
}	
	
	
	
function daochu6()	
{
	
	var url="daochu.php";  
	var key=$("#key_6").val();
	var start_day=$("#start_day_6").val();
	var end_day=$("#end_day_6").val();
	
    url=url+"?dao=six&start_day="+start_day+"&end_day="+end_day;	
	
	
	window.location=url;
	
	
}		
	
	
		
	
</script>


<table class="table table-striped table-bordered table-hover" style="width:100%" >
	<tr>
		 
		<td width="13%" >
			<input class="form-control" style="width:160px" id="key_6" placeholder="客户名称">
			
			
			
		</td>
		
		<td width="9%" align="right">起始日期</td>
		
		<td width="13%">
			
		 <input type="text" id="start_day_6" name="start_day_6" style="width:160px"    autocomplete="off"
                       onClick="WdatePicker({dateFmt: 'yyyy-MM-dd'})" class="form-control" />
		 </td>
		
	 
		<td width="9%" align="center">结束日期</td>
		 <td width="13%"><input type="text" id="end_day_6" name="end_day_6"    autocomplete="off"
                       onClick="WdatePicker({dateFmt: 'yyyy-MM-dd'})" style="width:160px" class="form-control"/></td>
		 
		
		<td  >
			 
			
				<button style="border-right:0;border-top-right-radius:0;border-bottom-right-radius:0" class="btn btn-default" onclick="searchbtn(1)" type="button">搜索</button>

			<button class="btn btn-default"   id="daobtn"  onclick="daochu6()" type="button">导出 <i class="icon-angle-down"></i></button>
			
			<button style="border-right:0;border-top-right-radius:0;border-bottom-right-radius:0" class="btn btn-default" onclick="clear_txt6()" type="button">清空</button>
			 
		</td>
		<td  >&nbsp;</td>
		 
	
		 
	</tr>
	<tr>
	  <td colspan="2" align="right" >&nbsp;  </td>
	  <td align="right">回款笔数</td>
	  <td id="count_hk">  </td>
	  <td align="right">回款合计</td>
	  <td width="12%" align="right" id="hkhj" > </td>
	  <td width="31%" align="right"  >&nbsp; </td>
   </tr>
	</table>
 


<div style="margin-bottom:5px;">
<table class="table table-striped table-bordered table-hover" id="tab_hk"  >
   	
	

   <tr id="top_hk">   
   <th style="width:18%">回款日期</th> 
   <th style="width:18%">合同编号</th> 
   <th style="width:18%">客户名称</th>	
   <th style="width:18%">回款金额</th>	
   <th style="width:18%">客户经理</th>		
	</tr>

	
	
	
	
	

 	
 
</table>
</div>




<div style="text-align: center;" id="pager_hk">
</div>

