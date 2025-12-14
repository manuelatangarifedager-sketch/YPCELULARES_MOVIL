package com.loginrolesapp.controlador;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import com.loginrolesapp.modelo.*;

@WebServlet("/CategoriaServlet")
public class CategoriaServlet extends HttpServlet {

    CategoriaDAO dao = new CategoriaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("categorias", dao.listar());
        RequestDispatcher rd = request.getRequestDispatcher("/admin/adminCategorias.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String accion = request.getParameter("accion");

        if ("agregar".equals(accion)) {
            dao.agregar(request.getParameter("nombre"));
        }

        if ("editar".equals(accion)) {
            dao.actualizar(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("nombre")
            );
        }

        if ("eliminar".equals(accion)) {
            dao.eliminar(Integer.parseInt(request.getParameter("id")));
        }

        response.sendRedirect("CategoriaServlet");
    }
}
