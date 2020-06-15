<%@page import="java.sql.*" %>
<%
    if(session.getAttribute("name")==null)
    {
        response.sendRedirect("../logout.jsp");
    }
    if(session.getAttribute("save")!=null)
            {
                out.println((String)session.getAttribute("save"));
                session.removeAttribute("save");
            }
    if(session.getAttribute("bsave")!=null)
            {
                out.println((String)session.getAttribute("bsave"));
                session.removeAttribute("bsave");
            }
    if(session.getAttribute("tsave")!=null)
            {
                out.println((String)session.getAttribute("tsave"));
                session.removeAttribute("tsave");
            }
    String id=(String)request.getParameter("id");
    String name=(String)session.getAttribute("name");
    System.out.println(id+" "+ name);
      session.setAttribute("id", id);
    %>
<!DOCTYPE html>
<html>
<head>
<title>admin dashboard</title>
<link rel="stylesheet" href="../css/adminteacherdashboard.css">
<link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
<script src="../js/script.js"></script>
</head>
	<body>
			<header>
                            
			</header>
			<div class="container">
			<div class="div1" >
				<h2>Admin Dashboard</h2>
			</div>
             <div class="div2">
                 <a href="adminoption.jsp?id=profile"><img src="../images/admin.png" ></a>
             <p>Admin profile</p>
             </div>
              <div class="div2">
                  <a href="adminoption.jsp?id=addstudent"><img src="../images/addstudent.jpg"></a>
             <p>Add Student</p>
             </div>
           <div class="div2">
               <a href="adminoption.jsp?id=addteacher"> <img src="../images/addteacher.jpg"></a>
             <p>Add teacher</p>
             </div>
            <div class="div2">
                <a href="adminoption.jsp?id=findstudent"> <img src="../images/findstudent.jpg"></a>
             <p>Find student</p>
             </div>

             <div class="div2" >
                 <a href="adminoption.jsp?id=findteacher"><img src="../images/findteacher.jpg"></a>
             <p>Find Teacher</p>
             </div>
            <div class="div2">
                <a href="adminoption.jsp?id=branch"><img src="../images/branch.jpg"></a>
             <p>Branch</p>
             </div>

           <div class="div2">
               <a href="adminoption.jsp?id=subject"><img src="../images/subject.jpg"></a>
             <p>Subject</p>
             </div>
             <div class="div2">
                 <a href="adminoption.jsp?id=report"><img src="../images/teacherreport.jpg"></a>
             <p>Report</p>
             </div>
	</div>
            
		</body>
</html>