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

      <div class="panel panel-success">
        <div class="panel-heading">Identificacion de Administrador</div>
        <p><div class="panel-body"><p><center>Por favor, introduzca sus datos de acceso:</center></p>
		<center><form action="Acceso" method="post">
		Usuario:<br><input type="text" name="usuario" required></br>
		Clave:<br><input type="password" name="clave" required></br>
		<br><input type="submit" value="Inicio Sesion"></br>
		</form></center>
      </div>
    </div>
  	</div>
 </div>
</div>
<center><P>  <br>La hora actual en el servidor es: ${serverTime}. </P></center>
</body>
</html>

