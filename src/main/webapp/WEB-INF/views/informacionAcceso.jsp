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
        <li><a href="#">Contacto</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/practica1_5/MiCuenta"><span class="glyphicon glyphicon-user"></span> Mi cuenta</a></li>
        <li><a href="/practica1_5/CalculaTotal"><span class="glyphicon glyphicon-shopping-cart"></span> Carro de la Compra</a></li>
      </ul>
    </div>
  </div>
</nav>

<form action="Carrito" method="post">
<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">Consolas</div>
        <div class="panel-body"><img src="https://psmedia.playstation.com/is/image/psmedia/ps3-overview-features-two-column-01-ps3-eu-mobile-27sep16?$TwoColumn_Image$" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">Play Station 3 SuperSlim</div>
        <center><input type="submit" value="180 Euros" name="id"></br></center>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Consolas</div>
        <div class="panel-body"><img src="https://images-na.ssl-images-amazon.com/images/I/71wLWZUu-qL._SL1500_.jpg" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">Play Station 4</div>
        <center><input type="submit" value="280 Euros" name="id"></center>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Consolas</div>
        <div class="panel-body"><img src="https://pisces.bbystatic.com/image2/BestBuy_US/images/products/4334/4334012_sd.jpg;maxHeight=640;maxWidth=550" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">Xbox One</div>
        <center><input type="submit" value="279 Euros" name="id"></center>
      </div>
    </div>
  </div>
</div><br>

<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-success">
        <div class="panel-heading">Accesorios</div>
        <div class="panel-body"><img src="https://d243u7pon29hni.cloudfront.net/images/products/mando-inalambrico-sony-ps4-dualshock-4-v2-blanco-1352703_l.png" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">DualShock 4 Blanco</div>
        <center><input type="submit" value="50 Euros" name="id"></center>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-success">
        <div class="panel-heading">Accesorios</div>
        <div class="panel-body"><img src="https://img.megasur.es/234/9818731-0.jpg" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">Play Station TV</div>
        <center><input type="submit" value="30 Euros" name="id"></center>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-success">
        <div class="panel-heading">Accesorios</div>
        <div class="panel-body"><img src="https://c1-ebgames.eb-cdn.com.au/merchandising/images/packshots/ecb7dc48390b497588f4ddab949337cf_Medium.png" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">Kinect Xbox One</div>
        <center><input type="submit" value="60 Euros" name="id"></center>
      </div>
    </div>
  </div>
</div><br><br>
</form>

</body>
</html>

