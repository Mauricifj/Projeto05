package br.com.fatecpg.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductCode {
    private String code;
    private String description;

    public static ArrayList<ProductCode> getCodes() throws Exception {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        String url = "jdbc:derby://localhost:1527/sample";
        Connection connection = DriverManager.getConnection(url, "app", "app");
        String sql = "SELECT * FROM PRODUCT_CODE";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet results = statement.executeQuery();
        ArrayList<ProductCode> codes = new ArrayList<>();
        while (results.next()) {
            ProductCode code = new ProductCode(
                    results.getString("PROD_CODE"),
                    results.getString("DESCRIPTION")
            );
            codes.add(code);
        }
        results.close(); statement.close(); connection.close();
        return codes;
    }

    
    public ProductCode(String code, String description) {
        this.code = code;
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    
    
}
