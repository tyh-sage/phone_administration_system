<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=utf-8"%>
<%@ page import="util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>主界面</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    
<style>
div
{
      position:relative;
      float: left;
      width: 10%;
      height: 124px;
      left:80px;
      border: 0;
}
body
{
	min-height: 100vh;
	min-width: 80%;
	background-image: linear-gradient(120deg,rgb(78,140,165 ),rgb(176, 220, 213))

}
*{
	padding:0;
	margin:0; 
	list-style:none;                /*列表项标记的类型为空*/
	border:0;
	background-attachment:fixed     /*背景图片固定不随滚动条滚动*/
}
.all                                /*轮播图*/
{
	width:500px;
	height:200px;
	padding:7px;
	border:0;
	margin:10px auto;              /*水平居中*/
	position:relative;
	
}
.screen
{
	width:500px;
	height:200px;
	overflow:hidden;               /*元素的内容若超出了给定的宽度和高度属性，则超出的部分被隐藏，不占位*/
	position:relative;
	left:140px;
}
.screen li                         /*li标签，定义列表项目*/
{ 
	width:500px;
	height:200px; 
	overflow:hidden; 
	float:left;
}
.screen ul                         /*ul标签，无序列表,放图片*/
{ 
	position:absolute;
	top:10px; 
	width:3000px;
}
.all ol                            /*ol标签，有序列表，放编号*/
{ 
	position:absolute;
	right:-134px;
	bottom:-20px; 
	line-height:20px;
	text-align:center;
}
.all ol li
{ 
	float:left; 
	width:20px;
	height:20px; 
	background:#fff;               /*背景白色*/
	border:0;
	margin-left:10px; 
	cursor:pointer;                /*光标变成小手*/
}
.all ol li.current
{ 
	background:#AFEEEE;            /*编号框的颜色*/
}
</style>

<script type="text/javascript">      /*JavaScript 使得网页展现滚动播放的图片*/     
//轮播图原理：给图片一个数字属性，播放下一张图片只要数字+1 即可实现；最后一张图片求余操作（让小标回到0）
//自动播放原理：利用setInterval(function,time)和setTimeout(function,time)实现
function animate(obj,target)
{
	clearInterval(obj.timer);  // 先清除定时器，避免定时器的叠加导致图片位移速度越来越快
	var speed = obj.offsetLeft < target ? 15 : -15;   //offsetLeft返回左边界的偏移像素值 用来判断应该 + 还是 -
    obj.timer = setInterval(function()
    {
    	var result = target - obj.offsetLeft;        // 因为他们的差值不会超过3
        obj.style.left = obj.offsetLeft + speed + "px";
        if(Math.abs(result)<=15)                     //Math.abs()返回一个数的绝对值，如果差值不小于3说明到位置了
        {
        	clearInterval(obj.timer);
            obj.style.left = target + "px";          //有3像素差距，我们直接跳转目标位置
        }
    },10)
}
window.onload=function()                        //窗口加载
{
    // 获取元素
	var box = document.getElementById("all");  //返回一个匹配到"all"的DOM(文档对象模型)Element对象  大盒子(编号的)
    var ul = document.getElementById("ul");
    var ulLis = ul.children;                   //.children方法获取的字列表
    // 操作元素
    // 因为我们要做无缝滚动，所以要克隆第一张，放到最后一张后面去
    // a.appendchild(b)   把 b 放到 a 的最后面
    // 1. 克隆完毕
    ul.appendChild(ul.children[0].cloneNode(true));   //返回调用该方法的将要被克隆的首节点的一个副本
    
    // 2. 创建ol和小li
    console.log(ulLis.length);                        //控制台输出信息
    var ol = document.createElement("ol");            //生成的是ol(有序列表，放编号)
    box.appendChild(ol);                              // 把ol追加到box里面
    for(var i=0;i<ulLis.length-1;i++)
    {
    	var li = document.createElement("li");
        li.innerHTML = i + 1;        //innerHTML设置或返回指定标签之间的HTML内容,即：给里面小的li文字 1 2 3 。
        ol.appendChild(li);          //添加到ol里面
    }
    ol.children[0].className = "current";   //className可以改变标签元素的css类选择器，从而改变元素的样式

    //3. 开始动画部分
    var olLis = ol.children;
    for(var i=0; i<olLis.length;i++)
    {
    	olLis[i].index = i;  // 获得当前第几个小li的索引号
        olLis[i].onmouseover = function() //鼠标经过大盒子要停止定时器
        {
        	for(var j=0;j<olLis.length;j++)
            {
             	olLis[j].className = "";  //所有的都要清空，即：变成白色，表明不在当前图片
            }
            this.className = "current";   //当前图片的样式
            animate(ul,-this.index*500)   //调用动画函数   第一个参数：谁动画   第二个：走多少
            square = key = this.index;    //小方形=序号=当前的索引号
        }
     }
        
	//4. 添加定时器
    var timer = null;      // 轮播图的定时器
    var key = 0;           //控制播放张数
    var square = 0;        // 控制小方块
    timer = setInterval(autoplay,2000);//开始轮播图定时器  setInterval(代码串/函数，时间)：按照指定的周期来调用函数，直到 clearInterval()被调用
    function autoplay()    //自动播放
    {
    	key++;                    //先++
        if(key>ulLis.length - 1)  //后判断
        {
        	ul.style.left=0;      //迅速调回
        	key=1;                //因为第4张就是第一张
        }
        animate(ul,-key*500);     //再执行
        //小方块
        square++;
        if(square > olLis.length -1)
        {
        	square=0;     //因为下一次肯定会先++，变为1
        }
        for(var i=0;i<olLis.length;i++)   //先清除所有的
        {
        	olLis[i].className = "";
        }
        olLis[square].className = "current";  //留下当前的
     }
    
     //last最后  鼠标经过大盒子要停止定时器
     box.onmouseover=function()
     {
     	clearInterval(timer);
     }
     box.onmouseout = function() 
     {
     	timer = setInterval(autoplay,2000);  // 开始轮播图定时器
     }
}
</script>

<style>                             /*导航栏的CSS*/
html,body                          /*设置html，可以使body之类的有依赖*/               
{                                  /*导航栏整体位置*/
	height:100%;
	width:100%;
	margin:0px;
	padding:0px;
}
section                            /*导航栏的文本中的区段*/
{
 	display:block;
	position:relative;
	top:80px;
	left:60px;
  	height:20%;
  	width:10%;
  	float:left;                    /*横向显示*/
}
ul                                /*导航栏的列表样式*/
{
 	list-style-type: none;        /*列表项前无标记*/
 	margin-top:5%;
	padding: 0px;
  	text-align: center;
}
a                                /*需要跳转的标签可以使用a标签*/
{
	position: relative;
	color: white;
	text-decoration: none;
	display: inline-block;
	font-size: 1.5em;             /*em是相对长度单位*/
}
.nav a
{
    opacity: 0.5;                 /*不透明度*/
}
.nav a:before,.nav a:after        /*伪元素:before和:after*/
{                                                     
  width: 2px;
  height: 32px;
  background: white;
  content:'';
  position: absolute;
  top: 0px;
  right: -10px;
  -webkit-transition: all 0.2s;  /*-webkit-浏览器私有前缀：webkit内核*/
  -moz-transition: all 0.2s;     /*-moz浏览器私有前缀：Firefox Gecko内核*/
  -ms-transition: all 0.2s;
  -o-transition: all 0.2s;
  transition: all 0.2s;           /*全部样式 0.2秒 缓动*/
}
.nav a:before                    
{
    top: 0px;
    left: -10px;
}
.nav a:hover                              /*鼠标悬停*/
{                     
    opacity: 1;                           /*不透明度*/
}
.nav a:hover::before                      /*右竖边框动效*/
{
	top: -75px; 
  	left: 46px;
  	width: 2px;
  	height: 110px;
  	-webkit-transform: rotate(90deg);     /*顺时针方向旋转90度*/
  	-moz-transform: rotate(90deg);
  	-ms-transform: rotate(90deg); 
  	-o-transform: rotate(90deg);
  	transform: rotate(90deg);
}
.nav a:hover::after                       /*左竖边框动效*/
{
	left: 46px;
  	width: 2px;
  	height: 110px;
  	-webkit-transform: rotate(90deg);
  	-moz-transform: rotate(90deg);
  	-ms-transform: rotate(90deg);
  	-o-transform: rotate(90deg);
  	transform: rotate(90deg);
}

.nav-2 a                                  /*登出*/
{
    opacity: 0.5;
    position:relative;
	left:-90px;
	top:500px;                        /*//////////!!!!!!!登出的位置*/
}
.nav-2 a:before,.nav-2 a:after          /*动效前*/
{
    content:'';
    position: absolute;
    background: white;
    top: 18px;
    left: -10px;
    width: 70px;
    height: 1px;
    -webkit-transition:  all 0.2s;
    -moz-transition:  all 0.2s;
    -ms-transition:  all 0.2s;
    -o-transition: all 0.2s;
    transition: all 0.2s;
}
.nav-2 a:hover
{
    opacity: 1;
}
.nav-2 a:hover::before        /*动效后的上边界*/
{
    top: 0px; 
}
.nav-2 a:hover::after         /*动效后的下边界*/
{
    top: 36px; 
}

</style>
</head>

<body>  
<section class="nav">
	<ul>
	<br><br>   <!--导航栏 -->
    <li><a href="add+delete.jsp">用户操作</a></li><br><br><br><br>       <!-- 增删 --> 
    <li><a href="revise.jsp">信息更改</a></li><br><br><br><br>           <!-- 修改 -->
    <li><a href="look.jsp">信息查看</a></li><br><br><br><br>           <!-- 显示、排序、查询 -->                        
    </ul>
</section>
<section class="nav-2">
	<a href="login.jsp">登出</a>
</section>
<div class="all" id="all">                                           <!-- div样式表中的定位技术 -->
	<div class="screen">
        <ul id="ul"><!--轮播图 -->
       		<li><img src="image/ship.jpg" width="500" height="160" /></li>
       		<li><img src="image/ocean.jpg" width="500" height="160" /></li>
       		<li><img src="image/ad1.jpg" width="500" height="160" /></li>    
           	<li><img src="image/java.jpg" width="500" height="160" /></li>    
           	<li><img src="image/author.jpg" width="500" height="160" /></li>           	
        </ul>
    </div>
</div>
</body>

</html>
