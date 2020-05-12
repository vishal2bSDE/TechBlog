
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list=new ArrayList();
        
        try{
            String q="select * from categories";
            Statement st=con.createStatement();
            ResultSet set=st.executeQuery(q);
            while(set.next()){
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                Category c=new Category(cid,name,description);
                list.add(c);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean savePost(Post p){
      boolean f=false;
      
      try{
          String q="insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
          PreparedStatement pstmt=con.prepareStatement(q);
          pstmt.setString(1, p.getpTitle());
          pstmt.setString(2, p.getpContent());
          pstmt.setString(3, p.getpCode());
          pstmt.setString(4, p.getpPic());
          pstmt.setInt(5,p.getCatId());
          pstmt.setInt(6,p.getUserId());
          pstmt.executeUpdate();
          f=true;
      }catch(Exception e){
          e.printStackTrace();
      }
      
      return f;
    }
    
    public List<Post> getAllPosts(){
        List<Post> list=new ArrayList();
        try{
            String q="select * from posts order by pDate desc";
            PreparedStatement pstmt=con.prepareStatement(q);
            ResultSet set=pstmt.executeQuery();
            while(set.next()){
                int pid=set.getInt("pid");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                Post p=new Post(pid, catId, pTitle, pContent, pCode, pPic, date, userId);
                list.add(p);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Post> getPostByCatId(int catId){
         List<Post> list=new ArrayList();
        try{
            String q="select * from posts where catId=? order by pDate desc";
            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setInt(1, catId);
            ResultSet set=pstmt.executeQuery();
            while(set.next()){
                int pid=set.getInt("pid");
               // int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                Post p=new Post(pid, catId, pTitle, pContent, pCode, pPic, date, userId);
                list.add(p);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public Post getPostByPostId(int postId){
        Post user=null;
        try{
            String q="select * from posts where pid=?"; 
            PreparedStatement p=con.prepareStatement(q);
            p.setInt(1, postId);
            ResultSet set=p.executeQuery();
            if(set.next()){
                int pid=set.getInt("pid");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                user=new Post(pid, catId, pTitle, pContent, pCode, pPic, date, userId);
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
}
