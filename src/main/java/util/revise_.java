package util;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import com.search.Searchworker;

@WebServlet("/revise_")   
public class revise_ extends HttpServlet
{

    /**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;

	public revise_() 
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
      //  ResultSet rs;
        // 驱动程序名
        String driver = "com.mysql.cj.jdbc.Driver";
        // URL指向要访问的数据库名
        String url = "jdbc:mysql://localhost:3306/mysql";
        // MySQL配置时的用户名
        String user = "root";
        // MySQL配置时的密码
        String password = "tyh030210";

        // 输入
        String txtUserphone_;   //原始的电话号码
        String txtUsername_;
        String txtUserdepart_;
        String txtUseremail_;
        String txtUserphone;
        String txtUsername;
        String txtUserdepart;
        String txtUseremail;
        
        // 数据库中存储的
      //  String myuserphone;
      //  String myusername;
      //  String myuserdepartment;
      //  String myuseremail;
        
      
        //接收数据
        txtUserphone_=request.getParameter("phonenumber_");
        txtUsername_ = request.getParameter("name_");
        txtUserdepart_ = request.getParameter("department_");
        txtUseremail_ = request.getParameter("email_"); 
        txtUserphone = request.getParameter("phonenumber");
        txtUsername = request.getParameter("name");
        txtUserdepart = request.getParameter("department");
        txtUseremail = request.getParameter("email");
        int rs=0;
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
                
                System.out.println(txtUserphone_);  //默认多选框被选中,不加修改，就会出现null
                System.out.println(txtUsername_);
                System.out.println(txtUserdepart_);
                System.out.println(txtUseremail_);
                System.out.println(txtUserphone);
                System.out.println(txtUsername);
                System.out.println(txtUserdepart);
                System.out.println(txtUseremail);
                if(txtUserphone==null)                   
                	txtUserphone=txtUserphone_;
                if(txtUsername==null)
                	 txtUsername= txtUsername_;
                if(txtUserdepart==null)
                	 txtUserdepart= txtUserdepart_;
                if(txtUseremail==null)
                	txtUseremail=txtUseremail_;
                
                String sql = "update worker set  phonenumber='"+txtUserphone+"',name='"+txtUsername+"',department='"+txtUserdepart+"', email='"+txtUseremail+"' where phonenumber='"+txtUserphone_+"' ";
                ps=ct.prepareStatement(sql);
         	   rs=ps.executeUpdate();
         	   if(rs!=0)
         	   {
         		  System.out.println("更新成功");
         		  response.setContentType("text/html;charset=UTF-8");       //解决中文乱码问题
         		  PrintWriter out = response.getWriter();
         		  out.print("<script>alert('修改成功！修改结果如下'); window.location='look.jsp' </script>");
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