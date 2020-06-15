
package com.online.attendence.save.java.org;
import java.sql.*;
public class Saveteacher {
    private String name,fname,email,password,mobileNo,gender,branch,address,error,dob;

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }
   

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

   
    
    public boolean saveTeacher(){
    
    try{
        Connection con=com.online.attendence.connection.org.MyCon.getCon();
        PreparedStatement ps=con.prepareStatement("insert into teacher(name,fname,email,password,gender,branch,mobileNo,address,dob)values(?,?,?,?,?,?,?,?,?)");
        ps.setString(1, name);
        ps.setString(2, fname);
        ps.setString(3, email);
        ps.setString(4, password);
        ps.setString(5, gender);
        ps.setString(6, branch);
        ps.setString(7, mobileNo);
        ps.setString(8, address);
        ps.setString(9, dob);
        ps.executeUpdate();
        return true;
    }
    catch(Exception e){
        e.printStackTrace();
        error=e.toString();
        return false;
    }
}
}
