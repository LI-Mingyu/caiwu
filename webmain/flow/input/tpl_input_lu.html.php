<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?=$da['title']?></title>
<link rel="stylesheet" href="<?=$da['p']?>/css/css.css" />
<link rel="stylesheet" href="mode/kindeditor/themes/default/default.css" />
<link rel="stylesheet" type="text/css" href="mode/plugin/css/jquery-rockdatepicker.css"/>
<link rel="shortcut icon" href="favicon.ico" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript" src="js/base64-min.js"></script>
<script type="text/javascript" src="mode/kindeditor/kindeditor-min.js"></script>
<script type="text/javascript" src="mode/plugin/jquery-rockdatepicker.js"></script>
<script type="text/javascript" src="<?=$da['p']?>/flow/input/inputjs/input.js?<?=$da['logintime']?>"></script>
<script type="text/javascript" src="web/res/js/jquery-changeuser.js"></script>
<script type="text/javascript" src="mode/plugin/jquery-rockmodels.js"></script>
<script src="js/WdatePicker.js"></script>
 
 
	
<script type="text/javascript">
var editor,arr=<?=$da['fieldsjson']?>,moders=<?=json_encode($da['moders'])?>,gongsiarr=<?=json_encode($da['gongsiarr'])?>,subfielsa=<?=json_encode($da['subfielsa'])?>,zbnamearr=<?=json_encode($da['zbnamearr'])?>,isedit=0,mid='<?=$da['mid']?>',isinput=1,data={};
</script>
<style>
.tdcont{padding:0px 0px;font-size:14px;}
.tdcont *{font-size:14px;}
.tdcont a{color:blue;}
.ys0{border:1px #888888 solid}
.ys1{padding:5px 5px; border:1px #888888 solid;color:#555555;}
.ys2{padding:5px 5px; border:1px #888888 solid;}

.inputs{width:95%;font-size:14px;}
.cionsss{padding:4px; background-color:#dddddd}
.datesss{background:url(mode/icons/date.png) no-repeat right;cursor:pointer}

.status{position: absolute;right:5px;top:10px;display:none;width:80px;height:80px;overflow:hidden; border:3px red solid;border-radius:50%;font-size:20px;text-align:center;line-height:80px;color:red;transform:rotate(-45deg);-o-transform:rotate(-45deg);-ms-transform:rotate(-45deg);-webkit-transform:rotate(-45deg);filter:progid:DXImagetransform.Microsoft.Matrix(M11=0.707,M12=-0.707,M21=0.707,M22=0.707,SizingMethod='auto expand');}

.tablesub td{height:25px;text-align:center;border-bottom:1px #888888 solid;border-right:1px #888888 solid;}
.tablesub .inputs{border:none}

.course{padding:8px; background-color:#dbf0fc;border:1px #c2e6f9 solid;margin-right:10px;text-align:center;border-radius:5px}
.coursejt{height:8px;overflow:hidden;width:30px;background-color:#dbf0fc}
.coursejts{width:0px;  height:0px; overflow:hidden;border-width:8px;border-style:solid;border-color:transparent transparent transparent #dbf0fc;}
.tishi{color:#888888;font-size:12px;padding:3px}
.btn-default{background-color:#1389D3;}
.btn-danger{background-color:#d9534f;}
.btn:hover{opacity:1;color:#ffffff}
.ke-icon-crop{background-image: url(mode/icons/crop.png);width: 16px;height: 16px;}
</style>
	
<script>
	
		function doContactAdd(){
		var tbl=document.getElementById("contactRowTbl");
		var contactNum=document.getElementById("contact_num").value-0;

		var tr=document.createElement("tr");
		tr.setAttribute("id","contactTr"+contactNum);

		
		var td;
		var input;

		//var arr_num=array["第二期收款","第三期收款","第四期收款"];

		td=document.createElement("td");
		td.setAttribute("id","qishu_"+contactNum);
			
		input=document.createElement("select");
			
		var opt=new Option("第一期","第一期");	
		input.options.add(opt);
		opt=new Option("第二期","第二期");
		input.options.add(opt);
		opt=new Option("第三期","第三期");
		input.options.add(opt);	
	    opt=new Option("自定义","自定义");
		input.options.add(opt);
			
		input.setAttribute("name","jindu_"+contactNum);
		input.setAttribute("id","jindu_"+contactNum);			
	 	
		input.setAttribute("className","f-text");
 	
	   
	 
		input.onchange=testfun; 
			
		td.appendChild(input);
		tr.appendChild(td);
			
       

		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.setAttribute("size","12");
		input.setAttribute("maxLength","10");
		input.setAttribute("index",contactNum);
		input.setAttribute("name","yinsday_"+contactNum);
		input.setAttribute("id","yinsday_"+contactNum);
		input.setAttribute("value","");
		input.setAttribute("className","f-text");
		input.setAttribute("title","格式：2019-01-01");
		input.setAttribute("onClick","WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'})");	
		//input.onchange=elementOnChnage;
		td.appendChild(input);
		tr.appendChild(td);
		
		
		
		
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.setAttribute("size","12");
		input.setAttribute("maxLength","15");
		input.setAttribute("index",contactNum);
		input.setAttribute("name","ysjiner_"+contactNum);
		input.setAttribute("id","ysjiner_"+contactNum);
		input.setAttribute("value","");
		input.setAttribute("className","f-text");
		//input.onchange=elementOnChnage;
		td.appendChild(input);
		tr.appendChild(td);
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.setAttribute("size","12");
		input.setAttribute("maxLength","15");
		input.setAttribute("index",contactNum);
		input.setAttribute("name","shsjiner_"+contactNum);
		input.setAttribute("id","shsjiner_"+contactNum);
		input.setAttribute("value","");
		input.setAttribute("className","f-text");
		//input.onchange=elementOnChnage;
		td.appendChild(input);
		tr.appendChild(td);
		
 
		
	
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.setAttribute("size","12");
		input.setAttribute("maxLength","10");
		input.setAttribute("index",contactNum);
		input.setAttribute("name","kaipiao_day_"+contactNum);
		input.setAttribute("id","kaipiao_day_"+contactNum);
		input.setAttribute("value","");
		input.setAttribute("className","f-text");
		input.setAttribute("title","格式：2019-01-01");
	    input.setAttribute("onClick","WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'})");		
		//input.onchange=elementOnChnage;
		td.appendChild(input);
		tr.appendChild(td);
		
		
		
		td=document.createElement("td");
		input=document.createElement("input");
		input.setAttribute("type","text");
		input.setAttribute("size","12");
		input.setAttribute("maxLength","10");
		input.setAttribute("index",contactNum);
		input.setAttribute("name","daozday_"+contactNum);
		input.setAttribute("id","daozday_"+contactNum);
		input.setAttribute("value","");
		input.setAttribute("className","f-text");
		input.setAttribute("title","格式：2019-01-01");
		input.setAttribute("onClick","WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'})");	
		//input.onchange=elementOnChnage;
		td.appendChild(input);
		tr.appendChild(td);
		
 
		
		td=document.createElement("td");
		var link=document.createElement("a");
		 
			link.setAttribute("href","javascript:doContactDeleteAct("+contactNum+");");			
			link.appendChild(document.createTextNode("删除"));			
			td.appendChild(link);	 
			
		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","status_"+contactNum);
		input.setAttribute("id","status_"+contactNum);
		input.setAttribute("value","UNCHANGE");
		td.appendChild(input);
		input=document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","id_"+contactNum);
		input.setAttribute("id","id_"+contactNum);
		input.setAttribute("value","0");
		td.appendChild(input);
		tr.appendChild(td);

		tbl.appendChild(tr);
		document.getElementById("contact_num").value=contactNum+1;
	}
		
	
	
	function doContactDelete(index){
		ShowConfirm('确认框','确定删除吗？',340,80,"doContactDeleteAct('"+index+"')");
	}
	
	
	function doContactDeleteAct(index){
		document.getElementById("contactTr"+index).style.display="none";
		document.getElementById("status_"+index).value="DELETE";
	}
	

	
</script>	
	
</head>
<body style="background:white">
<div align="center">
	<div class="blank10"></div>
	<div style="min-width:650px; position:relative;max-width:<?=$da['inputwidth']?>px;margin:0px 10px">
		<div class="status"></div>
		<div style="padding-bottom:15px;"><span id="inputtitle" onclick="location.reload()" style="font-size:24px"><?=$da['title']?></span></div>
		<div class="tdcont" align="left">
			<form name="myform">
			<input name="id" type="hidden" value="<?=$da['mid']?>">
			<?php 
			$firstrs 	= array();
			$coursestr 	= '';
			for($i=0;$i<$da['zbshu'];$i++)echo '<input value="0" type="hidden" name="sub_totals'.$i.'">';

			//echo $da['content'];


				 
			$dastr='<td height="34" align="right" class="ys1"><span>合同内容</span></td>';

			$str='<td colspan="3" class="ys2"><span id="div_content" class="divinput"><textarea class="textarea" style="height:80px;" name="content"></textarea></span></td></tr>';
					
			$added='<tr><td height="34"align="right"class="ys1">收款进度</td><td colspan="3"class="ys2"><input type="hidden"id="contact_num"name="contact_num"value="1"><table width="100%"border="0"cellspacing="0"cellpadding="0"align="center"id="contactTbl"class="ListTable"><tbody id="contactRowTbl"><tr><th width="7%">进度款分期</th><th width="4%">应收款日期</th><th width="8%">应收金额</th><th width="11%">实收金额</th><th width="16%">开票日期</th><th width="16%">到账日期</th><th width="4%">操作</th></tr><tr id="contactTr0"><td id="qishu_0" ><select name="jindu_0" id="jindu_0">
			  <option value="第一期">第一期</option>
			  <option value="第二期">第二期</option>
			  <option value="第三期">第三期</option>
			 <option value="自定义">自定义</option>	
			</select></td><td><input type="text" size="12" class="f-text" id="yinsday_0" name="yinsday_0" onclick="WdatePicker({dateFmt: \'yyyy-MM-dd HH:mm:ss\'})" value=""></td><td><input type="text"size="12"class="f-text"id="ysjiner_0"name="ysjiner_0"value=""></td><td><input type="text"size="12"class="f-text"id="shsjiner_0"name="shsjiner_0"value=""></td><td><input type="text" size="12" class="f-text" id="kaipiao_day_0" name="kaipiao_day_0" onclick="WdatePicker({dateFmt: \'yyyy-MM-dd HH:mm:ss\'})" value=""></td><td><input type="text" size="12" class="f-text" id="daozday_0" name="daozday_0" onclick="WdatePicker({dateFmt: \'yyyy-MM-dd HH:mm:ss\'})" value=""></td><td><input type="hidden"id="status_0"name="status_0"value="UNCHANGE"><input type="hidden"id="id_0"name="id_0"value="0"></td></tr></tbody></table><div class="table-bot"><a href="javascript:doContactAdd();">增加一行</a><span class="give"></span></div></td></tr>';

			 if($_REQUEST['num'] == 'custract'){			

			  $da['content']=str_replace($dastr,$added.$dastr,$da['content']);
	
			 }

			
		   $sales="<tr><td style=\"text-align:right;\">销售机会";
		           
			 
           $da['content']=str_replace($sales,"<tr style='display:none'><td style=\"text-align:right;\">Fuxk",$da['content']);
			

			//var_dump($GLOBALS['db']);exit;


			$db=$GLOBALS['db'];

	         $sql1="select count(*) as nums  from  xinhu_custract where  1=1 and date_format(optdt,'%m')=date_format(now(),'%m')";

 		    $rows=$db->getall($sql1);
			
	        $nums=$rows[0]['nums']+1;  

			
            $arr=explode('-',date("Y-m-d",time())); 

            $riqi=$arr[0].'-'.$arr[1];


		 if(intval($nums)==0)
		  {
			$nums=1;
		  }

		  if(intval($nums)<10)
		  {
			$nums_str='00'.$nums;
		  }

		   if(intval($nums)>10 && intval($nums)<100 )
		  {
			$nums_str='0'.$nums;
		  }

           $code= $riqi.'-'.$nums_str;

		  // exit($code);
		 
 			
	 
	
		  echo $da['content'];

		

			if($da['course']){
				
				$coursestr = '<div align="center" style="padding:20px 0px">';
				$coursestr .='<table><tr>';
				foreach($da['course'] as $k=>$rs){
					$coursestr .='<td><div class="course">'.$rs['name'].'';
					$coursestr .='</div></td>';
					if($rs['id']>-1){
						if($rs['id'] > 0){
							if(!$firstrs)$firstrs = $rs;
							if($rs['isnow'])$firstrs = $rs;
						}
						$coursestr .='<td><div class="coursejt"></div></td>';
						$coursestr .='<td><div class="coursejts"></div></td>';
					}
				}
				$coursestr .= '</tr></table>';
				$coursestr .= '</div>';
				
				if($da['moders']['isbxs']==1)$coursestr='';//不显示流程图
				
				//判断流程步骤是否上步指定
				if($firstrs && $firstrs['checktype']=='change'){
					$firstrs['isbt'] = 0;
					$placeholder = '可不选,如自己选择不要随意选择';
					$stsp = '<div style="padding-top:20px"><table width="100%"><tr><td width="15%" nowrap height="30" align="right">';
					if($firstrs['checktype']=='change'){
						$stsp.='<font color=red>*</font>';
						$placeholder = '必须指定人员';
						$firstrs['isbt'] = 1;
					}
					$stsp.= ''.$firstrs['name'].'：</td>';
					$stsp.= '<td width="100%"><input  class="inputs" style="width:99%" id="sysnextchange" value="'.$firstrs['sysnextopt'].'" placeholder="'.$placeholder.'" readonly type="text" name="sysnextopt"><input name="sysnextoptid" value="'.$firstrs['sysnextoptid'].'" id="sysnextchange_id" type="hidden"><input name="sysnextcustidid" value="'.$firstrs['id'].'" type="hidden"></td>';
					$stsp.= '<td nowrap><a href="javascript:;" onclick="js.changeclear(\'sysnextchange\')" class="webbtn">×</a><a href="javascript:;" id="btnchange_recename" onclick="js.changeuser(\'sysnextchange\',\'changeusercheck\',\'选择'.$firstrs['name'].'\',{changerange:\''.$firstrs['checktypeid'].'\'})" class="webbtn">选择</a></td>';
					$stsp.= '</tr></table></div>';
					echo $stsp;
				}
			}
			
			
			
			//是否抄送
			$iscs = (int)$da['moders']['iscs'];
			if($iscs>0){
				$csstr= $inputobj->inputchangeuser(array(
					'name'		=> 'syschaosong',
					'id'		=> 'syschaosongid',
					'placeholder'=>'选择要抄送的人员',
					'type'		=> 'changeusercheck',
					'title'		=> '选择抄送人员',
					'value' 	=> $da['chao']['csname'],
					'valueid'	=> $da['chao']['csnameid']
				));
				echo '<div style="padding-top:20px"><table width="100%"><tr><td width="15%" nowrap height="30" align="right"><font color="red">'.(($iscs==1) ? '':'*').'</font>抄送给&nbsp;</td><td width="100%">'.$csstr.'</td></tr></table></div>';
			}
			?>
			</form>
		</div>
		<?php echo $coursestr;?>
		<div style="height:60px; overflow:hidden"></div>
	</div>
	<div align="right" style="background:#eeeeee;border-top:1px #aaaaaa solid;padding:10px 0px; position:fixed;width:100%;bottom:0px;left:0px">
		<span id="msgview"></span>&nbsp; 
		<span id="AltSspan" style="display:none" >
		<?php
		if($da['isflow']>0)echo '<label><input onclick="c.changeturn(this)" value="1" checked type="checkbox" id="sysisturn">直接提交</label>&nbsp;';
		?>
		<input id="AltS" type="button" style="border-radius:5px" onclick="return c.save()" value="提交" class="webbtn"></span>&nbsp; &nbsp; 
	</div>
</div>
<script>
firstrs=<?=json_encode($firstrs)?>;
</script>
<script type="text/javascript" src="<?=$da['p']?>/flow/input/inputjs/mode_<?=$da['moders']['num']?>.js"></script>
<script type="text/javascript" src="web/res/js/jquery-rockupload.js"></script>
<script type="text/javascript" src="web/res/js/jquery-imgview.js"></script>
	
	
	
<script>
	
$(function(){
	
	$("input[name='num']").val('<?=$code?>');
	
 	var pr=$("input[name='qishu']").parent();
	 //alert($("input[name='qishu']").val());
	
	//alert(pr.html());
	
	$("input[name='qishu']").remove();
	
	
	 
	
	input=document.createElement("select");
			
		var sel=new Option("第一期","第一期");	
		input.options.add(sel);
		sel=new Option("第二期","第二期");
		input.options.add(sel);
		sel=new Option("第三期","第三期");
		input.options.add(sel);	
	    sel=new Option("自定义","自定义");
		input.options.add(sel);
			
		input.setAttribute("name","qishu");
		input.setAttribute("id","qishu");			
	 	
		input.setAttribute("className","f-text");
	
		inpusr='<input type="text" size="12" class="f-text" id="qishu" name="qishu" value="">';
	
		input.onchange=function(){
			
			val=$(this).val();
			
			if(val=="自定义")
			{
				//alert("wtf");
				
				pr.html("");
				pr.html(inpusr);
				
			}			
			
		}
	
	pr.append(input);
	
	
	
	<?php
	
	 $startim=date("Y-m-d",time());
	
	 $endtime=date("Y-m-d",strtotime('+7day'));
	
	
	?>
	
	$("input[name='regtime']").val('<?=$startim?>');
	
	$("input[name='exptime']").val('<?=$endtime?>');
	
	
	
	 /*
	
   $("input[name='regtime']").change(function(){
	   
	   
	   alert($(this).val());
	    
	  
		if($("input[name='exptime']")!="undefined")
		{

			  $("input[name='exptime']").val('ttt');

			start=$("input[name='regtime']").val();

			if(start!="" && start!="undefined") 
			{


				//alert(start);

			}

		}
	
   });
	 */
	
	
	
});
	
 
	
	

function gainpt(ipt,tt){	
//$('#'+ipt).change(function(){
	
	// alert($(this).val());
	
	
	arr=ipt.split('_');
	
	num=arr[1];
	 
	
	inpusr='<input type="text" size="12" class="f-text" id="jindu_'+num+'" name="jindu_'+num+'" value="">';
	 
	td=$('#'+tt).parent();
	
	//alert(td.attr("id"));
	
	//alert($('#'+tt).val());
	
	
	
	val=$('#'+tt).val();
	
	
    if(val=="自定义")
	{
	  td.html("");
	  td.html(inpusr);				
	}	
	
//}); 
	
}
	
	
	
 	
	
$('#jindu_0').change(function(){

 	//alert();
	
//	var tid=$(this).parent().attr("id");
	//alert(tid + $(this).attr("id") );
	
	
	val=$(this).val();
	
	inpusr='<input type="text" size="12" class="f-text" id="jindu_0" name="jindu_0" value="">';
	 
	
    if(val=="自定义")
	{
	  $('#qishu_0').html("");
	  $('#qishu_0').html(inpusr);				
	}	
	

	// gainpt(tid,$(this).attr("id"));
	

});  
	
	
function testfun()
{
	var tid=$(this).parent().attr("id");  
 
	 
	gainpt(tid,$(this).attr("id"));
	
}
	
	
	
	
	
</script>	
	
	
	
	
	
</body>
</html>