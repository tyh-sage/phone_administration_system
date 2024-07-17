<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver" %>   
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>查看</title>
<style>
 .top                                               /*表格第一行的CSS*/
 {                    
	width: 700px;
    height: 50px;
    background-color: rgb(142,129,188);
    color: white;
    font-size: 20px;  /* 设置字体大小 */
    letter-spacing: 3px;  /* 设置字间距 */   
    line-height: 50px;/* 设置行高与盒子高度一致，实现垂直居中 */    
    text-align:left;/* 设置水平居中 */
    font-family:sans-serif;
    position: relative;
 	left:296px;
 	top:0px;
}
    
table            /* 设置表格 */
{  
	width: 700px; /* 表格的宽度与top一样 */
    border: 1px solid white;  /* 设置表格边框 */
 	position: relative;
 	left:4px;	
 	border-collapse: collapse;   /*消除内边框*/
}
 
th               /* 设置表头 */
{
	width: 170px;
    height: 45px;
    background-color: rgb(184,175,202);
    border: 2px solid white;
 	text-align: center; /* 字体居中对齐 */
}

    
td               /* 设置表格中每一个单元格 */
{
	width: 170px;
    height: 45px;    
    border: 2px solid white;  
    text-align: center;         /* 字体水平居中 */
}
 
.odd       /* 设置排名为奇数的一行表格 */
{
    background-color: #FFF4E4; 
}

.even      /* 设置排名为偶数的一行表格 */
{
    background-color: #FED68F;
}

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
.pos                                      /*返回顶部*/
{
 	position:fixed;
    left:1390px;
    top:450px;
}
</style>

 
</head>
<body> 
<section class="nav">                                                  <!--导航栏 -->
	<ul>
	<br><br>
    <li><a href="add+delete.jsp">用户操作</a></li><br><br><br><br>       <!-- 增删 --> 
    <li><a href="revise.jsp">信息更改</a></li><br><br><br><br>           <!-- 修改 -->
    <li class="active"><a href="look.jsp">信息查看</a></li><br><br><br><br>           <!-- 显示、排序、查询 -->                                                   
    </ul>
</section>

<section class="nav-2">
	<a href="login.jsp">登出</a>
</section>

<div class="dropdown">                                                  <!--下拉菜单 -->                               
  <button class="dropbtn">选择操作</button>
	<div class="dropdown-content">
    <a href="look.jsp">查看（默认）</a>
    <a href="sort.jsp">排序</a>
    <a href="search.jsp">查询</a>
 	</div>
 </div>
 <%  
        try {  
            Class.forName("com.mysql.jdbc.Driver");  //驱动程序名
             String url = "jdbc:mysql://localhost:3306/mysql";   // 获取mysql连接地址
     		 String username = "root";  //数据库用户名
            String password = "tyh030210";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
			//若数据库连接成功，则输出查询到的数据结果
            if(conn != null){  
				 out.print("<br />");  
				 out.print("<br />");  //换行  
                Statement stmt = null;  //给实例赋初值为0
                ResultSet rs = null;   //给结果赋初值为0
                String sql = "SELECT * FROM worker";  //查询语句,查询成绩表中的数据保存到sql
                stmt = conn.createStatement();  //把该对象也就是stmt将SQL语句传递给数据库管理系统执行,通常来说产生结果集，返回给ResultSet对象
                rs = stmt.executeQuery(sql);  
                out.print("<br />");  
				//当结果集中还有数据时，依次输出这些数据
				 //resultSet是你查询的结果集合，rs.next相当于一个指针返回true或false，起始位置为0，每调用一次向下移动一下，如果返回true说明还有记录
%>       
<div class="top">查看结果如下</div>
<table border="2">
<tr>
	<th>电话号码</th>
	<th>人名</th>
	<th>工作部门</th>
	<th>邮箱</th>
</tr>
<%
				while (rs.next()) 
                {
                 //将查询结果按表格形式输出 
				 out.print("<tr>");
				 	out.print("<td>"+rs.getString("phonenumber")+"</td>");
				 	out.print("<td>"+rs.getString("name")+"</td>");
				 	out.print("<td>"+rs.getString("department")+"</td>");
				 	out.print("<td>"+rs.getString("email")+"</td>");
				 out.print("<tr>");
            	}  
            }
            else
            {  
                out.print("连接失败！");  
            }  
			//抛出异常
        }catch (Exception e) {        
            out.print("数据库连接异常！");  
        }  
%>   

</table>
<br><br><br><br><br>
<a href="#top" target="_self">
<img src ="image/top1.png" width="70" height="100" class="pos"/></a>
</body>
</html>

