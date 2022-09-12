<%-- 
    Document   : View
    Created on : Sep 6, 2022, 11:15:02 AM
    Author     : Dilmi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Controller.UserDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <%
        UserDao ud = new UserDao();
        Connection con = null;
        ResultSet resultset = null;
        ArrayList<User> users = new ArrayList<User>();

        try {

            con = ud.getConnection();

            System.out.println("Connnect from  View.jsp");

            Statement stmt = con.createStatement();
            String sql = "Select  *  from  userdetails.user";

            resultset = stmt.executeQuery(sql);
            System.out.println("Query  ececuted  ");

            while (resultset.next()) {
                User user = new User();
                user.setId(resultset.getInt("id"));
                user.setFullName(resultset.getString("fullName"));
                user.setAddress(resultset.getString("address"));
                user.setNationality(resultset.getString("nationality"));
                user.setNic(resultset.getString("nic"));
                user.setGender(resultset.getString("gender"));
                user.setAge(resultset.getInt("age"));
                user.setDob(resultset.getString("dob"));

                users.add(user);

            }

        } catch (Exception e) {
            System.out.println("error  is   " + e.getMessage());
        } finally {
            con.close();
        }

    %>

    <body>
        <div class="container"  align="center">


            <div class="card">
                <div class="card-header">
                    <h4  align="left">User NIC Validation/List of Users</h4>
                    <div  align="right">
                        <a href="index.jsp"><button class="btn btn-primary">Add New User</button></a>
                    </div>

                </div>
                <div class="card-body"   align="center">

                    <div align="center">
                        <table class="table">
                            <thead class="thead-light">
                                <tr>
                                    <th  scope="col">ID</th>
                                    <th scope="col">FULL Name</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Nationality</th>
                                    <th scope="col">Nic</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Age</th>
                                    <th scope="col">Birth Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    for (int i = 0; i < users.size(); i++) {
                                %>
                            <thead class="thead-light">
                                <tr>
                                    <td scope="col"><%=users.get(i).getId()%></td>
                                    <td scope="col"><%=users.get(i).getFullName()%></td>
                                    <td scope="col"><%=users.get(i).getAddress()%> </td>
                                    <td scope="col"><%=users.get(i).getNationality()%></td>
                                    <td scope="col"><%=users.get(i).getNic()%></td>
                                    <td scope="col"><%=users.get(i).getGender()%></td>
                                    <td scope="col"><%=users.get(i).getAge()%></td>
                                    <td scope="col"><%=users.get(i).getDob()%> </td>
                                    <td>
                                        <div  align="right">
                                            <a href="Update.jsp?id=<%=users.get(i).getId() %>" ><button class="btn btn-primary">Edit</button></a>
                                            <a href="DeleteUser?id=<%=users.get(i).getId() %>"><button type="button" class="btn btn-danger">Delete</button></a>
                                        </div>
                                    </td>
                                </tr>
                            </thead>

                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>	

                </div>
            </div>
        </div>    
    </body>
</html>
