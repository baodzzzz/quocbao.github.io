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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;

/**
 *
 * @author quocb
 */
public class ProductDAO implements IMethodDAO<Product> {

    public List<Product> getProductByCID(String subCategory_id) {
        try {
            List<Product> list = new ArrayList<>();
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from product where subCategory_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, subCategory_id);
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

    public Product getDetail(String id) {
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from product where id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
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
                        .subCate(rs.getString(10))
                        .build();
                return product;
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getAllPaging(int pageIndex, int pageSize) {
        try {
            List<Product> list = new ArrayList<>();
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from product order by id\n"
                    + "OFFSET (?-1)*? ROW FETCH NEXT ? ROW ONLY";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            ps.setInt(3, pageSize);
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

    public int totalProduct() {
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select COUNT(*) from product";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

//     public List<Product> getTotalCate(int subCategory_id) {
//        try {
//            List<Product> list = new ArrayList<>();
//            //mo ket noi
//            Connection conn = new DBContext().getConnection();
//            String sql = "select sum(quantity) from product where subCategory_id = ?";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, subCategory_id);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                Product product = Product.builder()
//                        .id(rs.getInt(1))
//                        .code(rs.getString(2))
//                        .name(rs.getString(3))
//                        .quantity(rs.getInt(4))
//                        .price(rs.getFloat(5))
//                        .description(rs.getString(6))
//                        .imageUrl(rs.getString(7))
//                        .status(rs.getInt(8))
//                        .subCategory_id(rs.getInt(9))
//                        .build();
//                list.add(product);
//            }
//            return list;
//        } catch (Exception e) {
//            e.printStackTrace(System.out);
//        }
//        return null;
//    }
//    
    @Override
    public List<Product> getAll() {
        try {
            List<Product> list = new ArrayList<>();
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from product";
            PreparedStatement ps = conn.prepareStatement(sql);
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

    @Override
    public Product getOne(int id) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "select * from product where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
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
                        .subCategoryId(rs.getInt(9)).build();
                return product;
            }

        } catch (Exception e) {
            e.printStackTrace(System.out);
        }

        return null;
    }

    @Override
    public boolean insert(Product product) {
        int numRow = 0;
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "INSERT INTO [dbo].[product]\n"
                    + "           ([code]\n"
                    + "           ,[name]\n"
                    + "           ,[quantity]\n"
                    + "           ,[price]\n"
                    + "           ,[description]\n"
                    + "           ,[imageUrl]\n"
                    + "           ,[subCategory_id]\n"
                    + "           ,[subCate])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, product.getCode());
            ps.setString(2, product.getName());
            ps.setInt(3, product.getQuantity());
            ps.setDouble(4, product.getPrice());
            ps.setString(5, product.getDescription());
            ps.setString(6, product.getImageUrl());
            ps.setInt(7, product.getStatus());
            ps.setInt(8, product.getSubCategoryId());
            numRow = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return (numRow > 0);
    }

    @Override
    public boolean update(Product product) {
        int numRow = 0;
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "UPDATE [dbo].[product]\n"
                    + "   SET [code] = ?\n"
                    + "      ,[name] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[imageUrl] = ?\n"
                    + "      ,[status] = ?\n"
                    + "      ,[subCategory_id] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, product.getCode());
            ps.setString(2, product.getName());
            ps.setInt(3, product.getQuantity());
            ps.setDouble(4, product.getPrice());
            ps.setString(5, product.getDescription());
            ps.setString(6, product.getImageUrl());
            ps.setInt(7, product.getStatus());
            ps.setInt(8, product.getSubCategoryId());
            ps.setInt(8, product.getId());
            numRow = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return (numRow > 0);
    }

    @Override
    public boolean delete(int id) {
        int numRow = 0;
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "DELETE FROM [dbo].[product]\n"
                    + "      WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            numRow = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return (numRow > 0);
    }

    public void deleteProduct(String pid) {
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "delete from product where id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }

    public void insertProduct(String code, String name, String quantity, String price, String description, String image, String cid, String category) {
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "INSERT INTO [dbo].[product]\n"
                    + "           ([code]\n"
                    + "           ,[name]\n"
                    + "           ,[quantity]\n"
                    + "           ,[price]\n"
                    + "           ,[description]\n"
                    + "           ,[imageUrl]\n"
                    + "           ,[subCategory_id]\n"
                    + "           ,[subCate])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, code);
            ps.setString(2, name);
            ps.setString(3, quantity);
            ps.setString(4, price);
            ps.setString(5, description);
            ps.setString(6, image);
            ps.setString(7, cid);
            ps.setString(8, category);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }

    public void editProduct(String code, String name, String quantity, String price, String description, String image, String subCategory,String pid) {
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "UPDATE [dbo].[product]\n"
                    + "   SET [code] = ?\n"
                    + "      ,[name] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[imageUrl] = ?\n"
                    + "      ,[subCategory_id] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, code);
            ps.setString(2, name);
            ps.setString(3, quantity);
            ps.setString(4, price);
            ps.setString(5, description);
            ps.setString(6, image);
            ps.setString(7, subCategory);
            ps.setString(8, pid);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }

}
