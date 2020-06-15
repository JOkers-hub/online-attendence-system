<%@page import="java.sql.*" %>
<%
    String user=request.getParameter("user");
    System.out.println(user);
    String email=request.getParameter("email");
    System.out.println(email);
    String password=request.getParameter("password");
    System.out.println(password);
    if(user.equals("admin"))
    {
        try{
            Connection con=com.online.attendence.connection.org.MyCon.getCon();
            System.out.println(email);
            PreparedStatement st=con.prepareStatement("select * from admin where email=? and password=?");
            st.setString(1, email);
            st.setString(2, password);
            System.out.println("huiguft");
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                System.out.println("likuh");
                int aID=rs.getInt("aID");
                System.out.println(aID);
                String name=rs.getString("name");
                session.setAttribute("name", name);
                response.sendRedirect("../admin/deshboard.jsp?id="+aID);
            }
        }catch(Exception e){
            session.setAttribute("fail", "<p style='color:red; font-weight:bold;'>Sorry Invalid Login </p>");
            System.out.println(e);
            response.sendRedirect("../index.jsp");
        }
    }else if(user.equals("teacher")){
        try{
            Connection con=com.online.attendence.connection.org.MyCon.getCon();
            System.out.println(email);
            PreparedStatement st=con.prepareStatement("select * from teacher where email=? and password=?");
            st.setString(1, email);
            st.setString(2, password);
            System.out.println("huiguft");
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                System.out.println("likuh");
                int tid =rs.getInt("tID");
                String name=rs.getString("name");
                session.setAttribute("name", name);
                response.sendRedirect("../teacher/deshboard.jsp?tid="+tid);
            }
        }catch(Exception e){
            session.setAttribute("fail", "<p style='color:red; font-weight:bold;'>Sorry Invalid Login </p>");
            System.out.println(e);
            response.sendRedirect("../index.jsp");
        }
        
    }else if(user.equals("student")){
        
        try{
            Connection con=com.online.attendence.connection.org.MyCon.getCon();
            System.out.println(email);
            int rollno=Integer.parseInt(email);
            char a;
            String table="";
         int i=0;
         while(i<3){
             a=email.charAt(i);
             table=table+a;
             i++;
         }
         table=table+"_student";
          System.out.println(table);
            session.setAttribute("branch", table);
            PreparedStatement st=con.prepareStatement("select * from "+table+" where rollno=? and password=?");
            st.setInt(1, rollno);
            st.setString(2, password);
            System.out.println("huiguft");
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                System.out.println("likuh");
                int ID=rs.getInt("rollno");
                String name=rs.getString("name");
                session.setAttribute("name", name);
                response.sendRedirect("../student/dashboard.jsp?id="+ID);
            }
        }
        catch(Exception e){
            session.setAttribute("fail", "<p style='color:red; font-weight:bold;'>Sorry Wrong input </p>");
            System.out.println(e);
            response.sendRedirect("../index.jsp");
        }
    }else{
            session.setAttribute("fail", "<p style='color:red; font-weight:bold;'>Sorry Invalid Login </p>");
            response.sendRedirect("../index.jsp");

    }
    System.out.println("back");
%>