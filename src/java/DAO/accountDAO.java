/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.accountDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class accountDAO {

    private static String accountCheck = "select * from account where (username = ? or email = ?) and password = ?";
    private static String addUser = "insert into account values (?,?,?,?,?,?,?)";
    private static String getUserByEmail = "select * from account where email = ?";
    private static String genUserID = "select top 1 accountID as counted from Account order by accountID  desc";
    private static String updateAccount = "update account set fullName = ?,phone = ?,email = ? where username = ?";
    private static String loadAllUser = "select * from account order by accountID";
    private static String countCurrentUser = "select count(accountID) as counted from account";
    private static String searchUser = "select * from account where fullName like ?";
    private static String deleteAccount = "delete from account where accountID = ?";
    private static String accountByUser = "select * from account where username = ?";
    private static String updateUserPass = "update account set password = ? where username = ?";
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public accountDTO account(String user, String pass) {
        accountDTO account = null;
        try {
            Connection conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(accountCheck);
            ps.setString(1, user);
            ps.setString(2, user);
            ps.setString(3, pass);
            rs = ps.executeQuery();

            if (rs.next()) {
                account = new accountDTO();
                account.setFullname(rs.getString("fullName"));
                account.setUsername(rs.getString("username").trim());
                account.setPassword(rs.getString("password"));
                account.setEmail(rs.getString("email"));
                account.setPhone(rs.getString("phone"));
                account.setRoleID(rs.getInt("roleID"));
                account.setAccountID(rs.getInt("accountID"));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }

        return account;
    }

    public void addAccount(String fullname, String username, String password, String email, String phone, int roleID, int userID) {
        try {
            Connection conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(addUser);
            ps.setInt(1, userID);
            ps.setString(2, fullname);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.setString(5, email);
            ps.setString(6, phone);
            ps.setInt(7, roleID);

            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
    }

    public accountDTO accountByEmail(String email) {
        accountDTO account = null;
        try {
            Connection conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(getUserByEmail);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                account = new accountDTO();
                account.setFullname(rs.getString("fullName"));
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setEmail(rs.getString("email"));
                account.setPhone(rs.getString("phone"));
                account.setRoleID(rs.getInt("roleID"));
                account.setAccountID(rs.getInt("accountID"));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }

        return account;
    }
    
    public accountDTO accountByUsername(String username){
        accountDTO account = null;
        try {
            conn=DBContext.DBUtils.getConnection();
            ps=conn.prepareStatement(accountByUser);
            ps.setString(1, username);
            rs=ps.executeQuery();
            if(rs.next()){
                account = new accountDTO();
                account.setFullname(rs.getString("fullName"));
                account.setUsername(rs.getString("username").trim());
                account.setPassword(rs.getString("password"));
                account.setEmail(rs.getString("email"));
                account.setPhone(rs.getString("phone"));
                account.setRoleID(rs.getInt("roleID"));
                account.setAccountID(rs.getInt("accountID"));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(""+e.getMessage());
        }
        return account;
    }

    public int genUserID() {
        int currentID = 0;
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(genUserID);
            rs = ps.executeQuery();
            if (rs.next()) {
                currentID = rs.getInt("counted");
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return currentID += 1;

    }

    public void updateAccount(String displayName, String phone, String email, String username) {
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(updateAccount);
            ps.setString(1, displayName);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, username);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
    }

    

    public List<accountDTO> userList() {
        List<accountDTO> list = new ArrayList<>();
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(loadAllUser);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new accountDTO(rs.getString("fullName"), rs.getString("username"), rs.getString("password"), rs.getString("email"), rs.getString("phone"), rs.getInt("roleID"), rs.getInt("accountID")));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }

        return list;

    }

    public List<accountDTO> userListForAdmin(String column, String sortby) {
        List<accountDTO> list = new ArrayList<>();
        try {
            conn = DBContext.DBUtils.getConnection();
            String query = "SELECT * FROM account ORDER BY " + column + " " + sortby + ";";
            ps = conn.prepareStatement(query);
//            ps.setString(1, column);
//            ps.setString(2, sortby);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new accountDTO(rs.getString("fullName"), rs.getString("username"), rs.getString("password"), rs.getString("email"), rs.getString("phone"), rs.getInt("roleID"), rs.getInt("accountID")));

            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(""+e.getMessage());
        }
        return list;

    }
    
    public List<accountDTO> searchUser(String user){
        List<accountDTO> list = new ArrayList<>();
        try {
            conn=DBContext.DBUtils.getConnection();
            ps=conn.prepareStatement(searchUser);
            ps.setString(1,"%"+user+"%");
            rs=ps.executeQuery();
            while (rs.next()) {
                list.add(new accountDTO(rs.getString("fullName"), rs.getString("username"), rs.getString("password"), rs.getString("email"), rs.getString("phone"), rs.getInt("roleID"), rs.getInt("accountID")));

            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(""+e.getMessage());
        }
        return list;
    }
    
    public void deleteAccount(int id){
        try {
            conn=DBContext.DBUtils.getConnection();
            ps=conn.prepareStatement(deleteAccount);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(""+e.getMessage());
        }
    }
    
    public int currentUser(){
        int count = 0;
        try {
            conn=DBContext.DBUtils.getConnection();
            ps=conn.prepareStatement(countCurrentUser);
            rs=ps.executeQuery();
            if(rs.next()){
                count=rs.getInt("counted");
            }
        } catch (Exception e) {
        }
        return count;
    }
    
    public void updatePass(String password,String username){
        try {
            conn=DBContext.DBUtils.getConnection();
            ps=conn.prepareStatement(updateUserPass);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(""+e.getMessage());
        }
    }
    
    public static void main(String[] args) {
        accountDAO dao = new accountDAO();
        int a;
        a=dao.currentUser();
        System.out.println(a);
        List<accountDTO> list = new ArrayList<>();
//        list=dao.userListForAdmin("accountID", "desc");
//        for (accountDTO dTO : list) {
//            System.out.println(""+dTO);
//        }
//list=dao.searchUser("a");
//        for (accountDTO dTO : list) {
//            System.out.println(dTO);
//        }
    dao.updatePass("monlai123", "115063236720814027174");
    }
}
