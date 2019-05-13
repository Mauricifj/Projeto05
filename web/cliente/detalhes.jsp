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
        <title>Compras</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../style.css">
    </head>
    <body class="list">
        <%@include file="../WEB-INF/jspf/header.jspf" %>
        
        <h2 class="titleClienteFabricante">Compras</h2>
        
        <%
            if (request.getParameter("id") != null)
            {
                int id = Integer.parseInt(request.getParameter("id"));
                try {
                    Customer customer = Customer.getCustomer(id);
                    if (customer != null) {
                        ArrayList<Order> orders = Order.getOrders(id);
        %>
        
        <div class="details">
            <h4 style="font-weight: bold;">Número: <%= customer.getId() %></h4>
            <h4 style="font-weight: bold;">Nome: <%= customer.getNome() %></h4>
        </div>                 
                       <div class="container tableClienteFabricanteGeral">
                           <table class="table table-hover tableClienteFabricante" border="1">
                                <tr class="thClienteFabricante">
                                    <th>Número</th>
                                    <th>Data</th>
                                    <th>Frete</th>
                                </tr>
                            <%if(orders.size() > 0) {%>
                                <%
                                    for (Order order : orders) {
                                %>
                                        <tr class="generatedRow">
                                            <td style="text-align: center;"><%= order.getNum() %></td>
                                            <td style="text-align: center;"><%= order.getSalesDate() %></td>
                                            <td style="text-align: center;"><%= order.getShippingCost() %></td>
                                        </tr>
                                <%      
                                    }
                                %>
                           </table>
                        </div>
                        
                        <h3><a href="index.jsp" class="backButton btn btn-danger btn-lg">Voltar</a></h3>
        <%          } else { %>
                      <h3 class="col-6 centralize text-center"> Não há compras </h3>     
                    <%}
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
        
        <%@include file="../WEB-INF/jspf/footer.jspf"%>
           
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     </body>
</html>
