<%@page import="java.sql.*"%>
<jsp:useBean id="ts" class="com.online.attendence.save.java.org.Saveteacher"/>
    <jsp:setProperty name="ts" property="*"/>
    <%
        if(ts.saveTeacher()){
            session.setAttribute("tsave","<p style='color:green; font-weight:bold;'>Teacher has been successfully added.</p>");
        }else{
            session.setAttribute("tsave","<p style='color:red; font-weight:bold;'>Error: "+ts.getError()+"</p>");
        }
        response.sendRedirect("../adminoption.jsp");
    
    %>