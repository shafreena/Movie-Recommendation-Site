<!Doctype html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Spartan&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light&display=swap" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="bootstrap.css">
   <script src="jquery.js"></script>
   <script src="bootstrap.js"></script><title>WAR</title></head>
<style>
h2{
   background-image: linear-gradient(pink,lightblue);
      /* position: fixed; */
      font-family: 'Spartan', sans-serif;
   color:Black;
      display: flex;
      justify-content: center;
      width: 100%;
      size: 5cm;
   font-size: 50px;
   padding-top: 1%;
   padding-bottom:1%;
   text-align: center;
}
body{
  font-family: 'Spartan', sans-serif;
    line-height:1.6 ;
    font-size: 18px ;
    background-image: linear-gradient(to right,lightblue,pink,lightblue);
    /* background-repeat: no-repeat;
    background-size: cover; */
}
/*
.row{
    display:flex;
  }
   .col-3{
    margin: 20px 120px;

  } */
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
  .card{
    background-color: #e8e8e8;
    border-radius:5px;
    padding:30px 20px;
    transition: all .3s;
  }
  .card:hover{
    box-shadow: 4px 4px 12px 2px #0005;
    transform: scale(1.008)
  }
  /* .card-body{
    height:500px;
  } */
  .card-title{
    font-size: 17px;
  }
  .card-text{
    font-size:15px;
    height:80px;
    overflow-y:auto;
  }
  .card .btn{
    background-color: #2e8690;
    border-radius: 5px;
    color:#fff;
    font-weight:bold;
    margin-top:10px;
    padding:5px 5px;
  }
  .card-img{
    height:400px;
    width:290px;
    margin:-30px -20px 10px -20px;
    object-fit:cover;
  }
</style>

<body>
  <!-- <%= new java.util.Date() %> -->
    <h2> <center>WAR</center> </h2>
     <div class="container-fluid">
      <div class="row"> 
      <?php
     $con = mysqli_connect("localhost","root","root","movies");
     $query = "select * from db where genre like '%War%'";
     $result = mysqli_query($con,$query);

      while($row1=$result->fetch_assoc())
      {
          ?>
          <div class="col-sm-3">
     <div class="card" style="width: 18rem;min-height:450px;margin:10px; ">
      <img src="<?php echo $row1['image']; ?>" class="card-img" alt="...">
      <div class="card-body">
        <h5 class="card-title"><?php echo $row1['name']; ?></h5>
        <p class="card-text"><?php echo $row1['award']; ?></p>
        <br><center><btn onclick="window.location.href='#'" class="btn btn-primary"><?php echo $row1['available']; ?></btn></center>
      </div>
      
    </div>
      </div>
    <?php
      }
      ?>   
      <!-- run -->

</div>
</div>
</body>
</html>