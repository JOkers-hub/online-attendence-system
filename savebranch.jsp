<%@page import="java.sql.*"%>
<jsp:useBean id="bs" class="com.online.attendence.save.java.org.Savebranch"/>
    <jsp:setProperty name="bs" property="*"/>
    <%
        if(bs.branch()){
            session.setAttribute("bsave","<p style='color:green; font-weight:bold;'>Branch has been successfully added.</p>");
        }else{
            session.setAttribute("bsave","<p style='color:red; font-weight:bold;'>Error: "+bs.getError()+"</p>");
        }
        response.sendRedirect("../adminoption.jsp");
    
    %>