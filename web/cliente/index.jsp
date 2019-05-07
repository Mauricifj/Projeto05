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
        <title>Clientes - JavaDB</title>
    </head>
    <body>
        <h1>JavaDB</h1>
        <h2>Clientes</h2>
        
        <%
            try {
                ArrayList<Customer> customers = Customer.getCustomers();
        %>
            <table border="1">
                <tr>
                    <th>Id</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Detalhes</th>
                </tr>
                <%
                    for (Customer customer : customers) {
                %>
                        <tr>
                            <td><%= customer.getId() %></td>
                            <td><%= customer.getNome() %></td>
                            <td><%= customer.getEmail() %></td>
                            <td><a href="details.jsp?id=<%= customer.getId() %>">Detalhes</a></td>
                        </tr>
                <%      
                    }
                %>
            </table>
        <%        
            } catch(Exception ex) {
        %>
                <h3><%= ex.getMessage() %></h3>
        <%
            }
        %>
    </body>
</html>
