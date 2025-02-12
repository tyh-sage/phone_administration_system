import java.io.IOException;
import java.net.URLEncoder;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class dologin extends HttpServlet
{

    /**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;

	public dologin() 
	{
        super();
    }

    public void destroy()
    {
        super.destroy();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        Connection ct;
        PreparedStatement ps;
        ResultSet rs;
        // 驱动程序名
        String driver = "com.mysql.cj.jdbc.Driver";
        // URL指向要访问的数据库名
        String url = "jdbc:mysql://localhost:3306/mysql";
        // MySQL配置时的用户名
        String user = "root";
        // MySQL配置时的密码
        String password = "tyh030210";

        // 输入的用户名和密码
        String txtUsername;
        String txtPassword;
        // 数据库中存储的用户名和密码
        String myuserword;
        String mypwd;

        //接收数据
        txtUsername = request.getParameter("name");
        txtPassword = request.getParameter("password");

       
            System.out.println("正在连接数据库...");

            try 
            {
                // 加载驱动程序
                Class.forName(driver);
                // getConnection()方法，连接MySQL数据库！！
                ct = (Connection) DriverManager.getConnection(url,user,password);
                if (ct != null) 
                {
                    System.out.println("数据库连接成功!");
                }

                ps = (PreparedStatement) ct.prepareStatement("select * from ad where name=? and password=? ");
                ps.setString(1, txtUsername);// 将第一个？设置为参数txtUsername
                System.out.println(txtUsername); 
                ps.setString(2, txtPassword); // 将第二个?设置为参数txtPassword
                // rs是一个ResultSet结果集,可以把rs理解成返回一张表行的结果集
                rs = ps.executeQuery(); // 执行查找看是否存在，有的话rs.next()返回true,反之为
                                        // false
                // 如果存在此用户，则跳转到主界面
                if (rs.next()) 
                {
                    myuserword = rs.getString(2);// 获得表格的第二列，此处为用户名
                    mypwd = rs.getString(3); // 获得表格的第三列，此处为密码
                    System.out.println("成功从mysql数据库的contol表中获取到用户名和密码：");
                    System.out.println(myuserword + "\t" + mypwd + "\t");// “\t”为“转义字符”,代表的是一个tab，也就是8个空格。
                    response.sendRedirect("main.jsp");
                }
                else 
                {
                    System.out.println("没有该用户，请重新输入");
                    response.sendRedirect("login.jsp?error=yes");
                }
                ct.close();

            } 
            catch (Exception e)
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
          
            

        // 判断是否勾选十天免登录
        boolean isRememberUser = (request.getParameter("isUseCookie") != null);
        if (isRememberUser)
        {// 要记住用户
            // 把用户名和密码保存在Cookie对象里面
            String username = URLEncoder.encode(txtUsername, "utf-8");
            // 使用URLEncoder解决无法在Cookie当中保存中文字符串问题，
            String pwd = URLEncoder.encode(txtPassword, "utf-8");

            Cookie usernameCookie = new Cookie("name", username);
            Cookie passwordCookie = new Cookie("password", pwd);
            usernameCookie.setMaxAge(60*60*24*10);
            passwordCookie.setMaxAge(60*60*24*10);// 设置最大生存期限为10天
            response.addCookie(usernameCookie);
            response.addCookie(passwordCookie);
        }
        else
        {
            Cookie[] cookies = request.getCookies();
            if (cookies != null && cookies.length > 0) 
            {
                for (Cookie c : cookies)
                {
                    if (c.getName().equals("name")|| c.getName().equals("password")) 
                    {
                        c.setMaxAge(0); // 设置Cookie失效
                        response.addCookie(c); // 重新保存。
                    }
                }
            }
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        doGet(request, response);
    }

    public void init() throws ServletException
    {

    }

}
