/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.feedBackDTO;
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
public class feedBackDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private static String newComment = "insert into feedback values (?,?,?,?,?,?)";
    private static String listFeedback = "select * from feedback where productID = ?";
     private static String genID = "select count(feedBackID) as counted from feedBack";

    public void addComment(int feedBackID, String productID, String username, String comment, int vote,String displayName) {
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(newComment);
            ps.setInt(1, feedBackID);
            ps.setString(2, productID);
            ps.setString(3, username);
            ps.setString(4, comment);
            ps.setInt(5, vote);
            ps.setString(6, displayName);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
    }

    public List<feedBackDTO> listFeedbackByProductID(String id) {
        List<feedBackDTO> list = new ArrayList<>();
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(listFeedback);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new feedBackDTO(rs.getString("productID"), rs.getString("username"), rs.getString("Comment"), rs.getString("displayName"),rs.getInt("feedBackID"), rs.getInt("starVote")));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(""+e.getMessage());
        }

        return list;
    }
    public int genID(){
        int count=0;
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(genID);
            rs=ps.executeQuery();
            if(rs.next()){
                count=rs.getInt("counted");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(""+e.getMessage());
        }
        return count+=1;
        
    }
    

    public static void main(String[] args) {
        feedBackDAO dao = new feedBackDAO();
        
//        List<feedBackDTO> list = new ArrayList<>();
//        list=dao.listFeedbackByProductID("1");
//        System.out.println(list);
//int i=0;
//i=dao.genID();
//        System.out.println(i);
    List<feedBackDTO> list = new ArrayList<>();
            
            list=dao.listFeedbackByProductID("3");
            System.out.println(list);
    }
}
