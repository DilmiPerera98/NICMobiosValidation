<%-- 
    Document   : index
    Created on : Sep 4, 2022, 2:23:57 PM
    Author     : Dilmi
--%>

<%@page import="Model.User"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Controller.UserDao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User nic validation</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link> 
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>  
        <script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script>
            (function () {
                'use strict';

                window.addEventListener('load', function () {
                    var forms = document.getElementsByClassName('needs-validation');
                    var validation = Array.prototype.filter.call(forms, function (form) {
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                }, false);
            })();
            
//            var nic=document.forms["form"]["nic"].value;
//            
//            if(!(nic==10 ||   nic==12)){
//              alert("Enter  valid nic ");
//              return false;
//      }

        </script>

    </head>


    <body >
        <div class="container"  align="center">


            <div class="card">
                <div class="card-header">
                    <h2  align="left">User NIC Validation</h2>
                    <div  align="right">
                        <a href="View.jsp"><button class="btn btn-primary">List All Users</button></a>
                    </div>
                </div>
                <div class="card-body"   align="center">

                    <form action="UserAdd" name="form" method="post" class="needs-validation" novalidate id="forms">

                        <div class="form-group row">
                            <label for="fullName" class="col-sm-2 col-form-label">First Name</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="fullName" id="fullName" autocomplete="off" required="" placeholder="Enter Full name">
                                <div class="invalid-feedback">Please Enter the Full Name</div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="address" class="col-sm-2 col-form-label">Address</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="address" placeholder="Enter Address" id="address" autocomplete="off" required="">
                                <div class="invalid-feedback">Please Enter the Address</div>
                            </div>
                        </div>


                        <div class="form-group row">
                            <label for="nic" class="col-sm-2 col-form-label">NIC</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="nic" placeholder="Enter NIC" id="nic" autocomplete="off" required="">
                                <div id="nicvalidate" class="invalid-feedback">Please Enter the NIC Number</div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="nationality" class="col-sm-2 col-form-label">Nationality</label>
                            <div class="col-sm-7">
                                <select name="nationality" class="form-control" class="col-sm-7" id="nationality" autocomplete="off" required="">
                                  <option disabled selected>selct one</option>
                                    <option >Sinhala</option>
                                    <option>Tamil</option>
                                    <option>Muslim</option>
                                </select>
                                <div class="invalid-feedback">Please Select Nationality</div>
                            </div>
                        </div>


                        <button type="submit" class="btn btn-primary btn-lg" >Submit</button>
                        <input type="hidden" id="status" value="<%= request.getAttribute("status")%>"> 



                    </form >
                </div>
            </div>
        </div>

        <script>
            
            var stat = document.getElementById("status");
            console.log(stat.value);

            if (stat.value === "success") {
                swal("Congrats", "Data Added Successfully","success");
            }
 
        </script>
        
    </body>

</html>
