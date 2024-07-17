<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver" %>         <!-- 造成页面500的原因 -->  
<%@page import="java.util.Enumeration"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

    
table            /* 设置表格 */
{  
	width: 700px; /* 表格的宽度与top一样 */
    border: 1px solid #495c69;  /* 设置表格边框 */
 	position: relative;
 	left:300px;	
 	border-collapse: collapse;   /*消除内边框*/
 	left:380px;
	top:180px;
}
 
th               /* 设置表头 */
{
	width: 170px;
    height: 45px;
    background-color:#495c69;
    border: 2px solid #495c69;
 	text-align: center; /* 字体居中对齐 */
}

    
td               /* 设置表格中每一个单元格 */
{
	width: 170px;
    height: 45px;    
    border: 2px solid #495c69;  
    text-align: center;  /* 字体水平居中 */
}
.odd       /* 设置排名为奇数的一行表格 */
{
    background-color: rgb(97,154,195); 
}

.even      /* 设置排名为偶数的一行表格 */
{
    background-color: rgb(143,178,201);
}

.g-container                           /*框框*/
{
	position:  absolute;
	width: 800px; 
	height: 800px; 
	left:300px;
	top:0px;
	color:white;
}
fieldset
{
	position: absolute;
	width: 800px; 
	height: 800px; 
	border: 10px solid transparent; 
	border-top-color: white; 
}
legend
{
    padding: 0 10px; 
} 

fieldset:nth-of-type(2){ transform: rotate(90deg); }
fieldset:nth-of-type(3){ transform: rotate(180deg); }
fieldset:nth-of-type(3)>legend{ transform: rotate(180deg); } 
fieldset:nth-of-type(4){ transform: rotate(-90deg); }

legend
{
	animation: move 10s infinite linear alternate;
} 
@keyframes move 
{
	100%
	{
		margin-left:300px;
	}
}
div
{
	position:  absolute;
	left:-400px;
	top:0px;

}
.cursor
{
	cursor: pointer;      /*鼠标*/
}         
img
{
	position:  absolute;
	left:760px;
	top:480px;
}
</style>

</head>
<body> 
	<div class="g-container">
		<fieldset><legend>search</legend></fieldset>
		<fieldset><legend>name</legend></fieldset>
		<fieldset><legend>successful</legend></fieldset>
		<fieldset><legend>congratulations</legend></fieldset>
	</div>
	<table>
		<tr>	
			<th class="odd">电话号码</th>
			<th class="even">人名</th>
			<th class="odd">工作部门</th>
			<th class="even">邮箱</th>
		</tr>
		<tr>
			<td class="odd"><%=request.getAttribute("phone")%></td>
			<td class="even"><%=request.getAttribute("name")%></td>	
			<td class="odd"><%=request.getAttribute("department")%></td>
			<td class="even"><%=request.getAttribute("email")%></td>
		</tr>
</table>
<div><a href="search_phonenumber.jsp"> <img src ="image/c.png" width="320" height="300" class="cursor"/></a></div>
<a href="search.jsp"><img src ="image/h.png" width="310" height="300" class="cursor" class="cursor"/></a>
</body>
</html>