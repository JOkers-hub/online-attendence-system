/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.online.attendence.save.java.org;

/**
 *
 * @author yoyoa
 */
import java.sql.*;

public class Savesubject {

    private String branch, scode, sname, error, table = "";
    int i = 0;
    char a;

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getScode() {
        return scode;
    }

    public void setScode(String scode) {
        this.scode = scode;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getTable() {
        return table;
    }

    public void setTable(String table) {
        this.table = table;
    }

    public Boolean subject() {
        try {
            a = branch.charAt(0);
            table = table + a;
            while (i < branch.length()) {
                if (branch.charAt(i) == ' ') {
                    a = branch.charAt(i + 1);
                    table = table + a;
                }
                i++;
            }
            table=table+"_subject";
            System.out.println(table);
            Connection con = com.online.attendence.connection.org.MyCon.getCon();
            DatabaseMetaData dbm = con.getMetaData();
            ResultSet tables = dbm.getTables(null, null, table, null);
            if(tables.next()) {
                System.out.println("table exist");
                PreparedStatement ps = con.prepareStatement("insert into "+table+" (scode,sname) values(?,?)");
                ps.setString(1, scode);
                ps.setString(2, sname);
                ps.executeUpdate();
            }else{
                PreparedStatement ps=con.prepareStatement("create table "+table+" (scode varchar(15), sname varchar(30))");
                ps.executeUpdate();
                PreparedStatement pst=con.prepareStatement("insert into "+table+" (scode,sname)values(?,?)");
                pst.setString(1, scode);
                pst.setString(2, sname);
                pst.executeUpdate();
                con.close();
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
            return false;
        }
    }
}
