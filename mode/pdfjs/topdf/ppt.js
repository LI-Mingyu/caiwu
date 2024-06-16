
WScript.Echo("start...");
function getarr(caa){
	var s='';
	for(var a in caa)s+=' @@ '+a+'=>'+caa[a]+'';
	return s;
}

function gotourl(url){
	var xml =  new ActiveXObject("MSXML2.XMLHTTP");
	xml.open("GET",url,false);
	xml.send();
	WScript.Echo("goto:"+url+"");
}


var files 	= WScript.Arguments; 
var docfile = files(0); 
WScript.Echo(docfile);
var path  	= docfile.substr(0, docfile.lastIndexOf('.'));
var isok	= 2;
var Obj		= false;
try{
	Obj 	= new ActiveXObject("Powerpoint.Application");
	Obj.Visible	= true; //转化必须可视
	Obj.DisplayAlerts = false;
	var doc 	= Obj.Presentations.Open(docfile);
}catch(e){
	Obj = false;
	WScript.Echo("Error:"+getarr(e)+"");
}
if(Obj){	
	var pdfpath = ""+path+".pdf";
	var fso 	= new ActiveXObject("Scripting.FileSystemObject"); 
	if(fso.FileExists(pdfpath))fso.DeleteFile(pdfpath);
	fso = false;
	try{
		doc.SaveAs(pdfpath,32, true); //32的
		WScript.Echo("isuccess");
		isok	= 1;
	}catch(e){
		WScript.Echo("Error:"+getarr(e)+"");
	}
	doc.Close();
	Obj.Quit();
}
var yurl = files(1);
if(isok>0 && yurl)gotourl(yurl+'&status='+isok+'');
WScript.Quit(0);