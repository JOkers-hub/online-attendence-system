<%@page import="java.sql.*"%>
<jsp:useBean id="ss" class="com.online.attendence.save.java.org.Savestudent"/>
    <jsp:setProperty name="ss" property="*"/>
    
    <%
        
                
        if(ss.saveStudent()){
            session.setAttribute("tsave","<p style='color:green; font-weight:bold;'>Student has been successfully added.</p>");
        }else{
            if(ss.getError()!="null"){
            session.setAttribute("tsave","<p style='color:red; font-weight:bold;'>Error: "+ss.getError()+"</p>");
            }else{
                session.setAttribute("tsave","<p style='color:green; font-weight:bold;'>New table has been created and Student has been successfully added.</p>");
            }
        }
        response.sendRedirect("../adminoption.jsp");
    
    %>