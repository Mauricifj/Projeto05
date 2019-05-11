<%-- 
    Document   : details
    Created on : 05/05/2019, 16:12:45
    Author     : mfj
--%>

<%@page import="br.com.fatecpg.jdbc.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.jdbc.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras - JavaDB</title>
    </head>
    <body>
        <h1>JavaDB</h1>
        <h2>Compras</h2>
        <h3><a href="index.jsp">Voltar</a></h3>
        <%
            if (request.getParameter("id") != null)
            {
                int id = Integer.parseInt(request.getParameter("id"));
                try {
                    Customer customer = Customer.getCustomer(id);
                    if (customer != null) {
                        ArrayList<Order> orders = Order.getOrders(id);
        %>
                        <h3>Id: <%= customer.getId() %></h3>
                        <h3>Nome: <%= customer.getNome() %></h3>
                        <table border="1">
                            <tr>
                                <th>Número</th>
                                <th>Data</th>
                                <th>Frete</th>
                            </tr>
                            <%
                                for (Order order : orders) {
                            %>
                                    <tr>
                                        <td><%= order.getNum() %></td>
                                        <td><%= order.getSalesDate() %></td>
                                        <td><%= order.getShippingCost() %></td>
                                    </tr>
                            <%      
                                }
                            %>
                        </table>
        <%        
                    } else {
        %>
                    <h3>Cliente <%= id %> não encontrado</h3>
        <%
                    }
                    } catch(Exception ex) {
        %>
                    <h3><%= ex.getMessage() %></h3>
        <%
                }
            }
            else {
                response.sendRedirect("index.jsp");
            }
        %>    
            
    </body>
</html>
