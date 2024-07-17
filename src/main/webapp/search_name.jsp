<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver" %>         <!-- 造成页面500的原因 -->  
<%@page  import="java.util.Enumeration"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查询</title>
<style>
body
{
	min-height: 100vh;
	min-width: 80%;
	background-image: linear-gradient(120deg,rgb(78,140,165 ),rgb(176, 220, 213))

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

.form                                  /*表单*/
{
	left:400px;
    height: 300px;                     /*元素的高度*/
    position: absolute; 
    top: 40%;                          /*元素的顶部边界离父元素的的位置是父元素高度的一半*/
    margin-top: -150px;                /*设置元素顶边负边距，大小为元素高度的一半*/
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
fieldset 
{ 
	padding:10px; 
	margin-top:5px; 
	border:8px solid #1E7ACE; 
 	width:400px;  
 	border: 2px groove black;
 	position:  absolute;
	left:100px;
	top:300px;
}  

legend 
{
    animation: marginMove 10s infinite alternate;
}

@keyframes marginMove 
{
	100% 
	{
        margin-left: 200px;
    }
}
div
{
	position: absolute;
	left:680px;
	top:120px;
}
</style>

<script> 
//取出传回来的参数error并与yes比较
  var errori ='<%=request.getParameter("error")%>';
  if(errori=='no')
  {
   alert("查无此人!");
  }
</script>

</head>
<body> 

<form method="get" action="/search_n">    <!-- 数据库查询电话号码 -->
	<fieldset align="center">
		<legend>查询</legend>                                                          <!--  组合表单中的相关元素-->
		<input type="text" class="input" name="name" placeholder="请输入人名~~" />
		<input type="submit" value="确定" class="input2" />
		<input type="reset" value="重置" class="input2" />
	</fieldset>
</form>
<div><img src ="image/g.gif" width="600" height="600"/></div>
</body>
</html>