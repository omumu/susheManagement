/*******************************************\
 日期时间类
\*******************************************/
JetsumFw.Class.Time = function(style,id,auto){
	var timerID = null;
	auto=(typeof(auto)=="undefined")?"0":auto;
	JetsumFw.Class.Time.showtime(style,id,auto);
}
JetsumFw.Class.Time.showtime=function(style,id,auto) {
		isYear="1";   //年
		isMonth="1";  //月
		isDay="1";    //日
		isDays="1";   //星期
		isW="1";      //午
		isHour="1";   //时
		isMinute="1"; //分
		isSecond="1"; //秒
		
		function initArray()
		 {
		  for(i=0;i<initArray.arguments.length;i++)
		  this[i]=initArray.arguments[i];
		 }
		var isnDays=new initArray("星期日","星期一","星期二","星期三","星期四","星期五","星期六","星期日");
		var now = new Date();
		var hours = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		//为了便于前台调用,用1,2,3,...调用样式,在函数中根据样式配出需要的年,月,日,星期,午,时,分,秒
		//0不显示,1显示
		if (style=="1"){
			isW="0";
			isHour="0";
			isMinute="0";
			isSecond="0";
		}
		if (style=="2"){
			isDays="0";
			isW="1";
			isHour="1";
			isMinute="1";
			isSecond="1";
		}
		if (style=="3"){
			isW="0";
			isHour="1";
			isMinute="1";
			isSecond="1";
		}
		var timeValue="";
		if (isYear=="1")
			timeValue += ((now.getYear()<1000)?now.getYear()+1900:now.getYear())+"年";
		if (isMonth=="1")	
			timeValue += (now.getMonth()+1)+"月";
		if (isDay=="1")
			timeValue += now.getDate()+"日 ";
		if (isDays=="1")
		    timeValue +=isnDays[now.getDay()]+" ";
		if (isW=="1")
			timeValue += (hours >= 12) ? "下午 " : "上午 ";
		if (isHour=="1")
		   if (isW=="1")
			timeValue += (hours >12) ? hours -12 :hours;
		   else
		    timeValue +=hours;
		if (isMinute=="1")
			timeValue += ((minutes < 10) ? ":0" : ":") + minutes;
		if (isSecond=="1")
			timeValue += ((seconds < 10) ? ":0" : ":") + seconds;
		document.getElementById(id).innerHTML = timeValue;
		if (auto=="1")
		 timerID = setTimeout("JetsumFw.Class.Time.showtime(\""+style+"\",\""+id+"\",\""+auto+"\")",1000);
}
