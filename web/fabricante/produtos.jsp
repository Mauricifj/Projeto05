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
        <title>Produtos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../style.css">
    </head>
    <body class="list">
        <%@include file="../WEB-INF/jspf/header.jspf" %>

       <h2 class="titleClienteFabricante">Produtos</h2>
    
        <%
            if (request.getParameter("id") != null)
            {
                int id = Integer.parseInt(request.getParameter("id"));
                try {
                    Manufacturer manufacturer = Manufacturer.getManufacturer(id);
                    if (manufacturer != null) {
                    ArrayList<Product> produtos = Product.getProducts(id);
        %>             
        
                        <div class="products">
                            <h4 style="font-weight: bold;">Número: <%= manufacturer.getId() %></h4>
                            <h4 style="font-weight: bold;">Nome: <%= manufacturer.getNome() %></h4>
                        </div> 
                        <%if(produtos.size() > 0) {%>
                        <div class="container tableClienteFabricanteGeral col-md-12" style="margin-left: 9%;">
                           <table class="table table-hover tableClienteFabricante" border="1">
                                <tr class="thClienteFabricante">                                  
                                    <th>Nº Produto</th>
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
                                        <tr class="generatedRow">                                           
                                            <td style="text-align: center;"><%= produto.getId() %></td>
                                            <td><%= produto.getDescription() %></td>
                                            <td style="text-align: center;"><%= produto.getCost() %></td>
                                            <td style="text-align: center;"><%= produto.isAvailable()%></td>
                                            <td style="text-align: center;"><%= produto.getQuantity() %></td>
                                            <td style="text-align: center;"><%= categoria %></td>
                                        </tr>
                                <%      
                                    }
                                %>
                            </table>
                        </div>
                        
                            <h3><a href="index.jsp" class="backButton btn btn-danger btn-lg" style="margin-left: 10%;">Voltar</a></h3>
        <%          } else { %>
        <h3 class="col-6 centralize text-center"> Não há produtos </h3>
        <%          }
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
