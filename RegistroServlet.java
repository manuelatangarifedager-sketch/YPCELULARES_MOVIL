package com.loginrolesapp.controlador;

import com.loginrolesapp.modelo.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");

        if (nombre == null || correo == null || password == null ||
            nombre.isEmpty() || correo.isEmpty() || password.isEmpty()) {

            response.sendRedirect("registro.jsp");
            return;
        }

        boolean registrado = usuarioDAO.registrar(
                nombre, correo, password, telefono, direccion
        );

        if (registrado) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("registro.jsp");
        }
    }
}
