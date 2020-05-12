
package com.tech.blog.entities;

import java.sql.Timestamp;


public class user {
    private int id;
    private String name,about ;
    private String email,password,gender;
    private Timestamp datetime;
    private String profile;

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getProfile() {
        return profile;
    }
    public user(int id, String name, String about, String email, String password, String gender) {
        this.id = id;
        this.name = name;
        this.about = about;
        this.email = email;
        this.password = password;
        this.gender = gender;
        
    }

    public user(String name, String about, String email, String password, String gender) {
        this.name = name;
        this.about = about;
        this.email = email;
        this.password = password;
        this.gender = gender;
        
    }

    public user() {
    }
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the about
     */
    public String getAbout() {
        if(about.isEmpty())return "hey ! using TechBlog";
        return about;
    }

    /**
     * @param about the about to set
     */
    public void setAbout(String about) {
        this.about = about;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the datetime
     */
    public Timestamp getDatetime() {
        return datetime;
    }

    /**
     * @param datetime the datetime to set
     */
    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }
    
}
