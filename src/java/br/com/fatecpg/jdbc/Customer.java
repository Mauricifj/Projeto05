package br.com.fatecpg.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Customer {
    private int id;
    private String nome;
    private String email;
    
    public static Customer getCustomer(int id) throws Exception {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        
        String url = "jdbc:derby://localhost:1527/sample";
        Connection connection = DriverManager.getConnection(url, "app", "app");
        String sql = "SELECT * FROM CUSTOMER WHERE CUSTOMER_ID = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet results = statement.executeQuery();
        Customer customer = null;
        if (results.next()) {
            customer = new Customer(
                    results.getInt("CUSTOMER_ID"),
                    results.getString("NAME"),
                    results.getString("EMAIL")
            );
        }
        results.close(); statement.close(); connection.close();
        return customer;
    }
    
    public static ArrayList<Customer> getCustomers() throws Exception {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        
        String url = "jdbc:derby://localhost:1527/sample";
        Connection connection = DriverManager.getConnection(url, "app", "app");
        Statement statement = connection.createStatement();
        ResultSet results = statement.executeQuery("SELECT * FROM CUSTOMER");
        ArrayList<Customer> customers = new ArrayList<>();
        while (results.next()) {
            Customer customer = new Customer(
                    results.getInt("CUSTOMER_ID"),
                    results.getString("NAME"),
                    results.getString("EMAIL")
            );
            customers.add(customer);
        }
        results.close(); statement.close(); connection.close();
        return customers;
    }

    public Customer(int id, String nome, String email) {
        this.id = id;
        this.nome = nome;
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
}
