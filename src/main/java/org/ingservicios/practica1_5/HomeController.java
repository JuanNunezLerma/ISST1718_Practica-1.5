package org.ingservicios.practica1_5;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private static final String nombreUsuario = "admin";
	private static final String claveUsuario = "admin";
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model mod, HttpServletRequest req, HttpServletResponse response) {
		logger.info("Bienvenido! El cliente es {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		mod.addAttribute("serverTime", formattedDate );
				
		// se busca la cookie de email
		Cookie[ ] cookies = req.getCookies( );
		String cookieName ="emailCookie";
		String emailAddress = "";
			
		if (cookies != null){
			for (Cookie cookie: cookies){
				if (cookieName.equals(cookie.getName())) 
					emailAddress =	cookie.getValue();
			}
		}
			
		System.out.println("El email que tiene la cookie es: " + emailAddress);
		
		//Se comprueba si la cookie no existe:
		if (emailAddress.equals("")){
			return "index";
			//url = "/registro.jsp"; //Se ofrecerá registrarse
		}
		else{
		// En este caso, se rellenan los datos del usuario ya registrado
		// buscando en la base de datos por el valor del email
			UsuarioDTO usuarioreg = dao.buscaUsuario(emailAddress);
		//Se añade a la sesión				
	 		HttpSession sesion=req.getSession(true);
	 		System.out.println("Sesion activada");
	 		sesion.setMaxInactiveInterval(180);
	 		sesion.setAttribute("nombre",usuarioreg.getNombre());
	 		sesion.setAttribute("apellidos",usuarioreg.getApellidos());
	 		sesion.setAttribute("email",usuarioreg.getEmail());
	 		int [] carrito = { 0, 0, 0, 0, 0, 0 };
	 		sesion.setAttribute("carrito", carrito);
				
	 		mod.addAttribute("nombre",usuarioreg.getNombre());
	 		mod.addAttribute("apellidos",usuarioreg.getApellidos());
	 		mod.addAttribute("email",usuarioreg.getEmail());
			return "informacionAcceso";
			//url = “/welcome.jsp”; //Se dará la bienvenida al usuario
		}

	}
	
	@RequestMapping(value = "/Acceso", method = RequestMethod.POST)
	public String emailList(HttpServletRequest req, Model mod) {
		
		System.out.println(req.getSession(false)==null);
		
		String usuario = req.getParameter("usuario");
		String clave = req.getParameter("clave");
		
		if (usuario.equals(nombreUsuario) && clave.equals(claveUsuario)) {
			
		    List<UsuarioDTO> LUsuarios = new ArrayList<UsuarioDTO>();
			LUsuarios = dao.leeUsuarios();
			mod.addAttribute("LUsuarios" , LUsuarios);//Pasamos la lista usuarios al objeto request para que pueda interactuar con el jsp.

			return "usuarios";
		}
		else
		{
			return "registro";
			//En registro habría que llamar al "Registrarse" que va a ser la parte de introducir al usuario en la BBDD.
		}
	}
	
	@Autowired
	private UsuarioInterfaz dao;
	
	@RequestMapping(value = "/Registrarse", method = {RequestMethod.POST,RequestMethod.GET})
	public String Registrarse(HttpServletRequest req, Model mod, HttpServletResponse response) {
		
		System.out.println(req.getSession(false)==null);
		
	    UsuarioDTO UsuarioNew = new UsuarioDTO();
	    UsuarioNew.setNombre(req.getParameter("nombre"));
	    UsuarioNew.setApellidos(req.getParameter("apellidos"));
	    UsuarioNew.setEmail(req.getParameter("email"));
	    
	    String nombre=UsuarioNew.getNombre();
		String apellidos=UsuarioNew.getApellidos();
		String email=UsuarioNew.getEmail();
		
		mod.addAttribute("nombre",nombre);
		mod.addAttribute("apellidos",apellidos);
		mod.addAttribute("email",email);
	    
	    Cookie c = new Cookie ("emailCookie",email);
	    c.setMaxAge(60);
	    c.setPath("/");
	    response.addCookie(c);
	    
	    if(dao.buscaUsuario(UsuarioNew.getEmail())!=null){
	    	return "ConfirmaLogin";
	    }
	    else {	    	
	    	dao.insertaUsuario(UsuarioNew);
	    	return "ConfirmaRegistro";
	    }      
		
	}
	
	@RequestMapping(value = "/ConfirmacionRegistro", method = {RequestMethod.POST,RequestMethod.GET})
	public String ConfirmacionRegistro(HttpServletRequest req, Model mod) {
		// Se leen los parámetros
	    String nombre = req.getParameter("nombre");
	 	String apellidos = req.getParameter("apellidos");
	 	String email = req.getParameter("email");

	 	int carrito [] = { 0,0,0,0,0,0 };
	 	
	 	System.out.println(nombre + " " + apellidos + " "+ email);

	 	System.out.println(req.getSession(false)==null);
	 	if (req.getSession(false)==null){
	 		if(nombre==null) {
	 			return "accesoNulo";
	 		}else {
	 			System.out.println("Sesion no activa");
	 			nombre=req.getParameter("nombre");
	 			apellidos=req.getParameter("apellidos");
	 		    email=req.getParameter("email");
	 			req.setAttribute("nombre", nombre);
	 			req.setAttribute("apellidos",apellidos);
	 			req.setAttribute("email",email);
	 			
	 			HttpSession sesion=req.getSession(true);
	 			System.out.println("Sesion activada");
	 			sesion.setMaxInactiveInterval(180);
	 			sesion.setAttribute("nombre",nombre);
	 			sesion.setAttribute("apellidos",apellidos);
	 			sesion.setAttribute("email",email);

	 			sesion.setAttribute("carrito", carrito);
	 			//response.setContentType("text/html");
	 			System.out.println(nombre + " " + apellidos + " "+ email + " " + carrito);
	 			
	 			return "informacionAcceso";
	 		}
 		}else {
				
			HttpSession sesion=req.getSession();
			System.out.println("Leemos datos de sesion");
			nombre=(String)sesion.getAttribute("nombre");
 			apellidos=(String)sesion.getAttribute("apellidos");
 			email=(String)sesion.getAttribute("email");
 			
 			carrito=(int[])sesion.getAttribute("carrito");
 			
 			req.setAttribute("nombre", nombre);
 			req.setAttribute("apellidos",apellidos);
 			req.setAttribute("email",email);
 			req.setAttribute("carrito", carrito);
 			
			System.out.println(nombre + " " + apellidos + " "+ email + " " + carrito);
 			
			return "informacionAcceso";

		} 
		
	}
	//En /Carrito, hacer arraylist de 6 objetos donde cada vez que pinche en un objeto se incremente en uno esa posicion
	//Si ps4, es el objeto 2, que la segunda posicion del array sea 2.
	
	@RequestMapping(value = "/Carrito", method = {RequestMethod.POST,RequestMethod.GET})
	public String Carrito(HttpServletRequest req, Model mod) {
		
		HttpSession sesion=req.getSession();
		System.out.println("Recuperamos datos de sesion");
		String nombre=(String)sesion.getAttribute("nombre");
		String apellidos=(String)sesion.getAttribute("apellidos");
		String email=(String)sesion.getAttribute("email");
			
		int carrito [] = { 0,0,0,0,0,0 };
		carrito=(int[])sesion.getAttribute("carrito");
		System.out.println(carrito==null);
		String id = req.getParameter("id");
		
		if(id.equals("180 Euros")) {
			carrito[0]++;		
		}
		if(id.equals("280 Euros")) {
			carrito[1]++;		
		}
		if(id.equals("279 Euros")) {
			carrito[2]++;		
		}
		if(id.equals("50 Euros")) {
			carrito[3]++;		
		}
		if(id.equals("30 Euros")) {
			carrito[4]++;		
		}
		if(id.equals("60 Euros")) {
			carrito[5]++;		
		}
		
		System.out.println(carrito);
		System.out.println(nombre);
		mod.addAttribute("nombre",nombre);
		mod.addAttribute("apellidos",apellidos);
		mod.addAttribute("email",email);

		sesion.setAttribute("carrito", carrito);		
	
		return "informacionAcceso";
	}
	
	@RequestMapping(value = "/CalculaTotal", method = {RequestMethod.POST,RequestMethod.GET})
	public String CalculaTotal(HttpServletRequest req, Model mod) {
		float precio_total=0;
		
		HttpSession sesion=req.getSession();
		System.out.println("Recuperamos el carrito");
		int carrito [] = { 0,0,0,0,0,0 };
		carrito=(int[])sesion.getAttribute("carrito");
		
		for (int i=0; i<carrito.length; i++) {
			switch (i) {
				case 0:
					precio_total=precio_total+carrito[0]*180;
					break;
				case 1:
					precio_total=precio_total+carrito[1]*280;
					break;
				case 2:
					precio_total=precio_total+carrito[2]*279;
					break;
				case 3:
					precio_total=precio_total+carrito[3]*50;
					break;
				case 4:
					precio_total=precio_total+carrito[4]*30;
					break;
				case 5:
					precio_total=precio_total+carrito[5]*60;
					break;
			}
		}
		
		mod.addAttribute("precio_total",precio_total);
		
		return "finalizaCompra";
	}
	
	@RequestMapping(value = "/ConfirmaPago", method = {RequestMethod.POST,RequestMethod.GET})
	public String ConfirmaPago(HttpServletRequest req, Model mod) {
		return "pagoConfirmado";
	}
	
	@RequestMapping(value = "/CancelaCompra", method = {RequestMethod.POST,RequestMethod.GET})
	public String CancelaCompra(HttpServletRequest req, Model mod) {
		return "pagoCancelado";
	}
	
	@RequestMapping(value = "/MiCuenta", method = {RequestMethod.POST,RequestMethod.GET})
	public String MiCuenta(HttpServletRequest req, Model mod) {
		
		HttpSession sesion=req.getSession();
		System.out.println("Recuperamos email");
		String email=(String)sesion.getAttribute("email");
		
		UsuarioDTO usuarioreg = dao.buscaUsuario(email);
		//Se añade a la sesión				
		
		if(usuarioreg!=null) {
		 	mod.addAttribute("nombre",usuarioreg.getNombre());
		 	mod.addAttribute("apellidos",usuarioreg.getApellidos());
			mod.addAttribute("email",usuarioreg.getEmail());
		}
	
		return "MiCuenta";
	}
	
	@RequestMapping(value = "/ModificarDatos", method = {RequestMethod.POST,RequestMethod.GET})
	public String ModificarDatos(HttpServletRequest req, Model mod) {
		
		return "nuevosDatos";
	}
	
	@RequestMapping(value = "/actualizaDatos", method = {RequestMethod.POST,RequestMethod.GET})
	public String actualizaDatos(HttpServletRequest req, Model mod, HttpServletResponse response) {
				
		UsuarioDTO UsuarioNew = new UsuarioDTO();
		UsuarioNew.setNombre(req.getParameter("nombre"));
		UsuarioNew.setApellidos(req.getParameter("apellidos"));
		UsuarioNew.setEmail(req.getParameter("email"));
		
		HttpSession sesion=req.getSession();
		System.out.println("Recuperamos email");
		String email=(String)sesion.getAttribute("email");
		
		dao.modificaUsuario(UsuarioNew, email);
		
		Cookie[ ] cookies = req.getCookies( );
		String cookieName ="emailCookie";
		String emailAddress = "";
			
		//Buscamos la cookie y la eliminamos, ya que el email ha cambiado.
		if (cookies != null){
			for (Cookie cookie: cookies){
				if (cookieName.equals(cookie.getName())) 
					cookie.setMaxAge(0);
			}
		}
		
		//Añadimos la nueva cookie
		Cookie c = new Cookie ("emailCookie",UsuarioNew.getEmail());
	    c.setMaxAge(60);
	    c.setPath("/");
	    response.addCookie(c);
		
	    //Actualizamos los datos en la sesion
		sesion.setAttribute("nombre",UsuarioNew.getNombre());
 		sesion.setAttribute("apellidos",UsuarioNew.getApellidos());
 		sesion.setAttribute("email",UsuarioNew.getEmail());
		mod.addAttribute("nombre",UsuarioNew.getNombre());
	 	mod.addAttribute("apellidos",UsuarioNew.getApellidos());
		mod.addAttribute("email",UsuarioNew.getEmail());
		
		return "datosModificados";
	}
	
}
