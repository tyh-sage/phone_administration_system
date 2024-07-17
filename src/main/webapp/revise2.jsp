<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改</title>
<style>
h1
{
	position: absolute; 
    top: 602px;  
    left: 100px;
}
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
.checkbox                                /*表单的大小*/
{
    zoom: 150%;
    border: 1px solid #ddd;
}

form
{
	font-size:30px; 
}
.form                                  /*表单*/
{
	left:850px;
    height:300px;                     /*元素的高度*/
    position: absolute; 
    top: 35%;                          /*元素的顶部边界离父元素的的位置是父元素高度的一半*/
    margin-top: -150px;                /*设置元素顶边负边距，大小为元素高度的一半*/ 
}
.input                                 /*信息输入框*/
{
    border: 1px solid #B8B8B8;         /*边框粗细为1px、样式为实心的、颜色为#B8B8B8的边框*/
    width: 280px;
    height: 45px;
    padding: 0 10px;                   /*上内边距和下内边距是0； 右内边距和左内边距是10px*/
    border-radius: 5px;                /*将输入框变为圆角的，5px为圆角半径*/
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
table            /* 设置表格 */
{  
	width: 300px; 
    border: 1px solid rgb(242,115,135);  /* 设置表格边框 */
 	position: relative;
 	left:200px;	
 	top:240px;
 	border-collapse: collapse;   /*消除内边框*/
}
 
th               /* 设置表头 */
{
	width: 170px;
    height: 45px;
    background-color: #b78d12;
    border: 2px solid  #b78d12;
 	text-align: center; /* 字体居中对齐 */
}

    
td               /* 设置表格中每一个单元格 */
{
	width: 170px;
    height: 45px;    
    border: 2px solid #b78d12;  
    text-align: center;  /* 字体水平居中 */
}
.odd       /* 设置排名为奇数的一行表格 */
{
    background-color: #f4ce69; 
}

.even      /* 设置排名为偶数的一行表格 */
{
    background-color: #f7da94;
}

input[type=checkbox]                   /*复选框*/
{
	cursor: pointer;
    position: relative;
}
input[type=checkbox]::after 
{
	position: absolute;
    top: 0;
    background-color: #fff;
    color: #fff;
    width: 14px;
    height: 14px;
    display: inline-block;
    visibility: visible;
    padding-left: 0px;
    text-align: center;
    content: ' ';
    border-radius: 2px;
    box-sizing: border-box;
    border: 1px solid #ddd;
}

input[type=checkbox]:checked::after
{
    content: "";
    background-color: #f8d86a;
    border-color: #f8d86a;
    background-color: #f8d86a;
}

input[type=checkbox]:checked::before 
{
    content: '';
    position: absolute;
    top: 1px;
    left: 5px;
    width: 3px;
    height: 8px;
    border: solid white;
    border-width: 0 2px 2px 0;
    transform: rotate(45deg);
    z-index: 1;
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


function check1()            //实现复选框被选中，则禁止使用输入框；反之亦然
{
    var checkbox = document.getElementById("p");
    if(checkbox.checked == true)
    {
        document.getElementById("phonenumber").disabled="disabled";
    }
    else
    {
        document.getElementById("phonenumber").disabled="";
    }
}

function check2()            //实现复选框被选中，则禁止使用输入框；反之亦然
{
    var checkbox = document.getElementById("n");
    if(checkbox.checked == true)
    {
        document.getElementById("name").disabled="disabled";
    }
    else
    {
        document.getElementById("name").disabled="";
    }
}

function check3()            //实现复选框被选中，则禁止使用输入框；反之亦然
{
    var checkbox = document.getElementById("d");
    if(checkbox.checked == true)
    {
        document.getElementById("department").disabled="disabled";
    }
    else
    {
        document.getElementById("department").disabled="";
    }
}

function check4()            //实现复选框被选中，则禁止使用输入框；反之亦然
{
    var checkbox = document.getElementById("e");
    if(checkbox.checked == true)
    {
        document.getElementById("email").disabled="disabled";
    }
    else
    {
        document.getElementById("email").disabled="";
    }
}

</script> 
</head>
<body>

<table>
<tr>
<th class="odd">电话号码</th>
<th class="even"><%=request.getAttribute("phone")%></th>
</tr>
<tr>
<th class="even">人名</th>
<th class="odd"><%=request.getAttribute("name")%></th>
</tr>
<tr>
<th class="odd">工作部门</th>
<th class="even"><%=request.getAttribute("department")%></th>
</tr>
<tr>
<th class="even">邮箱</th>
<th class="odd"><%=request.getAttribute("email")%></th>
</tr>
</table>
<h1>注：点击复选框，才可修改对应信息！</h1>
<div class="form">  
	<form method="get" action="revise_">    <!--动效待完成 -->
	  
		<input type="hidden" name="phonenumber_" value="<%=request.getAttribute("phone")%>" />    <!--隐藏，传值-->
		<input type="hidden" name="name_" value="<%=request.getAttribute("name")%>" />   
    	<input type="hidden" name="department_" value="<%=request.getAttribute("department")%>" />
    	<input type="hidden" name="email_" value="<%=request.getAttribute("email")%>" />
    	
    	<input type="checkbox" id="p" name="revise" class="checkbox" checked="checked" onclick="check1()">更改电话号码<br> 
    	<input type="text" id="phonenumber" name="phonenumber" class="checkbox"  onclick="check1()" disabled="disabled" value=<%=request.getAttribute("phone")%>><br><br>
    	
    	<input type="checkbox" id="n" name="revise" class="checkbox" checked="checked" onclick="check2()">更改姓名<br>
    	<input type="text" id="name" name="name"  class="checkbox" onclick="check2()" disabled="disabled" value=<%=request.getAttribute("name")%>><br><br>
    	
    	<input type="checkbox" id="d" name="revise" class="checkbox" checked="checked" onclick="check3()">更改工作部门<br>
    	<input type="text" id="department"  name="department" class="checkbox" onclick="check3()" disabled="disabled" value=<%=request.getAttribute("department")%>><br><br>
    	
    	<input type="checkbox" id="e" name="revise" class="checkbox" checked="checked" onclick="check4()">更改邮箱<br>
    	<input type="text" id="email" name="email" class="checkbox" onclick="check4()" disabled="disabled" value=<%=request.getAttribute("email")%>><br><br><br>
    	
    	<input type="submit"  class="checkbox" value="保存">
	</form>
</div>
</body>
</html>