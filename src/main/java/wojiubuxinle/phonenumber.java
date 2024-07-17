package wojiubuxinle;
import wojiubuxinle.phonenumber;


import java.io.IOException;//java的输入输出异常包，方便对程序输入输出检测：没有问题，程序正常运行；否则，控制台可以抛出你的输入输出错误。
import java.net.URLEncoder;//URLEncoder是用来对HTML表单编码，该类包含用于将字符串转换为application/x-www-form-urlencoded 格式的静态方法
import java.sql.DriverManager;//DriverManager在java.sql这个包里面,管理一组 JDBC 驱动程序的基本服务
import java.sql.ResultSet;//表示数据库结果集的数据表，通常通过执行查询数据库的语句生成。
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;//获取前端传递的参数，请求转发
import javax.servlet.http.HttpServletResponse;//下载文件,获取路径、设置浏览器支持所下载的文件、获取下载文件的输入流、创建缓冲区等作用
//response需要xml配置
//import com.mysql.cj.jdbc.Connection;
//import com.mysql.jdbc.PreparedStatement;
import java.sql.*;
@WebServlet("/phonenumber")
public class phonenumber extends HttpServlet {

    public phonenumber() {
        super();//父类构造函数
    }

    public void destroy() {
        super.destroy();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {//获取下载文件的路径
        Connection ct;//接口实例化为ct
        PreparedStatement ps;//创建对象ps，可以将SQL语句传给数据库做预编译，使用Connection接口的preparedStatement()方法
        ResultSet rs;//结果集(ResultSet)是数据中查询结果返回的一种对象，作用就是完成了查询结果的存储功能，
        
        String driver = "com.mysql.cj.jdbc.Driver";// 驱动程序类名，MySQL固定的
        String url = "jdbc:mysql://localhost:3306/mysql";// URL指向要访问的数据库名library
        String user = "root";// MySQL配置时的用户名
        String password = "tyh030210";// MySQL配置时的密码

        // 下面是数据库信息
        String txtphonenumber="";
        String txtname="";
        String txtdepartment="";
        String txtemail="";
        //下面是临时承接
        String mphonenumber;
        String mname;
        String mdepartment;
        String mtemail;


            System.out.println("正在连接数据库...");
            
            node pNode=new node();

            try {
                // 加载驱动程序
                Class.forName(driver);
                // getConnection()方法，连接MySQL数据库！！
                ct = (Connection) DriverManager.getConnection(url, user,password);
                if (ct != null) {
                    System.out.println("数据库连接成功!");
                }

                ps = (PreparedStatement) ct
                        .prepareStatement("select * from worker ");//ps是表单传来的账号密码
                //ps.setString(1, txtphonenumber); // 将第一个？设置为参数txtphonenumber
               // ps.setString(2, txtname); // 将第二个?设置为参数txtname
               // ps.setString(3, txtdepartment);//将第三个?设置为参数txtdepartment
               // ps.setString(4, txtemail);//将第四个?设置为参数txtemail
                // rs是一个ResultSet结果集,可以把rs理解成返回一张表行的结果集
                rs = ps.executeQuery(); //把数据库响应的查询结果存放在ResultSet类对象中供我们使用
                // 执行查找看是否存在，有的话rs.next()返回true,反之为 false
                // 如果存在此用户，则跳转到主界面
                String Flag="no";
                while (rs.next()) {//本身就是遍历？
                	mphonenumber = rs.getString(1);// 获得表格的第一列，下面以此类推
                	mname = rs.getString(2);
                	mdepartment = rs.getString(3);
                	mtemail = rs.getString(4);
                	
                	pNode.add(mphonenumber, mname, mdepartment, mtemail);//放入链表
                	pNode.quicksort1(pNode, pNode.getend(pNode));
                	
                    System.out.println("成功从数据库的worker表中获取数据：");
                    //System.out.println(mphonenumber + "\t" + mname + "\t"+mdepartment+ "\t"+mtemail);// “\t”为“转义字符”,代表的是一个tab，也就是8个空格。
                    Flag="yes";
                }
                request.getSession().setAttribute("pNode", pNode);
                request.setAttribute("pNode", pNode);
               
                while(pNode.next!=null) {System.out.println(pNode.phonenumber);pNode=pNode.next;}
                if(Flag.equals("yes"))  
                	 request.getRequestDispatcher("/phonenumber.jsp").forward(request, response);
//                	response.sendRedirect("http://localhost:8080/wojiubuxinle/phonenumber.jsp");//实现重定向
                else {
                    System.out.println("获取数据失败");
                    response.sendRedirect("sort.jsp?error=yes");
                }
                ct.close();

            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            // 如果验证码错误，就跳转回登录界面
        //} else {
           // System.out.println("验证码错误");
            //response.sendRedirect("login.jsp");
        //}

        // 判断是否勾选免登录


    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    public void init() throws ServletException {

    }

}


