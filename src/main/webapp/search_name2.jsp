<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mysql.jdbc.Driver" %>         <!-- 造成页面500的原因 -->  
<%@page import="java.util.*"%>
<%@page import="java.com.search.*"%>
<%@ page import="com.search.Searchworker" %>
<!DOCTYPE>
<html>
<head>
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
	border:1px solid #1E7ACE; 
 	width:400px;
}  

fieldset 
{
    border: 2px groove black;
}

legend 
{
    animation: marginMove 20s infinite alternate;
}

@keyframes marginMove 
{
	100% 
	{
        margin-left: 400px;
    }
}
    
table            /* 设置表格 */
{  
	width: 700px; /* 表格的宽度与top一样 */
    border: 1px solid #C3CBD6;  /* 设置表格边框 */
 	position: relative;
 	border-collapse: collapse;   /*消除内边框*/
 	color:white;
 	top:30px;
 	margin : auto;
}
 
th               /* 设置表头 */
{
	width: 170px;
    height: 45px;
    background-color: rgb(173,213,162);
    border: 2px solid rgb(173,213,162);
 	text-align: center; /* 字体居中对齐 */
}

    
td               /* 设置表格中每一个单元格 */
{
	width: 170px;
    height: 45px;    
    border: 2px solid rgb(173,213,162);  
    text-align: center;  /* 字体水平居中 */
}
.odd       /* 设置排名为奇数的一行表格 */
{
    background-color: #748B6F; 
}

.even      /* 设置排名为偶数的一行表格 */
{
    background-color: #2A403D;
}
.odd       /* 设置排名为奇数的一行表格 */
{
    background-color: rgb(140,194,105); 
}

.even      /* 设置排名为偶数的一行表格 */
{
    background-color: rgb(154,190,175);
}

.topic                 /*标题*/
{
	color:white;
	text-align:center;
	background-color: #475164;
	height:60px;
	line-height: 60px;
}
.cu
{	
	font-weight:bold;
	background-color:#fcb70a;
	Font-size:16px;
	
}
div                                    /*图片*/
{
	position:  absolute;
	left:-1100px;
	top:0px;

}
.cursor
{
	cursor: pointer;      /*鼠标*/
}         
img
{
	position:  absolute;
	left:1200px;
	top:480px;
}
</style>

</head>
<body> 
<h2 class="topic">成功查询!&nbsp;&nbsp;&nbsp;结果如下:</h2><br><br>
    <table border="1" cellspacing="0">
        <tr>
            <td class="cu">电话号码</td>
            <td class="cu">人名</td>
            <td class="cu">工作部门</td>
            <td class="cu">邮箱</td>
        </tr>
        <%
            ArrayList<Searchworker> list = (ArrayList<Searchworker>) request.getAttribute("list");
            for (Searchworker w : list) {
        %>
                <tr>
                    <td class="even"><%=w.getphonenumber()%></td>
                    <td class="odd"><%=w.getName()%></td>
                    <td class="even"><%=w.getdepartment()%></td>
                    <td class="odd"><%=w.getemail()%></td>
                </tr>
        <%
            }
        %>
    </table>
<div><a href="search_name.jsp"> <img src ="image/c.png" width="210" height="200" class="cursor"/></a></div>
<a href="search.jsp"><img src ="image/h.png" width="205" height="200" class="cursor" class="cursor"/></a>

</body>
</html>