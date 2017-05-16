/*******************************************\
 广告类
\*******************************************/
JetsumFw.Class.Ads = function(){
        this.collection;
		this.items	= [];
		//对联
		this.floater_addItem	= function(id,content,x,y)
				  {
					document.write('<DIV id='+id+'>'+content+'</DIV>');
					var newItem				= {};
					newItem.object			= document.getElementById(id);
					newItem.x				= x||0;
					newItem.y				= y||80;
					
					var isIE = /msie/i.test(navigator.userAgent);

					newItem.object.style.position="absolute"; 
					newItem.object.style.display="block"; 
					newItem.object.style.zIndex=9999;
					newItem.object.style.top = newItem.y+"px";
					if(newItem.x>0) newItem.object.style.left = newItem.x+"px"; 
	  				if(newItem.x<0) newItem.object.style.right = Math.abs(newItem.x)+"px"; 

					this.items[this.items.length]		= newItem;
				  }
		this.floater_play	= function()
				  {
					collection= this.items;
					setInterval('JetsumFw.Class.Ads.play()',10);
				  }
		
		this.source=function(file_name,url,link_text,size_width, size_height){
			var sources="";
			var is_swf = file_name.substring(file_name.length,file_name.length-3);
			if(is_swf=="swf")
			{
	        sources = "<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0\" width=\"" + size_width + "\"  height=\"" + size_height + "\">";
			sources += "<param name=\"movie\" value=\"" + file_name + "\">";
			sources += "<param name=\"quality\" value=\"high\">";
			sources += "<param name=\"wmode\" value=\"transparent\">";
			sources += "<embed src=\"" + file_name + "\" quality=\"high\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" width=\"" + size_width + "\"  height=\"" + size_height + "\"></embed></object>";
			}
			else if(is_swf=="gif" ||is_swf=="jpg"||is_swf=="bmp")
			{
			sources="<a href=\""+url+"\" title=\""+link_text+"\" target=\"_blank\"><img src=\""+file_name+"\"  border=\"0\" width=\""+size_width+"\" height=\""+size_height+"\" /></a>";
			}
			else
			  alert("error");
			 return sources;

		}
		//背投广告
		this.time_out = 6000;
		this.bgAds=function(id,content){
		
		//document.write("<DIV id=\""+id+"\" align=\"center\" >"+content+"</DIV>");
		var obj=document.getElementById(id);
		obj.innerHTML=content;
		obj.style.visibility="visible";
        setTimeout("JetsumFw.Class.Ads.real_log_start(\""+id+"\")",this.time_out);
		return false; 
		}
		//浮动广告
		this.delay = 30; 
		var interval;
		this.floatAds=function(id,content){
		document.write("<DIV id=\""+id+"\" style=\"Z-INDEX:1; POSITION: absolute;\">"+content+"</DIV>");
		var obj=document.getElementById(id);
		obj.style.visibility="visible";
		var delays=this.delay;
        interval = setInterval("JetsumFw.Class.Ads.changePos(\""+id+"\")",delays);

		obj.onmouseover=function(){clearInterval(interval)}
		obj.onmouseout=function(){interval=setInterval("JetsumFw.Class.Ads.changePos(\""+id+"\")",delays)}
		}	
			
}
var lastScrollY = 0;
JetsumFw.Class.Ads.play=function ()
		{
			if(screen.width<=800)
			{
				for(var i=0;i<collection.length;i++)
				{
					collection[i].object.style.display	= 'none';
				}
				return;
			}
			var doc=document.compatMode=='CSS1Compat'?document.documentElement:document.body;
			var diffY=doc.scrollTop;
			var percent = (diffY - lastScrollY)/10;
			percent = percent>0? Math.ceil(percent):Math.floor(percent);
			lastScrollY += percent;
			for(var i=0;i<collection.length;i++)
			{
				var followObj		= collection[i].object;
				followObj.style.top =followObj.offsetTop+percent+"px";
				
			}
			
}
JetsumFw.Class.Ads.real_log_start=function(id)
{
   var obj=document.getElementById(id);
   obj.style.display="none";
}
var xPos = 300;
var yPos = 200; 
var step = 1;
var height = 0;
var Hoffset = 0;
var Woffset = 0;
var yon = 0;
var xon = 0;

JetsumFw.Class.Ads.changePos=function(id) 
{
    //var doc=document.body||document.documentElement;
	var doc=document.compatMode=='CSS1Compat'?document.documentElement:document.body;
	var obj=document.getElementById(id);

	width = doc.clientWidth;
	height = doc.clientHeight;
	
	Hoffset = obj.offsetHeight;
	Woffset = obj.offsetWidth;
	obj.style.left = xPos + doc.scrollLeft+"px";

	obj.style.top = yPos + doc.scrollTop+"px";

	if (yon) 
		{yPos = yPos + step;}
	else 
		{yPos = yPos - step;}
	if (yPos < 0) 
		{yon = 1;yPos = 0;}
	if (yPos >= (height - Hoffset)) 
		{yon = 0;yPos = (height - Hoffset);}
	if (xon) 
		{xPos = xPos + step;}
	else 
		{xPos = xPos - step;}
	if (xPos < 0) 
		{xon = 1;xPos = 0;}
	if (xPos >= (width - Woffset)) 
		{xon = 0;xPos = (width - Woffset);   
	}
}
