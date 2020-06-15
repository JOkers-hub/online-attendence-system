<%@page import="java.sql.*" %>
<%
    if(session.getAttribute("name")==null)
    {
        response.sendRedirect("../logout.jsp");
    }
    String id=(String)request.getParameter("id");
    String name=(String)session.getAttribute("name");
    String table=(String)session.getAttribute("branch");
    System.out.println(id+" "+ name+"  "+table);
      session.setAttribute("id", id);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>student dashboard</title>
<link rel="stylesheet" href="../css/studentdashboard.css">
<link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">

</head>
<body>
<header>
</header>
<div class="container">
<div class="div1">
<h2>Student Dashboard</h2>
</div>
<div class="div2">
    <a href="studentoption.jsp"><img src="../images/studentprofile.jpeg">
        <p>Student profile</p></a>
</div>
<div class="div2">
<img src="../images/attendance.jpg">
<p>Student Attendance</p>
</div>
<div class="div2"> 
<img src="../images/marks.jpg">
<p>Student Marks</p>
</div>
<div class="div2">
<img src="../images/report.png">
<p>Student Report</p>
</div>

</div>
</body>
</html>