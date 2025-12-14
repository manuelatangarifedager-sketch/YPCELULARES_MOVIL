package com.loginrolesapp.controlador;

import com.loginrolesapp.modelo.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/CarritoClienteServlet")
public class CarritoClienteServlet extends HttpServlet {

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

        String accion = request.getParameter("accion");
        if (accion == null) accion = "listar";

        switch (accion) {

            case "agregar": {
                int productoId = Integer.parseInt(request.getParameter("productoId"));
                int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                carritoDAO.agregarAlCarrito(usuario.getId(), productoId, cantidad);
                response.sendRedirect("CarritoClienteServlet");
                break;
            }

            case "eliminar": {
                int productoId = Integer.parseInt(request.getParameter("id"));
                carritoDAO.eliminarDelCarrito(usuario.getId(), productoId);
                response.sendRedirect("CarritoClienteServlet");
                break;
            }

            case "vaciar": {
                carritoDAO.vaciarCarrito(usuario.getId());
                response.sendRedirect("CarritoClienteServlet");
                break;
            }

            default: {
                List<Producto> carrito = carritoDAO.listarCarrito(usuario.getId());

                double total = 0;
                for (Producto p : carrito) {
                    total += p.getPrecio() * p.getCantidad();
                }

                request.setAttribute("carrito", carrito);
                request.setAttribute("total", total);

                request.getRequestDispatcher("cliente/verCarrito.jsp")
                        .forward(request, response);

            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response); // 
    }
}
