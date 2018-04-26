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
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Mi cuenta</a></li>
        <li><a href="/practica1_5/CalculaTotal"><span class="glyphicon glyphicon-shopping-cart"></span> Carro de la Compra</a></li>
      </ul>
    </div>
  </div>
</nav>

<center>El precio total es ${precio_total}.
<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="LKMDG9S4BC8QC">
<input type="hidden" name="lc" value="ES">
<input type="hidden" name="item_name" value="CompraTotal">
<input type="hidden" name="amount" value="${precio_total}">
<input type="hidden" name="currency_code" value="EUR">
<input type="hidden" name="button_subtype" value="services">
<input type="hidden" name="no_note" value="0">
<input type="hidden" name="cn" value="Añadir instrucciones especiales para el vendedor:">
<input type="hidden" name="no_shipping" value="2">
<input type="hidden" name="rm" value="1">
<input type="hidden" name="return" value="http://localhost:8081/practica1_5/ConfirmaPago">
<input type="hidden" name="cancel_return" value="http://localhost:8081/practica1_5/CancelaCompra">
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted">
<input type="image" src="https://www.sandbox.paypal.com/es_ES/ES/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal, la forma rápida y segura de pagar en Internet.">
<img alt="" border="0" src="https://www.sandbox.paypal.com/es_ES/i/scr/pixel.gif" width="1" height="1">
</form></center>


</body>
</html>

