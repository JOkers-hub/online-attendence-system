<%@page import="java.sql.*"%>
<jsp:useBean id="ss" class="com.online.attendence.save.java.org.Savesubject"/>
    <jsp:setProperty name="ss" property="*"/>
    <%
        if(ss.subject()){
            session.setAttribute("ssave","<p style='color:green; font-weight:bold;'>Subject has been successfully added.</p>");
        }else{
            session.setAttribute("ssave","<p style='color:red; font-weight:bold;'>Error: "+ss.getError()+"</p>");
        }
        response.sendRedirect("../adminoption.jsp");
    
    %>