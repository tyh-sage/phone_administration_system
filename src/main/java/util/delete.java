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

@WebServlet("/delete")

public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public delete() {
        super();
    }
    public void destroy() {
        super.destroy();
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       Connection CT;//接口实例化为ct
	        PreparedStatement ps;//创建对象ps，可以将SQL语句传给数据库做预编译，使用Connection接口的preparedStatement()方法
	        ResultSet rs;//结果集(ResultSet)是数据中查询结果返回的一种对象，作用就是完成了查询结果的存储功能，
	        
	        String driver = "com.mysql.cj.jdbc.Driver";// 驱动程序类名，MySQL固定的
	        String url = "jdbc:mysql://localhost:3306/mysql";// URL指向要访问的数据库名library
	        String user = "root";// MySQL配置时的用户名
	        String password = "tyh030210";// MySQL配置时的密码
	        
	        //下面是表单传来的电话
	        String txtdphonenumber;

	        
	     // 接收表单数据
	        txtdphonenumber = request.getParameter("dphonenumber");
	        System.out.println("正在连接数据库...");
	        if(txtdphonenumber!="")  
	        {
		        
		        try {
	                // 加载驱动程序
	                              
	                System.out.println("下面开始删除");
	                //下面是删除一整行
	                Class.forName(driver);
	                // getConnection()方法，连接MySQL数据库！！
	                CT = (Connection) DriverManager.getConnection(url, user,password);
	                if (CT != null) {
	                    System.out.println("删除专用数据库连接成功!");
	                }
	                Statement Stmt = CT.createStatement();//再次使用Statement对象，专用于删除
	                System.out.println("delete from worker where phonenumber=" + txtdphonenumber);
	                int j=0;
	                j = Stmt.executeUpdate("delete from worker where phonenumber=" + txtdphonenumber);
	                System.out.println("j="+j);
	                if (j == 1) 
	            	{
	            	System.out.println("deletesuccess");
	            	response.setCharacterEncoding("utf-8");
	            	PrintWriter out = response.getWriter();
	            	out.print("<script>alert('deletesuccess'); window.location='add+delete.jsp' </script>");
	            	}
	            
	            else 
	            {
	            	System.out.println("deletefailure");
	            	PrintWriter out = response.getWriter();
	            	out.print("<script>alert('deletefailure'); window.location='add+delete.jsp' </script>");//实现重定向
	            }
	                Stmt.close();
	                CT.close();

	            } catch (Exception E) {
	                // TODO Auto-generated catch block
	                E.printStackTrace();
	            } 
	        	
	        }
	        else {
	        	response.setCharacterEncoding("utf-8");
            	PrintWriter out = response.getWriter();
	        	out.print("<script>alert('deletefailure'); window.location='add+delete.jsp' </script>");
			}
	        
	        
	          
	        

		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

}