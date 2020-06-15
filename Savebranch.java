/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.online.attendence.save.java.org;

import java.sql.*;
public class Savebranch {
    
    private String bname,bcode,error;

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getBcode() {
        return bcode;
    }

    public void setBcode(String bcode) {
        this.bcode = bcode;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    
    
    
    public boolean branch(){
        
        try{
            Connection con=com.online.attendence.connection.org.MyCon.getCon();
            PreparedStatement ps=con.prepareStatement("insert into branch(bcode,bname)values(?,?)");
            ps.setString(1,bcode);
            ps.setString(2,bname);
            ps.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            error=e.toString();
            return false;
        }
    }
    
}
