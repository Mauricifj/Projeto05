package br.com.fatecpg.jdbc;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Order {
    private int num;
    private Date salesDate;
    private double shippingCost;
    
    public static ArrayList<Order> getOrders(int customerId) throws Exception {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        
        String url = "jdbc:derby://localhost:1527/sample";
        Connection connection = DriverManager.getConnection(url, "app", "app");
        String sql = "SELECT * FROM PURCHASE_ORDER WHERE CUSTOMER_ID = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, customerId);
        ResultSet results = statement.executeQuery();
        ArrayList<Order> orders = new ArrayList<>();
        while (results.next()) {
            Order order = new Order(
                    results.getInt("ORDER_NUM"),
                    results.getDate("SALES_DATE"),
                    results.getDouble("SHIPPING_COST")
            );
            orders.add(order);
        }
        results.close(); statement.close(); connection.close();
        return orders;
    }

    public Order(int num, Date salesDate, double shippingCost) {
        this.num = num;
        this.salesDate = salesDate;
        this.shippingCost = shippingCost;
    }

    public double getShippingCost() {
        return shippingCost;
    }

    public void setShippingCost(double shippingCost) {
        this.shippingCost = shippingCost;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public Date getSalesDate() {
        return salesDate;
    }

    public void setSalesDate(Date salesDate) {
        this.salesDate = salesDate;
    }
}
