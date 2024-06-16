<meta charset="utf-8">

<script src="js/WdatePicker.js"></script>



<script>

//	2.  每月营业明细表
	
function searchbtn_2(page)	
{
	
	//var url="webmain/flow/page/rock_page_mymx.php";  //alert(url);
	var url="index.php";
	var key=$("#key_2").val();  
	var start_day=$("#start_day_2").val();
	var end_day= $("#end_day_2").val();
	
	var das={'search':'two','key':key,'start_day':start_day,'end_day':end_day,'page':page};
	
	 $.post(url,das,function(res){
		 
		  // alert(res)
		 
		 $("#tab_mx").find('tr').each(			 
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
		 
	   $("#top_mx").after(tarr[0]);
		 
		 
	   $("#heji").html(tarr[1]);	
	
	   $("#yshj").html(tarr[2]);
		 
	   $("#dshj").html(tarr[3]);
		 
	   $("#count_mx").html(tarr[4]);
		 
	  	 
		
	   $("#pager_mx").html(tarr[5]);
		 
	  
	 //  
	   
	 
	 });
	
}
	
$(function(){
	
	searchbtn_2(1);
	
})
	
	
function daochu2()	
{
	
	var url="daochu.php";  //alert(url);
	var key_2=$("#key_2").val();
	var start_day_2=$("#start_day_2").val();
	var end_day_2=$("#end_day_2").val();
	
    url=url+"?dao=two&key="+key_2+"&start_day="+start_day_2+"&end_day="+end_day_2;	
	
	
	window.location=url;
	
	
}	
	
	
	
	
function clear_txt2()
{
	 
	
	$("#start_day_2").val("");
	$("#end_day_2").val("");
	$("#key_2").val("");
	
}	
	
</script>


 <table class="table table-striped table-bordered table-hover"  width='100%' >
	<tr>
		 
		<td width="13%"  >
			<input class="form-control" style="width:160px" id="key_2" placeholder="客户名称">
			
		</td>
		
		<td width="9%" align="right">起始日期</td>
		
		<td width="16%">
			
		 <input type="text" id="start_day_2" name="start_day_2" style="width:160px" autocomplete="off"
                       onClick="WdatePicker({dateFmt: 'yyyy-MM-dd'})" class="form-control" />
		 </td>
		
	 
		<td width="6%" align="center">结束日期</td>
		 <td width="13%"><input type="text" id="end_day_2" name="end_day_2"  autocomplete="off"
                       onClick="WdatePicker({dateFmt: 'yyyy-MM-dd'})" style="width:160px" class="form-control"/></td>
		 
		
		<td  >
		 
			
				<button style="border-right:0;border-top-right-radius:0;border-bottom-right-radius:0" class="btn btn-default" onclick="searchbtn_2(1)" type="button">搜索</button>
			 
		</td>
		<td  > <button style="border-right:0;border-top-right-radius:0;border-bottom-right-radius:0" class="btn btn-default" onclick="clear_txt2()" type="button">清空</button> </td>
		<td width="17%"  >&nbsp;</td>
		<td width="11%"  ><button class="btn btn-default"   id="daobtn"  onclick="daochu2()" type="button">导出 <i class="icon-angle-down"></i></button> </td>
		 
	
		 
	</tr>
	<tr>
	  <td align="right" >本期营业额合计</td>
	  <td id="heji">  </td>
	  <td align="right">已收</td>
	  <td id="yshj">  </td>
	  <td align="right">应收</td>
	  <td width="6%" align="right" id="dshj" > </td>
	  <td width="9%" align="right"  >合同数量合计</td>
	  <td colspan="2" id="count_mx" > </td>
   </tr>
	</table>


<div style="margin-bottom:5px;">
<table class="table table-striped table-bordered table-hover" width='100%' id="tab_mx"  >
   <tr id="top_mx"> 
  
   <th style="width:12%">日期</th>
   <th style="width:12%">合同编号</th> 
   <th style="width:12%">客户名称</th>	
   <th style="width:12%">合同金额</th>	

   <th style="width:12%">已收</th>	
   <th style="width:12%">应收</th>
   <th style="width:12%">备注</th>  
  </tr>

 	
 
</table>
</div>




<div style="text-align: center;" id="pager_mx">
</div>

