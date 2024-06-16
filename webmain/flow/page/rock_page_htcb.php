
<meta charset="utf-8">
<script src="js/WdatePicker.js"></script>

 





 <table class="table table-striped table-bordered table-hover" style="width:100%" >
	<tr>
		
		
		<td width="13%"  >
			<input class="form-control" style="width:160px" id="key_3" placeholder="客户名称">
			
		</td>
		
		 
	  <td width="9%">起始日期</td>
		
		
		
		<td width="18%">			
		 <input type="text" id="start_day_3" name="start_day_3" style="width:160px" autocomplete="off"
                       onClick="WdatePicker({dateFmt: 'yyyy-MM-dd'})" class="form-control" />
		 </td>
		
	 
		<td width="10%">结束日期</td>
		 <td width="17%"><input type="text" id="end_day_3" name="end_day_3" autocomplete="off"
                       onClick="WdatePicker({dateFmt: 'yyyy-MM-dd'})" style="width:160px" class="form-control"/></td>
		 
		
		<td width="6%">
		<button style="border-right:0;border-top-right-radius:0;border-bottom-right-radius:0" class="btn btn-default" onclick="searchbtn_3(1)" type="button">搜索</button>			 
		</td>
		 
		
		<td width="6%">
	 	<button class="btn btn-default"   id="daobtn"  onclick="daochu3()" type="button">导出 <i class="icon-angle-down"></i></button>		 
		</td>
		
		
		<td width="40%">
		<button style="border-right:0;border-top-right-radius:0;border-bottom-right-radius:0" class="btn btn-default" onclick="clear_txt3()" type="button">清空</button>			 
		</td>
	
		 
	</tr>
	</table>


<div style="margin-bottom:5px;">
	
<table class="table table-striped table-bordered table-hover" id="htcb_tab" width="100%" >
   
  
  <tr style="background: #f5f5f4; " id="top_cb">
    <td width="147"  rowspan="2" valign="middle" ><p>客户名称</p></td>
    <td width="147"  rowspan="2" valign="middle" ><p>签订日期</p></td>
    <td width="147"  rowspan="2" valign="middle" ><p>合同编号</p></td>
    
    <td style="width:50px;text-align: center" valign="middle" colspan="2"><p> 收入 </p></td>
    <td style="width:50px;text-align: center" valign="middle" colspan="3"><p> 支出 </p></td>

    <td  width="147" valign="middle" rowspan="2"><p> 毛利 </p></td>
    <td  width="147" valign="middle" rowspan="2"><p> 毛利率%</p></td>
    <td  width="147" valign="middle" rowspan="2"><p> 已收金额</p></td>
    <td  width="147" valign="middle" rowspan="2"><p>应收金额 </p></td>
    <td  width="147" valign="middle" rowspan="2"><p>客户经理 </p></td>
  </tr>

  <tr id="top3">
    <td width="77"  valign="middle" ><p>合同金额</p></td>
    <td width="77"  valign="middle" ><p>已调账</p></td>
    <td width="77"  valign="middle" ><p>外协</p></td>
    <td width="77"  valign="middle" ><p>费用 </p></td>
    <td width="77"  valign="middle" style="text-align:center" >纳税</td>
  </tr>
	
	
	
	
 	
 
</table>
	
</div>




<div style="text-align: center;" id="pager_cb">
</div>


<script>

//	3 合同成本表
	
function searchbtn_3(page)	
{
	
	//var url="webmain/flow/page/rock_page_mymx.php";  //alert(url);
	var url="index.php";
	
	var key=$("#key_3").val();
	var start_day=$("#start_day_3").val();
	var end_day= $("#end_day_3").val();
	
	var das={'search':'three','key':key,'start_day':start_day,'end_day':end_day,'page':page};
	
	 $.post(url,das,function(res){
		 
		   
		 
		 $("#htcb_tab").find('tr').each(			 
			 function(){	//console.log("fuck");
				 
				 att=$(this).attr('id');
				 
				 
				 if(att==null)
				 {  
					 $(this).remove();
				 }
				 
				 			 
			 }		 
		 );	 
		 
		 
	  tarr_cb=res.split("$");
		 
			 
		 
	  $("#top3").after(tarr_cb[0]);
		
	  $("#pager_cb").html(tarr_cb[1]);
		 
	  
	 //  
	   
	 
	 });
	
}
	
$(function(){
	
	 searchbtn_3(1);
	
})	
	
function clear_txt3()
{
	 
	
	$("#start_day_3").val("");
	$("#end_day_3").val("");
	$("#key_3").val("");
	
}
	
	
function daochu3()	
{
	
	var url="daochu.php";  //alert(url);
	var key_3=$("#key_3").val();
	var start_day_3=$("#start_day_3").val();
	var end_day_3=$("#end_day_3").val();
	
    url=url+"?dao=three&key="+key_3+"&start_day="+start_day_3+"&end_day="+end_day_3;	
	
	
	window.location=url;
	
	
}	
		
	
</script>
