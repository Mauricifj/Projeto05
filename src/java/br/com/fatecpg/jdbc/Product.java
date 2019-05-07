package br.com.fatecpg.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Product {

    private int id;
    private String description;
    private double cost;
    public String availability;
    private int quantity;
    private String code;

    public static ArrayList<Product> getProducts(int manufacturerId) throws Exception {
        Class.forName("org.apache.derby.jdbc.ClientDriver");

        String url = "jdbc:derby://localhost:1527/sample";
        Connection connection = DriverManager.getConnection(url, "app", "app");
        String sql = "SELECT * FROM PRODUCT WHERE MANUFACTURER_ID = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, manufacturerId);
        ResultSet results = statement.executeQuery();
        ArrayList<Product> products = new ArrayList<>();
        while (results.next()) {
            Product product = new Product(
                    results.getInt("PRODUCT_ID"),
                    results.getString("DESCRIPTION"),
                    results.getDouble("PURCHASE_COST"),
                    results.getString("AVAILABLE"),
                    results.getInt("QUANTITY_ON_HAND"),
                    results.getString("PRODUCT_CODE")
            );
            products.add(product);
        }
        results.close();
        statement.close();
        connection.close();
        return products;
    }

    public Product(int id, String description, double cost, String availability, int quantity, String category) {
        this.id = id;
        this.description = description;
        this.cost = cost;
        this.availability = availability;
        this.quantity = quantity;
        this.code = category;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String category) {
        this.code = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String isAvailable() {
        return (availability.equals("TRUE")) ? "Disponível" : "Indisponível";
    }

    public void setAvailability(boolean availability) {
        this.availability = (availability) ? "Disponível" : "Indisponível";;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
