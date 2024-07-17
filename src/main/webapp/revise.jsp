<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>revise</title>
<style>
body
{
	min-height: 100vh;
	min-width: 80%;
	background-image:linear-gradient(120deg,rgb(78,140,165 ),rgb(176, 220, 213));
	cursor:url('image/c.png'),url("http://images.lvyou168.cn/images/next.cur"),auto;
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
	left:600px;
    height:300px;                     /*元素的高度*/
    position: absolute; 
    top: 40%;                          /*元素的顶部边界离父元素的的位置是父元素高度的一半*/
    margin-top: -150px;                /*设置元素顶边负边距，大小为元素高度的一半*/
}
.input                                 /*信息输入框*/
{
    border: 1px solid #B8B8B8;         /*边框粗细为1px、样式为实心的、颜色为#B8B8B8的边框*/
    width: 200px;
    height: 45px;
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

<!--  
<script> 
//取出传回来的参数error并与yes比较
  var errori ='<%=request.getParameter("error")%>';
  if(errori=='no')
  {
   alert("电话号码输入错误，请重新输入!");
  }
</script>
-->

</head>
<body>
<section class="nav">
	<ul>
	<br><br>
    <li><a href="add+delete.jsp">用户操作</a></li><br><br><br><br>       <!-- 增删 --> 
    <li class="active"><a href="revise.jsp">信息更改</a></li><br><br><br><br>           <!-- 修改 -->
    <li><a href="look.jsp">信息查看</a></li><br><br><br><br>           <!-- 显示、排序、查询 -->                                                   
    </ul>
</section>

<section class="nav-2">
	<a href="login.jsp">登出</a>
</section>

<div class="form">  
<form method="post" action="revise">    <!-- 数据库查询电话号码来修改 -->
<h2>修改：</h2>
	</table>
		<tr>
        	<td>电话号码：</td>
        </tr>
        <tr>
    		<td><input type="text" name="phonenumber" class="input" placeholder="请输入电话号码~~" /></td>     <!-- 要杀人了！！！name一定要与数据库匹配！！！ -->
    	</tr>        
    	<tr>
    		<td colspan="2" align="center" ><input type="submit" value="确定" class="input2" /></td>
    	</tr>           
    </table>
</form>	
	
</div>
</body>
</html>