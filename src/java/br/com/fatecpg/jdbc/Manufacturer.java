package br.com.fatecpg.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Manufacturer {
    private int id;
    private String nome;
    private String cidade;
    private String estado;
    private String email;

    public Manufacturer(int id, String nome, String cidade, String estado, String email) {
        this.id = id;
        this.nome = nome;
        this.cidade = cidade;
        this.estado = estado;
        this.email = email;
    }
    
    public static ArrayList<Product> getProducts(int id) throws Exception {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        
        String url = "jdbc:derby://localhost:1527/sample";
        Connection connection = DriverManager.getConnection(url, "app", "app");
        String sql = "SELECT * FROM PRODUCT WHERE MANUFACTURER_ID = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet results = statement.executeQuery();
        ArrayList<Product> products = new ArrayList<>();
        while (results.next()) {
            Product produto = new Product(
                    results.getInt("PRODUCT_ID"),
                    results.getString("DESCRIPTION"),
                    results.getDouble("PURCHASE_COST"),
                    results.getString("AVAILABLE"),
                    results.getInt("QUANTITY_ON_HAND"),
                    results.getString("PRODUCT_CODE")
            );
            products.add(produto);
        }
        results.close(); statement.close(); connection.close();
        return products;
    }
    
    public static Manufacturer getManufacturer(int id) throws Exception {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        
        String url = "jdbc:derby://localhost:1527/sample";
        Connection connection = DriverManager.getConnection(url, "app", "app");
        String sql = "SELECT * FROM MANUFACTURER WHERE MANUFACTURER_ID = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet results = statement.executeQuery();
        Manufacturer manufacturer = null;
        while (results.next()) {
            manufacturer = new Manufacturer(
                    results.getInt("MANUFACTURER_ID"),
                    results.getString("NAME"),
                    results.getString("CITY"),
                    results.getString("STATE"),
                    results.getString("EMAIL")
            );
        }
        results.close(); statement.close(); connection.close();
        return manufacturer;
    }
    
    public static ArrayList<Manufacturer> getManufacturers() throws Exception {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        
        String url = "jdbc:derby://localhost:1527/sample";
        Connection connection = DriverManager.getConnection(url, "app", "app");
        Statement statement = connection.createStatement();
        ResultSet results = statement.executeQuery("SELECT * FROM MANUFACTURER");
        ArrayList<Manufacturer> manufacturers = new ArrayList<>();
        while (results.next()) {
            Manufacturer manufacturer = new Manufacturer(
                    results.getInt("MANUFACTURER_ID"),
                    results.getString("NAME"),
                    results.getString("CITY"),
                    results.getString("STATE"),
                    results.getString("EMAIL")
            );
            manufacturers.add(manufacturer);
        }
        results.close(); statement.close(); connection.close();
        return manufacturers;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
