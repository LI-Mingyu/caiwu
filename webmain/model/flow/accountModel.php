<?php
//客户收付款单
class flow_accountClassModel extends flowModel
{
	
	
	public function flowrsreplace($rs)
	{
		// 账户属性：0.银行 1.微信 2.支付宝 3.现金
		 
 
	 switch($rs['acc_type'])	
	 {
         case 0:		 
	  	  $rs['acc_type']	 = "银行";
		  break;
		 case 1:		 
	  	  $rs['acc_type']	 = "微信";
		  break;
			 
		 case 2:
		  $rs['acc_type']	 = "支付宝";	
		  break;
		
			 
        case 3:
		  $rs['acc_type']	 = "现金";	
		  break;			 
	    case 4:
		  $rs['acc_type']	 = "";	
		  break;			 
		default:
		  $rs['acc_type']	 ="";
			 
			 
	 }
		
		return $rs;
	}
	
	 
}