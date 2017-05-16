/*******************************************\
 日期时间类
 pic_width //图片宽度
 pic_height //图片高度
\*******************************************/
JetsumFw.Class.PhotoSwitch = function(){
	_FILENAME="_PhotoSwitch.js";
	_UPDATEDATE="2009-04-11"
    _UPDATE="修改了PhotoFocus变量"
	
	this.bgcolor="#cccccc"; //背景色
	this.text_align="center";
	this.interval_time="2";//图片停顿时间，单位为秒，为0则停止自动切换
    this.PhotoFocus=function(id,pic_width,pic_height,text_height,pics,links,texts){
	    var swf_height=text_height+pic_height;
		PhotoSwitchValue="";
		swf=JetsumFw.Path+"classes/_PhotoSwitch/focus.swf";
		PhotoSwitchValue+="<object classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" codebase=\"http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cabversion=6,0,0,0\" width=\""+ pic_width +"\" height=\""+ swf_height +"\">";
		PhotoSwitchValue+="<param name=\"movie\" value=\""+swf+"\">";
		PhotoSwitchValue+="<param name=\"quality\" value=\"high\">";
		PhotoSwitchValue+="<param name=\"wmode\" value=\"opaque\">";
		PhotoSwitchValue+="<param name=\"bgcolor\" value=\""+this.bgcolor+"\">";
		PhotoSwitchValue+="<param name=\"FlashVars\" value=\"pics="+pics.join("|")+"&links="+links.join("|")+"&texts="+texts.join("|")+"&borderwidth="+pic_width+"&borderheight="+pic_height+"&textheight="+text_height+"&text_align="+this.text_align+"&interval_time="+this.interval_time+"\">";
		PhotoSwitchValue+="<embed bgcolor=\""+this.bgcolor+"\" src=\""+swf+"\" FlashVars=\"pics="+pics.join("|")+"&links="+links.join("|")+"&texts="+texts.join("|")+"&borderwidth="+pic_width+"&borderheight="+pic_height+"&textheight="+text_height+"&quality=\"high\" width=\""+ pic_width +"\" height=\""+ swf_height +"\" allowScriptAccess=\"sameDomain\" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" wmode=\"opaque\" />";
		PhotoSwitchValue+="</object>";
		document.getElementById(id).innerHTML = PhotoSwitchValue;
	}	
}