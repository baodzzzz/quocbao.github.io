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
import java.sql.Statement;
import java.util.Map;
import model.Cart;
import model.Order;

/**
 *
 * @author quocb
 */
public class OrderDetailDAO {

    public boolean insert(Map<Integer, Cart> cartMap, int orderId) { // sau khi save trả về id
        int numRow = 0;
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "INSERT INTO [dbo].[order_detail] ([order_id] ,[product_id] ,[product_name] ,[product_price] ,[quantity] ,[product_image]) VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            int [] a  = {};
             for (Map.Entry<Integer, Cart> entry : cartMap.entrySet()) {
                Integer productId = entry.getKey();
                Cart cart = entry.getValue();
                ps.setInt(1, orderId);
                ps.setInt(2, cart.getProduct().getId());
                ps.setString(3, cart.getProduct().getName());
                ps.setDouble(4, cart.getProduct().getPrice());
                ps.setInt(5, cart.getQuantity());
                ps.setString(6, cart.getProduct().getImageUrl());
                ps.addBatch();
            }
            a = ps.executeBatch();
            numRow = a.length;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return numRow > 0;
    }
}
