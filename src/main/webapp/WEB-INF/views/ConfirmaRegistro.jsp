<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
<head>
  <title>Gaming Online</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }

   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>
<body>
<div class="container">    
  <div class="row">

      <div class="panel panel-primary">
        <div class="panel-heading">Informacion: </div>
        <p><div class="panel-body"><p><center>Registro confirmado. Pulse OK.</center></p>
		<center>
			<form action="ConfirmacionRegistro" method="POST">
			<input type="hidden" name="nombre" id="nombre" value="${nombre}">
			<input type="hidden" name="apellidos" id="apellidos" value="${apellidos}">
			<input type="hidden" name="email" id="email" value="${email}">
			<input type="submit" value="OK">
		</form></center>
      </div>
    </div>
  	</div>
 </div>
</body>
</html>