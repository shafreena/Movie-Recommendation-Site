<!DOCTYPE html>
<html lang="en">
<head>
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
  <%@ page import = "java.io.*,java.util.*,java.sql.*,javax.servlet.*"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body onload="loadDoc()">

<h1>About</h1>
Current time is: <%= new java.util.Date()%>
<% out.print("just for having jsp code XD");%>
<!--<button type="button" onclick="loadDoc()">Who am I?</button>
<br><br>-->
<div id="about"></div>
<h2>Concepts implemented:</h2>
<ul id="concepts"></ul>
<h2 >Developer:</h2>
<h4 id="name"></h4>
<script>
function loadDoc() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      myFunction(this);
    }
  };
  xhttp.open("GET", "sample.xml", true);
  xhttp.send();
}
function myFunction(xml) {
  var i,j;
  var xmlDoc = xml.responseXML;
 var name;
 var about;
 var concepts="";
  var x = xmlDoc.getElementsByTagName("text");
  for (i = 0; i <x.length; i++) { 
    name ="<b> "+ x[i].getElementsByTagName("name")[0].childNodes[0].nodeValue+"</b>";
    about=x[i].getElementsByTagName("about")[0].childNodes[0].nodeValue;
  }
  var y=xmlDoc.getElementsByTagName("concepts");
      var z=xmlDoc.getElementsByTagName("concept");
      for(i=0;i<z.length;i++)
      {
           concepts+="<li>"+y[0].getElementsByTagName("concept")[i].childNodes[0].nodeValue+"</li>";
      }


  document.getElementById("name").innerHTML +=""+name;
  document.getElementById("about").innerHTML +=""+about;
  document.getElementById("concepts").innerHTML +=""+concepts;
}
</script>

</body>
</html>
