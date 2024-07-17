<%@ page language="java" import="java.util.*,java.net.*"
    contentType="text/html; charset=utf-8"%>

<%
    String path = request.getContextPath();//用来拼接当前网页的相对路径
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%><!-- 用来拼接当前网页的相对路径 ，似乎和上面相似,项目路径basePath" 放入pageContext中-->
<%
        request.setCharacterEncoding("utf-8");//来设置Tomcat接收请求的编码格式，只对POST方式提交的数据有效，对GET方式提交的数据无效
        response.setContentType("text/html;charset=utf-8");//把服务器端的编码方式也设置为utf-8
        String username = "";
        String password = "";
        Cookie[] arrCookie = request.getCookies();//遍历所有Cookie对象,request.getCookies()返回所有Cookie对象,遍历所有返回的对象找到名为listViewCookie的Cookie对象，从中读取list字符串，将list字符串进行分隔得到各个id
        if (arrCookie != null) {
            for (Cookie ck : arrCookie) {//arrCookie分别赋给ck
                if (ck.getName().equals("UserName")) {//UserName?
                    username = URLDecoder.decode(ck.getValue(), "utf-8");//使用指定的编码机制对 application/x-www-form-urlencoded 字符串解码(post的一种编码方式)
                }
                if (ck.getName().equals("PassWord")) {
                    password = URLDecoder.decode(ck.getValue(), "utf-8");//和上面类似
                    break;
                }
            }
        }
    %>
<!DOCTYPE>
<html>
<head>
<style>
*{                                     /*通配符选择器，所有的标签都有的属性*/
	margin: 0;                         /*CSS的盒子模型：content->padding->border->margin*/
	padding: 0;
	text-decoration: none;             /*给文本装饰上划线、中间线、下划线或不装饰*/
	font-family: sans-serif;           /*字体类型、设置字体系列，其中sans-serif：无衬线体*/
	box-sizing: border-box;            /*box-sizing:以特定的方式定义匹配某个区域的特定元素  border-box:放置两个带边框的框*/
	background-attachment: fixed       /*背景图片固定不随滚动条滚动*/
}
body                                    /*标签选择器*/
{
	min-height: 100vh;                  /*min-height:设置元素的最小高度  vh:相对于视窗的高度*/
	background-image: linear-gradient(120deg, rgb(176, 220, 213), rgb(78,140,165 ))   /*背景图片由两种颜色成120度线性渐变*/
}
.wrapper                                /*.类选择器*/
{
    width:354px;
    margin:0 auto;                     /*对象外边距:水平居中*/
}
.form
{
    height: 300px;                     /*元素的高度*/
    position: absolute; 
    top: 50%;                          /*元素的顶部边界离父元素的的位置是父元素高度的一半*/
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
.captcha_input                         /*验证码输入框*/
{
    border: 1px solid #B8B8B8;
    width: 184px;
    height: 45px;
    padding: 0 10px;
    border-top-left-radius: 5px;      /*左上角添加圆角边框*/
    border-bottom-left-radius: 5px;   /*左下角添加圆角边框*/
}
input,img                             /*让输入框和验证码图片水平局中对齐*/
{
	vertical-align:middle;
}
img                                   /*标签选择器，图片*/
{
    height:45px;
    width:90px;
}
.logbtn                               /*登录*/
{
	display: block;                   /*将元素显示为块级元素*/
	width: 100%;
 	height: 50px;
	border: none;
	font-size:20px;                   /*字体大小*/
 	background: linear-gradient(120deg, rgb(224, 241, 244), rgb(130, 204, 210));
 	background-size: 200%;
 	color: #fff;                     /*字体颜色是白色*/
 	outline: none;                   /*绘制于元素周围的一条线无效*/
 	cursor: pointer;                 /*cursor: pointer;*/
 	transition:.5s;                  /*过渡，指的是某个CSS属性值如何平滑的进行改变，即：动效*/
}
.logbtn:hover                        /*伪类，适用于用户使用指示设备虚指一个元素（没有激活它）的情况*/
{
	background-position: right;     /*背景位置右*/
}

.login-form
{
	width: 400px;
	background: #f1f1f1;
	height: 600px;
	padding: 120px 30px;
	border-radius:30px;
	position:absolute;
	left:180px;
	top:150px;
	transform: translate(-50%,-50%);          /*从左侧、右侧0点向左、向右移动自身宽度的50%*/
}

.login-form h1                       /*多类选择器，标题*/
{
	text-align: center;
	margin-bottom: 60px;
}
</style>
<base href="<%=basePath%>">

<title>登录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2">
<meta http-equiv="description" content="This is my page">

<script> 

//取出传回来的参数error并与yes比较
  var errori ='<%=request.getParameter("error")%>';
  if(errori=='yes')
  {
   alert("账号或密码错误，请重新登录!");
  }  
</script>

</head>
<body>

    <div class="wrapper">
        <div class="form">   
            <form name="loginForm" action="dologin" method="post" class="login-form">
               <h1>管理员登陆</h1>
                <table> 
                    <tr>
                        <td>用户：</td>
                        <td><input type="text" name="name"
                            value="<%=username%>" class="input" placeholder="请输入用户名" />
                        </td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td><input type="password" name="password"
                            value="<%=password%>" class="input" placeholder="请输入密码" />
                        </td>
                    </tr>
                   
                    <tr>
                        <td><br></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="checkbox" name="isUseCookie"
                            checked="checked" />十天内记住我的登录状态</td>
                    </tr>
                    <tr>
                        <td><br></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit"
                            value="登录" class="logbtn" />
                        </td>
                    </tr>
                </table>
            </form>
            <!-- 页底开始 -->
        </div>	
        <!-- 页底结束 -->
    </div>
</body>
</html>
