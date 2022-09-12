
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dilmi
 */
@WebServlet(name = "EditUser", urlPatterns = {"/EditUser"})
public class EditUser extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id=request.getParameter("id");
        String fullName=request.getParameter("fullName");
        String address = request.getParameter("address");
        String nationality = request.getParameter("nationality");
        String nic = request.getParameter("nic");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String  dob = request.getParameter("dob");
        
        UserDao ud=  new UserDao();
        
        
        try{
            Connection con=null;
            con= ud.getConnection();
            String sql= "UPDATE userdetails.user set fullName=?,address=?,nationality=?,nic=?,gender=?,age=?,dob=? where  id=?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, fullName);
            ps.setString(2, address);
            ps.setString(3, nationality);
            ps.setString(4, nic);
            ps.setString(5, gender);
            ps.setString(6, age);
            ps.setString(7, dob);
            ps.setString(8, id);
               
            ps.executeUpdate();
            
            RequestDispatcher rd =   request.getRequestDispatcher("View.jsp");
            rd.forward(request, response);
            
            
            System.out.println("Id from EditUser"+ id);
            
        }catch(Exception e){
            System.out.println(e.getMessage());
                   
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
