/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author quocb
 */
@Getter
@Setter
@Builder
@ToString
public class Product {

  
    private int id;
    private String code;
    private String name;
    private int quantity;
    private float price;
    private String description;
    private String imageUrl;
    private int status;
    private int subCategoryId;
    private String subCate;
    
//    public List<Images> getListImages() {
//        try {
//            List<Images> list = new ArrayList<>();
//            //mo ket noi
//            Connection conn = new DBContext().getConnection();
//            String sql = "SELECT * FROM [dbo].[images] where productId=?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, this.id);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//               Images images = Images.builder()
//                       .id(rs.getInt(1))
//                       .productId(rs.getInt(2))
//                       .imageUrl(rs.getString(3))
//                       .status(rs.getInt(4))
//                       .build();
//                list.add(images);
//            }
//            return list;
//        } catch (Exception e) {
//            e.printStackTrace(System.out);
//        }
//        return null;
//    }
    


}
