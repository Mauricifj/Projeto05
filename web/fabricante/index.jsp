<%-- 
    Document   : index
    Created on : 05/05/2019, 16:12:26
    Author     : mfj
--%>

<%@page import="br.com.fatecpg.jdbc.Manufacturer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fabricantes - JavaDB</title>
    </head>
    <body>
        <h1>JavaDB</h1>
        <h2>Fabricantes</h2>
        <h3><a href="../index.jsp">Voltar</a></h3>
        <%
            try {
                ArrayList<Manufacturer> manufacturers = Manufacturer.getManufacturers();
        %>
            <table border="1">
                <tr>
                    <th>Id</th>
                    <th>Nome</th>
                    <th>Cidade/Estado</th>
                    <th>Email</th>
                    <th>Produtos</th>
                </tr>
                <%
                    for (Manufacturer manufacturer : manufacturers) {
                %>
                        <tr>
                            <td><%= manufacturer.getId() %></td>
                            <td><%= manufacturer.getNome() %></td>
                            <td><%= manufacturer.getNome() %></td>
                            <td><%= manufacturer.getEmail() %></td>
                            <td><a href="produtos.jsp?id=<%= manufacturer.getId() %>">Produtos</a></td>
                        </tr>
                <%      
                    }
                %>
            </table>
        <%        
            } catch(Exception ex) {
        %>
                <h3>Erro ao buscar fabricantes</h3>
        <%
            }
        %>
    </body>
</html>
