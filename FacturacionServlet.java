package com.loginrolesapp.controlador;

import com.loginrolesapp.modelo.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/FacturacionServlet")
public class FacturacionServlet extends HttpServlet {

    CarritoClienteDAO carritoDAO = new CarritoClienteDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Producto> carrito = carritoDAO.listarCarrito(usuario.getId());

        if (carrito == null || carrito.isEmpty()) {
            response.sendRedirect("CarritoClienteServlet");
            return;
        }

        double total = 0;
        for (Producto p : carrito) {
            total += p.getPrecio() * p.getCantidad();
        }

        request.setAttribute("carrito", carrito);
        request.setAttribute("total", total);

        request.getRequestDispatcher("cliente/facturacion.jsp")
               .forward(request, response);
    }
}
