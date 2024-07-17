package util;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/search_p")   
public class search_p extends HttpServlet
{

    /**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;

	public search_p() 
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
        String txtUserphone;
        
        // 数据库中存储的
        String myuserphone;
        String myusername;
        String myuserdepartment;
        String myuseremail;
        
      
        //接收数据
        txtUserphone = request.getParameter("phonenumber");

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

                ps = (PreparedStatement) ct.prepareStatement("select * from worker where phonenumber=? ");
                ps.setString(1, txtUserphone); // 将第二个?设置为参数txtPassword
                // rs是一个ResultSet结果集,可以把rs理解成返回一张表行的结果集
                rs = ps.executeQuery(); // 执行查找看是否存在，有的话rs.next()返回true,反之为
                                        // false
                // 如果存在此用户，则跳转到主界面
                if (rs.next()) 
                {
                	myuserphone = rs.getString(1);// 获得表格的第一列，此处为电话号码
                	myusername = rs.getString(2);// 获得表格的第二列，此处为用户名
                	myuserdepartment = rs.getString(3);// 获得表格的第二列，此处为用户名
                	myuseremail = rs.getString(4);// 获得表格的第二列，此处为用户名
                    System.out.println("成功从mysql数据库的worker表中获取了电话号码：");
                    System.out.println(myuserphone + "\t" + myusername + "\t"+ myuserdepartment + "\t"+ myuseremail + "\t");// “\t”为“转义字符”,代表的是一个tab，也就是8个空格。
               	 	request.setCharacterEncoding("UTF-8");
               	 	request.setAttribute("phone", myuserphone);
               	 	request.setAttribute("name", myusername);
               	 	request.setAttribute("department",myuserdepartment);
               	 	request.setAttribute("email",myuseremail);
               	 	request.getRequestDispatcher("/search_phonenumber2.jsp").forward(request, response);
                }
                else 
                {
                    System.out.println("没有该电话号码，请重新输入");
                    response.sendRedirect("search_phonenumber.jsp?error=no");
                }
                ct.close();

            } 
            catch (Exception e)
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
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
