package util;

import java.io.IOException;
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

@WebServlet("/adddelete")
public class adddelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public adddelete() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       Connection ct;//接口实例化为ct
	        PreparedStatement ps;//创建对象ps，可以将SQL语句传给数据库做预编译，使用Connection接口的preparedStatement()方法
	        ResultSet rs;//结果集(ResultSet)是数据中查询结果返回的一种对象，作用就是完成了查询结果的存储功能，
	        
	        String driver = "com.mysql.cj.jdbc.Driver";// 驱动程序类名，MySQL固定的
	        String url = "jdbc:mysql://localhost:3306/mysql";// URL指向要访问的数据库名library
	        String user = "root";// MySQL配置时的用户名
	        String password = "tyh030210";// MySQL配置时的密码
	        
	        //下面是表单传来的电话、姓名、部门、邮件地址
	        String txtphonenumber;
	        String txtname;
	        String txtdepartment;
	        String txtemail;
	        
	     // 接收表单数据
	        txtphonenumber = request.getParameter("phonenumber");
	        txtname = request.getParameter("name");
	        txtdepartment =request.getParameter("department");
	        txtemail =request.getParameter("email");
	        System.out.println("正在连接数据库...");
	            
	        try {
                // 加载驱动程序
                Class.forName(driver);
                // getConnection()方法，连接MySQL数据库！！
                ct = (Connection) DriverManager.getConnection(url, user,password);
                if (ct != null) {
                    System.out.println("数据库连接成功!");
                }

                
                // 添加该用户成功，则仍然处于该界面，上方跳出弹框显示操作成功？？
                Statement stmt = ct.createStatement();//使用Statement对象
                //下面是在指定的列中插入数据，用于向表格中插入新的行。
                String sql = "insert into worker(phonenumber,name,department,email) values('" + txtphonenumber + "','" + txtname + "','" + txtdepartment+ "','" + txtemail+ "')";
                System.out.println(sql);
                int i = stmt.executeUpdate(sql);//返回sql影响的行数
              //  int i=0;
                if (i == 1) 
                	{
                	System.out.println("操作成功");
                	response.sendRedirect("add+delete.jsp?error=yes");//实现重定向
                	}
                
                else 
                {
                	System.out.println("添加失败");
                	response.sendRedirect("add+delete.jsp");//实现重定向
                }
                stmt.close();
                ct.close();

            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }    

		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}