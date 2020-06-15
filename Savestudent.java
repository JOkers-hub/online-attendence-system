/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.online.attendence.save.java.org;
import com.mysql.cj.xdevapi.Table;
import java.sql.*;
/**
 *
 * @author yoyoa
 */
public class Savestudent {
    
    private String rolno,name,fname,email,password,mobileNo,gender,branch,address,error,dob,table,bcode;
int year,rollno;

    public int getRollno() {
        return rollno;
    }

    public void setRollno(int rollno) {
        this.rollno = rollno;
    }
    public String getName() {
        return name;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getRolno() {
        return rolno;
    }

    public void setRolno(String rollno) {
        this.rolno = rollno;
    }

    public String getBcode() {
        return bcode;
    }

    public void setBcode(String bcode) {
        this.bcode = bcode;
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

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getTable() {
        return table;
    }

    public void setTable(String table) {
        this.table = table;
    }

           
  
    
    public boolean saveStudent(){
       try{
               table= branch.replaceAll("[^0-9]","")+"_student";
           System.out.println(table);
           Connection con=com.online.attendence.connection.org.MyCon.getCon();
           
           System.out.println(table);
           DatabaseMetaData dbm = con.getMetaData();
           ResultSet tables = dbm.getTables(null, null, table, null);
               if(tables.next()) {
                   System.out.println("exist");
                   PreparedStatement pst=con.prepareStatement("insert into "+table+"(name,fname,email,password,gender,year,branch,mobileNo,address,dob)values(?,?,?,?,?,?,?,?,?,?)");
              pst.setString(1, name);
              pst.setString(2, fname);
              pst.setString(3, email);
              pst.setString(4, password);
              pst.setString(5, gender);
              pst.setInt(6, year);
              pst.setString(7, branch);
              pst.setString(8, mobileNo);
              pst.setString(9, address);
              pst.setString(10, dob);
              pst.executeUpdate();
               return true;
               }
                else{
               System.out.println("false");  
               rolno=branch.replaceAll("[^0-9]","")+"001";
               System.out.println(rolno); 
              
               rollno=Integer.parseInt(rolno);
                System.out.println("rol"+rollno); 
               PreparedStatement s=con.prepareStatement("create table "+table+" (rollno int auto_increment PRIMARY KEY,name varchar(40),fname varchar(40),email varchar(40) UNIQUE,password varchar(30),gender varchar(10), branch varchar(50),year int,mobileNo varchar(11),address varchar(100),DOB varchar(15))");
              s.executeUpdate();
              PreparedStatement pst=con.prepareStatement("insert into "+table+"(rollno,name,fname,email,password,gender,year,branch,mobileNo,address,dob)values(?,?,?,?,?,?,?,?,?,?,?)");
              pst.setInt(1, rollno);
              pst.setString(2, name);
              pst.setString(3, fname);
              pst.setString(4, email);
              pst.setString(5, password);
              pst.setString(6, gender);
              pst.setInt(7, year);
              pst.setString(8, branch);
              pst.setString(9, mobileNo);
              pst.setString(10, address);
              pst.setString(11, dob);
              pst.executeUpdate();
               return true;
           }
            
           }
      
       catch(Exception e){
           e.printStackTrace();
           return false;
       }
   }
    
}
