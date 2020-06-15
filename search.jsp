<%@page import="java.sql.*" %>
<%
    String optn = request.getParameter("find");
    System.out.println(optn);
String type=request.getParameter("typ");
System.out.println(type);
String search=request.getParameter("search");
%>
<html>
    <head>
        <title>search</title>
    </head>
    <body>
        hello!!
        <%      
            if(type.equals("teacher")){
            Connection con = com.online.attendence.connection.org.MyCon.getCon();
            if (optn.equals("id")) {
                int id = Integer.parseInt(search);
                PreparedStatement ps = con.prepareStatement("select * from teacher where tID like '" + id + "%'");
                ResultSet rs = ps.executeQuery();
                if (!rs.isBeforeFirst()) {
                    out.println("<p>No Record Found!</p>");
                } else {%>
                    <table border='1' cellpadding='2' width='100%'>
                    <tr><th>Id</th><th>Name</th><th>Email</th><th>Branch</th></tr>
                   <% while (rs.next()) {%>
                        <tr><td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(7)%></td></tr></table>
                    <%}
                }}else{
                
                PreparedStatement ps = con.prepareStatement("select * from teacher where name like '" +search+ "%'");
                ResultSet rs = ps.executeQuery();
                if (!rs.isBeforeFirst()) {
                    out.println("<p>No Record Found!</p>");
                } else {%>
                    <table border='1' cellpadding='2' width='100%'>
                    <tr><th>Id</th><th>Name</th><th>Email</th><th>Branch</th></tr>
                   <% while (rs.next()) {%>
                        <tr><td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(7)%></td></tr></table>
                    <%}
                }
            }}
         else{
              Connection con = com.online.attendence.connection.org.MyCon.getCon();
            if(optn.equals("rollno")) {
            System.out.println(search+"  djdjd");
            char a;
            String table="";
         int i=0;
         while(i<3){
             a=search.charAt(i);
             table=table+a;
             i++;
         }
         table=table+ "_student";
System.out.println(table);
                int rollno=Integer.parseInt(search);
                PreparedStatement ps = con.prepareStatement("select * from "+table+" where rollno like '" +rollno+ "%'");
                ResultSet rs = ps.executeQuery();
                if (!rs.isBeforeFirst()) {
                    out.println("<p>No Record Found!</p>");
                } else {%>
                    <table border='1' cellpadding='2' width='100%'>
                    <tr><th>Id</th><th>Name</th><th>Email</th><th>Branch</th></tr>
                   <% while (rs.next()) {%>
                        <tr><td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(7)%></td></tr></table>
                    <%}
                }}else{
               
                PreparedStatement ps = con.prepareStatement("select * from where name like '" + search + "%'");
                ResultSet rs = ps.executeQuery();
                if (!rs.isBeforeFirst()) {
                    out.println("<p>No Record Found!</p>");
                } else {%>
                    <table border='1' cellpadding='2' width='100%'>
                    <tr><th>Id</th><th>Name</th><th>Email</th><th>Branch</th></tr>
                   <% while (rs.next()) {%>
                        <tr><td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(7)%></td></tr></table>
                    <%}
                }
            }

}
        %>
    </body>
</html>