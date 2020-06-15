<%
    if(session.getAttribute("fail")!=null)
            {
                out.println((String)session.getAttribute("fail"));
                session.removeAttribute("fail");
            }
%>
<!DOCTYPE html>
<html>
<head>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto Sans">
	<style>
		@media only screen and (min-width:850px)
		{
		*{
			margin:0px;
			padding:0px;
			box-sizing: border-box;
		}
		body{
			width: 100%;
			height: 100vh;
                        display:flex;
                        justify-content: space-between;
                        align-items: flex-start;
		}
		.leftcontainer{
			width:35%;
			height:100vh;
                        position:relative;
      
		}
		.leftcontainer h2{
                    color:black;
                    position:absolute;
                    top:40%;
                    right:5%;
                    left:20%;
                    font-size:25px;
                    text-shadow:2px 2px 3px grey;
                    text-align:justify;
                    letter-spacing:1px;
                    word-spacing: 3px;
                    text-align:center;
                    font-family:'Noto Sans',sans-serif;
	     
		}
		.leftcontainer h2::first-letter {
			font-size:160%;
			margin:0px 0px 10px 0px;
		}
           .leftcontainer .fas{
           	color:black;
           	position:absolute;
           	left:43%;
           	top:25%;
           	font-size:95px;
           }
           .rightcontainer{
                 width:75%;
                 height:100vh;
                 position:relative;        
                }
           .rightcontainerclip{
               position:absolute;width:100%;
               height:100vh;
               background:#3290A7;
               top:0px;
               left:0px;
               clip-path: circle(86.8% at 87% 51%);
               display:flex;
               justify-content: center;
               align-items: center;
           }
                .rightcontainerclip form{
               
                    border:2px solid black;
                    padding:30px 45px;
                    border-radius:30px 0px 30px 0px;
                    background:#206f74;
                    box-shadow:2px 2px 3px #135D67;
                }
                 .rightcontainer form h1{
                    color:white;
                    text-align:center;
                    margin-top:0px;

            }
           .rightcontainer form .main{
                 border:none;
                 background:transparent;
                 border-bottom:2px solid white;
                 font-size:20px;
                 margin:10px;
                 padding:10px;
                 width:100%;
                 color:white;

           }
           .rightcontainer form .main::placeholder{
           	color:white;
           	font-size: 15px;
           }
           .rightcontainer form .btn{
                  display:block;
                  margin:auto;
                  font-size:20px;
                  border:2px solid white;
                  background:transparent;
                  color: white;
                  padding:5px 10px;
                  margin-top:15px;
           }
           .rightcontainer form .select{
           	width:100%;
           	background:transparent;
           	height:40px;
           	color:black;
           	margin-left:10px;
                border:2px solid white;
                font-size:15px;
                margin-top:10px;
       }
   }
   @media only screen and (max-width:849px){
      *{
      	  margin:0px;
      	  padding:0px;
      	  box-sizing: border-box;
       }
      body{
            width:100%;
            height:100vh;
            position:relative;
          }
        .leftcontainer{
        	display:none;
        }    
           .rightcontainer{
           	width:100%;
           	height:100vh;
                position: absolute;
                top:0px;
                left:0px;
                position:relative;
           }
          .rightcontainerclip{
          	position:absolute;
          	width:100%;
          	height:100vh;
          	top:0px;
          	left:0px;
          	background:#3290A7;
          	display:flex;
          	justify-content: center;align-items: center;
          }
           .rightcontainerclip form{
               
                border:2px solid black;
                padding:30px 45px;
           	border-radius:30px 0px 30px 0px;
           	background:#206f74;
           	box-shadow:2px 2px 3px #135D67;
                }
                 .rightcontainer form h1{
            	  color:white;
            	  text-align:center;
            	  margin-top:0px;

            }
           .rightcontainer form .main{
                 border:none;
                 background:transparent;
                 border-bottom:2px solid white;
                 font-size:20px;
                 margin:10px;
                 padding:10px;
                 width:100%;
                 color:white;

           }
           .rightcontainer form .main::placeholder{
           	color:white;
           	font-size: 15px;
           }
           .rightcontainer form .btn{
                   display:block;
                   margin:auto;
                   font-size:20px;
                   border:2px solid white;
                   background:transparent;
                   color: white;
                   padding:5px 10px;
                   margin-top:15px;
           }
           .rightcontainer form .select{
           	width:100%;
           	background:transparent;
           	height:40px;
           	color:black;
           	margin-left:10px;
                border:2px solid white;
                font-size:15px;
                margin-top:10px;
       }
   }
		</style>
   
</head>
<body>
<div class="leftcontainer">
<i class='fas fa-book-reader'></i>
	     <h2>
	     	"Work hard so one day<br/> only your first name<br/> will be enough to recognise you".
	     </h2>
</div>
<div class="rightcontainer">
	<div class="rightcontainerclip">
            <form action="authentication/checkAdmin.jsp" method="post" >
            	<h1>Login Here</h1>
                <input class="main" type ="text" name="email" placeholder="UserId"><br/>
                <input class="main" type="password" name="password" placeholder="Password"><br/>
                   <select class="select" name="user">
                   	<option >User Type</option>
                   	<option value="admin">Admin</option>
                   	<option value="student">Student</option>
                   	<option value="teacher">Teacher</option>
                   </select>
                <input class="btn" type="submit" value="submit">
            </form>
	</div>
	</div>
</body>
</html>