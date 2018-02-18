package servlets;

import java.io.IOException;
import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

import javafx.scene.shape.Ellipse;

/**
 * Servlet implementation class ServletError
 */
@WebServlet(description = "clase para procesar errores personalizados", urlPatterns = { "/ServletError" })
public class ServletError extends GenericServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see GenericServlet#GenericServlet()
     */
    public ServletError() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#service(ServletRequest request, ServletResponse response)
	 */
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String error= request.getParameter("codigoError");
	if(error.equals("404")) {
		response.setContentType("text/html");
		response.getWriter().println("Se deben ingresar todos los campos");
	}else {
		request.getRequestDispatcher("/login").forward(request, response);
	}
	}

}
