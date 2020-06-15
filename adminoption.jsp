<%@page import="java.sql.*" %>
<%
    String name="";
    String aid="";
    if(session.getAttribute("name")==null)
    {
        response.sendRedirect("../logout.jsp");
    }else{
         name=(String)session.getAttribute("name");
         aid=(String)session.getAttribute("id");
    }
    System.out.println(aid+" hellow"+name);
    String optn=(String)request.getParameter("id");
    if(session.getAttribute("ssave")!=null){
        out.println((String)session.getAttribute("ssave"));
        session.removeAttribute("ssave");
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Options</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Open Sans" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Maven Pro" rel="stylesheet"/>
<link rel="stylesheet" href="../css/adminoption.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="../js/script.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
  <!------------------------header start------------>
<header>
    <%
          try{
              Connection con= com.online.attendence.connection.org.MyCon.getCon();
              int aID=Integer.parseInt(aid);
              PreparedStatement ps= con.prepareStatement("select * from admin where aID="+aID);
              ResultSet rs=ps.executeQuery();
              if(rs.next()){
                  %>
<h2>Online Attendance</h2>
  <span class="name"><%=rs.getString("name")%></span>
  
</header>
<!--------------------header end------------>
<div class="main">
  <!------------------left menu start------------>
  <div class="leftsidemenu" >
<ul>
    <li id="profile" onclick="spa(event,'profileform')"><a href="#"><span class="material-icons">account_box</span>Profile</a></li>
<li id="addstudent"onclick="spa(event,'studentform')"><a href="#"><i class='fas fa-user-friends' style=" font-size:23px;margin-right:15px;"></i>Add Student</a></li>
<li id="addteacher" onclick="spa(event,'teacherform')"><a href="#" ><i class='fas fa-chalkboard-teacher' style=" font-size:23px;margin-right:15px;"></i>Add Teacher</a></li>
<li id="findteacher" onclick="spa(event,'findteacherform')"><a href="#"><span class="material-icons">search</span>Find Teacher</a></li>
<li id="findstudent" onclick="spa(event,'findstudentform')"><a href="#"><span class="material-icons">search</span>Find Student</a></li>
<li id="branch" onclick="spa(event,'branchform')"><a href="#"><i class="fa fa-book"></i>Add Branch</a></li>
<li id="subject" onclick="spa(event,'subjectform')"><a href="#"><i class="fa fa-book" aria-hidden="true"></i>Add Subject</a></li>
<li>
    <img src="../images/exit.png">
<p class="logout">Logout</p>
</li>
</ul>
</div>
<!--------------left menu  end--------->

<div class="rightsidemenu">
 
  <!---------------------admin profile start------------>
<div class="rightsideprofile" id="profileform" style="display: none;">
    <img src="../images/map.jpeg">
  
                  <span><%=rs.getString("name")%></span>
   <table>
    <tr><th>FatherName</th><th>Email</th></tr>
    <tr><td><%=rs.getString("fname")%></td><td><%=rs.getString("email")%></td></tr>

    <tr><th>Gender</th><th>MobileNo</th></tr>
    <tr><td><%=rs.getString("gender")%></td><td><%=rs.getString("mobileNo")%></td></tr>

    <tr><th>Address</th><th>DOB</th></tr>
    <tr><td rowspan="3" class="first"><%=rs.getString("address")%></td><td><%=rs.getString("dob")%></td></tr>   
   </table>
  </div>
              <% }
          }catch(Exception e){
              out.println(e);
          }
      %>
  <!--------------------admin profile end------------>
  <!---------------------teacher form start------------>
<div class="rightsidemenuform" id="teacherform" style="display:none">
<form action="savebeans/saveteacher.jsp" method="post">
   <table>
    <caption>Teacher Information</caption>
     <tr><th>Name</th>
      <td><input class="main" type="text" name="name"  required></td>
     </tr>
     <tr><th>FatherName</th>
      <td><input  class="main" type="text" name="fname"  required></td>
    </tr>
     <tr><th>Email</th>
      <td><input  class="main" type="email" name="email" required></td>
    </tr>
    <tr><th>password</th>
      <td><input  class="main" type="password" name="password" required></td>
    </tr>
    <tr><th>Gender</th>
      <td class="rad"><input type="radio" name="gender" value="Male">Male
      <input type="radio" name="gender" value="Female">Female</td>
    </tr>
     <tr><th>Branch</th>
      <td><select class="sel" name="branch">
<option >--Select Branch--</option>
<%
                          try
                             {
                               Connection con = com.online.attendence.connection.org.MyCon.getCon();
                               PreparedStatement st = con.prepareStatement("select * from branch");
                               ResultSet rs = st.executeQuery();
                               while(rs.next())
                                 {
                                   %>                                  
                                    <option value="<%=rs.getString("bcode")%> <%=rs.getString("bname")%>"><%=rs.getString("bcode")%> <%=rs.getString("bname")%></option>
                                   <%}}
                           catch(Exception ex)
                              {
                               out.println(ex);
                              }%>
</select></td>
    </tr>
    <tr><th >DOB:</th>
        <td><input class="sel" name="dob" type="date"></td>
    </tr>
     <tr><th>Address</th>
         <td><textarea name="address"></textarea></td>
    </tr>
    <tr><td colspan="2"><input class="sub" type="submit" value="Add"></td></tr>
</table>
</form>
</div>
<!------------------------teacher form end----------->
<!----------------------student form start------------>
<div class="rightsidemenuform" id="studentform" style="display:none">
<form action="savebeans/savestudent.jsp" method="post">

   <table>
    <caption>Student Information</caption>
     <tr><th>Name</th>
      <td><input class="main" type="text" name="name" ></td>
     </tr>
     <tr><th>FatherName</th>
      <td><input  class="main" type="text" name="fname"  required></td>
    </tr>
     <tr><th>Email</th>
         <td><input  class="main" type="email" name="email" ></td>
    </tr>
    <tr><th>password</th>
        <td><input  class="main" type="password" name="password" ></td>
    </tr>
    <tr><th>Gender</th>
      <td class="rad"><input type="radio" name="gender" value="Male">Male
      <input type="radio" name="gender" value="Female">Female</td>
    </tr>
     <tr><th>Branch</th>
      <td><select class="sel" name="branch">
<option >--Select Branch--</option>
<%
                          try
                             {
                               Connection con = com.online.attendence.connection.org.MyCon.getCon();
                               PreparedStatement st = con.prepareStatement("select * from branch");
                               ResultSet rs = st.executeQuery();
                               while(rs.next())
                                 {
                                   %>
                                   
                                    <option value="<%=rs.getString("bcode")%> <%=rs.getString("bname")%>"><%=rs.getString("bcode")%> <%=rs.getString("bname")%></option>
                                    
                                   <%}}
                           catch(Exception ex)
                              {
                               out.println(ex);
                              }%>
</select></td>
    </tr>
    <tr><th>Year</th>
        <td>
            <select class="sel" name="year">
                <option>---Year---</option>
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
</select>
        </td></tr>
    <tr><th >Date Of Birth</th>
        <td><input class="sel" type="date" name="dob"></td>
    </tr>
     <tr><th>Address</th>
         <td><textarea name="address"></textarea></td>
    </tr>
    <tr><td colspan="2"><input class="sub" type="submit" value="Add"></td></tr>
</table>
</form>
</div>
<!------------------------student form end------------>
<!----------------------teacher find form start------------>
<div class="rightsidemenufineteacher" id="findteacherform" style="display: none;">
<h1>Find Teacher</h1>
<p>If you want to find or search any teacher.<br/>
 search it by teacher Id or by teacher Name</p>
<form action="search.jsp" method="post">
    <input type="hidden" name="typ" value="teacher">
<input type="radio" name="find" value="id" ><span>Search By Id</span>
<input type="radio" name="find" value="name"><span>Search By Name</span><br/>
<input type="search" name="search" placeholder="Search here..." >
</form>
</div>
<!-------------------teacher fine form end---------------------->
<!-----------------------student find form start------------>
<div class="rightsidemenufineteacher" id="findstudentform" style="display:none;">
<h1>Find Student</h1>
<p>If you want to find or search any student.<br/>
 search it by student Rollno or by student Name</p>
<form action="search.jsp" method="post">
    <input type="hidden" name="typ" value="student">
<input type="radio" name="find" value="rollno" ><span>Search By RollNo</span>
<input type="radio" name="find" value="name"><span>Search By Name</span><br/>
<input type="search" name="search" placeholder="Search here...">
</form>
</div>
<!----------------------------------student find form end------------>
<!----------------------------------branch form start------------>

<div class="rightsidemenubranch" id="branchform" style="display:none">
<h1>Add Branch</h1>
<label>Branch Code:</label><input type="number" required><br>
<label>Branch Name:</label><input type="text" required><br>
<input class="bran" type="submit" value="Add Branch">
</div>
<!----------------------branch form end--------->

<!--------------------------subjectform start---------------->

<div class="rightsidemenusubject" id="subjectform" style="display:none">
<h1>Add Subject</h1>
<label>Branch:</label>
<select class="sel">
<option value="">Select Branch</option>
</select><br/>
<label>Subject Code:</label><input type="number" required><br/>
<label>Subject Name:</label><input type="text" required><br/>
<input class="subj" type="submit" value="Add Subject">
</div>
<!----------------subject form end------------------->
</div>
</div>
</body>
</html>