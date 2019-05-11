<%-- 
    Document   : details
    Created on : 05/05/2019, 16:12:45
    Author     : mfj
--%>

<%@page import="br.com.fatecpg.jdbc.ProductCode"%>
<%@page import="br.com.fatecpg.jdbc.Manufacturer"%>
<%@page import="br.com.fatecpg.jdbc.Product"%>
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
                    Manufacturer manufacturer = Manufacturer.getManufacturer(id);
                    if (manufacturer != null) {
                    ArrayList<Product> produtos = Product.getProducts(id);
        %>
                        <h3>Id: <%= manufacturer.getId() %></h3>
                        <h3>Nome: <%= manufacturer.getNome() %></h3>
                        <table border="1">
                            <tr>
                                <th>Id</th>
                                <th>Descrição</th>
                                <th>Custo</th>
                                <th>Disponibilidade</th>
                                <th>Estoque</th>
                                <th>Categoria</th>
                            </tr>
                            <%
                                for (Product produto : produtos) {
                                    String categoria = "";
                                    for (ProductCode code : ProductCode.getCodes()) {
                                        if (produto.getCode().equals(code.getCode())) {
                                            categoria = code.getDescription();
                                        }
                                    }
                            %>
                                    <tr>
                                        <td><%= produto.getId() %></td>
                                        <td><%= produto.getDescription() %></td>
                                        <td><%= produto.getCost() %></td>
                                        <td><%= produto.isAvailable()%></td>
                                        <td><%= produto.getQuantity() %></td>
                                        <td><%= categoria %></td>
                                    </tr>
                            <%      
                                }
                            %>
                        </table>
        <%        
                    } else {
        %>
                    <h3>Fabricante <%= id %> não encontrado</h3>
        <%
                    }
                } catch(Exception ex) {
        %>
                    <h3>Erro ao buscar produtos do fabricante></h3>
        <%
                }
            }
            else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
