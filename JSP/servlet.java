      
import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class servlet extends HttpServlet {  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
          throws ServletException, IOException {

      // String user = request.getParameter("username");
      // String uemail = request.getParameter("email");
      // String upass = request.getParameter("password");
      PrintWriter pw = response.getWriter();
      response.setContentType("text/html");

      try{
        // Class.forName("com.mysql.jdbc.Driver");
        // Connection con = DriverManager.getConnection("jdbc:mysql://localhost/login?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
        // Statement st = con.createStatement();
        // int x = st.executeUpdate("insert into users(username,email,password) value"+user+"','"+uemail+"','"+upass+"')");
        // if(x>0){
            pw.println("<body style='background:#031346'>");
            pw.println("<div style='margin:200px; background:white'>");
            pw.println("<center><h1>Registration success..</h1>");
            pw.println("<h3 style='margin-bottom:30px'>Welcome to our tech forum</h3></center>"); 
           // pw.println("<button style='width:150px;height:30px;background:#031346' onclick='window.location.href='http://localhost:8000/Forum/Authentication/login.html'>Login</button>");
            pw.println("</div>");
            pw.println("</body>");
        // }else{
        //     pw.println("registration failed..");
        // }

      }catch(Exception e){
        pw.println(e);
      } 

    }
} 