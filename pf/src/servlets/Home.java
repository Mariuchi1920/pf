package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datos.PersonasDAO;
import entidad.Persona;


/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter(); 
		
		HttpSession sesion = request.getSession();//obtiene la sesion de ese usuario en ese mometo.sesion es una variable global, la podemos usar en cualquier parte del proyecto.
		String usuario=request.getParameter("usu");
		String contrasena= request.getParameter("con");

		PersonasDAO co= new PersonasDAO();
		//como el metodo me devuelve unn boolean puede estar dentro del if sin comparar 
		Persona personaLogin = co.auntenticarPersona(usuario, contrasena);
		
		if(personaLogin!=null){
			sesion.setAttribute("usuario", personaLogin);
			
			if(personaLogin.getTipoPersona().getIdTipoPersona() == 1){
				response.sendRedirect(request.getContextPath() + "/admin");
			}else {
				response.sendRedirect(request.getContextPath() + "/menuUsuario.jsp");
				////response.sendRedirect(request.getContextPath() + "/admin");
				
			}
		}else {
			
			out.print("<p style=\"color:red\">El nombre de usuario o contrasena son incorrectos</p>");  
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
            rd.include(request,response);  
			System.out.println("usuario y o contrasena incorrectos");
			
			
		}
		
	}
	

}
