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
import java.io.PrintWriter;

@WebServlet("/add")

public class add extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public add() {
        super();
    }
    public void destroy() {
        super.destroy();
    }


    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       Connection ct,CT;//接口实例化为ct
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
	        //System.out.println(txtphonenumber!="");
	        
	        
	        if((txtphonenumber!="")&&(txtname!="")&&(txtdepartment!="")&&(txtemail!=""))  
	        {
	        	try {
	                // 加载驱动程序
	                Class.forName(driver);
	                // getConnection()方法，连接MySQL数据库！！
	                ct = (Connection) DriverManager.getConnection(url, user,password);
	                CT = (Connection) DriverManager.getConnection(url, user,password);
	                if (ct != null&&CT!=null) {
	                    System.out.println("添加专用数据库连接成功!");
	                }

	                
	                // 添加该用户成功，则仍然处于该界面，上方跳出弹框显示操作成功？？
	                Statement stmt = ct.createStatement();//使用Statement对象用于添加
	                Statement Stmt = CT.createStatement();
	                ResultSet j;
	                String SQL="select * from worker where find_in_set('"+txtphonenumber+"',phonenumber)";
	                System.out.println(SQL);//控制台打印，检验字符串是否正确
	                j = Stmt.executeQuery(SQL) ;//返回是否号码已经存在的集合
	                int k;
	                if(j.next()==false) k=1;
	                else  k=0;
	                System.out.println("j="+j.next());
	                //SELECT * FROM users WHERE find_in_set(txtphonenumber, phonenumber);
	                //下面是在指定的列中插入数据，用于向表格中插入新的行。
	                int i=0;
	                
	                if(k==1)
	                {
	                String sql = "insert into worker(phonenumber,name,department,email) values('" + txtphonenumber + "','" + txtname + "','" + txtdepartment+ "','" + txtemail+ "')";
	                System.out.println(sql);//控制台打印，检验字符串是否正确   
	                i = stmt.executeUpdate(sql);//返回sql影响的行数，stmt关闭
	                System.out.println("i="+i);
	                }else {
	                	System.out.println("addfailure phonenumber existed");
	                	PrintWriter out = response.getWriter();
	                	out.print("<script>alert('addfailure phonenumber existed'); window.location='add+delete.jsp' </script>");
					}
	                
	                if (i == 1) 
	                	{
	                	System.out.println("添加成功");
	                	response.setCharacterEncoding("utf-8");
	                	PrintWriter out = response.getWriter();
	                	out.print("<script>alert('addsuccess'); window.location='add+delete.jsp' </script>");
	                	}
	                
	                else 
	                {
	                	System.out.println("addfailure phonenumber existed");
	                	PrintWriter out = response.getWriter();
	                	out.print("<script>alert('addfailure phonenumber existed'); window.location='add+delete.jsp' </script>");
	                }//上面是添加一整行
	               
	                stmt.close();
	                ct.close();

	            } 
		
		        catch (Exception e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
		        
	        	
	        }
	        else {
	        	response.setCharacterEncoding("utf-8");
            	PrintWriter out = response.getWriter();
	        	out.print("<script>alert('addfailure The input cannot be empty'); window.location='add+delete.jsp' </script>");
			}
	        
	        
	          
	        

		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

}