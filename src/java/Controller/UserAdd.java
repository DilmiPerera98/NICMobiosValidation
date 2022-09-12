/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Calendar;
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
@WebServlet(name = "UserAdd", urlPatterns = {"/UserAdd"})
public class UserAdd extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         PrintWriter out = response.getWriter();
       RequestDispatcher rd;
       
       User user = new User();
       boolean validNIC= false;
       boolean newNIC = false;
       
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String nationality = request.getParameter("nationality");
        String nic = request.getParameter("nic");
        String gender=null;
        int age = 0;
        String dob = null;
        
        int daysperMonth[]= {31,29,31,30,31,30,31,31,30,31,30,31}; 
        
        int year=0;
        int calculateyear;
        int monthdate = 0;
        int temp;
        int month = 0;
        int date;
        String errMsg ="";
        
        int  currentYear= Calendar.getInstance().get(Calendar.YEAR);
        
        try{
            if(nic.length()==10||nic.length()==12){
                validNIC   = true;
            }{
            System.out.println("Invalid nic");
        }
            if(nic.length()==12 && validNIC == true){
                newNIC = true;
            }else if(nic.length()==10 && validNIC==true){
                newNIC = false;
            }
            
            if(newNIC==false && validNIC == true){       
                calculateyear = Integer.parseInt(nic.substring(0, 2));
                monthdate = Integer.parseInt(nic.substring(2, 5));

                year = 1900 + calculateyear;
            }else if(newNIC==true && validNIC == true){
                calculateyear = Integer.parseInt(nic.substring(0, 4));
                monthdate = Integer.parseInt(nic.substring(4, 7));

                year = calculateyear;
            }
            
            if(monthdate >500){
                monthdate  =   monthdate-500;
                gender   = "Female";
            }else{
                gender = "Male";
            }
            
            temp = monthdate;
            
            for(int i=0; i<12; i++){
                if(temp <=daysperMonth[i]){
                    month = i+1;
                    break;
                }
                else{
                    temp = temp - daysperMonth[i];
                }
            }
            
            for(int i=0; i< (month-1); i++){
                monthdate = monthdate-daysperMonth[i];
            }
            
            date = monthdate;
            
            dob= year+"/"+date +"/"+month;
            currentYear = Calendar.getInstance().get(Calendar.YEAR);
            
            age = currentYear-year;
            
        
        user.setNic(nic);
        user.setFullName(fullName);
        user.setAddress(address);
        user.setNationality(nationality);
        user.setGender(gender);
        user.setAge(age);
        user.setDob(dob);

        }catch(Exception ex) {
            ex.printStackTrace();
        }
        
        UserDao ud=  new UserDao();
        try {
            Connection con=null;
            con= ud.getConnection();
            String sql= "INSERT INTO userdetails.user (fullName,address,nationality,nic,gender,age,dob) VALUES(?,?,?,?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, fullName);
            ps.setString(2, address);
            ps.setString(3, nationality);
            ps.setString(4, nic);
            ps.setString(5, gender);
            ps.setInt(6, age);
            ps.setString(7, dob);
            
            //probblem occured
             int   rowCount=   ps.executeUpdate();
            
          if(rowCount>0){
               request.setAttribute("status", "success");
               rd =   request.getRequestDispatcher("index.jsp");
               rd.forward(request, response);
           }



        } catch (Exception ex) {
            ex.printStackTrace();
        }
         
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
