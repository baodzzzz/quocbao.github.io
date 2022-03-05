/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author quocb
 */
public class SearchDAO {
     public List<Product> searchByName(String txtSearch) {
        try {
            List<Product> list = new ArrayList<>();
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from product where [name] like ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" +txtSearch+ "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .code(rs.getString(2))
                        .name(rs.getString(3))
                        .quantity(rs.getInt(4))
                        .price(rs.getFloat(5))
                        .description(rs.getString(6))
                        .imageUrl(rs.getString(7))
                        .status(rs.getInt(8))
                        .subCategoryId(rs.getInt(9))
                        .build();
                list.add(product);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
}
