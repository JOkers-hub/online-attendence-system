<%@page import="java.sql.*" %>
<%
    if(session.getAttribute("name")==null)
    {
        response.sendRedirect("../logout.jsp");
    }else{
    String name=(String)session.getAttribute("name");
    session.setAttribute("name", name);
     String id=request.getParameter("tid");
     session.setAttribute("tid", id);
    }
%>
<!DOCTYPE html>
<html>
<head>
<title>teacher dashboard</title>
<link rel="stylesheet" href="../css/adminteacherdashboard.css">
<link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
</head>
		<body>
			<header>
                            
			</header>
			<div class="container">
				<div class="div1" >
					<h2>Teacher Dashboard</h2>
				</div>
             <div class="div2">
                 <a href="teacheroption.jsp?id=profile"><img src="../images/teacherprofile.jpg"></a>
             <p>Teacher profile</p>
             </div>
              <div class="div2">
                  <a href="teacheroption.jsp?id=attendence"> <img src="../images/addattendance.jpg"></a>
             <p>Attendance</p>
             </div>
           <div class="div2">
               <a href="teacheroption.jsp?id=timetable">   <img src="../images/addsubject.png"></a>
             <p>Time Table</p>
             </div>
            <div class="div2">
                <a href="teacheroption.jsp?id=result"><img src="../images/uploadresult.jpg"></a>
             <p>Upload Result</p>
             </div>

             <div class="div2" >
                 <a href="teacheroption.jsp?id=viewstudent"><img src="../images/teacherviewstudent.jpg"></a>
             <p>View Student</p>
             </div>
            <div class="div2">
                <a href="teacheroption.jsp?id=report"> <img src="../images/teacherreport.jpg"></a>
             <p>Report</p>
             </div>

           <div class="div2">
               <a href="teacheroption.jsp?id=event"> <img src="../images/teacherevent.jpg"></a>
             <p>Event</p>
             </div>
            
			</div>
		</body>
</html>