package com.search;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import com.search.Searchworker;

@WebServlet("/search_n")   
public class search_n extends HttpServlet
{

    /**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;

	public search_n() 
	{
        super();
    }

    public void destroy()
    {
        super.destroy();
    }
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response)
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
        
        // 数据库中存储的
        String myuserphone;
        String myusername;
        String myuserdepartment;
        String myuseremail;
        
      
        //接收数据
        txtUsername = request.getParameter("name");

            System.out.println("正在连接数据库...");
            ArrayList<Searchworker> list = new ArrayList<Searchworker>();
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
                ps = (PreparedStatement) ct.prepareStatement("select * from worker where name=? ");
                ps.setString(1, txtUsername); // 将第二个?设置为参数name
                // rs是一个ResultSet结果集,可以把rs理解成返回一张表行的结果集
                rs = ps.executeQuery(); // 执行查找看是否存在，有的话rs.next()返回true,反之为
                                        // false
                // 如果存在此用户，则跳转到主界面
                if(rs.next())  //在这里进行判断集合中是否有数据存在...其实这里集合已经拿到集合中的第一条数据
                {
                	ps = (PreparedStatement) ct.prepareStatement("select * from worker where name=? ");
                    ps.setString(1, txtUsername); // 将第二个?设置为参数name
                    // rs是一个ResultSet结果集,可以把rs理解成返回一张表行的结果集
                    rs = ps.executeQuery(); // 执行查找看是否存在，有的话rs.next()返回true,反之为
                                            // false
                    // 如果存在此用户，则跳转到主界面
                	while (rs.next()) 
                	{
                		myuserphone = rs.getString(1);// 获得表格的第一列，此处为电话号码
                		myusername = rs.getString(2);// 获得表格的第二列，此处为用户名
                		myuserdepartment = rs.getString(3);// 获得表格的第二列，此处为用户名
                		myuseremail = rs.getString(4);// 获得表格的第二列，此处为用户名	
                		System.out.println(myuserphone);
                		Searchworker w = new Searchworker(myuserphone, myusername , myuserdepartment, myuseremail);
                		list.add(w);
                	}
                	 for (Searchworker w : list) {
                         System.out.println(w);
                     }
                	              	 	
                }
                else 
                {
                    System.out.println("没有该姓名，请重新输入");
                    response.sendRedirect("search_name.jsp?error=no");
                    return;  
                }
                ct.close();

            } 
            catch (Exception e)
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            request.setAttribute("list", list);
            // 跳转到.jsp展示数据
            // dispatch: 分发
            request.getRequestDispatcher("/search_name2.jsp").forward(request, response);
            return;  
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