<!Doctype html>



<html>

<head>
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
  <%@ page import = "java.io.*,java.util.*,java.sql.*,javax.servlet.*"%>
  <link href="https://fonts.googleapis.com/css?family=Spartan&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="bootstrap.css">
  <script src="jquery.js"></script>
  <script src="bootstrap.js"></script>
  <title>MOST POPULAR</title>
</head>
<style>
  h2 {
    background-image: linear-gradient(pink, lightblue);
    font-family: 'Spartan', sans-serif;
    color: Black;
    display: flex;
    justify-content: center;
    width: 100%;
    size: 5cm;
    font-size: 50px;
    padding-top: 1%;
    padding-bottom: 1%;
    text-align: center;
  }

  body {
    font-family: 'Spartan', sans-serif;
    line-height: 1.6;
    font-size: 18px;
    background-image: linear-gradient(to right, lightblue, pink, lightblue);

  }

  ::-webkit-scrollbar {
    width: 0.35em;
  }

  ::-webkit-scrollbar-track {
    box-shadow: inset 0 0 3px rgba(0, 0, 0, 0.3);
  }

  ::-webkit-scrollbar-thumb {
    background-color: #707070;
    border-radius: 8px;
    outline: 1px solid #f8f8f8;
  }

  .card {
    min-height: 600px;
  }

  .card-text {
    font-size: 15px;
    height: 80px;
    overflow-y: auto;
  }

  .card-img-top {
    height: 400px;
    width: 100%;
    object-fit: cover;
  }
</style>
<%  String cook = "";
Cookie c[] = request.getCookies();
for(Cookie cookie:c){  
  if(cookie.getName().equals("lastmovie")){      
    cook = cookie.getValue();
  }
}
//HttpSession session = request.getSession(true);
//out.println(session.getAttribute("movie1"));
//out.println(session.getAttribute("movie2"));
//out.println(session.getAttribute("movie3"));
//out.println(session.getAttribute("summa"));
%>

<body>
  <h2>
    <center>MOST POPULAR</center>
  </h2>
  <h4>
    <center>Last watched:<%=cook%> </center>
  </h4>
  <div class="container-fluid">
    <div class="row">
      <%  
     try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost/movies","root","root");
      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery("select * from db where popular='yes'");
      String id,name,genre,available,award,image;
      String[] bg = {"bg-primary","bg-secondary","bg-success","bg-danger","bg-warning","bg-info","bg-light","bg-dark"};
      int i = 0;
      while(rs.next()){

         id = Integer.toString(rs.getInt("id"));
         name = rs.getString("name");
         genre = rs.getString("genre");
         award=rs.getString("award");
         available = rs.getString("available");
         image=rs.getString("image");
         out.println("<div class=\"col-3\"><div class=\"card\" style=\"width: 18rem;margin:10px; \"><img src="+image+" class=\"card-img-top\" alt=\"...\"><div class=\"card-body\"><h5 class=\"card-title\">"+name+"</h5><p class=\"card-text\">"+genre+"<br><br>"+award+"</p><center><a href=\"#\" movie=\""+name+"\" class=\"btn btnn btn-primary\">"+available+"</a></center></div></div></div>");
         i = (i<7)?i+1:0;
      }}
      catch(Exception e){
         out.println(e);
      }
  %>
    </div>
  </div>
  <script>
    document.querySelectorAll('.btnn').forEach(b => {
      b.addEventListener('click', (evt) => {
        window.open("https://www.w3schools.com");
        $.ajax({
          type: "GET",
          url: "../examples/servlets/servlet/recent",
          dataType: "jsonp",
          data: {
            movie: evt.target.getAttribute('movie')
          },
          cache: false,
          success: function (html) {
            console.log(html);
          }
        });
      })
    })
  </script>
</body>

</html>