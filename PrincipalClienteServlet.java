package com.loginrolesapp.controlador;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import com.loginrolesapp.modelo.*;

@WebServlet("/PrincipalClienteServlet")
public class PrincipalClienteServlet extends HttpServlet {

    ProductoDAO dao = new ProductoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Usuario usuario = (session != null)
                ? (Usuario) session.getAttribute("usuario")
                : null;

        if (usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.setAttribute("celulares", dao.listarPorCategoria(1));
        request.setAttribute("tablets", dao.listarPorCategoria(2));
        request.setAttribute("accesorios", dao.listarPorCategoria(3));

        RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
        rd.forward(request, response);
    }
}
