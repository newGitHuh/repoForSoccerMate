/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author admin
 */
public class feedBackDTO {
    private String productID,username,comment,displayName;
    private int feedBackID,starVote;

    public feedBackDTO() {
    }

    public feedBackDTO(String productID, String username, String comment, String displayName, int feedBackID, int starVote) {
        this.productID = productID;
        this.username = username;
        this.comment = comment;
        this.displayName = displayName;
        this.feedBackID = feedBackID;
        this.starVote = starVote;
    }

    

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String Comment) {
        this.comment = Comment;
    }

    public int getFeedBackID() {
        return feedBackID;
    }

    public void setFeedBackID(int feedBackID) {
        this.feedBackID = feedBackID;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public int getStarVote() {
        return starVote;
    }

    public void setStarVote(int starVote) {
        this.starVote = starVote;
    }

    @Override
    public String toString() {
        return "feedBackDTO{" + "productID=" + productID + ", username=" + username + ", comment=" + comment + ", displayName=" + displayName + ", feedBackID=" + feedBackID + ", starVote=" + starVote + '}';
    }

    
}
