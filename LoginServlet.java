package com.loginrolesapp.controlador;

import com.loginrolesapp.modelo.Usuario;
import com.loginrolesapp.modelo.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("correo");
        String clave = request.getParameter("password");

        Usuario u = dao.login(correo, clave);

        // ❌ Usuario no existe
        if (u == null) {
            request.setAttribute("error", "Credenciales incorrectas.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // ✅ Usuario existe
        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuario", u);

        String rol = u.getRol();

        // 🔎 DEPURACIÓN (MUY IMPORTANTE)
        System.out.println("ROL OBTENIDO DEL LOGIN: [" + rol + "]");

        if (rol == null || rol.trim().isEmpty()) {
            request.setAttribute("error", "El usuario no tiene rol asignado.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        rol = rol.trim().toLowerCase();

        switch (rol) {
            case "admin":
                response.sendRedirect(request.getContextPath() + "/admin/panelAdmin.jsp");
                return;

            case "cliente":
                response.sendRedirect(request.getContextPath() + "/PrincipalClienteServlet");
                return;

            default:
                request.setAttribute("error", "Rol desconocido: " + rol);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
