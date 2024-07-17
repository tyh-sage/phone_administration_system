<%@page import="wojiubuxinle.node"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="wojiubuxinle.phonenumber"%>
<%@ page import="wojiubuxinle.node"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>排序</title>
<style>
body
{
	min-height: 100vh;
	min-width: 80%;
	background-image: linear-gradient(120deg,rgb(78,140,165 ),rgb(176, 220, 213));
	background-attachment:fixed;             /*背景不受滚轮影响*/
}
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
  -webkit-transition:  all 0.2s;  /*-webkit-浏览器私有前缀：webkit内核*/
  -moz-transition:  all 0.2s;     /*-moz浏览器私有前缀：Firefox Gecko内核*/
  -ms-transition:  all 0.2s;
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
li.active
{
     background: rgb(0,0,0,.2);
     color: rgb(255,255,255);  
}
.form                                  /*表单*/
{
	left:250px;
    height: 300px;                     /*元素的高度*/
    position: absolute; 
    top: 30%;                          /*元素的顶部边界离父元素的的位置是父元素高度的一半*/
    margin-top: -150px;                /*设置元素顶边负边距，大小为元素高度的一半*/
    zoom:150%;
}
.input                                 /*信息输入框*/
{
    border: 1px solid #B8B8B8;         /*边框粗细为1px、样式为实心的、颜色为#B8B8B8的边框*/
    width: 200px;
    height: 35px;
    padding: 0 10px;                   /*上内边距和下内边距是0； 右内边距和左内边距是10px*/
    border-radius: 5px;                /*将输入框变为圆角的，5px为圆角半径*/
}
.input2                                 /*确定按钮*/
{
    border: 1px solid #B8B8B8;         /*边框粗细为1px、样式为实心的、颜色为#B8B8B8的边框*/
    width: 50px;
    height: 50px;
    padding: 0 10px;                   /*上内边距和下内边距是0； 右内边距和左内边距是10px*/
    border-radius: 100%;              /*将输入框变为圆角的，5px为圆角半径*/
    
}
li.active
{
     background: rgb(0,0,0,.2);
     color: rgb(255,255,255);  
}
.dropbtn                              /*下拉按钮，跳转至相应的界面*/
{
    background-color: rgb(245,217,217);
    color: black;
    padding: 16px;
    font-size: 20px;       /*字体大小*/
    font-weight: bold;    /*加粗*/
    font-family:Brush Script MT;         /*字体*/
    border: none;
    cursor: pointer;
}

.dropdown                              /* 容器 <div> - 需要定位下拉内容 */ 
{
    position: relative;
    left:900px;
    top:40px;
    display: inline-block;
}

.dropdown-content                      /* 下拉内容 (默认隐藏) */ 
{
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    font-size:12px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a                       /* 下拉菜单的链接 */ 
{
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover                   /* 鼠标移上去后修改下拉菜单链接颜色 */
{
 background-color: rgb(213,89,111);       
}

.dropdown:hover .dropdown-content          /* 在鼠标移上去后显示下拉菜单 */
{
    display: block;
}

.dropdown:hover .dropbtn                   /* 当下拉内容显示后修改下拉按钮的背景颜色 */
{
    background-color: rgb(213,89,111);
}
.nav-2 a                                  /*登出*/
{
    opacity: 0.5;
    position:relative;
 left:-95px;
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
<section class="nav">                                                  <!--导航栏 -->
	<ul>
	<br><br>
    <li><a href="add+delete.jsp">用户操作</a></li><br><br><br><br>       <!-- 增删 --> 
    <li><a href="revise.jsp">信息更改</a></li><br><br><br><br>           <!-- 修改 -->
    <li class="active"><a href="search.jsp">信息查看</a></li><br><br><br><br>           <!-- 显示、排序、查询 -->                                                   
    </ul>
</section>

<div class="dropdown">                                                  <!--下拉菜单 -->                               
  <button class="dropbtn">选择操作</button>
	<div class="dropdown-content">
    <a href="look.jsp">查看</a>
    <a href="sort.jsp">排序（默认）</a>
    <a href="search.jsp">查询</a>
 	</div>
</div>
</section>
<section class="nav-2">
	<a href="login.jsp">登出</a>
</section>
<div class="form">  
<!--  <form method="get" action="  ">  -->   <!-- 数据库排序，能不能不用提交表单的方法 -->


<h2>排序：</h2><!-- 可位置往上来一点 -->
<script>
function s_click(obj)
{
    var num = 0;
    for(var i=0;i<obj.options.length;i++)
    {
      if(obj.options[i].selected==true)
      {
          num++;

      }
     }
     if(num==1)
     {
      var url = obj.options[obj.selectedIndex].value;
      window.open(url);//这里修改打开连接方式
     }
}
</script>

<select  multiple onchange="s_click(this)" size="3" >
 <option value="look.jsp">默认</option>           <!-- selected 属性规定在页面加载时预先选定该选项-->    
 <option value="phonenumber" >按电话号码排序</option>
 <option value="name" >按人名排序</option>                             
</select>

 <!-- Java传过来的flag，代表是否排好顺序-->
 
<div class="top">排序结果如下</div>
<table border="2">
<tr>
	<th>电话号码</th>
	<th>人名</th>
	<th>工作部门</th>
	<th>邮箱</th>
</tr>
<%
     node pnode = (node) request.getAttribute("pNode");
     //String pflag =  request.getParameter("Flag");
    // out.print("pnode.phonenumber"+request.getParameter(pnode.phonenumber));
 %>
<%
try{
	while (pnode.next!=null) 
    {
     //将查询结果按表格形式输出 
	    out.print("<tr>");
	 	out.print("<td>"+pnode.phonenumber+"</td>");
	 	out.print("<td>"+pnode.name+"</td>");
	 	out.print("<td>"+pnode.department+"</td>");
	 	out.print("<td>"+pnode.email+"</td>");
	    out.print("<tr>");
	    pnode=pnode.next;
	}  	
	
}catch (Exception e) {        
	out.print("查看异常！flag是");  
   // out.print(pflag); 
}            
%>
<!--  </form> -->
</body>
</html>
    
    
</form>	
</body>
</html>
