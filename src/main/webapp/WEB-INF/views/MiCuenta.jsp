<!DOCTYPE html>
<%@ page session="false" %>
<html lang="en">
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

Datos de Acceso. 
<br>SESIÓN
<p>Nombre: ${nombre}
<p>Apellidos: ${apellidos}
<p>Email: ${email}

<div class="jumbotron">
  <div class="container text-center">
    <h1>Gaming Online</h1>      
    <p>Tus compras en un click</p>
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Inicio</a></li>
        <li><a href="/practica1_5/ConfirmacionRegistro">Productos</a></li>
        <li><a href="/practica1_5/Contacto">Contacto</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/practica1_5/MiCuenta"><span class="glyphicon glyphicon-user"></span> Mi cuenta</a></li>
        <li><a href="/practica1_5/CalculaTotal"><span class="glyphicon glyphicon-shopping-cart"></span> Carro de la Compra</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">    
  <div class="row">

      <div class="panel panel-primary">
        <div class="panel-heading">Mi Cuenta</div>
        <p><div class="panel-body"><p><center>Tus datos registrados en nuestro sistema son los siguientes: </center></p>
		<center>
		<p><b>Nombre: </b>${nombre}
		<p><b>Apellidos: </b>${apellidos}
		<p><b>Email: </b>${email}
		<form action="ModificarDatos" method="post">
			<br><input type="submit" value="Modificar Datos"></br>
		</form>
		<form action="ConfirmacionRegistro" method="post">
			<br><input type="submit" value="Volver a Inicio"></br>
		</form></center>
      </div>
    </div>
  	</div>
 </div>

</body>
</html>
