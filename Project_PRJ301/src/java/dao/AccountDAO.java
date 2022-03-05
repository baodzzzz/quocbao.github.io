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
import model.Account;
import model.Category;

/**
 *
 * @author quocb
 */
public class AccountDAO {

    public Account login(String username, String password) {
        try {
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from account where username=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return Account.builder()
                        .username(rs.getString(1))
                        .password(rs.getString(2))
                        .email(rs.getString(3))
                        .phone(rs.getString(4))
                        .roleId(rs.getInt(5))
                        .status(rs.getInt(6))
                        .activeCode(rs.getString(7))
                        .build();
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public Account checkAccountExist(String username) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT *\n"
                    + "  FROM [dbo].[account]\n"
                    + "  where username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return Account.builder()
                        .username(rs.getString(1))
                        .password(rs.getString(2))
                        .email(rs.getString(3))
                        .phone(rs.getString(4))
                        .roleId(rs.getInt(5))
                        .status(rs.getInt(6))
                        .activeCode(rs.getString(7))
                        .build();
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public void signup(String username, String pass) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "INSERT INTO [dbo].[account]\n"
                    + "           ([userName]\n"
                    + "           ,[password])\n"
                    
                    + "     VALUES\n"
                    + "           (?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }
    
    public List<Account> getAll() {
        try {
            List<Account> list = new ArrayList<>();
            //mo ket noi
            Connection conn = new DBContext().getConnection();
            String sql = "select * from Account";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = Account.builder()
                        .username(rs.getString(1))
                        .password(rs.getString(2))
                        .email(rs.getString(3))
                        .phone(rs.getString(4))
                        .roleId(rs.getInt(5))
                        .status(rs.getInt(6))
                        .activeCode(rs.getString(7))
                        .build();
                list.add(account);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }
    
    public Account getOne(String username) {
        String query = "SELECT * FROM Account WHERE userName =?";
        try (
            Connection con = new DBContext().getConnection();
            PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, username);
                ResultSet rs = ps.executeQuery();
                if (rs != null && rs.next()) {
                    Account account = Account.builder()
                        .username(rs.getString(1))
                        .password(rs.getString(2))
                        .email(rs.getString(3))
                        .phone(rs.getString(4))
                        .roleId(rs.getInt(5))
                        .status(rs.getInt(6))
                        .activeCode(rs.getString(7))
                        .build();
                           
                    return account;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    
}
