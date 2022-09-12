<%-- 
    Document   : View
    Created on : Sep 6, 2022, 10:30:54 AM
    Author     : Dilmi
--%>

<%@page import="java.sql.Statement"%>
<%@page import="Controller.UserDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View  User</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <%
           Connection con=null;
           UserDao ud = new UserDao();
           ResultSet resultset = null;
           
            
            String fullName="";
            String address="";
            String nationality="";
            String nic="";
            String gender="";
            int age=0;
            String dob="";
            
            String id = "";
            
            
           
           try{
               con = ud.getConnection();

                Statement stmt = con.createStatement();
                String sql = "Select  *  from  userdetails.user where id='"+request.getParameter("id")+"';";

                resultset = stmt.executeQuery(sql);
                resultset.next();
                System.out.println(resultset.getInt(1));
                fullName = resultset.getString(2);
                address = resultset.getString(3);
                nationality = resultset.getString(4);
                nic = resultset.getString(5);
                gender = resultset.getString(6);
                age = resultset.getInt(7);
                dob = resultset.getString(8);
                
                id= request.getParameter("id");
                
           }catch(Exception e){
                System.out.println("error  is   " + e.getMessage());
           }
           
        %>
    </head>
    <body>
        <div class="container"  align="center">
             
             
             <div class="card">
               <div class="card-header">
                    <h4  align="left">User NIC Validation/List of Users</h4>
                    <div  align="right">
                    <a href="index.jsp"><button class="btn btn-primary">Add New User</button></a>
                    &nbsp;
                    <a href="View.jsp"><button class="btn btn-primary">List All Users</button></a>
                    </div>
                    
                </div>
                <div class="card-body"   align="center">
                    
                    
                    <form action="EditUser?id=<%=id%>" method="post"  >                        
                            
                        <div class="form-group row">
                            <label for="fullName" class="col-sm-2 col-form-label">Full Name</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="fullName" value="<%=fullName %>">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="address" class="col-sm-2 col-form-label">Address</label>
                            <div class="col-sm-7">
                             
                                <input type="text" class="form-control" name="address" value="<%=address %>">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="nationality" class="col-sm-2 col-form-label">Nationality</label>
                            <div class="col-sm-7">
                                <select name="nationality" class="form-control" class="col-sm-7">
                                    <option>Sinhala</option>
                                    <option>Tamil</option>
                                    <option>Muslim</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="nic" class="col-sm-2 col-form-label">NIC</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="nic" value="<%=nic %>" >
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="gender" class="col-sm-2 col-form-label">Gender</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="gender" value="<%=gender %>" >
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="age" class="col-sm-2 col-form-label">Age</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="age" value="<%=age %>" >
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="dob" class="col-sm-2 col-form-label">Date of Birth</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="dob" value="<%=dob %>">
                            </div>
                        </div>
                        
                        
                        <button type="submit" class="btn btn-primary btn-lg">Update</button>

                    </form >
                </div>
             </div>
         </div>
    </body>
</html>
