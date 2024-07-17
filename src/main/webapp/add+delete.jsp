<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add+delete</title>
<style>
body {
	min-height: 100vh;
	min-width: 80%;
	background-image: linear-gradient(120deg, rgb(78, 140, 165),
		rgb(176, 220, 213))
}

html, body /*设置html，可以使body之类的有依赖*/ { /*导航栏整体位置*/
	height: 100%;
	width: 100%;
	margin: 0px;
	padding: 0px;
}

section /*导航栏的文本中的区段*/ {
	display: block;
	position: relative;
	top: 80px;
	left: 60px;
	height: 20%;
	width: 10%;
	float: left; /*横向显示*/
}

ul /*导航栏的列表样式*/ {
	list-style-type: none; /*列表项前无标记*/
	margin-top: 5%;
	padding: 0px;
	text-align: center;
}

a /*需要跳转的标签可以使用a标签*/ {
	position: relative;
	color: white;
	text-decoration: none;
	display: inline-block;
	font-size: 1.5em; /*em是相对长度单位*/
}

.nav a {
	opacity: 0.5; /*不透明度*/
}

.nav a:before, .nav a:after /*伪元素:before和:after*/ {
	width: 2px;
	height: 32px;
	background: white;
	content: '';
	position: absolute;
	top: 0px;
	right: -10px;
	-webkit-transition: all 0.2s; /*-webkit-浏览器私有前缀：webkit内核*/
	-moz-transition: all 0.2s; /*-moz浏览器私有前缀：Firefox Gecko内核*/
	-ms-transition: all 0.2s;
	-o-transition: all 0.2s;
	transition: all 0.2s; /*全部样式 0.2秒 缓动*/
}

.nav a:before {
	top: 0px;
	left: -10px;
}

.nav a:hover /*鼠标悬停*/ {
	opacity: 1; /*不透明度*/
}

.nav a:hover::before /*右竖边框动效*/ {
	top: -75px;
	left: 46px;
	width: 2px;
	height: 110px;
	-webkit-transform: rotate(90deg); /*顺时针方向旋转90度*/
	-moz-transform: rotate(90deg);
	-ms-transform: rotate(90deg);
	-o-transform: rotate(90deg);
	transform: rotate(90deg);
}

.nav a:hover::after /*左竖边框动效*/ {
	left: 46px;
	width: 2px;
	height: 110px;
	-webkit-transform: rotate(90deg);
	-moz-transform: rotate(90deg);
	-ms-transform: rotate(90deg);
	-o-transform: rotate(90deg);
	transform: rotate(90deg);
}

li.active {
	background: rgb(0, 0, 0, .2);
	color: rgb(255, 255, 255);
}

.form /*表单*/ {
	left: 700px;
	height: 300px; /*元素的高度*/
	position: absolute;
	top: 33%; /*元素的顶部边界离父元素的的位置是父元素高度的一半*/
	margin-top: -150px; /*设置元素顶边负边距，大小为元素高度的一半*/
}

.nav-2 a /*登出*/ {
	opacity: 0.5;
	position: relative;
	left: -90px;
	top: 500px; /*//////////!!!!!!!登出的位置*/
}

.nav-2 a:before, .nav-2 a:after /*动效前*/ {
	content: '';
	position: absolute;
	background: white;
	top: 18px;
	left: -10px;
	width: 70px;
	height: 1px;
	-webkit-transition: all 0.2s;
	-moz-transition: all 0.2s;
	-ms-transition: all 0.2s;
	-o-transition: all 0.2s;
	transition: all 0.2s;
}

.nav-2 a:hover {
	opacity: 1;
}

.nav-2 a:hover::before /*动效后的上边界*/ {
	top: 0px;
}

.nav-2 a:hover::after /*动效后的下边界*/ {
	top: 36px;
}

div /*提交重置按钮*/ {
	position: absolute;
	top: 220px;
	left: 60px;
}
.submit
{
	position: absolute;
	top: 540px;
	left: 60px;
}
.reset
{
	position: absolute;
	top: 540px;
	left: 108px;
}
</style>
<script> 
//渲染及隐藏被选中的查询多选框对应的输入框
function Querychecked() {
	$('input[type="checkbox"]').click(function() {
		if (this.checked) {
			 let that = $(this);
			 //输入框的类名
			$(".control-label").each(function() {
				//判断 输入框的label 与 选中多选框的内容 是否相同
				if ($(this).text() == that.val()) {
					//委托输入框的父亲显示出来
					$(this).parent().show(0,function(){
					})	
				}	
			})
		} 
		//需要else，没有选中需要隐藏
		else {	
			let that = $(this);
			// console.log(that)
			console.log($(this).val());
			$(".control-label").each(function() {
				if ($(this).text() == that.val()) {
					$(this).parent().hide(0,function(){
					})	
				}	
			})
		}
	})
}
</script>
</head>
<body>
	<section class="nav">
	<ul>
		<br>
		<br>
		<li class="active"><a href="add+delete.jsp">用户操作</a></li>
		<br>
		<br>
		<br>
		<br>
		<!--导航栏 -->
		<li><a href="revise.jsp">信息更改</a></li>
		<br>
		<br>
		<br>
		<br>
		<li><a href="look.jsp">信息查看</a></li>
		<br>
		<br>
		<br>
		<br>
	</ul>
	</section>
	</section>
	<section class="nav-2"> <a href="login.jsp">登出</a> </section>
	<div class="form">
		<form method="get" action="add">
			<img src="image/add.png" width="20" height="20" align="top" /> 增加：<br>
			<br>
			<!-- 如果没有填完整，会不能提交且报错的设置？ -->
			<img src="image/t.png" width="20" height="20" align="top" />
			<!--图片与文本框对齐-->
			<input type="text" name="phonenumber">电话号码<br>
			<br> <img src="image/n.png" width="20" height="20" align="top" />
			<input type="text" name="name">人名<br>
			<br> <img src="image/d.png" width="20" height="20" align="top" />
			<input type="text" name="department">工作部门<br>
			<br> <img src="image/e.png" width="20" height="20" align="top" />
			<input type="text" name="email">E－mail地址<br><br>
			<div><input type="submit" value="保存">
			<input type="reset" value="重置"></div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</form>
		
		<form method="get" action="delete">
			<img src="image/de.png" width="20" height="20" align="top" /> 删除：<br>
			<br> <img src="image/t.png" width="20" height="20" align="top" />
			<input type="text" name="dphonenumber">电话号码<br>
			<br>
			<!-- 改了啊 -->
			<input class="submit" type="submit" value="保存"> 
			<input class="reset" type="reset" value="重置"><br>
		</form>
	</div>
</body>
</html>