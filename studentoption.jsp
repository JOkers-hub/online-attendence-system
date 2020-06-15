<%@page import="java.sql.*" %>
<%
    String name="";
    String id="";
    if(session.getAttribute("name")==null)
    {
        response.sendRedirect("../logout.jsp");
    }else{
         name=(String)session.getAttribute("name");
        id=(String)session.getAttribute("id");
    }
    String table=(String)session.getAttribute("branch");
    System.out.println(id+" hellow "+name+ " "+table);
    String optn=(String)request.getParameter("id");
    if(session.getAttribute("ssave")!=null){
        out.println((String)session.getAttribute("ssave"));
        session.removeAttribute("ssave");
    }
%>
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Open Sans" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Roboto Mono" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Maven Pro" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="../css/studentoption.css">
</head>
<body>
  <!------------------header start---------------->
<header><%
          try{
              Connection con= com.online.attendence.connection.org.MyCon.getCon();
              int ID=Integer.parseInt(id);
              PreparedStatement ps= con.prepareStatement("select * from "+table+" where rollno="+ID);
              ResultSet rs=ps.executeQuery();
              if(rs.next()){
                  %>
<h2>Online Attendance</h2>
  <span class="name"><%=rs.getString("name")%></span>
  </header>
  <!-----------------------header end------------------>
  <div class="container">
    <!----------------------leftcontainer start----------------->
  <div class="leftcontainer">
    <ul>
        <li onclick="spa(event,'profileform')"><span class="material-icons">account_box</span><br/>
        <a href="#">Profile</a>
      </li>
      <li onclick="spa(event,'attendance')"><i class="fa fa-book" aria-hidden="true"></i><br/>
        <a href="#">Attendance</a>
      </li>
         <li onclick="spa(event,'result')"><i class="fa fa-book" aria-hidden="true"></i><br/>
          <a href="#">Result</a>
         </li>
         <li onclick="spa(event,'feedback')"><i class='fas fa-book-open'></i><br/>
          <a href="#">Feedback</a>
         </li>
         <li ><a href="../logout.jsp">
             <img src="../images/exit.png">
             <p class="logout">Logout</p>
             </a>
         </li>
       </ul>
  </div>
  <!-----------------leftcontainerend---------->
 <div class="rightcontainer">
    <!---------------profile start---------->
 <div class="rightsideprofile" id="profileform" style="display:none">
     <img src="../images/map.jpeg">
  <span><%=rs.getString("name")%></span>
   <table>
    <tr><th>FatherName</th><th>Email</th></tr>
    <tr><td><%=rs.getString("fname")%></td><td><%=rs.getString("email")%></td></tr>

    <tr><th>Gender</th><th>MobileNo</th></tr>
    <tr><td><%=rs.getString("gender")%></td><td><%=rs.getString("mobileNo")%></td></tr>
<tr><th>Branch</th><th>Year</th></tr>
    <tr><td><%=rs.getString("branch")%></td><td><%=rs.getString("year")%></td></tr>
    <tr><th>Address</th><th>Date of Birth</th></tr>
    <tr><td rowspan="3" class="first"><%=rs.getString("address")%></td><td><%=rs.getString("dob")%></td></tr>   
   </table>
  </div>
              <% }
          }catch(Exception e){
              out.println(e);
          }
      %>
    <!----------------profile end---------->
 <!---------attendance  start-------------------------->
 <div class="rightsideattendance" id="attendance" style="display: none;">
      <h1>My Today's Attendance</h1>
      <table>
        <tr>
          <th>Subject Code</th>
          <th>Total Present</th>
          <th>Total Clsses</th>
          <th>Percentage</th>
        </tr>
        <tr>
          <td>Rcs073</td>
          <td>13</td>
          <td>30</td>
          <td>75%</td>
             </tr>
             <tr>
          <td>Rcs073</td>
          <td>13</td>
          <td>30</td>
          <td>75%</td>
             </tr>
             <tr>
          <td>Rcs073</td>
          <td>13</td>
          <td>30</td>
          <td>75%</td>
             </tr>
             <tr>
          <td>Rcs073</td>
          <td>13</td>
          <td>30</td>
          <td>75%</td>
             </tr>
             <tr>
          <td>Rcs073</td>
          <td>13</td>
          <td>30</td>
          <td>75%</td>
             </tr>
             <tr>
          <td>Rcs073</td>
          <td>13</td>
          <td>30</td>
          <td>75%</td>
             </tr>
             <tr>
          <td>Rcs073</td>
          <td>13</td>
          <td>30</td>
          <td>75%</td>
             </tr>
             <tr>
          <td>Rcs073</td>
          <td>13</td>
          <td>30</td>
          <td>75%</td>
             </tr>
             <tr>
          <td>Rcs073</td>
          <td>13</td>
          <td>30</td>
          <td>75%</td>
             </tr>
             <tr>
          <td>Rcs073</td>
          <td>13</td>
          <td>30</td>
          <td>75%</td>
             </tr>
             <tr>
          <td>Rcs073</td>
          <td>13</td>
          <td>30</td>
          <td>75%</td>
             </tr>
             <tr>
              <td class="percentage" colspan="4">Overall Percentage is:0% fail</td>
             </tr>
            
      </table>
     </div>

<!------------------------ attendance end------------------------>
<!-----------------------feedback section start----------------->
<div class="rightsidefeedback" id="feedback" style="display:none">
   <h1>Feedback Form</h1>
   <p>we would love to hear your thoughts,concern or problems with anything so we can improve!</p>
   <hr>
   <form>
   <label>Describe Feedback *</label><br/>
   <textarea rows="6%" cols="50%">
   </textarea><br/>
   <label>Name *</label>
   <input type="text" value="" required><br/>
   <label>Email *</label>
   <input type="email" value="" required><br/>

   <input type="submit" value="submit">
</form>
  </div>
<!-------------------feedback section end--------------------->
<!------------------result start------------------------>
<div class="rightsideresult" id="result">


</div>
<!--------------------result end-------------------------->
 </div>
</div>  
  <script src="../js/script.js"></script>
</body>
</html>