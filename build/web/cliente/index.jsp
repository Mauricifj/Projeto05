<%-- 
    Document   : index
    Created on : 05/05/2019, 16:12:26
    Author     : mfj
--%>

<%@page import="br.com.fatecpg.jdbc.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../style.css">
    </head>
    <body class="list">   
        <%@include file="../WEB-INF/jspf/header.jspf" %>
        
        <h2 class="titleClienteFabricante">Clientes</h2>
       
        <%
            try {
                ArrayList<Customer> customers = Customer.getCustomers();
        %>
        
        <div class="container tableClienteFabricanteGeral">
            <table class="table table-hover tableClienteFabricante" border="1">
                <tr class="thClienteFabricante">
                    <th>Id</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Detalhes</th>
                </tr>
                <%
                    for (Customer customer : customers) {
                %>
                        <tr class="generatedRow">
                            <td style="text-align: center;"><%= customer.getId() %></td>
                            <td><%= customer.getNome() %></td>
                            <td><%= customer.getEmail() %></td>
                            <td style="text-align: center;"><a href="detalhes.jsp?id=<%= customer.getId() %>">Detalhes</a></td>
                        </tr>
                <%      
                    }
                %>
            </table>
        </div>
            
            <h3><a href="../index.jsp" class="backButton btn btn-danger btn-lg">Voltar</a></h3>
        <%        
            } catch(Exception ex) {
        %>
                <h3><%= ex.getMessage() %></h3>
        <%
            }
        %>
        
        <%@include file="../WEB-INF/jspf/footer.jspf" %>
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
