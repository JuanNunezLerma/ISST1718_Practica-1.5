<!DOCTYPE html>
<%@ page session="false" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro</title>
</head>
<body>
	<p>Por favor, introduzca sus datos actualizados</p>
	<form action="actualizaDatos" method="post">
	Nombre:<br><input type="text" name="nombre" id="nombre"></br>
	Apellidos:<br><input type="text" name="apellidos" id="apellidos"></br>
	Email:<br><input type="email" name="email" id="email"></br>
	<br><input type="submit" value="Registrarse"></br>
	</form>

</body>
</html>